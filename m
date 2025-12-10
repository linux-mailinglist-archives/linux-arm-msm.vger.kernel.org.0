Return-Path: <linux-arm-msm+bounces-84881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 540BECB21DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 07:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E60A3022FD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 06:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251A62820A0;
	Wed, 10 Dec 2025 06:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9naU4wg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRqwnKJ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF30E27EC80
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 06:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765349564; cv=none; b=HCeMqWg0vpa2qT/+vW8kqv3Pd+7PydunnJgy2wmYlQ6iemHAubjXmlpQT+f3AfSwESNl/9nyCMMRFfqGqEX8l+1r0znwqkFMA+22PbsezVItLkf/yR194JDiVYhHSQ51x39VC87v9Odan7An1OepdUq/J6cuscpSW/5xeeUoNWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765349564; c=relaxed/simple;
	bh=Qg2jH4tYa3DjSOyKiyIg7vBI3R3xAo9V9E3PUvA+oHM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fd1n22cjwMaD7JEqqx0Ey+Q/x7wf8xYGTkG0sut8ee/dGcuAY+J1yB7tR1mU9ivRAnb8q+EA6sHrB01BIhYKPwjk2k43WgALgyCg3uIArZGWArwn/y+x7JUySow4SgwYy+a52NHWsIyzvrwpB2yuczsTF4yrm8R7RAhKSJvC1tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9naU4wg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRqwnKJ1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6EmnA1955603
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 06:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+i7mT83QSfV
	PYvwCBiECqpSVCGQIrkmGOqxS8j2Joo8=; b=L9naU4wgkVB7DCkPkiHT1rJTEzg
	RINlQwSe8XHz+LWuEuqR66K9e33GXvVLoquRfeaXWywa/3se6Z5Xjh89l0k+31pF
	YhO3XofJs0P0MHVIOtlLm0iSVLmH+1cWBPI4jRiuUppmmbnyYs3k1OOysvgYXCXP
	SGoYUzIw7yy4jeCxMuB/NwUAL209ceBRbQ1BKeb7lPHzpsW0U6vcHgKD7hr3hdvk
	rTM/3xaQTP4H2kkDrtpTIQqb62Dmb5+XYNEGEVyE07Xk+wDRBdxIqhIRIXChrIU9
	+wkHcK6zsIpjjTSYEmfCZ0RJeQnUJBVqYnZyupsAGpVkAqtZrep2DXOeVPA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp5p2r14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 06:52:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2956f09f382so4477815ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 22:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765349559; x=1765954359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+i7mT83QSfVPYvwCBiECqpSVCGQIrkmGOqxS8j2Joo8=;
        b=JRqwnKJ1UmZu+H3o/JvxIkYK9eWkfUkGVdzE+ZLA6pRhk7PppmaCiaoo5P52VWxUUS
         9OV3zuFidiDFtpXkbcNp5okVLr0EqZEQ3jd2sX562LCes2fUFrT7SBY5BTJaU+JbQ+La
         k7iBfVOwrNUVD8McGzE6btr4QS8JUbWuZJADUuf4xDgp0lsWzN1vIY+3gkmSYXMySb4p
         R6gG6mlQjpKXJYKhB1x/iL0k7YaeSP3wWfBMuzdfyNM6lNqyC61IzPEV1cKGFxIHj4Vq
         zuNVDO01WeAp3nwLb5JPD2c+Dvg8sQcGX5+CyaSSlzkELqHpiS28jSfczTW+eBcUdBdP
         H3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765349559; x=1765954359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+i7mT83QSfVPYvwCBiECqpSVCGQIrkmGOqxS8j2Joo8=;
        b=ktz8T4JJKZsJDbHGQEdnGvi1V7rthBFMsMOrRpAQ6lnyJXU3bXhKW9w7A/EMZNieaN
         vH454LStF2F7Z8S1FGZWYjPBUJLbpkzIhBfbESlDZuHn//IBg6FTl+nI3UVMBCa8udXZ
         7+14iA9L7BnQLtv6qnrWaBBSQAVkSCtHJ9k5KCdHJByONKRQOSOamw7NHX5huAbv73Bs
         75T/5R18JpkSxq9aoY0cDWpWkCEiQUxa9m8evi4pnK7+tHO5CZHqtrr7MGNOxBTA1UsC
         hiJ3cjrywucIqQRI0lcMN3rsTM9/zfCoqusEWSoednWLIxNQB2e7Ie3jEzvvzOv9BZTY
         V2XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc8IU0YNt+pXtMCzycpP5pwRf/0aAVZzGHE8YjdE9be4l5yjS/CZaZdmTcL/uZuhGkneRZ10TR9D8IhQQv@vger.kernel.org
