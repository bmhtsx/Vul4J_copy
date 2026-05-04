#!/bin/bash

BASE_DIR="$HOME/vuln_tmp"

echo "========================================================="
echo "base directory: $BASE_DIR"
echo "========================================================="

mkdir -p "$BASE_DIR/Path_Traversal"
mkdir -p "$BASE_DIR/XXE"
mkdir -p "$BASE_DIR/XSS"
mkdir -p "$BASE_DIR/Injection"
mkdir -p "$BASE_DIR/Deserialization"
mkdir -p "$BASE_DIR/SSRF"
mkdir -p "$BASE_DIR/Input_Validation"

checkout_vul() {
    local vul_id=$1
    local category=$2
    local target_dir="$BASE_DIR/$category/$vul_id"
    
    echo " -> checkout: $vul_id (category: $category) to $target_dir"
    
    vul4j checkout --id "$vul_id" -d "$target_dir"
    
    if [ $? -eq 0 ]; then
        echo " [OK] $vul_id checkout completed."
    else
        echo " [ERROR] $vul_id checkout failed. Please try again later or check vul4j configuration."
    fi
}

# 1. Path Traversal / Zip Slip
checkout_vul "VUL4J-18" "Path_Traversal"
checkout_vul "VUL4J-41" "Path_Traversal"
checkout_vul "VUL4J-43" "Path_Traversal"
checkout_vul "VUL4J-65" "Path_Traversal"
checkout_vul "VUL4J-69" "Path_Traversal"
checkout_vul "VUL4J-76" "Path_Traversal"
checkout_vul "VUL4J-79" "Path_Traversal"

# 2. XXE
checkout_vul "VUL4J-2"  "XXE"
checkout_vul "VUL4J-15" "XXE"
checkout_vul "VUL4J-24" "XXE"
checkout_vul "VUL4J-47" "XXE"
checkout_vul "VUL4J-61" "XXE"
checkout_vul "VUL4J-64" "XXE"

# 3. XSS
checkout_vul "VUL4J-23" "XSS"
checkout_vul "VUL4J-25" "XSS"
checkout_vul "VUL4J-34" "XSS"
checkout_vul "VUL4J-50" "XSS"
checkout_vul "VUL4J-59" "XSS"
checkout_vul "VUL4J-60" "XSS"

# 4. OS Command / Downstream Injection
checkout_vul "VUL4J-33" "Injection"
checkout_vul "VUL4J-38" "Injection"
checkout_vul "VUL4J-42" "Injection"
checkout_vul "VUL4J-45" "Injection"

# 5. Insecure Deserialization
checkout_vul "VUL4J-37" "Deserialization"
checkout_vul "VUL4J-54" "Deserialization"
checkout_vul "VUL4J-77" "Deserialization"
checkout_vul "VUL4J-78" "Deserialization"

# 6. SSRF
checkout_vul "VUL4J-51" "SSRF"
checkout_vul "VUL4J-56" "SSRF"

# 7. General Input Validation
checkout_vul "VUL4J-1"  "Input_Validation"
checkout_vul "VUL4J-10" "Input_Validation"
checkout_vul "VUL4J-14" "Input_Validation"
checkout_vul "VUL4J-26" "Input_Validation"
checkout_vul "VUL4J-30" "Input_Validation"
checkout_vul "VUL4J-48" "Input_Validation"
checkout_vul "VUL4J-49" "Input_Validation"
checkout_vul "VUL4J-66" "Input_Validation"
checkout_vul "VUL4J-68" "Input_Validation"

echo "========================================================="
echo "All checkout tasks completed!"
echo "Please go to $BASE_DIR to view the code."