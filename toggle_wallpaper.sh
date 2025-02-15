#!/bin/bash

# Set the directory where your wallpapers are stored
WALLPAPER_DIR="$HOME/wallpapers"

# Get the current wallpaper using hyprctl
current_wallpaper=$(hyprctl hyprpaper wallpaper "$DISPLAY")

# List all wallpapers in the directory and filter out the current wallpaper
available_wallpapers=$(find "$WALLPAPER_DIR" -type f -iname "*.jpg" -o -iname "*.png" | grep -v "$current_wallpaper")

# Use rofi to present the list of wallpapers
selected_wallpaper=$(echo -e "$available_wallpapers" | rofi -dmenu -p "Select Wallpaper")

# If a wallpaper is selected, preload it and set it using hyprctl
if [[ -n "$selected_wallpaper" ]]; then
    # Preload the wallpaper first
    hyprctl hyprpaper preload "$selected_wallpaper"
    
    # Set the wallpaper on the specified display
    hyprctl hyprpaper wallpaper "eDP-1,$selected_wallpaper"
fi

