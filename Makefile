OUT_DIR=output
IN_DIR=input
STYLE=./style.css
CV_ENG=resume
CV_SPA=resume-spanish


all: html pdf

html: init
	pandoc --standalone --include-in-header $(STYLE) --from markdown --to html --output $(OUT_DIR)/$(CV_ENG).html $(IN_DIR)/$(CV_ENG).md;
	pandoc --standalone --include-in-header $(STYLE) --from markdown --to html --output $(OUT_DIR)/$(CV_SPA).html $(IN_DIR)/$(CV_SPA).md;

pdf: html
	wkhtmltopdf --enable-local-file-access $(OUT_DIR)/$(CV_ENG).html $(OUT_DIR)/$(CV_ENG).pdf
	wkhtmltopdf --enable-local-file-access $(OUT_DIR)/$(CV_SPA).html $(OUT_DIR)/$(CV_SPA).pdf


init: dir

dir:
	mkdir -p $(OUT_DIR)

clean:
	rm -f $(OUT_DIR)/*
