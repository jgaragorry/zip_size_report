#!/bin/bash

# Script para calcular el tamaño total de archivos .zip modificados hace más de 60 días

# Descripcion:
# El script busca archivos con extensión .zip en el directorio /home/uplanner/integracion/csv que hayan sido modificados hace más de 60 días.
# Calcula el tamaño total de estos archivos.
# Finalmente, muestra el tamaño total en gigabytes (GB) con dos decimales.

# Instrucciones:
# Crea un archivo llamado zip_size_report.sh en tu directorio de trabajo.
# Copia y pega el contenido del script anterior en ese archivo.
# Dale permisos de ejecución al script con chmod +x zip_size_report.sh.
# Ejecuta el script con ./zip_size_report.sh.

# Directorio de búsqueda
DIRECTORY="/home/uplanner/integracion/csv"

# Buscar archivos .zip modificados hace más de 60 días y calcular su tamaño
total_size=$(find "$DIRECTORY" -type f -name "*.zip" -mtime +60 -exec du -s {} \; | awk '{sum+=$1} END {print sum}')

# Convertir el tamaño a GB con dos decimales
size_in_gb=$(echo "scale=2; $total_size / (1024*1024)" | bc)

# Mostrar el resultado
echo "Tamaño total de archivos .zip: $size_in_gb GB"

