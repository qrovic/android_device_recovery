#!/bin/bash
# Sync
telegram -M "Pterodon - Moto G5S: Sync Device (Dependencies) Tree started"
SYNC_START=$(date +"%s")

. build/envsetup.sh
lunch omni_montana-eng
SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
telegram -M "Pterodon - Moto G5S: Device Tree Sync (Dependencies) completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

# Build
telegram -m "Pterodon - Moto G5S: Building Recovery started"
SYNC_START=$(date +"%s")
mka recoveryimage

SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
telegram -M "Pterodon - Moto G5S: Building completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

# Output
telegram -f out/target/product/montana/recovery.img "[Pterodon Recovery] [Unofficial] - Moto G5S"
