#!/bin/bash

# Set your organization name and search keyword
org="Azure"
keyword="avm"

# Fetch repositories and filter by keyword
# Note: Adjust the jq filter based on your exact matching needs
repos=$(gh repo list $org --limit 1000 --json nameWithOwner,sshUrl | jq -r ".[] | select(.nameWithOwner | test(\"$keyword\")) | .sshUrl")

# Clone each repository
for repo in $repos; do
    echo "Cloning $repo..."
    git clone $repo
done

echo "All matching repositories have been cloned."
