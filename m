Return-Path: <linux-arm-msm+bounces-84882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAE1CB21E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 07:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB4743009FC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 06:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FA1285074;
	Wed, 10 Dec 2025 06:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjHw9q66";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7lBg+LO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA93A2D3725
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 06:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765349566; cv=none; b=Wv231FFZyw7BA7E5sTvxi7shqzewkJfdAkJCj0J8k61/8JbK6fNB3ei7FSU36gSoVrGGKUZcOlEDzEjmNHXzjyeYVNpwC/eeBSWY/adJD0pvFCCfVhv5ihs1qqCeB/1s5tfDaiEjw0Spu5jfJ5FMvvIwFn5zjkhUVbdGdmSgcDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765349566; c=relaxed/simple;
	bh=eU0rE+w8vLoH6e33KwYCTSmr+/UOuCFYdFezzoORBnI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aGP4KvdQZsqzlupWoIcbvM+fD6XXo2L4hxSbeviyToXlAg+v6DhhnKcd36Z6rmwxf7daGsjo+1lhAtz82k9AYVVihv2oeh9hVPEFA+yrmG4HlitFJYodZxvCCbfzF50UoiYcc7T6da0fgFO30iRSlnkJnVimQCvXt6HXMLUitDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjHw9q66; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7lBg+LO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6Dbl81497506
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 06:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DEoF490jUeX
	CQq+pu07fhdbph37+1R3iDlBmh9qDxUY=; b=PjHw9q663QpTkMRc1HKt+JKCYyM
	4Q6L5WwdfxUBXsZ52R/LSuSRxOxIpHrk3GI9LB9pkTaAHyxN/+gxxqC6uAyt/WFx
	ipcDRwwJZNN29y6nT4iRaaxIqkQnJJi+/qWEPeDCbCSz2ONSXW/3PI2hZrT3Q/L5
	JNRBDbAeYcu7b9TFjyJWUtG0IfqsVMNXSEpBTdNNT3+sWueEfFKkGdKHgYHIg0cO
	tz3aA5OcP1BZDb3w9O3BDar6l+S2JEmctpSOT9Ph32iwb/knxW3caMlJnOJ7AG/j
	DPHORacn6b7c/dGLn4w6kW8ilBQDnSocEe1ZLy0X7w8aCjMH1ouDudwkG7g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay2e0g8nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 06:52:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297df52c960so129203595ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 22:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765349563; x=1765954363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEoF490jUeXCQq+pu07fhdbph37+1R3iDlBmh9qDxUY=;
        b=B7lBg+LOqD1LMcVwCuHir4J4pHLMAJYUcb7BsYzA7xadMUEVii97cqRmJA21z7VTBa
         px2au2BSTrlLSexwJvHKT9x2C6MCni1ivzeaaFdQTx9R9HKbVoJSKsAvGZ9Pw4f9Uukv
         cWSM+vxBvQ9dBh/IBeq6mpqoehBpJUzcBIrWuENkkW9N/AxGzxgNtBOQSBR0s0oxr5k5
         tPIcqwp8+2z49iX2P00s/yJ1sLllnqtLgxDYjj19ty4Dnm+fz0alQ5k20EbP2F8d1S62
         1ti8ngb41Bpw81mmTmYnqi7UF24vGvKfrBYCOzYnbUgmaEjo4O6zX0C7TDejilErPlFr
         WSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765349563; x=1765954363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DEoF490jUeXCQq+pu07fhdbph37+1R3iDlBmh9qDxUY=;
        b=v635CCEUaL9r8B2b9sJAnxJpZH2AJ7dhHJVsYUi950XYoUow3BTs7RQ8576NPMVA0a
         KwFIbJqCaLxYx4B7MJjWkqU29cJOcLI0e3BL339hiUvK0E4b43v3O0e9ILFwD6ccLe9x
         d12E4YuS5rBSpmtMCGraijXvWWRpekV1/vJ3yYYnZp9xPhVfHFXD7csrFtw7MnoQqsNW
         l8tbQgznqdgLQ3PLmC6hTXrCH+UQJ5/ntHhWN4YkHI0AnyVr/OstcKhQ2WXqKTQIRqb1
         vxJ7+7vtrz7f0E2LnuRQK5+KDxD7ns26g5Rd0RG8uDNlRBKyc/Jehsvn+a+jInh11EOi
         zCpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVS3z64oEyVK+LNAMJSlgyl5pFD8gxRlCS6ebMgjBz6l5Qu9Gjfkx7LQzMy7MffyT/9gQL0Yq+e8meKYAQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJjzs8PzOBmYoRAFXh1av+nAKDr7E/jSap8ZZr6Au8UKxydme
	SCuaRyUMjzECE0ez6ZFvEYy7nqecgXhCBn18Few6OhFN9yUuyH8tVT352s8PBALbGC7Al98KVLC
	E6++H1W26GTHJMp8BW4MOYNbnMWpSseH7BO0eakvOrqqIiiAVolm82FQN5fx7iv4X7RNt
