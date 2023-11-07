#!/usr/bin/env bash

# My other repositories: https://github.com/carls0n/

[[ -z $1 ]] && echo Which theme would you like to change to? && exit

[[ `uname -s` == "OpenBSD" ]] && path=/usr/local/share/
[[ `uname -s` == "Linux" ]] && path=/usr/share/

if [[ $1 != "ls" ]] && [[ -e ~/.themes/$1/xfwm4 ]] || [[ -e $path/themes/$1/xfwm4 ]]
then
xfconf-query -c xfwm4 -p /general/theme -s $1
fi

if [[ $1 != "ls" ]] && [[ -e ~/.themes/$1/gtk-3.0 ]] || [[ -e $path/themes/$1/gtk-3.0 ]]
then
xfconf-query -c xsettings -p /Net/ThemeName -t "string" -s $1 --create
elif [[ $1 != "ls" ]] && [[ ! -e ~/.themes/$1/gtk-3.0 ]] && [[  ! -e $path/themes/$1/gtk-3.0 ]]
then
echo "No theme by that name. Check capitalization."
fi

if [[ -e ~/.themes/$1/xfce-notify-4.0 ]] || [[ -e $path/themes/$1/xfce-notify-4.0 ]]
then
xfconf-query -c xfce4-notifyd -p /theme -t "string" -s $1
fi

if [[ $1 == "ls" ]]
then
for file in {~/.themes/*/gtk-3.0/gtk.css,$path/themes/*/gtk-3.0/gtk.css}
do
ls "$file" | awk -F "/" '{print $(NF - 2)}' 
done
fi
