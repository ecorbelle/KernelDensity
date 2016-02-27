R_OPTS=--vanilla

all: Diapos.pdf Scripts/Figures/KernelDensity1.pdf Screenshot.png

Scripts/Figures/KernelDensity1.pdf: Scripts/KernelDensity.R
	rm Scripts/Figures/*.pdf
	R CMD BATCH $(R_OPTS) Scripts/KernelDensity.R Scripts/KernelDensity.Rout

Screenshot.png: Scripts/Figures/KernelDensity10.pdf
	convert -density 200 Scripts/Figures/KernelDensity10.pdf Screenshot.png

Diapos.pdf: Diapos.tex Scripts/Figures/KernelDensity1.pdf
	# Crear as diapositivas de exemplo
	pdflatex Diapos.tex
	rm *.aux *.log *.nav *.out *.snm *.toc

