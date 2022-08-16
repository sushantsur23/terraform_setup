#2 images repositories in ECR as we have 2 docker images in our project

#create ECR repository

resource "aws_ecr_repository" "repository" {
    for_each = toset(var.repository_list)
    name = each.key
}

#Build Docker images and push to ECR
resource "docker_registry_image" "backend" {
    for_each = toset(var.repository_list) 
    name ="${aws_ecr_repository.repository[each.key].repository_url}:latest"

    build {
        context = "../application"
        dockerfile = "${each.key}.Dockerfile"
    } 
}

## Set up credentials to push to ECR
