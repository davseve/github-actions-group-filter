#!/bin/bash

# Read the JSON file and filter objects based on input argument
filter_group() {
    group=$1
    if [[ "$group" == "all" ]]; then
        jq -c '.include' config.json
    else
        jq -c --arg group "$group" '.include | map(select(.group == $group))' config.json
    fi
}

# Call the function with the provided argument
filter_group "$1"