X-Gm-Gg: AY/fxX7Vsr8Xome1uRVTettYp0d2MGAOQ2POgFtO1uv+GWLB8UhVu6TvtNYlcpbwpfg
	9CGKnNao0lbL4JdwHOI/Av6QMUfTBPHPOeJElsTg9Mu39y4D1d7HKqjnvTBZ4rFtUR/jGO1AcD/
	9VZgvRhnzqExWzJdW+SPdSV21phfjnW2EhWFcwS3PFwEi5oyr9hfHhs9NyhSsewG4RLeYVodZtJ
	1Co4h6fbGJiXTQzqV1j3lxtqsbpaZ/VT0m3MU37dm9acCNu505FCVyqZueKk1zqMmiqmIfx0fWq
	qyl4+ZNr3baaSQ1NIgl5qVLCmdrB9FdPh4zM0IfFF5U2vSziRW808iUlKVHichBMOyEmkzFsOAe
	2H0fWSDnwY6ktccerWFQYFw4qOVvJrqF3krtUhZ0=
X-Received: by 2002:a17:903:290:b0:29e:9817:1cc6 with SMTP id d9443c01a7336-29ec22ca92cmr15576395ad.3.1765349562761;
        Tue, 09 Dec 2025 22:52:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2flnIXL94He+2EXGROYJMEPH1vwcVF3g7/KAv3F7rrJZbe1dwVfQC7DMstVyaDzNXa3HpbQ==
X-Received: by 2002:a17:903:290:b0:29e:9817:1cc6 with SMTP id d9443c01a7336-29ec22ca92cmr15576185ad.3.1765349562337;
        Tue, 09 Dec 2025 22:52:42 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeac7360sm171728205ad.81.2025.12.09.22.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 22:52:41 -0800 (PST)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 2/2] ASoC: qcom: q6dsp-lpass-ports: Update constraints to support 32-bit PCM format
Date: Wed, 10 Dec 2025 12:21:56 +0530
Message-Id: <20251210065157.2775514-3-ravi.hothi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA1OCBTYWx0ZWRfXwProgZIMP06o
 BxrOo9IBTYSvRFKpdWSkjxq3eIb8zUQ4CG3U0XhzFmRvgF4PolAOS0yR7lI7frvVqBtAJp93fjN
 Il9TDLjrhCv+yGT8xzwEtLHqEMiGis5vO6LQJreDvS9yarYUHfrVoFA8BavjBSlCnA/mFVAQDDW
 6CZkW9Lpoo6f+xozsOgM3Ad04o6UhgPuQXw+00EN/kNlviKG1o+3fL0WN5Z3Bx9bKKwVZwYm1Xc
 Ihcmr3hT6/3zzKhvwJ3C9ukZ/hDD3eQRepOEeSld+nW9WcfsnCt2uv4ONUtQlElIe29KrRO5C6U
 +QBghMwHji/mcR8gcfNM2XrPG7hgsu3QyXCGpqdvRoKfY5W6mSYZZ2ABlIwxdG6UuN51GfTTHGY
 ugt29s+ac4diQ+4rODDZsSI/2EtJgQ==
X-Proofpoint-ORIG-GUID: TtsCcPkTEL1Uax3vrkLnVlXjn8aJLLaC
X-Authority-Analysis: v=2.4 cv=G5oR0tk5 c=1 sm=1 tr=0 ts=693918bb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=cIWfwQdKQqLfDOyn9HwA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: TtsCcPkTEL1Uax3vrkLnVlXjn8aJLLaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100058

Expand the existing constraints by introducing support for
the 32-bit PCM format (SNDRV_PCM_FMTBIT_S32_LE) alongside
the existing 16-bit and 24-bit formats. This enhancement
enables handling of high-resolution audio streams and improves
audio quality for supported hardware.

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


