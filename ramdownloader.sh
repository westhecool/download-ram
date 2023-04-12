#!/bin/bash
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi
echo -n "How much ram you wanna download?: "
read n
dd if=/dev/zero of=/swapfile bs=1024 count=$(($n*1048576))
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile none swap sw 0 0" >> /etc/fstab
