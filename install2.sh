#!/bin/bash
sudo apt-get install libcairo2-dev
sudo apt-get install libjpeg62-turbo-dev
sudo apt-get install libpng12-dev
sudo apt-get install libtool-bin
sudo apt-get install libossp-uuid-dev
sudo apt-get install libavcodec-dev libavutil-dev libswscale-dev
sudo apt-get install libfreerdp-dev
sudo apt-get install libpango1.0-dev
sudo apt-get install libssh2-1-dev
sudo apt-get install libtelnet-dev
sudo apt-get install libvncserver-dev
sudo apt-get install libwebsockets-dev
sudo apt-get install libpulse-dev
sudo apt-get install libssl-dev
sudo apt-get install libvorbis-dev
sudo apt-get install libwebp-dev
wget -O "guacamole-server-1.4.0.tar.gz" https://apache.org/dyn/closer.lua/guacamole/1.4.0/source/guacamole-server-1.4.0.tar.gz?action=download
tar -xzf guacamole-server-1.4.0.tar.gz
cd guacamole-server-1.4.0
sudo ./configure --with-init-dir=/etc/init.d
sudo make
sudo make install
sudo update-rc.d guacd defaults
sudo ldconfig
sudo ldconfig
sudo systemctl daemon-reload
sudo systemctl start guacd
sudo systemctl enable guacd