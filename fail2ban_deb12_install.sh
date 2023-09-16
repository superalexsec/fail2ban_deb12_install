#!/bin/bash

# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Update the package list and install Fail2ban
# apt update
apt install -y fail2ban

# Copy the default configuration file
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Start Fail2ban and enable it to start on boot
systemctl start fail2ban
systemctl enable fail2ban

echo "Fail2ban has been installed and started."
