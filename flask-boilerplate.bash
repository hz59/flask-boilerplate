#!/bin/bash

# Author: hz59
# GitHub: https://github.com/hz59
# Description: This script sets up a Flask project with docker-compose

# create the directory for the project
mkdir flask-boilerplate
cd flask-boilerplate

# create virtual env for Python packages
python3 -m venv venv
source venv/bin/activate

# install flask and other required packages
pip install flask

# create a flask app file
echo 'from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    return "Hello, world!"
' > app.py

# create a Dockerfile for the Flask app
echo 'FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD ["python3", "app.py"]
' > Dockerfile

# create a requirements file for the flask app
echo 'Flask
' > requirements.txt

# create a docker-compose file
echo 'version: "3"
services:
  web:
    build: .
    ports:
      - "5000:5000"
' > docker-compose.yml

# start the flask app using docker-compose 
docker-compose up -d 
