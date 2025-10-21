Return-Path: <linux-arm-msm+bounces-78140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CFDBF5D86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8B1834F7F15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 10:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D5E2EC54B;
	Tue, 21 Oct 2025 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnjZ4JXU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D8D2E090A
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043212; cv=none; b=SZZ9vG1bVhZkMBrJOhono8AkzhF2qQnH4tE+yiRlhQjRxZ4vcMx3f8KM7JqRgGZIen1tIyVtJi4QHJyD/N+4VMD5luGj16LD188iKsx8I/XJOdR/ObljQ07wzqYtBbpmMFrU/qVMLTCch5T9mDsYcxCQQsifKnMyg1Ex3zWU2CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043212; c=relaxed/simple;
	bh=FGgM/h/Nl0fe1KfWFbs1h0vZjvAmT5bJ7lsP2RH/hsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQXQA4OtwIacuox7sHD/7MO/V73AovkTGRqr7U99wtaj3LB+0uCEWtCWsxThIhkGbMuYHet1cyvB2WMe9QuJ5VMRt6EQzJyHWMJ/NZtmP9HuxSdXt4GEWjkX5z7VjiBzGCph+dSwbBlea7MiI8NgEoo1K5ol7NlMD7MpeJCKEJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnjZ4JXU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8QZXU024982
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 10:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+9Ah8tbJTOj
	w8bPwKE9oPJwMMDi4lE0dwETBQg6knh0=; b=KnjZ4JXUakFrDnVTcpINKjN+TMW
	0R5dIbfA612/g6BKZ5L7Ze4/iWJ8qFGpNBkHZyX1VjwrOi+NWJaJo0IIctxEES4l
	fyEKpawcxm9X6Q82lOyIraJIF4AKuWuUqfzalRUszAvVk05Xsj6GSXF5kYbUqxF9
	ud4ro2x9wk8DoJB2wURXQU9/rkCa8T1kNACP6E+kGoimAI1yw/4NxDb58QLONijs
	dgLic2cGJW2CRDuT0+pgFub17ajR/m4N9gl9EmZje1eOsKMwk2M8LIbNUeAOoqo6
	atWm8yUT+aqtIwMdWhTRlYVwY7eGy7TMxcEYzlAi6l/Xj41TqsOPx8AOMbw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w80dvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 10:40:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87a0e9be970so203050576d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 03:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043208; x=1761648008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9Ah8tbJTOjw8bPwKE9oPJwMMDi4lE0dwETBQg6knh0=;
        b=AtkKan3C8qpcxfQgSdCjGceuPYEWylB9NJ5XxZXx5VAYCUy9dCvt6PsVjqxz+q25qt
         BqvV7FruWwUzCYLG21wXX3M8vdZxk0xwlikXib12AlMzcVtum9z8mQdtWepvkFSyPePm
         yzL8HydMHwbOs/XAQENCf6zoQ1TsheKTQFstpvg5yaJke7SS6KODeW1PtG9qc15dWsFd
         umT2/qW8bYIjMDvlU73GhqFUZhJfOEgpnhk8mgUa+M0c6/4vQ1apZcee1joz1Ri7iHIf
         Gf9ZyZ5XcI4/O46w5+PQZfsaBWIiWtRENJBxO+k/A+zyUet8lkE4eH+2GFwj+razHsnx
         EEng==
X-Forwarded-Encrypted: i=1; AJvYcCV/4xFeQjAGTfoY3rE2pNspRdIGcNEYc+HZE+U1rOgkrTC8EZMeGQQ6q6RPeTqYfEjeicyuh+BwOu/0HLmX@vger.kernel.org
X-Gm-Message-State: AOJu0YyeJjsupoHBCSQb6TLcqFwDvXpJ08VmVddTWwMfQ8lbnEJPScNi
	Ao99FPwKtFtR6Hm/ueCirnCE01rmYRgl9xUe8Fogz76CVJ7196jwH+khRa6c86SKOi9klE9Le6z
	pWRBn3BzpNTY9mgVc9/wwHLCefWMu+/knqLuymyofnZNwx5DCuZGxGzUZnVG1eJIuWw4o63kgpZ
	dt
X-Gm-Gg: ASbGncvE66TIbEicegAIljL1kk+2VY4B4z2h2Fd+soepkbG6brF9TaddYEnMU228s9R
	9vBvJhCK0389Ush0Q5kod9iqtE6uX4/J+CgfG0HYOSticxkHJgKDWfcELIO9xv5sg9iLG845AdR
	hCoIWmNHljArKxGZLFDn4sRmTyIWn236mz4ibxIxN+QCnTSjxeQY4fzRSNiO33dUMWk2rVqQ4X4
	GcYUpOEbcbb3JN1Ak2okyGZ7rmAHNAQyFt0GXAjJ3Rsox7XP5aCWhpJ6sARKKKDObbGQ8XhsSzt
	x/X3ThRycqXrQwisyxE3GLTo7HzqUcSmahNP2rHiJi4B1yko6puYyCfWiiPmtyKRIYvivsJCJzi
	yBzP3yEyVeh/t
