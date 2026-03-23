Return-Path: <linux-arm-msm+bounces-99423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id isuOIajBwWkHWQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:41:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FBB2FE60E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B6BD3069877
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09CA38423B;
	Mon, 23 Mar 2026 22:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dq2fpmPG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8xtVjUI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607DE382F2C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305551; cv=none; b=QhN3G+lZpwJNC4eIS0owWzZLpCR8gO/+jyApPdU4YboZs8kyVtGoyk2VBany4WYfNgqrC25nbfvSFken0BQ7kg+kxFTae/hs/xxT2gqoyrbwAu6wIg+52IeyUVfyP4g4dScN5kgAI66qI2Tj3QAvSi0ZtZI/lZ4GYfZfxPCVJ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305551; c=relaxed/simple;
	bh=1AGWMMo+ZQ2MpMqgndQclqL9hoOIddPn00jRigW1KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rXEj+JS3USIjG0GpfItaUM9XlQwsgRIAvwp8uV9wTMCmzyV1G++obxDHWwa+uoEg3SsQcyZYB2zLTlZd/yCgjF9m9lg0STEVXzWgNxlyLgxevw3OA0J39LymwQVCmCXjTRA5Ly27Q5WQWVUarj7czaLRdbELRXF4jc97Epn3rmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dq2fpmPG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8xtVjUI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqYXE2971835
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UA23pg+dGV
	Ambwz2ppXfyVdk6xlbVmq70z85L7JFXQ=; b=Dq2fpmPGHg+XusYXLCZhkgCSRfn
	kvjCg0IXB+NQdAA7kMA+Aee/E/2oNxlbSXEuDXaLGCYPaXqEOEBxroblOLvrpCIx
	vGu/WQjXhDTxO7+iBHLABOgIQFqDPtnSoCktXyKYFzrN7dON0MxnCpCHmejZBbPN
	paDTbsLyGctmT/8TvKZ5GzQ+QH7xGM76i8KtToMv/3yKminwlNDQwHkytnOkg6Wn
	2CC/o6NXtJzdZjAKuT5R1UN0BNfbQc7xSu7g6uMiCQC9J9ffIHIY3E97zf3Mx37u
	bZgXx+s95ELkg3k10ANG9hJh97qSUBnUH793Q72ESaQXu5iNeSdstptg7HA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc309x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b3544bc7bso10164501cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305549; x=1774910349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=i8xtVjUI1yoEZ2akBMOmS7JN5PSlNhqZktDb9RVa50WImxvnva2eblp9a88+LWVx5M
         2Tu1DWtFuNRJyGuvvPJVBK6J+8hWaiFCFn27QYFDgQFo5heoVne3WNt4QFoZvoz30/ZE
         KluOvRB/o9R8nHDarFL8TD2ffxfKx5L+BbomJFh4zSpHj100Ui0qI+1f1pGYz4QOmQMS
         XcsTVbAim5rVCivnEnKC6qzxErovGZBX7rKlIgPz+eu9fED2D20zIqy3FHTgB7yBxhIV
         Pc1Dy1ap2K7UFzWpKUhRfGhPxR/BPNd1pYmd/oJOA8JAOot5hTu/izn0jM6GoqIjNfoF
         DmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305549; x=1774910349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=eFg3/Meo0DSMEvfgo8A/rOhi55WAGuEIjYp9i4Ye7+Zv5MB7QYXAEnrIjs1JmBnDZE
         /YE+WrDJTcU5NwoHmsnNOtc7QG8u6FLxb5vVCGFdKgSNzQOinNC3Bjz+si3YzEhQcZJR
         bBbQZzT/BcF3e9bkvd0PdqJ436E1XoaDIzxav6F11vKUd7GvW8g5F/sFkQUEBmmSYo+4
         K20x1yIqmI0FhIbasgG/iixPXf5eggbWenvREwgRM9GYEttzbgaU5vJ8nD5H7jPhJMi8
         Xy+sQ3dmTlAF3JgvNfFFQV5LcmXytJi0DjvDu7QZ+tQaCtQWlQIRXwVUbYg9btQrYSVL
         /I3w==
X-Forwarded-Encrypted: i=1; AJvYcCU0Y0rh5QqW9fiqd/z9W00FMyILKHdwPcj0mq8NR4Y+CxLCPuBJGfKNWs9pzga5i8WIUYTgRJOpfXOZMnjI@vger.kernel.org
X-Gm-Message-State: AOJu0YyuAu8EahDBGpkG6JidYjQaMkl/S6DgQ3lDY1qJlMLLckP/NFdc
	+zkozz5eBAj/x9Lrsh0rAs9WpHRlu+srNkU5I4sdyviA1RF9n1V+drzNpldxP36QGYRYOB9bEsp
	MTeAl0lhHTGpy3p7VocZA6UrjHMJjB0GPd0rET9s0f0vs5WmVVBrBmF6wuyDvpP0E2Py/
X-Gm-Gg: ATEYQzwu6EvkioKoWalHjpbnOn5iGSm+V8YHEQUR6wMS/b4XHcC9qEwphM1BIBB17sE
	qO6qWuOPUMyrg3iIRO9vnNzISNbhCFx0vDNzwFI01S32NRK94IDGZPxVNieNnrRxzRDF0VoQTQG
	80zlPCBQGodcnvhz6Elh/tQQ3A+En/asWZK5wek03xbGhOVxHKr3vEG3rpow1z30Bu3939XpS+4
	4ENAohGcjHmdZHJ3nJKT+buWq9M2W+y/QXM1/MVrn1lZNORyWNulXdZWqEz3PrA/9PT5snthPG9
	wRqQ2CY9lBVqTY//QqtRG9TlZh5KsMvGIH4rlR7MjMeQw33hW0kouj/2yfb3lSLDac6Vkn0voQQ
	oL0bG7SYYhGjLmNgUmfgdBjQxpqr4d0vu+8EvWcRck4RroSvTRZ7UxXs=
