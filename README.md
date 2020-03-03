## Build the image 

    docker build -t ycharki/sshkey:1.0 --build-arg SSH_PRIVATE_KEY="$(cat /root/.ssh/id_rsa)" .

## Run the image

    docker run ycharki/sshkey:1.0

## Note

this exemple provide you with a practical test using ARG to pass secret key