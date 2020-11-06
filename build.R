library(AnnotationForge)
table <- read.csv("mart_export.txt",h=T)

## To know about the Symbols (Keytypes) and their meaning
help('SYMBOL')

## Creating Ensembl ID to Gene Symbol and ALIAS mapping
oSym <- unique(table[,c(1,8,9)])
oSym <- oSym[oSym[,2]!="-",]
colnames(oSym) <- c("GID","GENENAME", "ALIAS")

## Ensembl ID to Chromosome Mapping
oChr <- unique(table[,c(1,10)])
oChr <- oChr[oChr[,2]!="-",]
colnames(oChr) <- c("GID","CHR")

## Ensembl ID to GO Term mapping
oGO <- unique(table[,c(1,3,6)])
oGO <- oGO[oGO[,2]!="",]
oGO <- oGO[oGO[,3]!="",]
colnames(oGO) <- c("GID","GO","EVIDENCE")

makeOrgPackage(gene_info=oSym, chromosome=oChr,go=oGO,
               version="0.1",
               maintainer="Rohit Satyam <rohitsatyam102@gmail.com>",
               author="Rohit Satyam <rohitsatyam102@gmail.com>",
               outputDir = ".",
               tax_id="39947",
               genus="Oryza",
               species="japonica",
               goTable="go")

install.packages("./org.Ojaponica.eg.db", repos=NULL, type="source")
