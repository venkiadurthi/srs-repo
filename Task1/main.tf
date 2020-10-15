provider "aws" {
    version = "3.10.0"
    region = "<Name>"
    #Name can be ap-south-1/ap-southeast-1
}

resource "aws_db_instance" "RDS-MySQL" {
  allocated_storage    = 20
  max_allocated_storage= 100
  storage_type         = "io1"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "demodb"
  username             = "user"
  password             = "YourPwdShouldBeLongAndSecure!"
  parameter_group_name = "RDS.mysql5.7"
  storage_encrypted    = true
  multi_az             = false
}

resource "aws_db_snapshot" "RDS-Snapshot" {
  db_instance_identifier = aws_db_instance.RDS-MySQL.id
  db_snapshot_identifier = "testsnapshot1234"
  encrypted              = true
}