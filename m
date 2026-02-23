Return-Path: <linux-arm-msm+bounces-93757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yI9qCy+YnGluJgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:10:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5989417B4F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 40838303F5C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 18:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB0533BBB9;
	Mon, 23 Feb 2026 18:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHs788gH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RGJEWjch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7203233D6FF
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870088; cv=none; b=FOUAF0EXajzg/rB5z2ruDhdn7Lstz8zH8mb6i3qUkBJOwXOEG67wmgmP3+BbeQ9AMQpjox0PoCN3AUPVpRD64madRGlMRjhm8aRWSmhlrJqCy/z2+QYJnEVbSstSOH35G2Njx8cV7vho+WMiG3AzJ7bwPdkKr4dhtj5TDcG4uXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870088; c=relaxed/simple;
	bh=1AGWMMo+ZQ2MpMqgndQclqL9hoOIddPn00jRigW1KUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IiZWHDdFwBQwcf5CIDnge8832eu2IHxhLZuvdijMlhYLLcEOtub6pdlp/eUs232xNogswykP/2r5OjBgNV8+gY+MuWa0hVdQ4/6j7eBLmtVuBD6xafcCkv5eUNZ6PVMrpo5UNmrON1Jk079z4TmOvmRAeGNvMkiTMmnycAycYCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHs788gH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RGJEWjch; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWDDx3732709
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2UA23pg+dGV
	Ambwz2ppXfyVdk6xlbVmq70z85L7JFXQ=; b=VHs788gHBLElUvHdyl49YXjfMgO
	poFeujaOurmAB7oXuAfO2ltjQ14p1pkLY+Gr3BNDPr+MjSUaDEDIKI7V+H/fp0O/
	26YdVr5OHDhEGLeOqzVpZ4JZ+Yvs/R8DtXCthvi6AsqF8RdF6f86PXExyMCY2EGu
	cRzWNOltytisSzvzzbXu2qXVaAgyOzEyjUNhkUO4dMaO+IQnerGTOQosMTM+VrQg
	O0XTwBIfqJfLUaeS+SmJNzEWBAt9xaXB9RDJ8eHInYOWdB008x2MIfMu+ixVZMVD
	AxG3ZaGHzb8wUaqRyR7VhgFJnUDj0eOvSrRU94u8D4geQ64E9EumDOug3Xg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t9e9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:08:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ca3ef536ddso5457075385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 10:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870085; x=1772474885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=RGJEWjchbTIeGDYBFh6UuZJKNFcMXcd9fh4iGb2HscvGwRKCAAbQy9TWdm7RCjLKpa
         wZeN1UI5g4zBWMmLcJOr+Jd9T6nn41ofw6H53Ezn6JB4tsquo3XvSDpgiCewjV06xYsv
         BENCyoocvmlf+t9aYR6il9573PiR5b+SgXkVJU7HzTcYnY9UlC9vFDQZFu4bDUhmj+GQ
         vKDR8JqKFDLqtsReu4KoDP/pzkGe/8H9qmXp93SuQqpQfx/eFTe1DOJNHHKNfDvUoK8D
         StZQus2A8toR4JBLLHkI9maSNM/9hAbAxX5KOJoW/RnzZTZGo35hjdgm3Lfdux9OX349
         +MtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870085; x=1772474885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UA23pg+dGVAmbwz2ppXfyVdk6xlbVmq70z85L7JFXQ=;
        b=bwzUVZEmpW8cUK7zkLMb8VNEa58z01QMrL7C4ImvKcO11ki2u+F6th4Q3i2vlKw0pr
         Zy78D+LiXiAvtkAf4VqnxRq6/iYnHDs1/nygBmWmRj5HU+uSuoFmfMbpqXsHlY0D26QG
         L7N839WUfdCfpzoc/Q4VgnNFjwOXTv/7vt/6t+lf4IUhq1jB3WA0SjszwziP20YLLZDA
         oO8+Na4cwKWpOGwEd5VL5kCEYtvAtUtP1ycM4Vk9+SKPeDgGd4gS1xHxeqZZAzqVu1fO
         gfXq9rfwzUCfrpR+GJdZW0zDyadqNE3ohGG9GgSBNySs+OAEF5G6PMS/NEV9872djoDF
         e9eg==