X-Received: by 2002:a05:622a:1a24:b0:4da:155a:76fc with SMTP id d75a77b69052e-4e89d21be0dmr229753751cf.16.1761043208139;
        Tue, 21 Oct 2025 03:40:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHazcELOTt+E+T3i2/ToyI5wizEDJzBBjmFtFWnpeZf3zGb9GIyKGPsj4eFnXMx5scrjcgWKw==
X-Received: by 2002:a05:622a:1a24:b0:4da:155a:76fc with SMTP id d75a77b69052e-4e89d21be0dmr229753511cf.16.1761043207558;
        Tue, 21 Oct 2025 03:40:07 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a976sm20087938f8f.32.2025.10.21.03.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 03:40:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stable@vger.kernel.org
Subject: [PATCH v2 1/4] ASoC: qcom: sdw: fix memory leak for sdw_stream_runtime
Date: Tue, 21 Oct 2025 11:39:59 +0100
Message-ID: <20251021104002.249745-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021104002.249745-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251021104002.249745-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX5Oiwbub0CEot
 H7YDfe9vATf2CvmF+uQtPhdlD8sMW0lyhshWbA6fCcC+bSDfH3vNKnJnLUtaT0QoLpa+2Aduw2W
 Epw2D+/p930tOb96nxtE6aULGVEIy6V0LgX7oR50blzNn0JQTXYVPyiMObQOitOBAe6VJjsxrlJ
 u8LBWzmon28p9k1lpdfKfUqxETcidWAjE9sfnI4l64LFFs/5gOAtsEJTIRxNJgIQovff19uP4rH
 Zjq91mG7+Xcy1fgNtitoPINhS+JdQYKfaTxkiQ5wXkA2718ayVnCiIOpINeTc7l7oxXNgFCipth
 wQhyuXK5LkpyqMBZA1+5/qC/DiqdFdrBzrCRkPhq77aUOVFfJNkQvtZjng4rV0uFCwc2/GdW62W
 HPKfxKerzHkFGLSFtbd7wpIBekn25A==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f76309 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=N47DpUgmF8P8R7KZyx8A:9 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Y7IMZ9wpJqlSlIlAPtGH04XJuvYbb102
X-Proofpoint-ORIG-GUID: Y7IMZ9wpJqlSlIlAPtGH04XJuvYbb102
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

For some reason we endedup allocating sdw_stream_runtime for every cpu dai,
this has two issues.
1. we never set snd_soc_dai_set_stream for non soundwire dai, which
   means there is no way that we can free this, resulting in memory leak
2. startup and shutdown callbacks can be called without
   hw_params callback called. This combination results in memory leak
because machine driver sruntime array pointer is only set in hw_params
callback.

Fix this by
 1. adding a helper function to get sdw_runtime for substream
which can be used by shutdown callback to get hold of sruntime to free.
 2. only allocate sdw_runtime for soundwire dais.

Fixes: d32bac9cb09c ("ASoC: qcom: Add helper for allocating Soundwire stream runtime")
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc7280.c   |   2 +-
 sound/soc/qcom/sc8280xp.c |   2 +-
 sound/soc/qcom/sdw.c      | 105 +++++++++++++++++++++-----------------
 sound/soc/qcom/sdw.h      |   1 +
 sound/soc/qcom/sm8250.c   |   2 +-
 sound/soc/qcom/x1e80100.c |   2 +-
 6 files changed, 64 insertions(+), 50 deletions(-)

diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index af412bd0c89f..c444dae563c7 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -317,7 +317,7 @@ static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_card *card = rtd->card;
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 78e327bc2f07..9ba536dff667 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -73,7 +73,7 @@ static void sc8280xp_snd_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
-	struct sdw_stream_runtime *sruntime = pdata->sruntime[cpu_dai->id];
+	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
 
 	pdata->sruntime[cpu_dai->id] = NULL;
 	sdw_release_stream(sruntime);
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 7d7981d4295b..7b2cae92c812 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -7,6 +7,37 @@
 #include <sound/soc.h>
 #include "sdw.h"
 
