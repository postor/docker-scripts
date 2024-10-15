#!/bin/bash

set -ex

# Get Ubuntu version
UBUNTU_VERSION=$(lsb_release -rs)

# Backup the original sources.list
echo "Backing up the original /etc/apt/sources.list to /etc/apt/sources.list.bak"
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

# Replace the sources list with TUNA mirror for the appropriate Ubuntu version
echo "Switching to TUNA mirror for Ubuntu $UBUNTU_VERSION..."
sudo tee /etc/apt/sources.list <<EOF
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${UBUNTU_VERSION} main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${UBUNTU_VERSION}-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${UBUNTU_VERSION}-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ ${UBUNTU_VERSION}-security main restricted universe multiverse
EOF

# Update the package list
echo "Updating package list..."
sudo apt update

echo "APT sources have been switched to TUNA mirror for Ubuntu $UBUNTU_VERSION!"