X-Received: by 2002:ac8:5f52:0:b0:50b:6a80:ec17 with SMTP id d75a77b69052e-50b6a80ef20mr43577901cf.40.1774305548810;
        Mon, 23 Mar 2026 15:39:08 -0700 (PDT)
X-Received: by 2002:ac8:5f52:0:b0:50b:6a80:ec17 with SMTP id d75a77b69052e-50b6a80ef20mr43577571cf.40.1774305548257;
        Mon, 23 Mar 2026 15:39:08 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 07/13] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
Date: Mon, 23 Mar 2026 22:38:39 +0000
Message-ID: <20260323223845.2126142-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c1c10d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=nvRDalaNTaWZAukup-IA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: CXbhxq84xnJF2cXbPaIa68q6teavl_u2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX20pHPaDyVZLe
 upVXnqCzkUrpooGAgHNXVKMgssQ3dmUfPo9KbpecF5X8D9+A3wzTOHd/xmVFn31WIZXUV0kgMGz
 yKzoVJnYwpoM7/kFLlVUlsZm3UnPChGE30OIuWloERThcbfAX8Nv7VdOKbSl97U2c1birR5zRqT
 eUhy7C1UPO7QugaFFdXGVAjtovLbmldRhuccKpDWWu6ew+GmWOCGXy4WlMb5/R5BZOcKkCc+Ctk
 P7Ke3YjATgcl1/mJiv8uTX68XTVcS1w0KI+H1Gr2wO0LRSoImRDYZhxDdyop1Kbu1HODM/qpsM/
 UpdJfW5gDIRHsBxvSpGrXecJfUBjCWfRwnufyBIQPOxkfD6wLV3mleITMeBeUNdy/VAGgY1dAwM
 e8v1ksaGDkFzgU5WsOulXm4ppMCe+o9NigaLT0gU5TM4kpMIgf4ZJsFdeZIic3ljAAXUpC5vNFi
 btDyC4OyvW/k6MARHVw==
X-Proofpoint-ORIG-GUID: CXbhxq84xnJF2cXbPaIa68q6teavl_u2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230167
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99423-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 25FBB2FE60E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for LPASS LPI MI2S dais in the dai-driver, these dais are
used in Monaco based platform devices.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index 4eed54b071a5..d31388ed3ccf 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -96,6 +96,42 @@
 		.id = did,						\
 	}
 
+#define Q6AFE_MI2S_RX_DAI(pre, did) {				\
+		.playback = {						\
+			.stream_name = pre" MI2S Playback",	\
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+				SNDRV_PCM_RATE_176400,			\
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
+				   SNDRV_PCM_FMTBIT_S24_LE |		\
+				   SNDRV_PCM_FMTBIT_S32_LE,		\
+			.channels_min = 1,				\
+			.channels_max = 8,				\
+			.rate_min = 8000,				\
+			.rate_max = 176400,				\
+		},							\
+		.name = #did,						\
+		.id = did,						\
+	}
+
+#define Q6AFE_MI2S_TX_DAI(pre, did) {				\
+		.capture = {						\
+			.stream_name = pre" MI2S Capture",	\
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+				SNDRV_PCM_RATE_176400,			\
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
+				   SNDRV_PCM_FMTBIT_S24_LE |		\
+				   SNDRV_PCM_FMTBIT_S32_LE,		\
+			.channels_min = 1,				\
+			.channels_max = 8,				\
+			.rate_min = 8000,				\
+			.rate_max = 176400,				\
+		},							\
+		.name = #did,						\
+		.id = did,						\
+	}
+
 static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	{
 		.playback = {
@@ -484,6 +520,16 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		.id = QUINARY_MI2S_TX,
 		.name = "QUIN_MI2S_TX",
 	},
+	Q6AFE_MI2S_RX_DAI("LPI RX0", LPI_MI2S_RX_0),
+	Q6AFE_MI2S_RX_DAI("LPI RX1", LPI_MI2S_RX_1),
+	Q6AFE_MI2S_RX_DAI("LPI RX2", LPI_MI2S_RX_2),
+	Q6AFE_MI2S_RX_DAI("LPI RX3", LPI_MI2S_RX_3),
+	Q6AFE_MI2S_RX_DAI("LPI RX4", LPI_MI2S_RX_4),
+	Q6AFE_MI2S_TX_DAI("LPI TX0", LPI_MI2S_TX_0),
+	Q6AFE_MI2S_TX_DAI("LPI TX1", LPI_MI2S_TX_1),
+	Q6AFE_MI2S_TX_DAI("LPI TX2", LPI_MI2S_TX_2),
+	Q6AFE_MI2S_TX_DAI("LPI TX3", LPI_MI2S_TX_3),
+	Q6AFE_MI2S_TX_DAI("LPI TX4", LPI_MI2S_TX_4),
 	Q6AFE_TDM_PB_DAI("Primary", 0, PRIMARY_TDM_RX_0),
 	Q6AFE_TDM_PB_DAI("Primary", 1, PRIMARY_TDM_RX_1),
 	Q6AFE_TDM_PB_DAI("Primary", 2, PRIMARY_TDM_RX_2),
@@ -636,6 +682,7 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 			break;
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6i2s_ops;
 			break;
 		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
-- 
2.47.3


