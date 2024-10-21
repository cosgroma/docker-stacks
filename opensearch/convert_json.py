import json
from genson import SchemaBuilder

# Function to generate JSON schema from a JSON file
def generate_json_schema(json_file_path):
    # Read the JSON file
    with open(json_file_path, 'r') as file:
        data = json.load(file)

    # Create a Schema Builder
    builder = SchemaBuilder()
    builder.add_object(data)

    # Generate schema
    return builder.to_schema()

# Path to your JSON file
json_file_path = 'path_to_your_json_file.json'

def generate_schema(json_file_path):
    schema = generate_json_schema(json_file_path)
    print(json.dumps(schema, indent=4))

import sys

def main():
    # get arguments
    args = sys.argv[1:]
    if len(args) != 1:
        print('Usage: python convert_json.py <json_file_path>')
        sys.exit(1)
    
    # get json file path
    json_file_path = args[0]
    generate_schema(json_file_path)

if __name__ == '__main__':
    main()
