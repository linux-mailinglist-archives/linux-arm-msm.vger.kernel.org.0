Return-Path: <linux-arm-msm+bounces-78143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B0EBF5D92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4C3A2353A06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 10:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C53926B2DA;
	Tue, 21 Oct 2025 10:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tmxvpvew"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4909D32D441
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 10:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043223; cv=none; b=iHvXKZUV6+iJjHaaVqsqwvwmJy6IkrQx1AnqCZVSDgpNDXcK9IaawAA9+duGj/ZXnuvajOUbtrFg99v2kz8LRmZmxGz9E43tl5E6K3kUlGK/GGpQWs/1H73lPEc6q7KMUEV+L0aeJCa3JgTFTiU0vjXHh89tXgZ+HUSkz1J6UbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043223; c=relaxed/simple;
	bh=UYyYRnQbXnCvAIlE1ZdNvY1IRbRxEMbOF2tV79AsSe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GmLAlhPv2MkSGvey+WHXAbWZ1robY87sv+9Q2rUn3Xl62/LskIbnaDbxSq8iPPuknA6SDGGGwoXgFZH2cMDUPlorBIrcRPlbyuNnLR9lsv4QutwA22tTnzsgX/ReRysX7pm5PEWZHczuR/WqgdQFzI0mteV3jVaBFkIzd+pw1nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tmxvpvew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8MQxV005407
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 10:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jNy+kcNV6c4
	PBhObCb2utKXHWJKznzQtqH7XbZIO9js=; b=Tmxvpvewo8LvbZOVtTldkjiOM67
	bzWL/BC0F9VycNUffsUgy3R5nbf05R/nN0yAiVA5o6mzid83Mw9s+zwpvpGEI3Ev
	ptON+BDbgCXZJ8XQsBtLgZzEFmmIBF4GINZ810qG6hEyTnyPHg2nPHl70ZWdge2W
	iIILGHaEHQHqjLTYE0T1ZVE97TGeBca9Xc9aFtPyZGIPx128VebLDDhWf7ryTWuC
	faJXufmOxrbETKLaevgxtWypJHnF+xtxXtVHQLA4rQ/dUnlCq+98/YfEbYJkvDwG
	hg1aKUGpPNEgnG4RhZT1aaQ9FV05G80IVKXg2KwaKYlwoNtqlpav6WKLE5w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfgaxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 10:40:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c1f435bd6so193936636d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 03:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043212; x=1761648012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNy+kcNV6c4PBhObCb2utKXHWJKznzQtqH7XbZIO9js=;
        b=UYbv5HWccV3q5wP10FL1XMPJFXTjYB0K52cQdNB+eXpbslrFkB5SwbavJDduw32A8o
         ZSpQ9CFWgJgIV1DLi9X80yXl8fzerHWacnODeG8woW491xGaL2Fl+glnR1c/fIIXs3kB
         BP4Q8pFUEOj8Ac0lHV7Ke+qBEZ/8/H7Ex5yx5O42SEReL9F6NlHOuFfYNhNRiQMtYrua
         G9Ht7nUkiUE403kVAxMIGNcvdhegQ0kvZfEAqz3axFMOhQXPKUJzLItdESfCXrSi/PeT
         5vJbiAzWe2Fq49cDSgLtiBALRq04YQPW4FNwvsiGTNuCNih24ToeuCNajJFG9XelJLQd
         vr8g==
X-Forwarded-Encrypted: i=1; AJvYcCUmOF9iyxix6ss73nuNpKVEGMIVgxmSOChj6sekOGgzu0eXyK2Uu+l0BTvnBJlDNCrepn+Dy66xUvQLU5Vh@vger.kernel.org
X-Gm-Message-State: AOJu0YwytjLQyNSUPEwABFi+Po5diLfFjrxHUCts0BLypic41QfsBLZS
	HUbWehvvX8sc+gdNDbzK7JA2VRGurewkMa/mIC/fop8RGw1yYMnwKOGkkiRLXl4MKbbPc87BMpt
	FHIrNu5RaeWLHivuehCxohhKxKpt0nSioEgB+sOdj7BmZg1cFRF+MGRlZXGODdmammpOs
