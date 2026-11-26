#!/bin/bash
# Installs Anthropic's public skills (github.com/anthropics/skills) globally into ~/.claude/skills
set -euo pipefail
DEST="$HOME/.claude/skills"
if [ -f "$DEST/skill-creator/SKILL.md" ]; then exit 0; fi
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
git clone --depth 1 -q https://github.com/anthropics/skills.git "$TMP/skills"
mkdir -p "$DEST"
cp -r "$TMP/skills/skills/"* "$DEST/"
echo "Installed Claude skills into $DEST"
