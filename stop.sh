#!/bin/bash

## -- This script will imitate Gnome's Media Controls (Play/Pause, Next, Previous, Stop) -- ##
## -- It will assume you are using a media application that is compatible with MPRIS or  -- ##
## -- "Media Player Remote Interfacing Specification"                                    -- ##

# Search for running media applications
# and store into apps array
apps=(`qdbus | grep org.mpris.MediaPlayer2 | sed 's/.*\.//'`)

# For each application send the "Stop" command
for app in "${apps[@]}"
  do
        qdbus org.mpris.MediaPlayer2.$app /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
  done
