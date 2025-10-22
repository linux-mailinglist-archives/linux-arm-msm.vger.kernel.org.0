Return-Path: <linux-arm-msm+bounces-78344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 658C7BFCA83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 302016E44B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 14:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A4234D4EF;
	Wed, 22 Oct 2025 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="govKmZyy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127453502B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761143651; cv=none; b=hb1YxgVWyQyGbsGk/MT3XAvA5f5KcV9j3G5gJ+i3BZ+mzKCcxgy4N+FS0My/UumZZmF02QsBbyNJ9o+FiTqM2x1U6kthLIql2YJVm4a4tbBqAo5WNgf1QQ3unoZufZ2eofEGpNEFrWOLQsuvAHhw3/dw+66Z0B+33rtGGeo2Wos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761143651; c=relaxed/simple;
	bh=Bz5dNjnWGJ72zU9lpe8lIcLxT6Mivkx50DoKVMYTicc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmjBfX072fU5YEBrn80ncTMHjeTLgGgLhudb0ilVe3TlMSkaglqbbfpoZkR456KvMjiAoaMH1lu5YNRIfnuHboAW3+OgVdFWORxTRh959HOziYuTfl6euOJgFHXZf1+g5PVjZnQl4aTm3f5YmLnBVg2gCx1l3deoqC18JqdyBCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=govKmZyy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MBam67027488
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=faQIz8fSwdO
	oA7CWAkNGtjSmqzRzKQ9HbO9f6ZOpKX8=; b=govKmZyybdeQGQigfBY6KIPoEXT
	pvMs2zdjtmwwitWHXIWAlpJpgJ2zcn2u2lmB0cFVBE2B0a8m7l9GzB7eZmDgNQ/m
	NYr/2ZixueYVufsrA9V65Sgow5Nas/VZwky7SI6IFMQYlTReh1TXJ14eoziEeDrU
	ooG6FtSufXQC3rWcxguvhiyAcd0kp13InCN6N/Me+H5SDMpTDbAnhJSFhj2OhG71
	1Q4tSApkDvjavwti/vRaPsXQp40sLgdPjTcU6dA3r+UMt1wXByJEJHfx7qdkZz8D
	lqKXsu3pk6By/m/l5X54gQIY7zzR++Q5nlkTR7KZOe7R3Fybbtp7pUjXViQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j4vyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:34:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e899262975so41202751cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761143646; x=1761748446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faQIz8fSwdOoA7CWAkNGtjSmqzRzKQ9HbO9f6ZOpKX8=;
        b=hbVuKUwEq09rZP0Abtgj+5KDlBBWidZVDjWTJHkUXF810naT6wH5WCvyif82HiTipk
         k2Gz2TjtEcQk+1C3ImL67wqF+uzNv7AMujLbPgvKS1qihkClYJGal0NP/YyVzkyly3mC
         cDKodbm6cB38ljOADklPIxIKlfUX2RCjz+TQ3VaorKu9XzoCH0dCMOEZeaG7ycNIZpWW
         iPx0a4yQdiOIVJcmxCE5nJubkD0MeSCq4xxQ8Sr/0q+9QA3YuyocmC0ks1SzM4f2ajQJ
         ryJSa5g83hAaKxlcixLHdlaA9wTquPkVTKzJfUaLNRX0aKtdc/kT7PXz+dyCRRLh9bZt
         shTw==
X-Forwarded-Encrypted: i=1; AJvYcCUG3JJMh0H6bCVE5WDfjy2ZAcr9cGkCs8/rCmu6K2F5oEI9StPgL+K2rykbOVNvWMVNBr3sUNRrVTk4R1DV@vger.kernel.org
X-Gm-Message-State: AOJu0YxBGcLnXZsyMtL6jChT1+53TlscmjvM/7b87Fk5wi0+D86E2iWM
	WaOnMMph2Cqu5jMItWN68MHUu5KNdrqqzeirP1TSCFOmzMRilzrcsQUP1uq3a5/ljqiOBWFRbep
	a5tUhLPIfB1SgEKcqUzNP7coLUyq6ObKNJQVpYxeOwvR26Vkfv28FH9QnZU7r7L87Kf5CechcNM
	il
