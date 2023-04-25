#!/bin/bash
#Docker + apache + php

sudo apt update
sudo apt upgrade -y
sudo apt install docker.io -y
sudo systemctl restart docker.service

sudo mkdir atividade
cd atividade
sudo touch Dockerfile
cd ..
sudo chmod 777 -R atividade
cd atividade
sudo echo "
FROM php:8.1-apache
COPY ./php/index.php /var/www/html/
" > Dockerfile
sudo mkdir php
cd php
sudo touch index.php
cd ..
sudo chmod 777 -R php
cd php
sudo echo "<?php phpinfo(); ?>" > index.php
cd ..
sudo docker build -t atividade .
sudo docker run -d -p 80:80 atividade

#postgres

#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install postgresql -y
sudo systemctl restart postgresql.service
sudo su postgres -c 'psql -c "CREATE DATABASE testdb;"'
sudo su postgres -c 'psql testdb -c "CREATE TABLE table1 (column1 integer, column2 integer);"'
sudo su postgres -c 'psql testdb -c "INSERT INTO table1 (column1) SELECT a.column1 FROM generate_series(1, 1000000) AS a (column1);"'
sudo su postgres -c 'psql testdb -c "SELECT * FROM table1 LIMIT 10;"'

 







              