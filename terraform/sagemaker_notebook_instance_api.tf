# Create a lambda function that can be called from iOS shortcuts. The function will manage the lifecycle of SageMaker Notebook Intance.

# Create Lambda Function
# IAM Role - lambda, sagemaker-notebook-instance


resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "test_lambda" {  
  function_name = "my_notebook_instance_lifecyle"
  description = "Manage the lifecycle of my notebook instance"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "main.handler"
  runtime = "nodejs12.x"

  memory_size = 128
  timeout     = 60

  source_code_hash = filebase64sha256("../sagemaker_notebook_instance_api.zip")
  filename = "../sagemaker_notebook_instance_api.zip"

  environment {
    variables = {
      foo = "bar"
    }
  }
}

