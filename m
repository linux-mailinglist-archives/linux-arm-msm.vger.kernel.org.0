Return-Path: <linux-arm-msm+bounces-82241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C5C68B73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AA50138175A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45ADC32F765;
	Tue, 18 Nov 2025 10:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNSfmUoh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B21E1E7C19
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460139; cv=none; b=MpOe95OBx3DOEaSvtVS6BeF1nt6SM7qofilNmqHZS/FggaxfONJ+18WqrWBKHrKChTYbPi5rkv32YYTAc4u2LA0B5QffWQpf1vUQIPY1gCuaK5EyV5eGtgUkXKUyBg/XSMzPtwnkr8jI7nZZsmkWQy7JXR2M8MMs7YQiCojNaUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460139; c=relaxed/simple;
	bh=6PoO/YGb/fNtD2zisri6HddmB7PkFezmhqhZBvMmmD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H+e4QeYfi/5BNdwyc4dS2kIXOf3VFkw4cpAtr8EXpudhUXmSGIjgKJOJjRqIc0ycNUjfwo7DjnDn3hagJTkR4qs0+iNhGuIIN+v46MkCV254dGHe6ubarED9+vaNwz8NQOcZra1y3ZVbXmj2S7XzuUtxkOIT1KzJzUsoP+3Ep6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNSfmUoh reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8VMAB2249858
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O13cKuwNtxt
	1AIq68CNYqjMUm5hN0y8zZFVwLx4dckc=; b=eNSfmUohupRwwcpV/WErMLfzkKp
	4HeB41dgMBDa+dFO/xrQEM4HrlPFTEVyiyRYSsPBlV1oUvilNUDbIGUWkNdtYx+/
	n1UlmbIaQZCfQMb0DhURNSr70dTGR1xihyPlUvLVyLHA7pxlTAn0nKzg4NBm1w1Z
	2+QmIXVeGeQVUFA7LzQrDaTTGHWECCcQNrT77Ge7g1GPs2eOTZh+ZToBipLoNeJt
	haPqHAh5q34kNZEgpQT1HI2QOUedx8Z2vyEEfFffkCy/LwkV42e15LMXbYzJF7CI
	Tb64p9ddxZjFyUqF+yj+3OO06fX/GVNABcv3HBigzoRZoqN2EZ86DpdfcRQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnc5g9xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:02:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7bf5cdef41dso3968918b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 02:02:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460135; x=1764064935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O13cKuwNtxt1AIq68CNYqjMUm5hN0y8zZFVwLx4dckc=;
        b=S3W7AjT3L7WudBUqss8uMT6sw9VLqS8AOUOvI4zTsEIVpaQprULTurSfyFMa96cSoP
         AdggDraYzAS1IGsWiThUQOoDk7DNEvu7GlU9mLnOE1oGQmqqonjdNboDUzvFu3y8ZRmG
         iVoMEp4LuzlCBolIOW9j/AtdlBgJuJIoGUIYEDkRVqtIStF3mJg7vK6bF5PBfiU3SMAN
         FkJ2i4WQaXH4+O2GlZFRQu4VM2MEDg9kfi9PS3AOGuHmoFnr6SWDwFQYdsBNI+wxsOmP
         WwPPhr4JeQioq+YsYP/5ilnNtuCQ3lrurtRyYbvYtvfR7YcXi70pJ5LZm3pxUWGd09ar
         M2+g==
X-Forwarded-Encrypted: i=1; AJvYcCWagB3SiqFZDsKjzKl7HsfrgqLdpYlZOBmMqEl4y8JrxnEiaYXecw3M8WPEWsEPBOAq/+Qtug++yaOOzEwV@vger.kernel.org
X-Gm-Message-State: AOJu0YwDH8FYMnvUAkx/suNuEYg6MGv2jxY1SQdLBSytKwd1BExvrN6C
	1RQqJWt4/CgMy9NsuchvbsoguoQ0cF2wz4hTURpVlAzZIfI6S7G6oQV0+TISon7jGmWFf9AoceN
	3KKNHQFgKmh3c6Xzb2eQlO6SStLN5ttUZLdnOOWtRLqNW+0GcUATqXMVmPwbIlz/vybeF
