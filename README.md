#README

##Jenkins slave version:
_**0.0.1**_

##Dependance:
_**docker 1.9**_

##Information:
Built on top of Java v1.8.65. This image contains awscli, Jenkins Swarm Client, NodeJS and NPM

##Usage:
`docker build --build-arg NODE_VERSION=0.12.9 --build-arg JENKINS_SWARM_VERSION=2.0 -t web-jenkins-slave:0.0.1 .`

If no build arguments are specified, it will automaticaly revert to Node version 0.12.9 and Jenkins Swarm version 2.0

