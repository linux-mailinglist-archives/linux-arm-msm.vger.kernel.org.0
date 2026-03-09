Return-Path: <linux-arm-msm+bounces-96130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHVeA7turmn8EAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:54:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 117E72347D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0CDE0301B64D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3495364950;
	Mon,  9 Mar 2026 06:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A025RYo2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BAZGx46G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E40364923
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 06:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039122; cv=none; b=VZAcXTR2HvJ7wG7i1Bm+knz+hPbrTkHODo8bu3RqVPUv2qiCp8HbarGrCTcRL4SPtpWnP8HF6Iu1hZVp+qHNLFj3+/3sk9zPU2hg8U/A/S7ZCT53vV2ftT6nkShoSOtm18JS2/6GbCjdSRjUH65/j9fNwNsa6BSizT3jL9AFwTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039122; c=relaxed/simple;
	bh=VyhmcmdCocO/mXPDB+OqytJYIreg7wlJAag5CLmUSxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAZcqeNi/L0p4E92+so4a+7ahvyM6CEG9UGLwo3BOoz/uNqZkKhfAyRl4OZvh7RlTRxBnDRQEqmQ+/pPtrOQ4YQmP/r+np7ybo3MzyhkNkq1HykgvmWsgGRVITkcKB4mkOTuNqJs/6DG0u7/0BcuDaDOH1a7ARkuWH5gD2rtOEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A025RYo2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BAZGx46G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628MxmMv3462729
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 06:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XJegSL9SyIW
	8NkmReRK6OuDLMZtYbsuyhgigi3fazVM=; b=A025RYo20wiU44Z47IRq/8GebSp
	bogZwwLBMogFPxaQvJ89uGH7aWJ0MqmCBHqRln1dvFdA1cM1TQF+xSJ+49oPh1Tz
	bCvRN1lgETiYyZDTFU7PRIQRa/SRXsp/tBL9HH1TKW6pedWO9E50POb4A5gK7Meq
	Ei4KhxF0v72T6+0DNPdsfvoXdsR19WfTGwCAvIEx0W4waYV3Tcs8NdHcKdA2v83W
	xwnWFhZM2yKyKBzymD138yqmvmgrUnKWCoibfYlTo/zO8wyyoueU9ZparCILYP5+
	mOt+mzb8O24+bCCbFf0afq8aQKMMa1qewesXfaD2BmEX3wMD4ppnxOcaJ2A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8c4cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 06:51:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a108d17d2so356656646d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039119; x=1773643919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJegSL9SyIW8NkmReRK6OuDLMZtYbsuyhgigi3fazVM=;
        b=BAZGx46G63XSIqSEPicW9UVLazzF3iMTcygLGAYWAJhwvjBxQfjgqR4+uEDnAmYQAm
         KLnK+WVPmLSr4HA6UmArDst6NKgRq61WgLn2tXaS4MwiZ/Qsuyq0oInvkJuBaJcUsd7t
         E3QbmoQLiLcDNRbDR6HZY6oFZNk5RzedP1mPvU8pMBlFXv7Q1lmnlNe4Y6Muh5j+FfaM
         4+SqjG0jIjTra1LicmdwnaObrw0pGLV+epNyKF2HuXfPaJGzeCWdvm9QuZ8PR6wwcFTl
         7dsV3uhr5hAvcUoa5/p5rOyRBhoB0321PdoL14dG54G1vk7Z5C2xKaw2YVM+WU+FvVQV
         P5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039119; x=1773643919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XJegSL9SyIW8NkmReRK6OuDLMZtYbsuyhgigi3fazVM=;
        b=uuixJbS1PCT00sQwWAxONdDbxNBOoWlT685iYbeLqJCDF80jrZvxkA+HkpFgnBbgDK
         KyG5lhnMXnFfTEQIQuQoP13CVsrjBdjJA9MdlPKzP+9WwT+2lBAYbGQMK9sCqS/IAxs/
         iUAIhAUvBVe1aPzSu5txFPWtW/XKDHd4bmb53vEQj1jR43FIIZ/dyIzeNb1oS6DoBfW5
         GOYh3X6CQ7Jyce1+fgHr5NTcSHxyGhqGWcg+81Ph4CRHJmA18TCsfkqZFA9cFNq/FuJ5
         +cKxC1M8GSiYtfad1+CfEfYZKnTt8drW7iRpdHr3eD0/vYjINP3c3urDcpsxrHQYb4Mz
         Z9ew==
