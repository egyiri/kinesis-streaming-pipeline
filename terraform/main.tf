resource "aws_s3_bucket" "international_bucket" {
  bucket = "kinesis-project-international-${data.aws_caller_identity.current.account_id}"
  

  tags = {
    Name        = "My International bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "usa_bucket" {
  bucket = "kinesis-project-usa-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "My  USA bucket"
    Environment = "Dev"
  }
}

data "aws_caller_identity" "current" {}


resource "aws_s3_bucket_ownership_controls" "international_bucket_ownership" {
  bucket = aws_s3_bucket.international_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}


resource "aws_s3_bucket_acl" "international_bucket_acl" {
  bucket = aws_s3_bucket.international_bucket.id
  depends_on = [aws_s3_bucket_ownership_controls.international_bucket_ownership]
  acl    = "private"
}

  resource "aws_s3_bucket_ownership_controls" "usa_bucket_ownership" {
    bucket = aws_s3_bucket.usa_bucket.id
    rule {
      object_ownership = "BucketOwnerPreferred"
    }
}

resource "aws_s3_bucket_acl" "usa_bucket_acl" {
    bucket = aws_s3_bucket.usa_bucket.id
    depends_on = [aws_s3_bucket_ownership_controls.usa_bucket_ownership]
    acl    = "private"
}
