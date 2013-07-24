create:
	cp template.html ${TITLE}.html
	sed -i '' -e 's/$${TITLE}/\${TITLE}/g' -e 's/$${ANSWER}/\${ANSWER}/g' ${TITLE}.html
	git add ${TITLE}.html
	git ci "${TITLE}"

publish:
	git checkout gh-pages
	git merge origin/gh-pages
	git push origin gh-pages

# target: start - Start Jekyll server
start:
	jekyll serve -w > /tmp/jekyll.access.log 2> /tmp/jekyll.errors.log &

# target: stop - Stop Jekyll server
stop:
	kill `ps -eaf | grep "jekyll serve" | grep -v grep | awk '{ print $$2 }'`

# target: status - Check if the Jekyll server is running
status:
	@ps -eaf | grep "jekyll serve" | grep -v grep | awk '{ print $$2 }'

# target: logs - Display Jekyll logs
logs:
	tail -f /tmp/jekyll.*