X-Gm-Gg: ASbGncutq20MmquNFyWy4u5o4MgYHew/0EK3ggTCXNqd3hb9crwNcEgE2L+0Xxf03/e
	X0D5ZqghiciQDMOeXF6usfmanx9m9EXj4Ck40snlasp8vprcow2K63d7Lh0SRN2O3DWA+x2Er8f
	zAnr1yl9dE7nEQpg10Iau89GkccAnkG+Bw2V5KdtzxL5HbJ0F/61bJFZ4Qz3IWkHbljimDL38UV
	4ZxvovtqU2BIpz7CFgT/1b339dWwEU19rMGskxG5txg4uE0WEn5yAHCjS8tleUK1zJGot+yiP2I
	dSPcQ0kdsZ3w+tqSBJq3JLVaZOBw/Gq6LtbLu339KYyRYWgKZHlhAI73N1SYbPLHJv/N8xNaQlF
	qATg=
X-Received: by 2002:a05:6a00:cc9:b0:7aa:d7dd:b7dc with SMTP id d2e1a72fcca58-7ba3ca62f1cmr20389038b3a.31.1763460135091;
        Tue, 18 Nov 2025 02:02:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMwe4yCZpEIS9Im0zeQqJNAXo/u0jFJIed6UJrlvHv6FAFp24D2lmOFiUKNuoRHJAlxoOJBA==
X-Received: by 2002:a05:6a00:cc9:b0:7aa:d7dd:b7dc with SMTP id d2e1a72fcca58-7ba3ca62f1cmr20389002b3a.31.1763460134586;
        Tue, 18 Nov 2025 02:02:14 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9256b9283sm16120030b3a.33.2025.11.18.02.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:02:13 -0800 (PST)
From: Ravi.Hothi.ravi.hothi@oss.qualcomm.com
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 1/2] ASoC: qcom: q6dsp-lpass-ports: Add support for multiple sampling rates
Date: Tue, 18 Nov 2025 15:32:02 +0530
Message-Id: <20251118100203.2751955-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118100203.2751955-1-ravi.hothi@oss.qualcomm.com>
References: <20251118100203.2751955-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LHzbYQeHTEQr4BRgW8MEi0Fs8VX_d2-c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3OSBTYWx0ZWRfX6HshdImkifCB
 H3OfaNpfscutoUkMTGSYCSZlcEaF4S+xa9borG/JhYaNYsC4ueYa8/S6UgHPnxOGsFD9ImPEB9z
 6BNJ0uDLHHKlvU71bQTCPKy0BHumCv/0oXjS4ryW+VDYHsQG47GwTKHmc5z/n7krmk6oqvKUYHE
 ln9tbUxHAkvn43YBeUpNh90h2GF9tq2Viv2lTsuQwgHWmJsjSnrRJNR5kT3RiaL7dFCzbnGf0Ho
 hrhGb40bHOsepwAYIVbSCkjtIJNLI7TjGLVB6J84UDi7wxJ2qK28nb0h8U6Ijv3POL384otKBT0
 YqjCZjgQn/5O/+HK+MJ5d5ZdxIp9UF2tpf2ykIKJrYJtUQxTa9U5Un1MiDcyBqCckz0Vkycp40c
 cuzYC/o36svzmmdCaBtiJKFhb+Z40g==
X-Authority-Analysis: v=2.4 cv=BYTVE7t2 c=1 sm=1 tr=0 ts=691c4427 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=wbo3agcGWv7YO2hpoMUA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: LHzbYQeHTEQr4BRgW8MEi0Fs8VX_d2-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180079

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Extend the q6dsp-lpass-ports driver to support a wider range of sampling
rates, from 8000 Hz to 192000 Hz. This improves compatibility with
diverse audio hardware and enables better flexibility for audio stream
configurations.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 73 +++++++++---------------
 1 file changed, 27 insertions(+), 46 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index 4eed54b071a5..76421adb5afa 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -10,16 +10,14 @@
 #define Q6AFE_TDM_PB_DAI(pre, num, did) {				\
 		.playback = {						\
 			.stream_name = pre" TDM"#num" Playback",	\
-			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
-				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
-				SNDRV_PCM_RATE_176400,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,		\
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
 				   SNDRV_PCM_FMTBIT_S24_LE |		\
 				   SNDRV_PCM_FMTBIT_S32_LE,		\
 			.channels_min = 1,				\
 			.channels_max = 8,				\
 			.rate_min = 8000,				\
-			.rate_max = 176400,				\
+			.rate_max = 192000,				\
 		},							\
 		.name = #did,						\
 		.id = did,						\
