provider "aws" {
  region = var.region
  access_key = var.my_access_key
  secret_key = var.my_secret_key
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "lambda.zip"
  function_name = "terraform_function_udacity"
  role          = "arn:aws:iam::860179914372:role/service-role/neoris-lambda-test-role-uc0ugf7r"
  handler       = "lambda.lambda_handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("lambda.zip")

  runtime = "python3.8"

  environment {
    variables = {
      greeting = var.greeting
    }
  }
}