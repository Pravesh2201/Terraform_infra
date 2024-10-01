resource "aws_vpc_peering_connection" "peer" {
  vpc_id      = var.vpc_id
  peer_vpc_id = var.peer_vpc_id
  auto_accept = true
}

# Routes for VPC Peering
resource "aws_route" "peer_public_route" {
  route_table_id         = var.public_route_table_id
  destination_cidr_block = "172.31.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "peer_private_route" {
  route_table_id         = var.private_route_table_id
  destination_cidr_block = "172.31.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
