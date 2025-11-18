Return-Path: <linux-arm-msm+bounces-82242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C028C68B79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6100238265A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653343376AC;
	Tue, 18 Nov 2025 10:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zp/61pGl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924D232ED47
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460143; cv=none; b=bamiK7C/u83OiaNqCNtFTVnRCLsW3d6LfMAFs/nAlM6rxntd6X9pdAiiUOMUQROMnyyVrehZlimTtGFgbksjhw8N+AoTFXrJuyCBz9k0Cj7BZQHTkI4w7u6mc4TqHYvPQeir2mrsqQeARxj1FF0dKugfRUvw0Cd7fnttqPtWgEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460143; c=relaxed/simple;
	bh=CbxtIvTekqrp5erXiJTkMlBeVvmJmh/eKhW86wM11l4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=incr6opghoiJ5hBoy+Nf+13znmDbNnoqwczOot/ufbDbTs+JZMkJ5dfRcYRpk+SjlVo42bPWCywNYmXtx2vGQAXJUD5F6qeWTvjRMBi/TuIzs7YTGYlKf9cGGLElDyPAl56nu1lKYYg2SN0MIlOagzc6iYuZNts5JDAF9w3tYgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zp/61pGl reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8l8QK2755265
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qMuNEob1rac
	JwJMjnvjWTnyit3VquPLYcumLP/b/DM4=; b=Zp/61pGl48suyNjIVq2A7nJbQBg
	t2QvRnVQxwmoG/CGPh68NfdkhNJKH/6MvCVCJfQWkjszeqkgmxnTIngZhaAMz2ei
	TKWoLWQhS9CYuUF56lNuW2kaLraO6OzrPFg8y4VSuZh/QsvEoX6f22RK+kUqfnMp
	QJnM9xWYhEoJe2v6U91ZqTOz5EjbJhN3qy/n3PzqwBK9S7UojO+uRdoObwfz8929
	E/tLp3G/rR6+ObZg/KziJ8lGTvYkfWcfPMhXthpLPEQ2/I9Vk5cS4NoJKRpJup8e
	K7Mdf0+tRnbPpwNMRIX6DdoZIwfoBpOnyM4yrWTG85SZg1dBQVm2xSdHPPg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj08bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:02:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3437b43eec4so9825530a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 02:02:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460139; x=1764064939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qMuNEob1racJwJMjnvjWTnyit3VquPLYcumLP/b/DM4=;
        b=rLAMvsu61R+S6+VYRYwGSjSQn+6uwfV3+xDrnaNHBLIrh6RPep2KsOBko5Fnc7/X71
         UEGdIVaFLRrTZ9sdG/o1t2LL2K2T8VJK+y0INum6k+ng7Dr8NlLKyz3cslN7Ki9KLWr5
         Vl0dDRKs2enh9UZUJ6LQibVTcej63WacQgsp5NC57FsvT8Hkrr/HnDezm90npnv6kvJD
         aVuJWSHNJXYATKntLNk1ddFoq3CcKmY7dva/1veIz7gOf3PWypUu4OCfzGdiZ9sD27KX
         BHj6fOq8mA7rcCeV8xgLWJtaxvxhUEYFwEtHQucnpOyz4+TcDuG0oVAc/tmrfFyVytdo
         KX8g==
X-Forwarded-Encrypted: i=1; AJvYcCViV+D3qoSBk64ar/HQC+jHu47BIguo8p1fCxnpvRg4rpJutDcaVeSlE/rS634o5E5pyv7TjWvjTHlfntK1@vger.kernel.org
X-Gm-Message-State: AOJu0YzPrkuYWT5mop2/jKqPuWs3N6avsxwJOuk3EZLyeUiIedDFi1yl
	pmuYOLWWSksyWHA+3Kwu/lPZhOmD/84XwcQXNPZFyl0ogO/gwau/AzbE+vuY8pYZC+eys0sGOOk
	oO4vG5XQa6frrMxee7pzFTp4EnK8KlAPEFJcslaW+0aNinxVm3x7+2JXyBsPW1WAtYSgx
X-Gm-Gg: ASbGncta9BWqFVRswxV2Ia4z1Pt7TzY76AOxrwD8opGLXS30mHL2HDOKhuI8AeOlZd/
	1k7kSeKO7yjxgzoa9zj2xSCy1kW6SpUDR6KtqcaHGwz3PvJ7BmaoFy7R5zCRfXy6W+cghUvB2Fo
	2Si6HM688ol8iq0GtJ/2cYznck7ttID2kfYyiTQgYliMsEyFEzHjauJFwR6su9FW3op525vE2EM
	1WMpADO6DY3Vx8BWQJLmVdH9tFLyOVtJkZ6fv9NbLf2L/X3ezRpel2SlP0vIKPK81L8Oy/m9ee6
	6kj/zaJ5kWFxeC6AhQHrFmKFwQ1lolBUHdLDFdljaNOk4ZN0GjNSybZ2j6NkQcTWOb+fZ5VpqTq
	tfIU=
