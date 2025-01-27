# Implement plan

1. Project Setup

- Create a Git Repository:
  - Create a new repository on GitHub (or your preferred platform).
- Local Development Environment:
  - Docker:
  - Create a Dockerfile and docker-compose.yml (refer to the example provided earlier).
  - Build and run the Docker containers.
- WordPress Installation:
  - Install WordPress within your Docker container.
  - Install and activate the WooCommerce plugin.
- Theme Selection:
  - Choose and install a suitable WooCommerce theme.
- Initial Commit:
  - Add all files and folders to Git (except for .git, .docker, and potentially large media files).
  - Commit the initial changes with a descriptive message (e.g., "Initial project setup with Docker").
  - Push the changes to your remote repository on GitHub.

2. Development Workflow

- Create Feature Branches:
  - Create a new branch for each feature or bug fix (e.g., feature/product-page-design, bugfix/cart-issue).
- Develop and Test Locally:
  - Make changes to your theme files, plugins, and PHP code within your Docker container.
  - Thoroughly test your changes locally.
- Commit Changes Frequently:
  - Commit your changes regularly and write clear and concise commit messages.
- Push to Remote Branch:
  - Push your local branch to the remote repository on GitHub.

3. Code Review and Collaboration

- Create Pull Requests:
  - Create a pull request on GitHub to merge your branch into the main branch.
- Code Review:
  - Request code reviews from other developers on your team.
  - Provide constructive feedback and address any identified issues.
- Merge and Deploy:
  - Once the code review is complete and all issues are resolved, merge the branch into the main branch.
- Trigger Kinsta Deployment: Utilize Kinsta's Git integration to automatically deploy the code from the main branch to your staging environment.

4. Staging and Production

- Staging Environment:
  - Kinsta provides a staging environment for testing.
  - Deploy the code from the main branch to the staging environment.
- Production Deployment:
  - Thoroughly test in the staging environment.
  - Deploy the code from the main branch to the production environment using Kinsta's deployment features.

5. Maintenance and Updates

- Regular Updates:
    - Create a new branch for each update (e.g., hotfix/wordpress-update).
    - Update WordPress, WooCommerce, and plugins within your Docker container.
    - Test updates thoroughly in the staging environment.
- Deploy updates to production.
- Security:
Implement security measures within your Docker environment.
Keep your server software, plugins, and Docker images updated.
Regularly review security logs.

---
# Before start:

## How we manage the dependence and themes
- php has `Composer` which the same as `npm` or `pip install`
- it will read the `composer.json` file, then download those things to `vendor` folder
- after that, it also move the package to the folder it should be

## How we develop with those pre-build plugin
- the idea is:
  - keep thing with plug-in and themes as it-is, because every time we version up, any code change in those folder will be override
  - so we has separated folder call `custom-plug-in` an `custom-theme`, install it to the wp itself.

## Install `docker` `docker-compose`
```cmd
docker -v
docker-compose --version
```

## Set up your `wp-config.php`
- just copy and rename `wp-config-sample.php` into `wp-config.php`

---
# Run your local env

## STEP 1:
- make sure you have docker and docker-compose

## STEP 2:
- run 
```
docker-compose up -d
```
- in your terminal it should print out 
```
[+] Running 4/4
 ✔ Network sample-woocommerce_default      Created                                                                                            0.1s 
 ✔ Volume "sample-woocommerce_mysql_data"  Created                                                                                            0.0s 
 ✔ Container sample-woocommerce-woo-db-1   Healthy                                                                                           10.9s 
 ✔ Container sample-woocommerce-woo-web-1  Started                                                                                           11.0s 
```
- check docker image
```
docker ps
```

```
CONTAINER ID   IMAGE                        COMMAND                  CREATED          STATUS                    PORTS                  NAMES
ecf88587d882   sample-woocommerce-woo-web   "docker-entrypoint.s…"   22 minutes ago   Up 21 minutes             0.0.0.0:8080->80/tcp   sample-woocommerce-woo-web-1
3d8a517f0ec2   mysql:5.7                    "docker-entrypoint.s…"   22 minutes ago   Up 22 minutes (healthy)   3306/tcp, 33060/tcp    sample-woocommerce-woo-db-1
```

## STEP 3:
- access to wp in browser
  - you might need to install wp if it's the first time you run the project
```
http://localhost:8080/
```

## STEP 4:
- develop
```
TBD
```

## STEP 5:
- stop dev
```
docker-compose down
```
- you will see in the terminal
```
[+] Running 3/3
 ✔ Container sample-woocommerce-woo-web-1  Removed                                                                                                                1.2s 
 ✔ Container sample-woocommerce-woo-db-1   Removed                                                                                                                1.6s 
 ✔ Network sample-woocommerce_default      Removed  
```
- don't worry, the data will not lost
  - database will be save in the volumes of docker