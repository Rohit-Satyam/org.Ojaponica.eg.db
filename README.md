# org.Ojaponica.eg.db

# Introduction
This org.db package is made for organism annotation of Oryza sativa haponica for GO term enrichment analysis. The raw data was obtained from Plant Biomart. Following filters were used to obtain the .csv file:

```
    Gene stable ID
    Transcript stable ID
    GO term accession
    GO term name
    GO term definition
    GO term evidence code
    GO domain
    Gene name
    Gene Synonym
    Chromosome/scaffold name
```

# Installation

The package was tested on R version > 4.0. In case if you find discrepency in installation, please dropin the issue.

```r
install.packages("https://github.com/Rohit-Satyam/org.Ojaponica.eg.db/releases/download/v0.1/org.Ojaponica.eg.db-v0.1.tar.gz", repos = NULL, 
                 type="source")
```

# Usage
The package can be loaded as

```r
library(org.Ojaponica.eg.db)
ojp <-org.Ojaponica.eg.db
#To know the keytypes use
AnnotationDbi::keytypes(ojp)

# To know the columns, use
AnnotationDbi::columns(ojp)
```

The GO term enrichment analysis can be done as follows:
```r
library(clusterProfiler)
sample_gene <- c("Os01g0100100","Os01g0100200","Os01g0100300","Os01g0100400","Os01g0100466","Os01g0100500")
ojp <- org.Ojaponica.eg.db
sample_test <- enrichGO(sample_gene, OrgDb=ojp, pvalueCutoff=1, qvalueCutoff=1, keyType = "GID", ont="ALL")
```
Learn more about GSEA from [this blog](https://guangchuangyu.github.io/2016/01/go-analysis-using-clusterprofiler/)

# References
1. [AnnotationForge](docs.google.com/spreadsheets/d/1ujC0Grg0y6Kov3srXI8K4mA73hjp4bgdpCNN8qroxqQ/edit#gid=0)
