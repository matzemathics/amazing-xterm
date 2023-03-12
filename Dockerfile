FROM debian:bullseye

# add xpra repository
ADD https://xpra.org/gpg.asc /usr/share/keyrings/xpra.asc
ADD https://raw.githubusercontent.com/Xpra-org/xpra/master/packaging/repos/bullseye/xpra.sources /etc/apt/sources.list.d

# install packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y --no-install-recommends xpra xterm xserver-xorg-video-dummy xauth python3-netifaces python3-pillow

EXPOSE 10000/tcp

ENTRYPOINT [ \
    "xpra", "start", ":42", \
    "--bind-tcp=0.0.0.0:10000", \
    "--no-daemon", \
    "--sharing=yes", \
    "--dbus-launch=", \
    "--mdns=no", \
    "--notifications=no", \
    "--start-child=xterm -fs 14 -fa DejaVuMonoSans", \
    "--exit-with-children=yes" \
]