X-Received: by 2002:a17:90a:8a84:b0:343:60ab:ca8e with SMTP id 98e67ed59e1d1-343fa73b7e7mr15448640a91.17.1763460139077;
        Tue, 18 Nov 2025 02:02:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHL9RUDf6h4VxjPfstozuaNX07Z0pm4BzkP/oEdHSr/z+UYskYnGmudGCyLJlm3pH2mwlX23A==
X-Received: by 2002:a17:90a:8a84:b0:343:60ab:ca8e with SMTP id 98e67ed59e1d1-343fa73b7e7mr15448606a91.17.1763460138576;
        Tue, 18 Nov 2025 02:02:18 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9256b9283sm16120030b3a.33.2025.11.18.02.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:02:17 -0800 (PST)
From: Ravi.Hothi.ravi.hothi@oss.qualcomm.com
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 2/2] ASoC: qcom: q6dsp-lpass-ports: Add support for 32-bit PCM format
Date: Tue, 18 Nov 2025 15:32:03 +0530
Message-Id: <20251118100203.2751955-3-ravi.hothi@oss.qualcomm.com>
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
X-Proofpoint-GUID: -JxU--AfGvz26tl67peqiXWabx-3Hl-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3OSBTYWx0ZWRfXx6DBImZtf87n
 Q6HUT7I8fKkbTphM7vp7WcPik8miIZCMCaoQyBKAIjptG6Xx0+AUTeKu7swoKCK8R8+PPSSqtUo
 gWk9DmPYle+xQ/J4Wt/lYDbmp47/L6SMUxh3BUO5DzNgiNaOXpGplmpsqg0AU6MTUkpct6ma7qH
 JlsmM7buE8rzpsDoS7FY59i+JPr4Ue3IUn4CXfhNpe0TBSdi/zzbkuH+vSTZL+A4XOwVZ4Urrr0
 w3iENaqLaDQpUbxoeH00ICojdBot6OeDxo7pBoG07lPM5WlxMaDKChcYho+Cqhb8NxWaWDdkU8T
 KVBJJFyiHEnRlbeK8K2K1sCQI9l/48AIbd99LTCfSRyyfCjo/WNMvs1ZSPIoA80TWNPq/S+4joO
 cNmZYzdoI/CGlyz921fiHAZ+vvJM8A==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691c442c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=h57z9UKOc1SyWDzF5_MA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: -JxU--AfGvz26tl67peqiXWabx-3Hl-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180079

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Introduce support for 32-bit PCM format (SNDRV_PCM_FMTBIT_S32_LE) in
addition to existing 16-bit and 24-bit formats. This allows handling
high-resolution audio streams and improves audio quality for supported
hardware.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 35 +++++++++++++++++-------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index 76421adb5afa..8542e620ee02 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -344,7 +344,8 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Primary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
-				   SNDRV_PCM_FMTBIT_S24_LE,
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -357,7 +358,8 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Primary MI2S Capture",
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
-				   SNDRV_PCM_FMTBIT_S24_LE,
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -369,7 +371,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		.playback = {
 			.stream_name = "Secondary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_8000_192000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -382,7 +386,8 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Secondary MI2S Capture",
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
-				   SNDRV_PCM_FMTBIT_S24_LE,
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -394,7 +399,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		.playback = {
 			.stream_name = "Tertiary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_8000_192000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -407,7 +414,8 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Tertiary MI2S Capture",
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
-				   SNDRV_PCM_FMTBIT_S24_LE,
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -419,7 +427,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		.playback = {
 			.stream_name = "Quaternary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_8000_192000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -432,7 +442,8 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 			.stream_name = "Quaternary MI2S Capture",
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
-				   SNDRV_PCM_FMTBIT_S24_LE,
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -444,7 +455,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		.playback = {
 			.stream_name = "Quinary MI2S Playback",
 			.rates = SNDRV_PCM_RATE_8000_192000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
@@ -456,7 +469,9 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 		.capture = {
 			.stream_name = "Quinary MI2S Capture",
 			.rates = SNDRV_PCM_RATE_8000_192000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
+				   SNDRV_PCM_FMTBIT_S32_LE,
 			.channels_min = 1,
 			.channels_max = 8,
 			.rate_min =     8000,
-- 
2.34.1


