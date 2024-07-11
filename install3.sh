#!/bin/bash
wget -O "guacamole-1.4.0.war" https://apache.org/dyn/closer.lua/guacamole/1.4.0/binary/guacamole-1.4.0.war?action=download
sudo mv guacamole-1.4.0.war /var/lib/tomcat9/webapps/guacamole.war
sudo systemctl restart tomcat9 guacd
sudo echo "GUACAMOLE_HOME=/etc/guacamole" >> sudo /etc/default/tomcat9
sudo apt install mariadb-server -y
cd ~/guacamole-client-1.4.0/extensions/guacamole-auth-jdbc/modules/guacamole-auth-jdbc-mysql
cat schema/*.sql | sudo mysql -u root -p guacamole_db
curl -L 'http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.24.tar.gz/from/http://cdn.mysql.com/' | sudo tar xz
sudo mkdir /etc/guacamole
sudo mkdir /etc/guacamole/lib
sudo cp mysql-connector-java-5.1.24/mysql-connector-java-5.1.24-bin.jar /etc/guacamole/lib/
sudo mkdir -p /etc/guacamole/extensions
sudo mkdir -p /etc/guacamole/lib
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.26.tar.gz
tar -xf mysql-connector-java-8.0.26.tar.gz
sudo cp mysql-connector-java-8.0.26/mysql-connector-java-8.0.26.jar /etc/guacamole/lib/
wget -O "guacamole-auth-jdbc-1.4.0.tar.gz" https://apache.org/dyn/closer.lua/guacamole/1.4.0/binary/guacamole-auth-jdbc-1.4.0.tar.gz?action=download
tar -xf guacamole-auth-jdbc-1.4.0.tar.gz
sudo mv guacamole-auth-jdbc-1.4.0/mysql/guacamole-auth-jdbc-mysql-1.4.0.jar /etc/guacamole/extensions/
sudo systemctl restart tomcat9 guacd mysql