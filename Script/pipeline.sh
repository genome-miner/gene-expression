# Downloading SRA data
wget https://sra-pub-run-odp.s3.amazonaws.com/sra/SRR22805709/SRR22805709

# Converting SRA data to fastq format
fastp-dump --split-files SRR22805709

# Quality checking
fastqc SRR22805709_1.fastq SRR22805709_2.fastq

# Trimming
fastp -i SRR22805709_1.fastq -i SRR22805709_2.fastq -o  SRR22805709_1.trimmed.fastq -o  SRR22805709_2.trimmed.fastq -h report.html -j report.json

# Downloading reference genome
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/500/365/GCF_000500365.1_VIP4-0439/GCF_000500365.1_VIP4-0439_genomic.fna.gz

# Decompressing the reference genome
gunzip genomic.fna.gz

# Indexing the reference genome
bowtie2-build genomic.fna genome-index

# Alignment
bowtie2 -x genome-index -1 SRR22805709_1.trimmed.fastq -2 SRR22805709_2.trimmed.fastq -S SRR22805709.sam -p 4

# SAM to BAM
samtools view -Sb SRR22805709.sam > SRR22805709.bam

# Sorting and Indexing
samtools sort SRR22805709.bam -o SRR22805709.sorted.bam
samtools index SRR22805709.sorted.bam

# For featureCount tool install subread package
conda install -c bioconda subread

# Installing annotation file
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/500/365/GCF_000500365.1_VIP4-0439/GCF_000500365.1_VIP4-0439_genomic.gff.gz

# Unzipping gene-annotation.zip
unzip gene-annotation.zip

# Counting the number of genes/exons
featureCount -a genomic.gff -t g -g ID -p B -o counts.txt SRR22805709.sorted.bam

# Visualization is done on GUI (iDEP tool)
