# yum/dnf post-transaction reporting action+script

These files should be owned by root and not world/group readable.

These scripts very basic, and are intended for use with a specific version of splunk, and as such they should be treated as example / reference code when implementing in your environment.

Edit the `*-post-transaction-reporting.sh` scripts and change `SPLUNK_URL` + `SPLUNK_AUTHORIZATION` values as appropriate.

For yum-based systems:
- `yum install yum-plugin-post-transaction-actions`
- Save `yum-post-transaction-reporting.sh` to `/usr/local/sbin/` (or edit `yum-post-transaction-reporting.action` to reflect the correct path)
- Save `yum-post-transaction-reporting.action` to `/etc/yum/post-actions/`

For dnf-based systems:
- `dnf install python3-dnf-plugin-post-transaction-actions`
- Save `dnf-post-transaction-reporting.sh` to `/usr/local/sbin/` (or edit `dnf-post-transaction-reporting.action` to reflect the correct path)
- Save `dnf-post-transaction-reporting.action` to `/etc/dnf/plugins/post-transaction-actions.d/`

