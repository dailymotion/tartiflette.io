workflow "Push tartiflette.io Docker Image" {
  on = "push"
  resolves = ["Build"]
}

action "Docker Registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  secrets = ["DOCKER_USERNAME", "GITHUB_TOKEN", "DOCKER_PASSWORD"]
}

action "Build" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Docker Registry"]
  args = "build -t dailymotion/tartiflette.io:$GITHUB_SHA ."
}