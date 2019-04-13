#!/bin/sh

# Turn on the laptop screen.
xrandr --output eDP1 --auto

# Turn off my the other screens.
xrandr --output VIRTUAL4 --off


# Kill the xorg server running on the nvidia card.
sudo kill $(ps ax | grep Xorg | grep :8 | awk '{print $1}')

# Wait plenty of time for it to die.
sudo sleep 5

# Remove the nvidia kernel module so we can shut down the card.
# If you're running another driver this might be something different.
sudo rmmod nvidia

# Use bumblebee to turn off the nvidia card and save power.
sudo echo OFF > /proc/acpi/bbswitch
