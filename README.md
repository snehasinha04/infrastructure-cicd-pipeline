# Infrastructure CI/CD Pipeline | Terraform, AWS & GitHub Actions

## Project Overview

This project demonstrates how to automate infrastructure code quality checks using **Terraform and GitHub Actions**.

The pipeline automatically checks Terraform formatting, initializes Terraform, and validates infrastructure configuration whenever changes are pushed to the `main` branch or submitted through a pull request.

The project also uses **Moto**, a local AWS mocking tool, to test S3 bucket creation and versioning without deploying resources to a real AWS account.

## Technologies Used

- **Terraform:** Infrastructure as Code (IaC)
- **AWS S3:** Cloud storage resource defined using Terraform
- **GitHub Actions:** CI automation
- **Moto:** Local AWS service simulation
- **Git & GitHub:** Version control and collaboration

## Project Architecture

```text
Developer
   |
   v
GitHub Repository
   |
   v
Pull Request / Push to Main
   |
   v
GitHub Actions Workflow
   |
   +--> Terraform Format Check
   |
   +--> Terraform Initialize
   |
   +--> Terraform Validate
   |
   v
CI Pipeline Result
```

Local infrastructure testing is performed separately using Moto:

```text
Terraform Configuration
        |
        v
   Moto S3 Endpoint
        |
        v
Local S3 Bucket
        |
        v
S3 Versioning Enabled
```

## Project Structure

```text
infrastructure-cicd-pipeline/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── versions.tf
│   └── .terraform.lock.hcl
│
├── terraform-local/
│   ├── main.tf
│   ├── variables.tf
│   ├── provider.tf
│   ├── versions.tf
│   └── .terraform.lock.hcl
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
└── .gitignore
```

## CI Pipeline Workflow

The GitHub Actions workflow performs the following steps:

1. **Checkout Repository:** Downloads the repository code into the GitHub Actions runner.
2. **Setup Terraform:** Installs Terraform.
3. **Format Check:** Checks whether Terraform files follow standard formatting.
4. **Initialize:** Initializes Terraform without configuring a remote backend.
5. **Validate:** Checks the Terraform configuration for syntax and configuration errors.

The workflow runs when changes are pushed to `main` or when a pull request includes changes to the Terraform configuration or workflow file.

## Local Infrastructure Testing Using Moto

Moto provides a local AWS-compatible environment for testing infrastructure without creating actual AWS resources.

The local Terraform configuration creates:

- An S3 bucket.
- S3 bucket versioning.
- Project-related resource tags.

### Run the Local Test

**1. Start the Moto server:**

```powershell
py -m moto.server -H 127.0.0.1 -p 5000
```

**2. Open another terminal and navigate to the project directory:**

```powershell
cd C:\Users\SNEHA\infrastructure-cicd-pipeline\terraform-local
```

**3. Initialize Terraform:**

```powershell
terraform init
```

**4. Preview infrastructure changes:**

```powershell
terraform plan
```

**5. Create local resources:**

```powershell
terraform apply
```

Type `yes` when Terraform asks for confirmation.

**6. Verify the Terraform state:**

```powershell
terraform state list
```

Expected resources:

```text
aws_s3_bucket.project_bucket
aws_s3_bucket_versioning.project_versioning
```

## Key Learnings

- Understanding Infrastructure as Code using Terraform.
- Automating Terraform checks using GitHub Actions.
- Understanding CI workflows and pull requests.
- Testing AWS infrastructure locally using Moto.
- Managing S3 bucket configuration and versioning.
- Using Git and GitHub for version control.

## Project Status

- Terraform configuration created.
- GitHub Actions CI workflow successfully executed.
- Pull request and merge workflow tested.
- Local S3 bucket and versioning successfully tested using Moto.

**Note:** The AWS infrastructure configuration has been validated, but it has not been deployed to a real AWS account. The local infrastructure test was performed using Moto.