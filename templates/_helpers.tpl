{{- define "gittechstack.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "gittechstack.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

#Create chart name and version as used by the chart label.

{{- define "gittechstack.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

#Selector labels

{{- define "gittechstack.selectorLabels" -}}
app.kubernetes.io/name: {{ include "gittechstack.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}