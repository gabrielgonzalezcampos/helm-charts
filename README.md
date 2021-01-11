# CORD Bachelor Degree Thesis

## Helm Charts

Forked from [opencord/helm-charts](https://github.com/opencord/helm-charts). 

Added MultiUE support with OAISIM4 by indicating UE number and parameters at [values.yaml](https://github.com/marcllena/helm-charts/blob/master/oaisim4/values.yaml)

Code developed:

* **OAISIM2**: Tried to add second UE with another OAI instance, failing to provide connectivity.
* **OAISIM3**: Tried to add second UE in the same OAI instance, successful. Requires manual configuration of UE configmap.
* **OAISIM4**: Final version, as UE configmap is created automatically.
* **OMEC Control and Data Plane**: Hardcoded image tags to match CiaB Makefile 

Added a chart to use SiaB with BMv2 and Stratum as AGG switch.
* **Mininet-BMv2**: Mininet Stratum topology by default, with BMv2 switch.

Marc Llena
