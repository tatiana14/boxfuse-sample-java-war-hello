FROM tomcat
WORKDIR boxfuse-sample-java-war-hello
ADD  target/hello-1.0.war /usr/local/tomcat/webapps/
