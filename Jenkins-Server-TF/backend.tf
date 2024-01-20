terraform {
  backend "s3" {
    bucket         = "my-ews-baket1"
    region         = "eu-west-1"
    key            = "full-project-of-deploy-re-nodejs-app/Jenkins-Server-TF/terraform.tfstate"
    dynamodb_table = "Lock-Files"
    encrypt        = true
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}