X-Gm-Message-State: AOJu0YwXxQTzMbJf+JcgrB1GQk/geh2B5AjkE+4xm/ws6nPHI/+iz5l2
	5egV+2DgP4OgFh18Tb0CnxTnl4ZQm2C80nMkB3/7K8aK+GshF99WyduYaoL+BAvt1LFVVOblnRk
	1OKiF9a7GeDvUNTt0KtPb/KcMHKyFUrewl5Z6vgPMQN6Oc3/yiasdGQWWH4NaC+tOzI7h
X-Gm-Gg: AY/fxX4JEnEBBeY8lnXv0E2I7x4Lh2o4skI5C29wLs60FT1dx+VkIuGjZj9qPTNZEtl
	H4XrOZiD2g0OFHhDthtVIlXxL5/Bm0y5GvPpyo3S9A5O++0w71RIf7C2Wx40hLizu1Wrq1hzf0f
	lmKkJR9SmUACETqmz04FINujn5JRBr5m6v4cOYfrC8+2Crp9JKM1kCTrSyF5H91T6z/WjxytPbT
	6Zoob7l+wM/9ZBTJt75P3plO4OjzFsaBdqGJNKS1iz/Gpj+HI01nvdiRPGK5itBWX9vsyNkrN7G
	TE3U9qr8UBwQ3DCP+Tk08gUXEZKCYiFEWVwEJXR5FI9OYxubnlQmsiJYS7NIy6Dg7KR5fBxjhR1
	20PoMHHiBMOBBIXoQJlSQfUMqpbcx932IAT0aXrM=
X-Received: by 2002:a17:903:19cc:b0:281:fd60:807d with SMTP id d9443c01a7336-29ec27c5a6amr17492105ad.2.1765349559251;
        Tue, 09 Dec 2025 22:52:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcv2v0k+WHxxfI+NcDx9UVEcYTb1mW0GwRVVwF4j8Gijal2mVCNvlKl7YXQA1MmxUkSPjWMw==
X-Received: by 2002:a17:903:19cc:b0:281:fd60:807d with SMTP id d9443c01a7336-29ec27c5a6amr17491725ad.2.1765349558708;
        Tue, 09 Dec 2025 22:52:38 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeac7360sm171728205ad.81.2025.12.09.22.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 22:52:38 -0800 (PST)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 1/2] ASoC: qcom: q6dsp-lpass-ports: Extend q6dsp-lpass-ports driver to support additional sampling rates
Date: Wed, 10 Dec 2025 12:21:55 +0530
Message-Id: <20251210065157.2775514-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>
References: <20251210065157.2775514-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Pvrxb8PFmmBt2kywC8PH4X4xz647Byrw
X-Authority-Analysis: v=2.4 cv=ZZYQ98VA c=1 sm=1 tr=0 ts=693918b8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=wbo3agcGWv7YO2hpoMUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA1OCBTYWx0ZWRfX9ViMW1cfeqoT
 P3Lag7qyE3tCS23uV61Xkc+R+01DiKR16mewpc+u6t5qkqgum64X8BWBIqPaXPAoflZhSqTIB+W
 a0dxNJMmkyij7v39l51kdh7Lzs+cA//K9T09p5bptuN2gdEKIY1NXxK4ft9WMXyVqYpAIG1xGW7
 aKrT+eeoidF1TJf1gQKySZsnIQN6/xvUjQkPmgdeHtzXk/gZxN900UsBTn4N/C/GEUSSvCLoTcd
 R2hBt37YIV10XFOfTgy0RaO9g76Ok6tbxB1BxUMq/ARy2HFtsohFwDhKVtQTzdxuQxyGqWE/auc
 c18qDqUed27Aoj+eOHFk6ynt+OFjTqn87GFN9Ow0ZLoTyPFmDMfOU+RYLqLSSzacvAgfCbTvDwB
 cakgyo2pl7LXnwgGWjK9V6cuiF9WUQ==
X-Proofpoint-GUID: Pvrxb8PFmmBt2kywC8PH4X4xz647Byrw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100058

Expand the existing constraints in the q6dsp-lpass-ports driver
to allow a wider range of sampling rates, from 8000 Hz to 192000 Hz.
This change improves compatibility with diverse audio hardware and
provides greater flexibility for audio stream configurations.

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


