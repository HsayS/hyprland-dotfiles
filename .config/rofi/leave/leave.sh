#!/bin/bash
choice=$(echo -e "Reboot\nShutdown" | rofi -dmenu -p "Select Action:")

case $choice in
    Reboot)
        systemctl reboot
        ;;
    Shutdown)
        systemctl poweroff
        ;;
    *)
        exit 1
        ;;
esac
