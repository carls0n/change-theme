#!/usr/bin/env bash

[[ -z $1 ]] && echo Which theme would you like to change to? && exit

[[ `uname -s` == "OpenBSD" ]] && path=/usr/local/share/
[[ `uname -s` == "Linux" ]] && path=/usr/share/

if [[ -e ~/.themes/$1/xfwm4 ]] || [[ -e $path/themes/$1/xfwm4 ]]
then
xfconf-query -c xfwm4 -p /general/theme -s $1
xfconf-query -c xsettings -p /Net/ThemeName -t "string" -s $1 --create
else echo "No theme by that name. Check capitalization."
fi
if [[ -e ~/.themes/$1/xfce-notify-4.0 ]] || [[ -e $path/themes/$1/xfce-notify-4.0 ]]
then
xfconf-query -c xfce4-notifyd -p /theme -t "string" -s $1
xfce4-panel -r
fi
