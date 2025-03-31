#!/bin/bash                         
# Linux System Management Tool
# Author: Your Name
# Date: March 26, 2025

show_menu() {
    clear
    echo "========================================"
    echo "   Linux System Management Tool"
    echo "========================================"
    echo "1. System Information"
    echo "2. Disk Usage"
    echo "3. User Management"
    echo "4. File Operations"
    echo "5. Network Information"
    echo "6. Exit"
    echo "========================================"
}

system_info() {
    echo "===== System Information ====="
    echo "Hostname: $(hostname)"
    echo "OS: $(uname -o)"
    echo "Kernel Version: $(uname -r)"
    echo "Uptime: $(uptime -p)"
    echo "Current Users: $(who -q)"
    echo
}

disk_usage() {
    echo "===== Disk Usage ====="
    df -h
}

user_management() {
    echo "===== User Management ====="
    echo "1. List All Users"
    echo "2. Create a New User"
    echo "3. Delete a User"
    echo "4. Go Back"

    read -p "Choose an option: " choice

    case $choice in
        1) cut -d: -f1 /etc/passwd
	   sleep 5;;
        2) read -p "Enter new username: " username
           sudo useradd "$username"
           echo "User $username created."
	   sleep 5;;
        3) read -p "Enter username to delete: " username
           sudo userdel "$username"
           echo "User $username deleted."
	   sleep 5;;
        4) return;;
        *) echo "Invalid option.";;
    esac
}

file_operations() {
    echo "===== File Operations ====="
    echo "1. List Files in a Directory"
    echo "2. Create a File"
    echo "3. Delete a File"
    echo "4. Go Back"

    read -p "Choose an option: " choice

    case $choice in
        1) read -p "Enter directory path: " dir
           ls -la "$dir"
	   sleep 5;;
        2) read -p "Enter file name to create: " filename
           touch "$filename"
           echo "File $filename created."
	   sleep 5;;
        3) read -p "Enter file name to delete: " filename
           rm -f "$filename"
           echo "File $filename deleted."
	   sleep 5;;
        4) return;;
        *) echo "Invalid option.";;
    esac
}

network_info() {
    echo "===== Network Information ====="
    echo "IP Address: $(hostname -I)"
    echo "Network Interfaces:"
    ip -br link
    echo
    sleep 5
}

while true; do
    show_menu
    read -p "Choose an option: " option

    case $option in
        1) system_info;;
        2) disk_usage;;
        3) user_management;;
        4) file_operations;;
        5) network_info;;
        6) exit 0;;
        *) echo "Invalid option.";;
    esac

    read -p "Press Enter to continue..."
done

