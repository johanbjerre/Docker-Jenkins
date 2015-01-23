FROM stackbrew/ubuntu:14.04
MAINTAINER Allan Espinosa "allan.espinosa@outlook.com"

RUN apt-get update && apt-get clean
RUN apt-get install -q -y wget openjdk-7-jre-headless && apt-get clean

ADD http://mirrors.jenkins-ci.org/war/1.596/jenkins.war /opt/jenkins.war
# ADD jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins

RUN mkdir -p /jenkins/plugins
ADD simple-theme-plugin.jpi /jenkins/plugins/simple-theme-plugin.jpi
# RUN (cd /jenkins/plugins && wget --no-check-certificate  http://updates.jenkins-ci.org/latest/simple-theme-plugin.hpi)
# ADD config.xml /jenkins/config.xml

ADD ./branding/userContent/blobb.png /jenkins/userContent/blobb.png
ADD ./branding/userContent/ci.png /jenkins/userContent/ci.png
ADD ./branding/userContent/ci2.png /jenkins/userContent/ci2.png
ADD ./branding/userContent/jenkinsstyle.css /jenkins/userContent/jenkinsstyle.css

ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080
CMD [""]