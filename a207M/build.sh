#!/bin/bash
# Sync
telegram -M "TWRP - A20s: Sync Device (Dependencies) Tree started"
SYNC_START=$(date +"%s")

. build/envsetup.sh
lunch omni_a207M-eng
SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
telegram -M "TWRP - A20s: Device Tree Sync (Dependencies) completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

# Build
telegram -m "TWRP - A20s: Building Recovery started"
SYNC_START=$(date +"%s")
mka recoveryimage

SYNC_END=$(date +"%s")
SYNC_DIFF=$((SYNC_END - SYNC_START))
telegram -M "TWRP - A20s: Building completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

# Output
telegram -f out/target/product/a207M/recovery.img "[TWRP Recovery] [Unofficial] - Samsung Galaxy A20s"