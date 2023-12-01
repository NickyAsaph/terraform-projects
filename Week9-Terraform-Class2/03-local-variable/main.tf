variable "bucket_prefix" {
  type    = string
  default = "nick-test"
}

locals {
  bucket_name = "${var.bucket_prefix}-bucket1"
}

resource "aws_s3_bucket" "my_test_bucket" {
  bucket = local.bucket_name
  acl    = "private"
}
