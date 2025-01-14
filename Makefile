.PHONY: deploy sync-locale
deploy:
	git checkout master
	git merge --no-edit dev
	git push origin master
	git checkout dev

sync-locale:
	cp skill-package/interactionModels/custom/en-US.json skill-package/interactionModels/custom/en-AU.json
	cp skill-package/interactionModels/custom/en-US.json skill-package/interactionModels/custom/en-CA.json
	cp skill-package/interactionModels/custom/en-US.json skill-package/interactionModels/custom/en-GB.json
	cp skill-package/interactionModels/custom/en-US.json skill-package/interactionModels/custom/en-IN.json