pipeline {
    agent any

    environment {
        SVC_ACCOUNT_KEY = credentials('terraform-auth')
    }
     
    stages {
        stage ('checkout'){
            steps {
                git branch: 'main', url: 'https://github.com/gcp9490/terraform-gcp.git'
            }
        }
      
		stage('Set Terraform path') {
            steps {
                script {
                    def tfHome = tool name: 'Terraform'
                    env.PATH = "${tfHome}:${env.PATH}"
                }
                sh 'echo $SVC_ACCOUNT_KEY | base64 -d > ./rakeshlab-jsonkey.json'
		        sh 'pwd'
                sh 'terraform --version'               
               
            }
        }
        
         stage('Initialize Terraform') {
		 steps {  
			  dir('VPC')
			 {
                sh 'terraform init'
			 }
		 }
	 }
				 
	stage('Terraform Plan') {
		 steps {  
			  dir('VPC')
			 {
                sh 'terraform plan'
			 }
		 }
	}
				 
	stage('Terraform Apply') {
		 steps {  
			  dir('VPC')
			 {
                sh 'terraform apply -auto-approve'
			 }
		 }
	}
                             
}
}
