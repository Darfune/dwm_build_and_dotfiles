#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


# Displays Settings
#xrandr --output eDP1 --mode 1920x1080 --output DP2 --mode 1920x1080 --right-of eDP1 &

# Wallpaper
~/.fehbg &

# Compositor
picom -f &

# Audio
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/pipewire-media-session &

# Dwnblocks
dwmblocks &

# Java shit
export _JAVA_AWT_WM_NONREPARENTING=1

# Loop
#while true; do
#	dwm >/dev/null 2>&1
#done

# Excecute DWM
exec dwm