X-Gm-Gg: ASbGnctYKSk5+c8lghryEaW1weC9Ck60z6Fvpa53gi31OpjsfTtoui9sROxNst6dS6n
	fl/XBhrsMXmfeczV1ZXzchcRN4IEdO66MVS4xsL0uDE6u0P4y4IJZ+gMvZopnYs0yoPh9IdZWCT
	Q7n9sa2KoM1SBiPtVIdIoyph/tr0hSz6DuYPyf/4BqXSEsyD5739KENjTlc08FWa07FjS4zkyCh
	MfxTgMj8VcF9UK6ZDYAIIHNNe86CeEsr05b6pee50+f4eF6rb2BjP424LxDWPNEz7cUW8mRkMSb
	FAt6K9duYNAYQJ97CONfyxfroMUXy/03wHKtPxli0WaSuifA0HeiLv76Wabgw5JsEFPlZWHx4GK
	8/RpqVojf+qEK
X-Received: by 2002:ac8:7e88:0:b0:4eb:7669:6b91 with SMTP id d75a77b69052e-4eb76697856mr32465951cf.16.1761143645326;
        Wed, 22 Oct 2025 07:34:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDK7D29Zp1dC9C3t8n2L6JThatH0XLulfavnkHZNj4oocbfOoVQymObbxt5nwrjNWlrqFgpA==
X-Received: by 2002:ac8:7e88:0:b0:4eb:7669:6b91 with SMTP id d75a77b69052e-4eb76697856mr32465241cf.16.1761143644735;
        Wed, 22 Oct 2025 07:34:04 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a993sm25544910f8f.24.2025.10.22.07.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:34:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Steev Klimaszewski <threeway@gmail.com>
Subject: [PATCH v3 4/4] ASoC: qcom: sc7280: make use of common helpers
Date: Wed, 22 Oct 2025 15:33:49 +0100
Message-ID: <20251022143349.1081513-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022143349.1081513-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251022143349.1081513-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX8OQ9ixyxqEcM
 po69MA7lq7dtLeRQZrkHZ3Tsx3Xniq774P6iL5SopFXEB3yom1+Z0DWSS2Ezo0OczsxPyWHStf1
 8dzc6wycwIK+Jsl9V+tp4puNlng5xq8FGfkvQsxJXA/J5zrPuTtr057bLmkkYsArt84IUb3aJ9n
 KZ1W+1uwMCJis5nyIx/oBfiTc7hkneMLPMpTrYPdoxfajE7CHzTbfnMqnYD6i/AQL5tD7HefM3X
 bgq2SEj6zxF+Ol9XYMx2xw3z/jBxoJs/Hv6vUjFU8vNWnTuOZQ1QeljGcFN2Arh0lBcfM+XmshJ
 g5+KLoph83FkPr3VPP5s9Pfxhmns+H5asRlDMIqUdUE/uxRI+SGXcL5AnJuYq5NzYl6ox/TSYzo
 AAZk2ymYuHF9wjWl1dGwHo0tkFtsDg==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f8eb5e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=xzVSZQTBi2W_vW4HIIQA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 6mKRCkuHucRsB6WL8xS_SvH2Z_ZQQr4k
X-Proofpoint-ORIG-GUID: 6mKRCkuHucRsB6WL8xS_SvH2Z_ZQQr4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

sc7280 machine driver can make use of common sdw functions to do most of
the soundwire related operations. Remove such redundant code from sc7280
driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Steev Klimaszewski <threeway@gmail.com> # Thinkpad X13s
---
 sound/soc/qcom/sc7280.c | 67 ++---------------------------------------
 sound/soc/qcom/sdw.c    | 11 +++++++
 2 files changed, 14 insertions(+), 64 deletions(-)

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
index c44659deea01..6576b47a4c8c 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2018-2023, Linaro Limited.
 // Copyright (c) 2018, The Linux Foundation. All rights reserved.
 
+#include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
 #include <sound/soc.h>
@@ -35,6 +36,16 @@ static bool qcom_snd_is_sdw_dai(int id)
 		break;
 	}
 
+	/* DSP Bypass usecase, cpu dai index overlaps with DSP dai ids,
+	 * DO NOT MERGE into top switch case */
+	switch (id) {
+	case LPASS_CDC_DMA_TX3:
+	case LPASS_CDC_DMA_RX0:
+		return true;
+	default:
+		break;
+	}
+
 	return false;
 }
 
-- 
2.51.0


