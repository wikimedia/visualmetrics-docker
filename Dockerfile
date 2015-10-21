FROM debian:wheezy
MAINTAINER Peter Hedenskog <peter@wikimedia.org>

RUN apt-get update && apt-get install -y \
  ca-certificates \
  gcc \
  git \
  imagemagick \
  ipython \
  ipython-notebook \
  libjpeg-dev \
  python \
  python-dev \
  python-imaging \
  python-numpy \
  python-scipy \
  python-matplotlib \
  python-pandas \
  python-pip \
  python-sympy \
  python-nose \
  wget \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

# static builds from http://johnvansickle.com/ffmpeg/
# as recommended by WPT forums, lets use the 2.8.1 version 
ADD ffmpeg-2.8.1-64bit-static/ffmpeg /usr/bin/

RUN pip install Pillow  \
  && pip install pyssim

RUN git clone https://github.com/WPO-Foundation/visualmetrics.git

WORKDIR visualmetrics

CMD ["python", "visualmetrics/visualmetrics.py", "--check"]
