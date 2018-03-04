#!/bin/bash

# Install git, postgresaql, libraries for python and gcc, etc .. 
yum update -y
yum install Python Python-devel gcc libxml2-devel gcc-c++ -y
yum install python-pip python-devel postgresql-server postgresql-devel postgresql-contrib gcc nginx -y
pip install Flask-Caching pbr html5lib
yum install git -y

# Clone airflow app from github
cd /opt; git clone https://github.com/apache/incubator-airflow.git

# Initialize postgresql and activate the service during bootup
service postgresql initdb
chkconfig postgresql on

# Install Airflow app using python setup tool
cd /opt/incubator-airflow; python setup.py  install
