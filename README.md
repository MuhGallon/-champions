# Project Wildcard v1.3 — Competitive Team Lab / season-ready foundation

## What this release actually provides
- Retains permanent local key `wildcard:permanent:v1`, Supabase account sync, battle record merging, snapshots and JSON backup.
- Unlimited saved teams and dynamic lead-pair selection for whichever team is active.
- More complete set editor: species, item, ability, nature, EV text, IV text, four moves, notes.
- Showdown-style import/export that preserves ability, nature, EV/IV strings, items and moves for ordinary sets. It does not implement the full Showdown parser or validate every field.
- Season & Rules page driven by checked-in `regulations.json`, versioned manifest, user-triggered and on-load fetch, previous format archive. New seasons never delete teams or records. Format legality is explicitly **unverified** until maintainers provide official roster/constraints and mark them verified. Species-only validation is not full legality.
- Meta Scout defensive type overview for the limited starter dex and JSON import of externally sourced tournament statistics. No stats are invented and no third-party scraping is claimed.
- Existing speed calculator, partial roster/lead heuristic, offline caching, cloud sync settings and Data Vault.

## Critical limitations — NOT equivalent yet to the named services
No complete Champions Pokédex, learnsets, full Pokémon Showdown battle engine, damage-calculation engine, curated tournament feed, or independent season auto-discovery. The regulation manifest automatically **checks for published updates**, but a maintainer must update `regulations.json` with sourced official rules for each season. The coverage table excludes unknown species rather than guessing. Battle analysis is heuristic and must not be treated as an exact simulation. Meta stats require manually imported sourced JSON for now.

## Deploy safely
1. EXPORT and save existing battle-history backups from the old app and each device.
2. Extract the ZIP, and upload the app files inside it into **`wildcard-next/`**, not your existing repository root. Do not upload the ZIP as a single file.
3. Check that `index.html`, `app.js`, `sw.js`, `manifest.webmanifest`, `icon.svg`, `regulations.json` share the same folder; `SUPABASE_SETUP.sql` is needed in Supabase SQL Editor but does not need to be hosted.
4. Wait for GitHub Pages then visit `https://muhgallon.github.io/-champions/wildcard-next/`. A hard refresh may be needed if an older service worker cached files.
5. Verify team changes recalculate Matchup Lab, battle history persists on refresh, season selection does not reset battles, and Data Vault backup exports.
6. Set up Supabase separately for cross-device syncing using the instructions in the v1.2 package and SQL. Use only the publishable/anon key, NEVER a service-role or secret key.

## Season updates
`regulations.json`: version, checkedAt, active format ID, regulations list with unique id, name, start/end, source URL or citation, species[], rules{battle,teamSize,bring}, verified boolean. On every season, add a new regulation entry and set `active`, retain the older regulations, and increment `version`. Before marking `verified: true`, cross-check the roster and all rule restrictions against official event documentation. Even with a verified species roster, the app does not validate full item/move/form legality.

## Import tournament stats
Meta Scout expects JSON `{ "version":"date", "format":"Reg M-C Doubles", "source":"URL and capture date", "pokemon":[{"name":"Rillaboom","usage":34.2,"items":["..."] ,"moves":[],"abilities":[],"partners":[]}] }`. The app does not independently verify the supplied stats.

## Testing and back-up
Import a backup after updating to confirm data migration; test two separate browsers/devices with the same Supabase credentials. Back up before edits/updates. Concurrent cloud edits can still conflict. You own this fan project; avoid copying copyrighted source code or UI assets from third-party sites.