X-Forwarded-Encrypted: i=1; AJvYcCWTDnUeHCBm6xECgfrAQrEWPLdAfQbgTFUzIItccCwdKOKO+ovJdy0MJPNXC38F/X2osN+E61MVE+ZL/D7l@vger.kernel.org
X-Gm-Message-State: AOJu0YxkYb+b1R42Q6ckRH/iKlZVQHFYl6enPVteziW/wWx3aOUu2iyP
	vZCPr782k8neSpnILP36DaffbK5h3pJKD+7fVSCLyxXld3sICGQoZMsbdG17WdmMWCLt8SxW4NU
	a5owX6SORkjc2W4/Pz31/5HdNqn6rg9BWOYdoczr7qSBowEo8SAk4F0skabvaiAnVPcQQ
X-Gm-Gg: ATEYQzwAivg2tikJvhBdQ64SdikUl170ZQgXpsxcz+ULtCZlUaCQf1tluHiyXSFZXV8
	DlHVmjsz++DgHxvThCoy0KSL0jz0WhP7st2K5gQaBRnRDpdskYivki9YVSIoc43lMqSAwFstycU
	h+t8oWRY/Ezh5n3UP/As6zyVamZY4DI+aE6GJrRr6GlbwyAMc54HFk9MvIPeIkogmCNVckwQtPF
	8GGIUgws/4URjFN8isw7rx0A44EpXF0eIV7aHDfwItIwmMzZOPXafZ8rrzjUzT/pz9iLB8JMUdX
	v9MpgnHPihC7sc6YIAn6CnuraM31575KSaoUlW9LvXeXv4QBOJykZ/sGibwYW8zeeiEazXMijNI
	UaOqYJXxVRY4A/x4tZy0xUo0+ABO6NrI6T5twjuYMSgHctpZVf2xCeTk=
X-Received: by 2002:a05:620a:450f:b0:8cb:4cc2:c5d3 with SMTP id af79cd13be357-8cd6d52e388mr1248045585a.73.1773039118843;
        Sun, 08 Mar 2026 23:51:58 -0700 (PDT)
X-Received: by 2002:a05:620a:450f:b0:8cb:4cc2:c5d3 with SMTP id af79cd13be357-8cd6d52e388mr1248043985a.73.1773039118374;
        Sun, 08 Mar 2026 23:51:58 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 12/13] ASoC: qcom: qdsp6: remove search for module iid in hot path
Date: Mon,  9 Mar 2026 06:51:36 +0000
Message-ID: <20260309065137.949053-13-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: x3n1Z1HoKjYzr6lA-I6B70JL-8FL-7yB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfX35P0ppKUzuvI
 GK2iMiZr3ktcgUNPoBMaFCGMSz/wQE4nKbG59dv/EDEz+mwfYc+Et56Yyqpwg39GVmjpngmDF7w
 58HGUd+7nYf2s0xOkCJIkadRxC4CWHfI2yPa9ek3VXWBLR3rxAmqRcx3O/ZkM/a6X7n1p7ivGAi
 AhItJw3Cjh9wRiNmuaJNJ6FGcde9zD5kPEzkTEh3+V/0/73fN/FU9s0mq72BaNh7sq46BLMoGA+
 6CJ8RlG+3wEUQv1iSSimY2qzF3yXZOEYGor3kz1v+IFH62HyqAAULSRAbDAuwBWktiSmrXcxCcH
 5uo5SR6n/ZhhoF8Ib7+y3ptB9YFUOojZ4YQJLr++d4zzcfg23/H94r0BGfFfsejid97Qt7QD7Q/
 +j0fphPBa05zOXYH7xVyMxiWQSuhrasXRsscnnSMj9uNtOIcZsUDgvtNc8WpS1xoFSSKP2nSt33
 J92wAoGB7xblSsq2QEQ==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69ae6e0f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Ll4dbTg5roZnn8cDlSAA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: x3n1Z1HoKjYzr6lA-I6B70JL-8FL-7yB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090061
