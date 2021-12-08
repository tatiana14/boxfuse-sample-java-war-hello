pipeline {
  agent {
          docker{
             image 'tatiana14/agent'
             registryCredentialsId '07bc1adf-1171-45a5-8b08-28aa61cd438f'
             args '-v /var/run/docker.sock:/var/run/docker.sock -u root '
          }

  }

  stages {

    stage('Checkout code') {
      steps {
        git 'https://github.com/tatiana14/boxfuse-sample-java-war-hello.git'
       
      }
    }

    stage('Build') {
      steps {
         sh "mvn package"
      }
    }

    stage('Build And Push Docker Image') {
      steps {
        sh 'docker build -t app_image .'
        sh 'docker tag app_image tatiana14/boxfuse_app:2.0.0'
        sh  'docker push tatiana14/boxfuse_app:2.0.0'

      }
    }
    
    stage('Run docker on instance-3') {
      steps {
             sh 'ssh-keyscan -H instance-3 >> ~/.ssh/known_hosts'
             sh """ssh root@instance-3<< EOF 
             docker run -d -p 8081:8080 tatiana14/boxfuse_app:2.0.0
             exit
             EOF"""
      }
    }
  }
}
