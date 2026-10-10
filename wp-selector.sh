#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/wallpapers"

WALL=$(find "$WALL_DIR" -maxdepth 1 -type f \
  \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \
     -o -iname '*.webp' -o -iname '*.gif' -o -iname '*.bmp' \) \
  -printf '%f\n' | sort | wofi --dmenu --prompt "Choose wallpaper")

[[ -z "$WALL" ]] && exit 0

if ! awww query >/dev/null 2>&1; then
    notify-send "Wallpaper selector" "awww daemon is not running"
    exit 1
fi
