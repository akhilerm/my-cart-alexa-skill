### Alexa Todoist Shopping List skill

Alexa [deprecated](https://developer.amazon.com/en-US/docs/alexa/ask-overviews/deprecated-features.html#shopping-lists) the List Management REST API which was used
by Todoist to sync Alexa and the Shopping list Todoist Project on Jul 1, 2024. So the sync stopped working. This project
creates a new skill which you can host on your amazon developer account. This skill is *only* for creating shopping list
tasks via Alexa

#### Setting up the skill
1. Install and setup the [`ask`](https://developer.amazon.com/en-US/docs/alexa/smapi/quick-start-alexa-skills-kit-command-line-interface.html#prerequisites) CLI.
2. Create a new alexa hosted skill
```shell
akhil@akhil-ThinkPad-L14:~/W/alexa $ ask new
Please follow the wizard to start your Alexa skill project ->
? Choose a modeling stack for your skill:  Interaction Model
  The Interaction Model stack enables you to define the user interactions with a combination of utterances, intents, and slots.
? Choose the programming language you will use to code your skill:  NodeJS
? Choose a method to host your skill's backend resources:  Alexa-hosted skills
  Host your skill code by Alexa (free).
? Choose the default region for your skill:  us-east-1
? Please type in your skill name:  MyCart
? Please type in your folder name for the skill project (alphanumeric):  MyCart

Project directory for MyCart created at
        /home/akhil/Work/alexa/MyCart

Lambda code for MyCart created at
	./lambda

Skill schema and interactionModels for MyCart created at
	./skill-package

The skill has been enabled.

Hosted skill provisioning finished. Skill-Id: amzn1.ask.skill.abcdef01-2345-6789-abcd-ef0123456789
Please follow the instructions at https://developer.amazon.com/en-US/docs/alexa/hosted-skills/alexa-hosted-skills-ask-cli.html to learn more about the usage of "git" for Hosted skill.
```
3.Copy your [Todoist API Key](https://todoist.com/help/articles/find-your-api-token-Jpzx9IIlB), and export it as
```shell
export TODOIST_API_KEY_ALEXA_SKILL_ENV=<your key>
```
4. Get the Project ID of your `Shopping List` project from Todoist. (The project should already be created). Use the `id` field
```shell
curl -X GET 'https://api.todoist.com/rest/v2/projects'   --header 'Authorization: Bearer <your key>'
```
5. Export the above `id` as `SHOPPING_LIST_PROJECT_ID_ALEXA_SKILL_ENV`
6. Run the initialization script to prepare the dev environment with the skill code
```shell
wget https://gist.githubusercontent.com/akhilerm/db4b9faa5c5ae10cf0400948927406a6/raw/prepare_dev_env.sh
chmod +x prepare_dev_env.sh
./prepare_dev_env.sh <skill root directory> akhilerm/my-cart-alexa-skill
```
5. Use `make deploy` to deploy the skill to alexa. This will merge the `dev` branch to `master` branch and push
   the changes to AWS CodeCommit.

NOTE: While editing interaction models, only the `en-US.json` need to be edited and use `make sync-locale` to sync with
the other locales