all: slides.pdf slides.html

# add or remove content files as desired here
SLIDES_FILES=\
	slides.md

DERIVED_FILES=\
	slides.pdf \
	slides.html

slides.pdf: $(SLIDES_FILES) Makefile
	pandoc --toc -H header.tex -B include-before-body.tex -A include-after-body.tex -t beamer --slide-level 2 -V theme:Endocode $(SLIDES_FILES) -o slides.pdf

slides.html: $(SLIDES_FILES) Makefile
	pandoc --toc $(SLIDES_FILES) -o slides.html

clean:
	rm -f $(DERIVED_FILES)

