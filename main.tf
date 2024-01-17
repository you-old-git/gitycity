data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro" 
  key_name = aws_key_pair.deployer
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDqBo98whikle5GRatzaDJ9wnrLsmHTrBy2cD/fDSy1s5EOVkQZ684RZ+uyGnawT6lgBPEFLGLUJ6HbLzvWXm8JaBD3vZBKWSQ6X+tR8g0HRR2M+EDZWElT2ergxIY74rGma2sK20QgcbR9hrxsSu6JBIeFJxFIWFeY1/fBe6+TtgIrDiEaDY1jEozoVjWINBKx7eNHeqYVYLeaPok9zzLMfOpuurFZeL0i96nCdDcbgAYc766lDt4m5IBNRznJy3R+AfmsdwCwobYzGDbjpTrwl3ikYJFYXlJJdnGnQPIFhdKf9of3JAyvneBmy0nwiPDj97+uImWSX1F9B/3oQxCiISwdWqsAjNw/9Grqh5Fe7BshYNvXaMSCOnWgx3M07+Lwtiv4Ceiw5wv7+zPR1gvTlTL8QcU3xmshalbPeOZTw/dr9cT2bEcMApAHYPcd6ALEiTf7hu+auqMvv8jKWWBCMKJS7wpBWomwIbi+6Ko5Ro44vmKfJ7dvNPoWHCa/qjC4ayVrkxkBqkfuL6+rkheENT/zSX5ff39pOTkut6G1QlSbMnVxkBVuOg3M4YMoPxZGJCbC/Qy/YAXFnJVOT6UkntFiqT2eopHiDqVQjk59O6q/owQhblCZm2AoGdwj6i07uUOLQl9V4rD6xVCPxyg40r6WyHdeFdxZeBS8Z9fpMQ== git@github.com:you-old-git/gitycity.git"
}
