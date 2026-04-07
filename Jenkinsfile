pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // This pulls the latest code from your repo
                checkout scm
            }
        }
        
        stage('Docker Build') {
            steps {
                // This builds the image using the Dockerfile in your folder
                sh 'docker build -t dattaramcloud/trend-app:latest .'
            }
        }
        
        stage('Docker Push') {
            steps {
                // This logs into DockerHub and pushes the image
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', passwordVariable: 'DOCK_PASS', usernameVariable: 'DOCK_USER')]) {
                    sh "echo $DOCK_PASS | docker login -u $DOCK_USER --password-stdin"
                    sh 'docker push dattaramcloud/trend-app:latest'
                }
            }
        }
    }
}