+static bool qcom_snd_is_sdw_dai(int id)
+{
+	switch (id) {
+	case WSA_CODEC_DMA_RX_0:
+	case WSA_CODEC_DMA_TX_0:
+	case WSA_CODEC_DMA_RX_1:
+	case WSA_CODEC_DMA_TX_1:
+	case WSA_CODEC_DMA_TX_2:
+	case RX_CODEC_DMA_RX_0:
+	case TX_CODEC_DMA_TX_0:
+	case RX_CODEC_DMA_RX_1:
+	case TX_CODEC_DMA_TX_1:
+	case RX_CODEC_DMA_RX_2:
+	case TX_CODEC_DMA_TX_2:
+	case RX_CODEC_DMA_RX_3:
+	case TX_CODEC_DMA_TX_3:
+	case RX_CODEC_DMA_RX_4:
+	case TX_CODEC_DMA_TX_4:
+	case RX_CODEC_DMA_RX_5:
+	case TX_CODEC_DMA_TX_5:
+	case RX_CODEC_DMA_RX_6:
+	case RX_CODEC_DMA_RX_7:
+	case SLIMBUS_0_RX...SLIMBUS_6_TX:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
+}
+
 /**
  * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
  * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
@@ -29,6 +60,9 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret, i, j;
 
+	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+		return 0;
+
 	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
 	if (!sruntime)
 		return -ENOMEM;
@@ -89,19 +123,8 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 	if (!sruntime)
 		return 0;
 
-	switch (cpu_dai->id) {
-	case WSA_CODEC_DMA_RX_0:
-	case WSA_CODEC_DMA_RX_1:
-	case RX_CODEC_DMA_RX_0:
-	case RX_CODEC_DMA_RX_1:
-	case TX_CODEC_DMA_TX_0:
-	case TX_CODEC_DMA_TX_1:
-	case TX_CODEC_DMA_TX_2:
-	case TX_CODEC_DMA_TX_3:
-		break;
-	default:
+	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
-	}
 
 	if (*stream_prepared)
 		return 0;
@@ -129,9 +152,7 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_prepare);
 
-int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
-			   struct snd_pcm_hw_params *params,
-			   struct sdw_stream_runtime **psruntime)
+struct sdw_stream_runtime *qcom_snd_sdw_get_stream(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
@@ -139,21 +160,23 @@ int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct sdw_stream_runtime *sruntime;
 	int i;
 
-	switch (cpu_dai->id) {
-	case WSA_CODEC_DMA_RX_0:
-	case RX_CODEC_DMA_RX_0:
-	case RX_CODEC_DMA_RX_1:
-	case TX_CODEC_DMA_TX_0:
-	case TX_CODEC_DMA_TX_1:
-	case TX_CODEC_DMA_TX_2:
-	case TX_CODEC_DMA_TX_3:
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			sruntime = snd_soc_dai_get_stream(codec_dai, substream->stream);
-			if (sruntime != ERR_PTR(-ENOTSUPP))
-				*psruntime = sruntime;
-		}
-		break;
+	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+		return NULL;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		sruntime = snd_soc_dai_get_stream(codec_dai, substream->stream);
+		if (sruntime != ERR_PTR(-ENOTSUPP))
+			return sruntime;
 	}
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_sdw_get_stream);
+
+int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
+			   struct snd_pcm_hw_params *params,
+			   struct sdw_stream_runtime **psruntime)
+{
+	*psruntime = qcom_snd_sdw_get_stream(substream);
 
 	return 0;
 
@@ -166,23 +189,13 @@ int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
-	switch (cpu_dai->id) {
-	case WSA_CODEC_DMA_RX_0:
-	case WSA_CODEC_DMA_RX_1:
-	case RX_CODEC_DMA_RX_0:
-	case RX_CODEC_DMA_RX_1:
-	case TX_CODEC_DMA_TX_0:
-	case TX_CODEC_DMA_TX_1:
-	case TX_CODEC_DMA_TX_2:
-	case TX_CODEC_DMA_TX_3:
-		if (sruntime && *stream_prepared) {
-			sdw_disable_stream(sruntime);
-			sdw_deprepare_stream(sruntime);
-			*stream_prepared = false;
-		}
-		break;
-	default:
-		break;
+	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+		return 0;
+
+	if (sruntime && *stream_prepared) {
+		sdw_disable_stream(sruntime);
+		sdw_deprepare_stream(sruntime);
+		*stream_prepared = false;
 	}
 
 	return 0;
diff --git a/sound/soc/qcom/sdw.h b/sound/soc/qcom/sdw.h
index 392e3455f1b1..b8bc5beb0522 100644
--- a/sound/soc/qcom/sdw.h
+++ b/sound/soc/qcom/sdw.h
@@ -10,6 +10,7 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream);
 int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 			 struct sdw_stream_runtime *runtime,
 			 bool *stream_prepared);
+struct sdw_stream_runtime *qcom_snd_sdw_get_stream(struct snd_pcm_substream *stream);
 int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params,
 			   struct sdw_stream_runtime **psruntime);
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f5b75a06e5bd..ce5b0059207f 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -117,7 +117,7 @@ static void sm8250_snd_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
 
 	data->sruntime[cpu_dai->id] = NULL;
 	sdw_release_stream(sruntime);
diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 444f2162889f..2e3599516aa2 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -55,7 +55,7 @@ static void x1e80100_snd_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
 
 	data->sruntime[cpu_dai->id] = NULL;
 	sdw_release_stream(sruntime);
-- 
2.51.0


