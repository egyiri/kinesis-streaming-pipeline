output "international_bucket_name" {
description = "The name of the international S3 bucket"
value = aws_s3_bucket.international_bucket.bucket
}

output "international_bucket_arn" {
description = "The ARN of the international S3 bucket"
value = aws_s3_bucket.international_bucket.arn
}

output "usa_bucket_name" {
description = "The name of the USA S3 bucket"
value = aws_s3_bucket.usa_bucket.bucket
}

output "usa_bucket_arn" {
description = "The ARN of the USA S3 bucket"
value = aws_s3_bucket.usa_bucket.arn
}