X-Rspamd-Queue-Id: 117E72347D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96130-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Remove searching for Shared Memory module instance id on every
read/write call, this is un-necessary if we can cache the shared
memory module instance id per PCM graph.

Add new member to graph struct to store shared memory module
instance id to avoid searching for this in hot path.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c        |  5 +++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c            | 14 +++++++++-----
 sound/soc/qcom/qdsp6/q6apm.h            |  3 ++-
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 3eff45b241c9..bdd4cc458acd 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -355,7 +355,7 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 
 	spin_lock_init(&prtd->lock);
 	prtd->substream = substream;
-	prtd->graph = q6apm_graph_open(dev, event_handler, prtd, graph_id);
+	prtd->graph = q6apm_graph_open(dev, event_handler, prtd, graph_id, substream->stream);
 	if (IS_ERR(prtd->graph)) {
 		dev_err(dev, "%s: Could not allocate memory\n", __func__);
 		ret = PTR_ERR(prtd->graph);
@@ -496,7 +496,8 @@ static int q6apm_dai_compr_open(struct snd_soc_component *component,
 		return -ENOMEM;
 
 	prtd->cstream = stream;
-	prtd->graph = q6apm_graph_open(dev, event_handler_compr, prtd, graph_id);
+	prtd->graph = q6apm_graph_open(dev, event_handler_compr, prtd, graph_id,
+					SNDRV_PCM_STREAM_PLAYBACK);
 	if (IS_ERR(prtd->graph)) {
 		ret = PTR_ERR(prtd->graph);
 		kfree(prtd);
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 70e283671f43..aceb2ac9bac8 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -203,7 +203,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	 * graph, so sequence for playback and capture will be different
 	 */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
-		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
+		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id, substream->stream);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
 			rc = PTR_ERR(graph);
@@ -240,7 +240,7 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct s
 	int graph_id = dai->id;
 
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
+		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id, substream->stream);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
 			return PTR_ERR(graph);
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index f190ad5e912a..7ef6ae0b1759 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -411,12 +411,11 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 {
 	struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 *write_buffer;
 	struct audio_buffer *ab;
-	int iid = q6apm_graph_get_rx_shmem_module_iid(graph);
 
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_pkt(sizeof(*write_buffer),
 					DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
 					graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
-					graph->port->id, iid);
+					graph->port->id, graph->shm_iid);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -449,11 +448,10 @@ int q6apm_read(struct q6apm_graph *graph)
 	struct data_cmd_rd_sh_mem_ep_data_buffer_v2 *read_buffer;
 	struct audioreach_graph_data *port;
 	struct audio_buffer *ab;
-	int iid = q6apm_graph_get_tx_shmem_module_iid(graph);
 
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_pkt(sizeof(*read_buffer),
 					DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
-					graph->tx_data.dsp_buf, graph->port->id, iid);
+					graph->tx_data.dsp_buf, graph->port->id, graph->shm_iid);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -604,7 +602,7 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 }
 
 struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
-				     void *priv, int graph_id)
+				     void *priv, int graph_id, int dir)
 {
 	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct audioreach_graph *ar_graph;
@@ -631,6 +629,12 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 	graph->id = ar_graph->id;
 	graph->dev = dev;
 
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		graph->shm_iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	else
+		graph->shm_iid = q6apm_graph_get_tx_shmem_module_iid(graph);
+
+
 	mutex_init(&graph->lock);
 	init_waitqueue_head(&graph->cmd_wait);
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 5cf538397841..7c646ffcf956 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -99,6 +99,7 @@ struct q6apm_graph {
 	void *priv;
 	q6apm_cb cb;
 	uint32_t id;
+	uint32_t shm_iid;
 	struct device *dev;
 	struct q6apm *apm;
 	gpr_port_t *port;
@@ -113,7 +114,7 @@ struct q6apm_graph {
 
 /* Graph Operations */
 struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
-				     void *priv, int graph_id);
+				     void *priv, int graph_id, int dir);
 int q6apm_graph_close(struct q6apm_graph *graph);
 int q6apm_graph_prepare(struct q6apm_graph *graph);
 int q6apm_graph_start(struct q6apm_graph *graph);
-- 
2.47.3


