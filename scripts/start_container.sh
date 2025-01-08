#!/bin/bash

# Pull the latest image
echo "Using default tag: latest"
docker pull nikhil976/simple-python-flask-app:latest

# Check if port 5000 is free, otherwise map to a different port
if ! lsof -i :5000; then
  echo "Port 5000 is free. Starting container..."
  docker run -d -p 5000:5000 nikhil976/simple-python-flask-app:latest
else
  echo "Port 5000 is occupied, using port 5001 instead..."
  docker run -d -p 5001:5000 nikhil976/simple-python-flask-app:latest
fi
