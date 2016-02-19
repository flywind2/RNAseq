#!/bin/bash
# Build EBV genome for STAR aligner without GTF file
# Written by David Coffey dcoffey@fhcrc.org
# Updated February 11, 2016

## Prerequisites (see Software_installation.sh)
# Download and install STAR aligner
# Download reference genome FASTA files

## Variables
# export STAR=".../STAR_2.5.0a/bin/Linux_x86_64/STAR"
# export GENOME_DIRECTORY=".../STAR_genomes/hg19"
# export REFERENCE_FASTA_FILE=".../hg19.fasta"
# export GENOME=""
# export EMAIL=""

START=`date +%s`
echo Begin Build_EBV_STAR_genome_no_GTF.sh for genome $GENOME on `date +"%B %d, %Y at %r"`

mkdir -p $GENOME_DIRECTORY
cd $GENOME_DIRECTORY

# Build STAR genome
$STAR \
--runMode genomeGenerate \
--genomeDir $GENOME_DIRECTORY \
--genomeFastaFiles $REFERENCE_FASTA_FILE \
--runThreadN 4 \
--genomeSAindexNbases 9 # Log2(genome size)/2 - 1

END=`date +%s`
MINUTES=$(((END-START)/60))
echo End Build_EBV_STAR_genome_no_GTF.sh for genome $GENOME.  The run time was $MINUTES minutes.

echo "The runtime was $MINUTES minutes" | mail -s "Finished Build_EBV_STAR_genome_no_GTF.sh for sample $GENOME" $EMAIL