X-Forwarded-Encrypted: i=1; AJvYcCVVhuqZiNGs920E1CEoc+PoA07TIFj58z99gz/Gdps3Z+dzgyGkWXN2Jzou7qaTjHnafW7RpsA5YiL/k3uK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5B3VaJerBv/jiHGlYSK1IWfF98SkCMD3DavXXNrEa/ma/AJRk
	tiLYrkkFA8o0PjB/gPDMTdTa4RnxqMiRyLbhu8FseOv0AORFwtsenmBsRwTxIRKBaDiWC82aM3N
	GoYnUboFX09PZY+DedO6RooGMiKwa8fy+mLWAhY4uuo/tlV9cUngGPZ/LZClk9px4SSuT
X-Gm-Gg: AZuq6aLrsKY6Ubkc5UsFVZCE5agzF8FAdopRgMi3EKHtqgZ51LP06djl3ZDYDsdVhDK
	C0tbo53ckjbCZmkduRNtnn6WqZp7OUBDkk6jx56+dgV0YPE3Fag72jtKDMQWl+AnGg/HzrPxLdK
	7AoaXzBSznGcQiUsmIne/k8GpljaSz9Ex3uyOANhds3i/atv2s4ZXLB/mi4oKbHxgeV3+RJ1jEi
	94H6JHR9hGtXbPA8KrMMrb1+wEdM9qAcfrfT4YusgEWaBZNzMzMk1YWIBUdqIJWBvH9Jgmy+3CI
	Wu/GZoGEmydXP4JcCaC6aRP5UxZQH9YgrcaNsUqiRym9nsDXXMEjUikLZWz85Q4B8310VfKZQ9/
	TFbBllk2E5mdtHGpYuIOTEXJTzKLCtk8gmXteNMRlF2vkGraOfw3vKX4=
X-Received: by 2002:a05:620a:4150:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cb8c9cda80mr1154634385a.2.1771870084889;
        Mon, 23 Feb 2026 10:08:04 -0800 (PST)
X-Received: by 2002:a05:620a:4150:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cb8c9cda80mr1154628085a.2.1771870084439;
        Mon, 23 Feb 2026 10:08:04 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:08:03 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 08/14] ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
Date: Mon, 23 Feb 2026 18:07:34 +0000
Message-ID: <20260223180740.444311-9-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699c9785 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=nvRDalaNTaWZAukup-IA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: gTEsoHvEZZVXie0IlIFhgJW-gN06dpqA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfXwe8iEaEDO1jD
 PPEliwBByNoU9EhtOoPx0ZAbNyCwLmnFUSsFx1BUe4cH9aFFJAq9mSyEok7m/EHYmhBGe7/07TQ
 NHOHwaofxjXGqM/Y7NzhXjS4WhlH1LuKwn1sY26VsEXW8BsIUmXNc9NhdqdYRDtrgXq2v7NeFP3
 k/FjBtmW1lQRPM3If2klrXJ50zCuDAeJvx0LjMAOqO+Rta0zdQ6TYnkFz6hYP2a2o7cfNW2ZhCj
 EzXSVgpSQxFOOeWh2gzc5frouE+lAtxudm3+FCtl1Pgr9xLnsLOIQVSUrbJaJb33Z9f1UhggKcM
 CPOqvgjwF3v/pARziQdjNt+SUaxH33hQurREM5zBMX0E08ymVB7CF+erXKUq8NXlkb4v0lUB43r
 4sAL/JLR+4tyeJl4JmKj3NZT0AcflZ7H0bkQ77e5q/XCkS5EwBeWoNUvliM7tm2Ryw5+rnkVkw2
 8I+kLL/ZBgI8dzpsouA==
X-Proofpoint-ORIG-GUID: gTEsoHvEZZVXie0IlIFhgJW-gN06dpqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230156
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93757-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5989417B4F2
X-Rspamd-Action: no action

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


