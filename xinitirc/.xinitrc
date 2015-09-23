#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

#xrandr --dpi 144 &
setxkbmap -option terminate:ctrl_alt_bksp -option ctrl:nocaps
start-pulseaudio-x11 &
xset +fp /usr/share/fonts/TTF/
#xss-lock -- i3lock -f -r &
xset s off
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
#compton -b
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
exec i3
