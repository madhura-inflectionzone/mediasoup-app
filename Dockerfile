# Use the latest Node.js LTS version as the base image
FROM node:lts

# Install system dependencies required by MediaSoup
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the entire source code into the container
COPY . .

# Expose necessary ports
EXPOSE 4010

# Define the command to run your app
CMD ["node", "app.js"]
