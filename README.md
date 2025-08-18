# Gene-expression
This repository contains an RNA-seq analysis pipeline implemented on Linux for analyzing transcriptomic data using Next-Generation Sequencing (NGS).

# Project Overview
1. **Objective:** Quantify gene expression levels from RNA-seq data.
2. **Reference Genome:** _Vibrio parahaemolyticus_ VIP4-0439 (https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/500/365/GCF_000500365.1_VIP4-0439/GCF_000500365.1_VIP4-0439_genomic.fna.gz)
3. **Sample Data:** SRA dataset ( https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR22805709/SRR22805709)
4. **Annotation file:** Annotation file gives us information regarding exons, introns, CDSs, UTRs, and other functional elements (ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/500/365/GCF_000500365.1_VIP4-0439/GCF_000500365.1_VIP4-0439_genomic.gff.gz)
5. **Output:** Gene counts table (counts.txt) for downstream differential expression analysis.

# Tools Used
1. FastQC: For quality checking raw reads
2. SRA Toolkit (fasterq-dump): For converting .sra files into FASTQ format
3. Fastp: For adapter trimming and quality filtering
4. Bowtie2: For reference genome indexing and alignment
5. Samtools: For file conversion, sorting, and indexing
6. Subread (featureCounts): For counting gene/exon reads
7. iDEP: For visualization and differential expression analysis (GUI-based)
8. Bash: For shell scripting automation

# RNA-seq Workflow
1. Data/         # SRA data 
2. Quality/      # Quality of SRA data before and after trimming
3. Genome/       # Reference genome and indexed files  
4. SAM/          # SAM file  
5. BAM/          # BAM file  
6. Annotation/   # Annotation file data 
7. Gene-count/   # How many reads mapped to each gene
8. iDEP-result/  # Pre-process and heatmap
9. Script/       # Pipeline script
10. Documents/   # Flowchart and images
**Note:** Somes files have been compressed using the **gzip** command to minimize their size.

# Pipeline Steps (Summary)
1. Download SRA data
2. Convert SRA to FASTQ
3. Quality check (FastQC)
4. Read trimming & filtering (Fastp)
5. Download and prepare reference genome
6. Decompress genome
7. Build Bowtie2 index
8. Mapping & alignment (Bowtie2 → SAM file)
9. Convert SAM to BAM, sort & index (Samtools)
10. Download gene annotation (GFF file)
11. Count gene/exon reads (featureCounts)
12. Visualization & downstream analysis with iDEP GUI

# Results Summary
**Sample:** SRR22805709
**Reference:** GCF_000500365.1_VIP4-0439
**Output:** counts.txt (gene expression matrix)
**Visualization:** Performed using iDEP tool for gene expression profiling and pathway analysis.

# Key Concepts
Bioinformatics | RNA-seq | Transcriptomics | Gene Expression | NGS Pipelines | Shell Scripting | Data Analysis

# Contact
I’m a biotechnology student exploring bioinformatics pipelines for transcriptomics and genomics research. Open to learning and collaboration!
**Email:** biotechnologist09pharma@gmail.com

# Images and Flowchart
RNA-seq pipeline workflow and related images are available in the Document folder.

# Note
This is a learning project for practicing RNA-seq data analysis and shell scripting on Linux. Reference genome and sample data are used strictly for educational purposes.
