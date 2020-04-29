## Steps to build and run the app
 - Ensure you have Docker installed
 - `git clone https://github.com/shyam-biradar/k8s-demo-app.git`
 - `sudo docker build -t tv-demo-app:v1 .` 
 - `sudo docker run -p 8181:80 tv-demo-app:v1`

## Access web console at http://IP:8181
