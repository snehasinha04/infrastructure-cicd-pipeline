resource "aws_s3_bucket" "project_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "Infrastructure-CICD-Demo"
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "project_versioning" {
  bucket = aws_s3_bucket.project_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}