@@ -28,16 +26,14 @@
 #define Q6AFE_TDM_CAP_DAI(pre, num, did) {				\
 		.capture = {						\
 			.stream_name = pre" TDM"#num" Capture",		\
-			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
-				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
-				SNDRV_PCM_RATE_176400,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,		\
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
 				   SNDRV_PCM_FMTBIT_S24_LE |		\
 				   SNDRV_PCM_FMTBIT_S32_LE,		\
 			.channels_min = 1,				\
 			.channels_max = 8,				\
 			.rate_min = 8000,				\
-			.rate_max = 176400,				\
+			.rate_max = 192000,				\
 		},							\
 		.name = #did,						\
 		.id = did,						\
@@ -46,16 +42,14 @@
 #define Q6AFE_CDC_DMA_RX_DAI(did) {				\
 		.playback = {						\
 			.stream_name = #did" Playback",	\
-			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
-				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
-				SNDRV_PCM_RATE_176400,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,		\
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
 				   SNDRV_PCM_FMTBIT_S24_LE |		\
 				   SNDRV_PCM_FMTBIT_S32_LE,		\
 			.channels_min = 1,				\
 			.channels_max = 8,				\
 			.rate_min = 8000,				\
-			.rate_max = 176400,				\
+			.rate_max = 192000,				\
 		},							\
 		.name = #did,						\
 		.id = did,						\
@@ -64,16 +58,14 @@
 #define Q6AFE_CDC_DMA_TX_DAI(did) {				\
 		.capture = {						\
 			.stream_name = #did" Capture",		\
-			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
-				SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
-				SNDRV_PCM_RATE_176400,			\
+			.rates = SNDRV_PCM_RATE_8000_192000,		\
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |		\
 				   SNDRV_PCM_FMTBIT_S24_LE |		\
 				   SNDRV_PCM_FMTBIT_S32_LE,		\
 			.channels_min = 1,				\
 			.channels_max = 8,				\
 			.rate_min = 8000,				\
-			.rate_max = 176400,				\
+			.rate_max = 192000,				\
 		},							\
 		.name = #did,						\
 		.id = did,						\
@@ -350,118 +342,108 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	}, {
 		.playback = {
 			.stream_name = "Primary MI2S Playback",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.id = PRIMARY_MI2S_RX,
 		.name = "PRI_MI2S_RX",
 	}, {
 		.capture = {
 			.stream_name = "Primary MI2S Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.id = PRIMARY_MI2S_TX,
 		.name = "PRI_MI2S_TX",
 	}, {
 		.playback = {
 			.stream_name = "Secondary MI2S Playback",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.name = "SEC_MI2S_RX",
 		.id = SECONDARY_MI2S_RX,
 	}, {
 		.capture = {
 			.stream_name = "Secondary MI2S Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.id = SECONDARY_MI2S_TX,
 		.name = "SEC_MI2S_TX",
 	}, {
 		.playback = {
 			.stream_name = "Tertiary MI2S Playback",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.name = "TERT_MI2S_RX",
 		.id = TERTIARY_MI2S_RX,
 	}, {
 		.capture = {
 			.stream_name = "Tertiary MI2S Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.id = TERTIARY_MI2S_TX,
 		.name = "TERT_MI2S_TX",
 	}, {
 		.playback = {
 			.stream_name = "Quaternary MI2S Playback",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.name = "QUAT_MI2S_RX",
 		.id = QUATERNARY_MI2S_RX,
 	}, {
 		.capture = {
 			.stream_name = "Quaternary MI2S Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
 				   SNDRV_PCM_FMTBIT_S24_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.id = QUATERNARY_MI2S_TX,
 		.name = "QUAT_MI2S_TX",
 	}, {
 		.playback = {
 			.stream_name = "Quinary MI2S Playback",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-			SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_96000 |
-			SNDRV_PCM_RATE_192000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
 			.channels_min = 1,
 			.channels_max = 8,
@@ -473,13 +455,12 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	}, {
 		.capture = {
 			.stream_name = "Quinary MI2S Capture",
-			.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_8000 |
-				 SNDRV_PCM_RATE_16000,
+			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-			.rate_max =     48000,
+			.rate_max =     192000,
 		},
 		.id = QUINARY_MI2S_TX,
 		.name = "QUIN_MI2S_TX",
-- 
2.34.1


