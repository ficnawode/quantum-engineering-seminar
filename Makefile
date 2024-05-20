PROJNAME=main

.PHONY: $(PROJNAME).pdf all clean

all: $(PROJNAME).pdf

%.tex: %.raw
	./raw2tex $< > $@

%.tex: %.dat
	./dat2tex $< > $@

$(PROJNAME).pdf: $(PROJNAME).tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make $<

cleanall:
	latexmk -C

clean:
	latexmk -c
