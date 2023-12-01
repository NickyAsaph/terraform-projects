locals {
  bucket_name = "mytest-nick-bucket"
  env         = "dev"
}

resource "aws_s3_bucket" "nick_test_bucket" {
  bucket = local.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "nick_test_bucket" {
  bucket = local.bucket_name
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "nick_test_bucket" {
  bucket = local.bucket_name

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.nick_test_bucket,
    aws_s3_bucket_public_access_block.nick_test_bucket,
  ]

  bucket = local.bucket_name
  acl    = "public-read-write"


  # tags = {
  #   Name        = local.bucket_name
  #   Environment = local.env
  # }
}


