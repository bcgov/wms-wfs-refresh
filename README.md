# wms-wfs-refresh

This script will trigger rollout restarts for WMS and WFS test and prod deployments so that related pods can refresh themselves with the latest data from Geoserver's S3 store. 

This script can be used until test and production Geoserver WMS and WFS pods refresh themselves from relevant data sources, after which this repo can be deleted.

## Rationale for script

This repo and script exist primarily to document this task for Map team members. Don't make use of this script permanent, or bake it into a deployment process. Instead, update the Geoserver application to refersh this data automatically if possible.  

## Use

Clone the repo, make the script executable and run. The script was tested on Debian. Alternatively, use the OC commands directly, or apply updates through the interface.