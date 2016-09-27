# docker-pidgin

How does it work
===

It is based on the latest version of pidgin-3.0.0 devel as released by the
Ubuntu Community ( http://ppa.launchpad.net/sipe-collab/ppa/ubuntu ).

I need it to run the latest pidgin version in my Gentoo box where it is still
not available!

The audio is working through the pulse server running on your host. Be sure to
have enabled the features:

 "Enable network access to local sound devices"
 
 "Don't require authentication"
 
in paprefs

I created a script called sipe-pidgin that helps to run the docker container and connect to the
host pulse-server. Furthermore it mount your local purple config
"/home/$USER/.purple" in the container. Therefore copy the original or adjust
for your convenience.

Enjoy
Alessandro

Source
===
https://github.com/zioalex/docker-pidgin

Credits
===
Based on https://github.com/kohlerm/docker-pidgin
