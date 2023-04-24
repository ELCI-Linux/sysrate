#!/bin/bash

# Disable text globbing
set -f

# Initialize variable to store neofetch output
neofetch_output=""

# Run neofetch and append its output to the variable
for i in {1..3}; do
    neofetch_output+="$(neofetch)\n"
done

# Use the variable to create a command to evaluate
command="sgpt --chat .system \"Neofetch reports: ${neofetch_output}\""

# Evaluate the command
eval $command

# Use a derivative of the above syntax to request a system rating from gpt
command="sgpt --chat .system \"Please rate this system: $(neofetch --score)\""

# Evaluate the command with text globbing enabled
set +f
eval $command
