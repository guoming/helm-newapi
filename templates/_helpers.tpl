{{/*
Define some default values for the xxl-job chart.
*/}}
{{- define "newapi.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "newapi.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride -}}
{{- else -}}
{{ $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name -}}
{{- .Release.Name -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified destinationRule name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "newapi.mysql.fullname" -}}
{{ template "newapi.fullname" . }}-mysql
{{- end -}}


{{/*
Create a default fully qualified destinationRule name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "newapi.redis.fullname" -}}
{{ template "newapi.fullname" . }}-redis
{{- end -}}