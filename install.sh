#!/bin/bash -v
setenforce 0

rpm -Uhv https://yum.dockerproject.org/repo/main/centos/7/Packages/docker-engine-selinux-1.9.1-1.el7.centos.noarch.rpm
rpm -Uhv https://yum.dockerproject.org/repo/main/centos/7/Packages/docker-engine-1.9.1-1.el7.centos.x86_64.rpm

systemctl enable docker
systemctl start docker

docker run --name mysql -e MYSQL_ROOT_PASSWORD=$dbpass -d mysql
docker run --name wordpress --link mysql:mysql -p 80:80 -d wordpress