X-Gm-Gg: ASbGncs/l9MjWSv9y5r+X2HVx8NQ44Tj1nE0y+nVYJHHkbVOmiKhgd4I7vSQT85tw5y
	9e5YabZcVEBMEevXejmTEt1rkNW+bWCegCHKQ1INR3WvhHLFaXbH8GHUPXDBQWk1ZLxLhXwIPhL
	RnKqf32HnAQfYt/305jLbzGDZ3MHmp41QnmzvHU8TrOIT71eH5BnyCojScMRffD26itCJKX4lUG
	lqAqopEwqjJEfI3Knt940y4bdQLnRzPJ1N9aWMG9AG18o65JZXTFb5M2xmzUWHCcFfHHR8AzaZc
	ykc7tjhVG2nO0WRJdpEN/fwoEymWrnbX9+Ytj6J/BC1pxUGNr8MJD1pddnYF/PYZ+5fudeJ2xfK
	pBFhgq5MLUMkh
X-Received: by 2002:ac8:5a88:0:b0:4b7:9506:efd1 with SMTP id d75a77b69052e-4e89d1fa8f4mr160054621cf.15.1761043212081;
        Tue, 21 Oct 2025 03:40:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNwpGr5uC6St5tQQjzTYAMWepTpl6VdBTuEO/ILCKO7RvOLdLTGwCCKckadeZvFJxgQmGWJA==
X-Received: by 2002:ac8:5a88:0:b0:4b7:9506:efd1 with SMTP id d75a77b69052e-4e89d1fa8f4mr160054401cf.15.1761043211552;
        Tue, 21 Oct 2025 03:40:11 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a976sm20087938f8f.32.2025.10.21.03.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 03:40:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/4] ASoC: qcom: sc7280: make use of common helpers
Date: Tue, 21 Oct 2025 11:40:02 +0100
Message-ID: <20251021104002.249745-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: VKUVbaqZH4HMIWZjOtCfe2iEYfUhUyMl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX39cHaluAAZ1g
 P2Jgvl41Zw7+rMqt0Xnmd6MgMlRNZgDTVggm7aZXsFBZdGs1DsbX95opc5PiiAgwFgAF7rJrJG5
 0FQMvSzFb4uziZyLVCoqbRPzeh2PVFOeL+lVxZ2XuVMoY4waytK1/hgZCl1rFTl2qZ//LtKEHvD
 o8FSp/cdTWorLXzUUMHTFI/f2UEYRujF5RPbPqT4pmmcZ6dg7j1S6ZAuDGa1CyvfeW0oUBLw6ja
 HpxsrFQ3SkUgT/Oe6qxjI6RoKcVrkyxMk5Il3f/6vBdPxvcl3p5OsJKXJHmAtl4ascykzuMFfCN
 Ao4YDGiviCk0qy3nkj0S+2xmCoCrWl35tuC0piJK7DayhsrmZM29MWshvhWlNvbBdraL37jYavQ
 a1Zb6If2nCxrfKM90HRo6N8m//2Fhg==
X-Proofpoint-GUID: VKUVbaqZH4HMIWZjOtCfe2iEYfUhUyMl
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f76314 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=xzVSZQTBi2W_vW4HIIQA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

sc7280 machine driver can make use of common sdw functions to do most of
the soundwire related operations. Remove such redundant code from sc7280
driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc7280.c | 67 ++---------------------------------------
 sound/soc/qcom/sdw.c    | 10 ++++++
 2 files changed, 13 insertions(+), 64 deletions(-)

diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index c444dae563c7..abdd58c1d0a4 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -31,7 +31,6 @@
 
 struct sc7280_snd_data {
 	struct snd_soc_card card;
-	struct sdw_stream_runtime *sruntime[LPASS_MAX_PORTS];
 	u32 pri_mi2s_clk_count;
 	struct snd_soc_jack hs_jack;
 	struct snd_soc_jack hdmi_jack;
@@ -207,32 +206,12 @@ static int sc7280_snd_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai;
-	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
-	struct sdw_stream_runtime *sruntime;
-	int i;
 
 	if (!rtd->dai_link->no_pcm) {
 		snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2, 2);
 		snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE, 48000, 48000);
 	}
 
-	switch (cpu_dai->id) {
-	case LPASS_CDC_DMA_TX3:
-	case LPASS_CDC_DMA_RX0:
-	case RX_CODEC_DMA_RX_0:
-	case SECONDARY_MI2S_RX:
-	case TX_CODEC_DMA_TX_3:
-	case VA_CODEC_DMA_TX_0:
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			sruntime = snd_soc_dai_get_stream(codec_dai, substream->stream);
-			if (sruntime != ERR_PTR(-ENOTSUPP))
-				pdata->sruntime[cpu_dai->id] = sruntime;
-		}
-		break;
-	}
-
 	return 0;
 }
 
@@ -241,30 +220,8 @@ static int sc7280_snd_swr_prepare(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
-	int ret;
 
-	if (!sruntime)
-		return 0;
-
-	if (data->stream_prepared[cpu_dai->id]) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		data->stream_prepared[cpu_dai->id] = false;
-	}
-
-	ret = sdw_prepare_stream(sruntime);
-	if (ret)
-		return ret;
-
-	ret = sdw_enable_stream(sruntime);
-	if (ret) {
-		sdw_deprepare_stream(sruntime);
-		return ret;
-	}
-	data->stream_prepared[cpu_dai->id] = true;
-
-	return ret;
+	return qcom_snd_sdw_prepare(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
 static int sc7280_snd_prepare(struct snd_pcm_substream *substream)
@@ -291,24 +248,8 @@ static int sc7280_snd_hw_free(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	const struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
-	switch (cpu_dai->id) {
-	case LPASS_CDC_DMA_RX0:
-	case LPASS_CDC_DMA_TX3:
-	case RX_CODEC_DMA_RX_0:
-	case TX_CODEC_DMA_TX_3:
-	case VA_CODEC_DMA_TX_0:
-		if (sruntime && data->stream_prepared[cpu_dai->id]) {
-			sdw_disable_stream(sruntime);
-			sdw_deprepare_stream(sruntime);
-			data->stream_prepared[cpu_dai->id] = false;
-		}
-		break;
-	default:
-		break;
-	}
-	return 0;
+	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
 static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
@@ -317,7 +258,6 @@ static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_card *card = rtd->card;
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
@@ -336,8 +276,7 @@ static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
 		break;
 	}
 
-	data->sruntime[cpu_dai->id] = NULL;
-	sdw_release_stream(sruntime);
+	qcom_snd_sdw_shutdown(substream);
 }
 
 static int sc7280_snd_startup(struct snd_pcm_substream *substream)
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index c44659deea01..16bf09db29f5 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2018-2023, Linaro Limited.
 // Copyright (c) 2018, The Linux Foundation. All rights reserved.
 
+#include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
 #include <sound/soc.h>
@@ -30,6 +31,15 @@ static bool qcom_snd_is_sdw_dai(int id)
 	case RX_CODEC_DMA_RX_6:
 	case RX_CODEC_DMA_RX_7:
 	case SLIMBUS_0_RX...SLIMBUS_6_TX:
+	default:
+		break;
+	}
+
+	/* DSP Bypass usecase, cpu dai index overlaps with DSP dai ids,
+	 * DO NOT MERGE into top switch case */
+	switch (id) {
+	case LPASS_CDC_DMA_TX3:
+	case LPASS_CDC_DMA_RX0:
 		return true;
 	default:
 		break;
-- 
2.51.0


