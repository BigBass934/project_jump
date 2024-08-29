provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "app_server" {
    ami           = "ami-0abcdef1234567890"
    instance_type = "t2.micro"

    tags = {
        Name = "MyAppServer"
    }

    key_name = "my-key-pair"
}

resource "aws_rds_instance" "db_instance" {
    allocated_storage       = 20
    engine                  = "postgres"
    engine_version          = "5.7.29"
    instance_class          = "db.t2.micro"
    name                    = "mydbinstance"
    username                = "admin"
    password                = "password"
    parameter_group_name    = "default.postgres12"

    tags = {
        Name = "MyDBInstance"
    }
}