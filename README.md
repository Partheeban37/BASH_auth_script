# Failed Login Attempt Monitoring Script (Bash, Linux)

## Description
A Bash-based monitoring script that parses Linux authentication logs to detect repeated failed login attempts and generate basic alerts.

## Features
- Reads Linux auth logs or journalctl
- Detects failed SSH login attempts
- Generates alert based on threshold
- Beginner-friendly SOC monitoring tool

## Usage
```bash
chmod +x failed_login_monitor.sh
./failed_login_monitor.sh
