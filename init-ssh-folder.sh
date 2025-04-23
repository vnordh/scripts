#!/bin/bash

# Define the SSH directory path in your home directory
ssh_dir="$HOME/.ssh"

# Define the filename for the empty ED25519 private key file
private_key_file="id_ed25519"
private_key_path="$ssh_dir/$private_key_file"

# Define the desired permissions for the SSH directory and private key file
ssh_dir_permissions="700"  # Owner: read, write, execute
private_key_permissions="600" # Owner: read, write

# Check if the SSH directory exists
if [[ ! -d "$ssh_dir" ]]; then
  # Directory does not exist, so create it
  mkdir -p "$ssh_dir"
  echo "Action: Created SSH directory: $ssh_dir"
else
  # Directory already exists
  echo "Status: SSH directory already exists: $ssh_dir"
fi

# Set the correct permissions for the SSH directory
chmod "$ssh_dir_permissions" "$ssh_dir"
echo "Action: Set permissions for SSH directory to: $ssh_dir_permissions"

# Check if the private key file exists
if [[ ! -f "$private_key_path" ]]; then
  # File does not exist, so create it
  touch "$private_key_path"
  echo "Action: Created empty private key file: $private_key_path"
else
  # File already exists
  echo "Status: Private key file already exists: $private_key_path"
fi

# Set the correct permissions for the private key file
chmod "$private_key_permissions" "$private_key_path"
echo "Action: Set permissions for private key file to: $private_key_permissions"

echo "Status: SSH setup complete."
