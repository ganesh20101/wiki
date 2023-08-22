# Use an official Ubuntu as the base image
FROM sarathii

# Install prerequisites and Jenkins
RUN apt-get update && apt-get install -y openjdk-11-jdk wget gnupg2 && \
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - && \
    sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' && \
    apt-get update && apt-get install -y jenkins

# Expose Jenkins port
EXPOSE 8080

# Start Jenkins
CMD ["java", "-jar", "/usr/share/jenkins/jenkins.war"]
