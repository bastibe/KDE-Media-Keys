#!/bin/bash

## -- This script will imitate Gnome's Media Controls (Play/Pause, Next, Previous, Stop) -- ##
## -- It will assume you are using a media application that is compatible with MPRIS or  -- ##
## -- "Media Player Remote Interfacing Specification"                                    -- ##

# Search for running media applications
# and store into apps array
apps=(`qdbus | grep org.mpris.MediaPlayer2`)

# For each application send the "Next" command
for app in "${apps[@]}"
  do
        qdbus $app /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
  done
