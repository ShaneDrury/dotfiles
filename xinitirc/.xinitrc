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

setxkbmap gb -option terminate:ctrl_alt_bksp -option ctrl:nocaps &
xset +fp /usr/share/fonts/TTF/
xset s off
xset s 1800 1800
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
switchmonitor
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
xinput set-prop "DLL0665:01 06CB:76AD Touchpad" 299 0
xinput set-prop "DLL0665:01 06CB:76AD Touchpad" 266 0
xinput set-prop "DLL0665:01 06CB:76AD Touchpad" 287 -0.5
exec i3
