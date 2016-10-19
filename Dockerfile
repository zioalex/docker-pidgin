# Base docker image
# Build with
# docker build -t zioalex/sipe-collab ./
# docker  run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix sipe-collab
# docker  run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -e PULSE_SERVER=tcp:$(hostname -i):4713  -e PULSE_COOKIE=/run/pulse/cookie -v ~/.config/pulse/cookie:/run/pulse/cookie sipe-collab
# Audio in Docker
# http://stackoverflow.com/questions/28985714/run-apps-using-audio-in-a-docker-container
# https://github.com/jlund/docker-chrome-pulseaudio/blob/master/Dockerfile
# http://stackoverflow.com/questions/28985714/run-apps-using-audio-in-a-docker-container
# https://github.com/tieto/sipe
# https://raw.githubusercontent.com/jgeboski/ebuilds/master/dev-libs/gplugin/gplugin-0.27.0-r1.ebuild
# https://bugs.gentoo.org/show_bug.cgi?id=564086
# https://code.launchpad.net/~sipe-collab/+recipe/pkg-sipe-daily
# https://github.com/kohlerm/docker-pidgin/blob/master/Dockerfile
# https://launchpad.net/~sipe-collab
# DBUS in the container
# http://ask.projectatomic.io/en/question/3647/how-to-connect-to-session-dbus-from-a-docker-container/

FROM ubuntu:xenial
MAINTAINER zioalex@gmail.com


# Install pidgin and dependencies
RUN mkdir -p /usr/share/icons/hicolor && \
#        echo "deb http://ppa.launchpad.net/sipe-collab/ppa/ubuntu wily main">>/etc/apt/sources.list && \
    echo "deb http://ppa.launchpad.net/sipe-collab/ppa/ubuntu xenial main" >>/etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys  737F9811F93FF666 && \
    apt-get update && apt-get install -y \
    ca-certificates \
    gconf-service \
    hicolor-icon-theme \
    libappindicator1 \
    libasound2 \
    libcanberra-gtk-module \
    libcurl3 \
    libexif-dev \
    libgconf-2-4 \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    libnspr4 \
    libnss3 \
    libpango1.0-0 \
    libv4l-0 \
    libxss1 \
    libxtst6 \
    wget \
    xdg-utils \
        software-properties-common \
        dbus-x11 \
     gnome-keyring\
     pulseaudio \ 
     pavucontrol \
        pidgin  \
        pidgin-sipe && \
     rm -rf /var/lib/apt/lists/*
#COPY local.conf /etc/fonts/local.conf

# Copy my pidgin config 
# COPY purple_config /root/.purple/
# Instead of copying use the original pidgin config dir
# -v /home/asurace/.purple

# Autorun pidgin
#CMD [ "/usr/bin/pidgin" ]
#RUN  /bin/bash -c '/usr/bin/pavucontrol &'
#RUN  /bin/bash -c '/usr/bin/pidgin'
#CMD /bin/bash -c '/usr/bin/pavucontrol& /usr/bin/pidgin'
# Audio setting can be managed directly from the host pulse

# My timezone
RUN echo "Europe/Berlin" > /etc/timezone
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime

CMD /bin/bash -c '/usr/bin/pidgin'

