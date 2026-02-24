# CLI-Test-Suite-Runner-Bash
A reusable Bash framework for automated regression testing of CLI programs.

# Bash Test Suite Runner 

A lightweight, reusable Bash script for automating regression testing of command-line programs. Given a suite file listing test stems and a target program, the script runs each test, compares the actual output with the expected output, and reports any failures in a structured, human-readable format. 

## Features 

- **Suite-driven testing**: Reads a list of test stems from a suite file.
- **Flexible input model**:
   - Optional `stem.args` for command-line arguments.
   - Optional `stem.in` for standard input.
   - Required `stem.expect` for expected standard output.
- **Clear failure reports**:
   - Prints the test name, arguments, input, expected output, and actual output.
- **Clear error handling**:
   - Exits with an error if a required `.expect` file is missing.
   - Checks the number of script arguments.
- **Reusable across projects**:
   - Works with any CLI program that reads from stdin and/or argv.
     
- ## Usage
  
  ```bash
  ./runSuite.sh suite-file program
  
- **example**:
  ./runSuite.sh suite.txt ./myprogram
  Where suite.txt might contain:
  test1
  test2
  bigCase
