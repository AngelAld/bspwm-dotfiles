#! /bin/bash

# primero matamos todo

pkill dunst
pkill flashfocus
pkill picom
pkill pa-applet
pkill polybar
pkill xfce4-power-manager
# esperamos un segundo

sleep 1

#ahora lo volvemos a abrir

if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload example &
	done
else
	polybar --reload example &
fi

dunst &
wal -R &
flashfocus &
picom -b &
pa-applet &
xfce4-power-manager &
dunstify 'bspwm reloaded'
