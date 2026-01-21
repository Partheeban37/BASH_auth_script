#!/bin/bash

# ===============================
# Failed Login Attempt Monitor
# ===============================

THRESHOLD=5
# for Ubuntu / Debian:
###LOG_FILE="/var/log/auth.log"
# for RHEL / CentOS:
LOG_FILE="/var/log/secure"

echo "====================================="
echo " Failed Login Attempt Monitoring Tool "
echo "====================================="

# Check if auth.log exists
if [ -f "$LOG_FILE" ]; then
    echo "[INFO] Reading logs from $LOG_FILE"
    FAILED_LOGINS=$(grep "Failed password" "$LOG_FILE")
else
    echo "[INFO] auth.log not found, using journalctl"
    FAILED_LOGINS=$(journalctl _SYSTEMD_UNIT=ssh.service | grep "Failed password")
fi

# Count failed attempts
COUNT=$(echo "$FAILED_LOGINS" | wc -l)

echo "[INFO] Total failed login attempts detected: $COUNT"

# Alert condition
if [ "$COUNT" -ge "$THRESHOLD" ]; then
    echo "[ALERT] Suspicious activity detected!"
    echo "[ALERT] More than $THRESHOLD failed login attempts found."
else
    echo "[OK] Failed login attempts below alert threshold."
fi

echo "====================================="
