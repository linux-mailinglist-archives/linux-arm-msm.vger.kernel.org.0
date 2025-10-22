Return-Path: <linux-arm-msm+bounces-78343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1ACBFC948
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F182F357180
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 14:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89747350A14;
	Wed, 22 Oct 2025 14:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKXMumSK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FF334C9B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761143649; cv=none; b=af0IbFHKEQ3oqoS0Z/MDn1icj7HBLjkvqIBfIaHAUZYUq4k1H8uXgeF2yhPH8UVYaLybEhfVROC2CMr3tjrCvoGfBSaqqVzx32kwfIxLBLeZ7GDJpCTouG0tdlArDThfrT39pDdaQyK0skSG/TfOTPBXzZvKGvvnjAcrFPSvl0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761143649; c=relaxed/simple;
	bh=N3ekUkk5r7V11hY0lO88UuCG6vkaZSYvwo4x85M1YwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYM9axeBG5SsgDx4vo8oZnnpH1Wmrtao2uOtAEhAeu+GxWqXQsfZgqOX4MoRglzHKLI/BBy5GqbLxFqAzIxD6lzXNtnUlu3ZeYFjcrnCKT/THlxTeGbmqeES1aZVvRly/3cgEyJ5hCzrMprxctevZB3CFPRyTDHbbCbpFYhl3G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKXMumSK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MB5KhV025166
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LjQNhFIeUpf
	5JssPbJ0qx1B6gPLm2FuVhAcXynJbBBc=; b=kKXMumSKlLkFbJhuPzeLE77hSlU
	gHup/Ffj5oRKkz2thtdUJsOpZRM0mpkusgfA/TasdirrHyrXEV5VYQE7LbWqMnZk
	qEmZNloGrMMNiFUL5dEFp/H7iBuvamFSTsHCjgZaVjPkL+a/oVUFIqP33At0pYYo
	dvNsZZKn1QCT/QGFo3PAQk52nSVfos0BrcQox5lwyo0s/tnWKZYP1sktePS1Wkmt
	pF/ANwuHd5XKLVvDLDRTYfUn1m5gZ/7DQioA2/tF+OPKGvACsHsy1//WL5pQPHIW
	T0H35PCncs5r9yaLQi1zeaZjCCXtco7YZn6G8lB82V6a69jAaVgaeAkrg5w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8508a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:34:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e88e094a5dso52478221cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761143644; x=1761748444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LjQNhFIeUpf5JssPbJ0qx1B6gPLm2FuVhAcXynJbBBc=;
        b=sMncaJwtsfFD71swzUk1MVgpbftrjnYXd6TvSR8S/99x8Bd79Nnme8z5jnnPoqT9t0
         pZVFd8hLCQ1RTF/h61JVrrq78kBuAknQZU3s9ykbbgL037I/ZAxVdRwLo4Tru/wd7E5G
         sl+dvweYg0zphkXITXUz3TNeKsESqsRcbZv9/qdZfNrLYnaQD3SrxvNQvLdxfxScO2bB
         jzYfGIU3GzUVjgy6ejndUlrMJ4GqlhMZ309l/qesFMhidi6UsYwQR7TrbWEZNxy5/EDK
         e1n1JKEJIHk9KQWH6qEB++qCQC4+yxraGqsmEW1R5Kon1eQk3gPtpYKvznoUVOegBQvT
         Aj1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFFblIpyLiU6HI47JCGebdP00x+j28TEKNPyjruj28M7umZ/h3bF+sAa6uW8+AamQCE/CPLrtEqwZDoRGK@vger.kernel.org
X-Gm-Message-State: AOJu0YxQzks+0VAU+J+kgyWpp+WnAIz4YZfYD8+E0z9nnCjp+byD4tAU
	MTaB6btgHgmTDI0tfv1O6XvNp9w3CdTFVSIDdZYNMOI4G63s+USjps3DTocbzFG6/Iahdcb1ByW
	fx3kFYt/JwUj0K5GHlzy4wlzoixYKqSA066SzM3xHaaa20xyZeBObSDjZjtn1FgwymFms
X-Gm-Gg: ASbGncug5hCz337vaMVtlKAYUdsHaKro8KAHkZ38hl80tDk5VigyuX3KdtE7QmsLI4F
	upTj+D8PDD1dMJNxGuwZ58MZD3GxthDnOErn8AGv77gMeEn/EoBljTnU/kysjO10plVmUywOviZ
	0Lg5VlGVpRYUeqD6tvENnTckUFAXq60SFPbrpgH8RR75bSbTTPeX7fXNihp3U05okcD1erpXZ3u
	wY/133P2j6a+vYqINciF7Dk6WYgPEpaFypu/DeNQV5PDjPcy4kuVbzPEFKiQaeWv+SKfEw+MCH1
	LrEZ0PhLvCycTvY75wbmegsPW/UM3tcYMb0nGESrcbCd5zSd5PAlBguib4mU5YjAOFcFJ1+RHGl
	yU+c9PIyz0rjZ
X-Received: by 2002:a05:622a:18a1:b0:4e8:ae23:588 with SMTP id d75a77b69052e-4e8ae230a33mr206904621cf.71.1761143644038;
        Wed, 22 Oct 2025 07:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUURiqf2ZbYCHQYkeUwniA0/msOMU8UfHS5MceRvgrYZgwzEArKHXJ3RTzXptD3Cba0FFXJg==
X-Received: by 2002:a05:622a:18a1:b0:4e8:ae23:588 with SMTP id d75a77b69052e-4e8ae230a33mr206903991cf.71.1761143643611;
        Wed, 22 Oct 2025 07:34:03 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a993sm25544910f8f.24.2025.10.22.07.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:34:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Steev Klimaszewski <threeway@gmail.com>
Subject: [PATCH v3 3/4] ASoC: qcom: sdm845: make use of common helpers
Date: Wed, 22 Oct 2025 15:33:48 +0100
Message-ID: <20251022143349.1081513-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX77cvDlzM0AHH
 BdIah3kOf6aiSKAUhVSc5p7DNcjtOg7HvuxcPv5WUQXRikmYwGSiOyGqTpvUBw0+o0QYpMN5i3V
 i0UnJQWj6XyEQLiBUTzKc6ktteNRpNHauoyV7wuMiK5fAli7kIj7WXrp9qSFUGu2KB00C1GD1t5
 ijfpT4+QMKEQNKanYqmhVuGiHEE50mdwoUm9X7YdA37arwLA37GYWA6pRs8HXl60ASoMFTv6iUo
 6q6AyuwuesjyyXKP4YMDBciqvjPsHWvwvqyKJl9SUOJWhlAPdft4lLVG1HyLtGxqTcAjF3ezdC0
 RurOXuQioLMTY4lg+oNj9gl8jK+x9738PkRsCaFFb6xzZB76Mws30g1PWfQYKgCy+BDBvh6sN7o
 v06L2jz2Tsk+WO/HNhiltqAltxD3LA==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f8eb5d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=5b0IN9Hzzi15MECZVvAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: IYFRng96H-_On0WyYOufdZAZ6ybcCDSp
X-Proofpoint-ORIG-GUID: IYFRng96H-_On0WyYOufdZAZ6ybcCDSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

sdm845 machine driver can make use of common sdw functions to do most of
the soundwire related operations. Remove such redundant code from sdm845
driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Steev Klimaszewski <threeway@gmail.com> # Thinkpad X13s
---
 sound/soc/qcom/sdm845.c | 53 +++--------------------------------------
 1 file changed, 3 insertions(+), 50 deletions(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index a233b80049ee..e18a8e44f2db 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -40,7 +40,6 @@ struct sdm845_snd_data {
 	uint32_t pri_mi2s_clk_count;
 	uint32_t sec_mi2s_clk_count;
 	uint32_t quat_tdm_clk_count;
-	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 };
 
 static struct snd_soc_jack_pin sdm845_jack_pins[] = {
@@ -62,18 +61,11 @@ static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
-	struct sdm845_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 	u32 rx_ch[SLIM_MAX_RX_PORTS], tx_ch[SLIM_MAX_TX_PORTS];
-	struct sdw_stream_runtime *sruntime;
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret = 0, i;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		sruntime = snd_soc_dai_get_stream(codec_dai,
-						  substream->stream);
-		if (sruntime != ERR_PTR(-ENOTSUPP))
-			pdata->sruntime[cpu_dai->id] = sruntime;
-
 		ret = snd_soc_dai_get_channel_map(codec_dai,
 				&tx_ch_cnt, tx_ch, &rx_ch_cnt, rx_ch);
 
@@ -430,7 +422,6 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_card *card = rtd->card;
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX:
@@ -471,8 +462,7 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 		break;
 	}
 
-	data->sruntime[cpu_dai->id] = NULL;
-	sdw_release_stream(sruntime);
+	qcom_snd_sdw_shutdown(substream);
 }
 
 static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
@@ -480,38 +470,8 @@ static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
-	int ret;
-
-	if (!sruntime)
-		return 0;
-
-	if (data->stream_prepared[cpu_dai->id]) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		data->stream_prepared[cpu_dai->id] = false;
-	}
 
-	ret = sdw_prepare_stream(sruntime);
-	if (ret)
-		return ret;
-
-	/**
-	 * NOTE: there is a strict hw requirement about the ordering of port
-	 * enables and actual WSA881x PA enable. PA enable should only happen
-	 * after soundwire ports are enabled if not DC on the line is
-	 * accumulated resulting in Click/Pop Noise
-	 * PA enable/mute are handled as part of codec DAPM and digital mute.
-	 */
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
 
 static int sdm845_snd_hw_free(struct snd_pcm_substream *substream)
@@ -519,15 +479,8 @@ static int sdm845_snd_hw_free(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
-
-	if (sruntime && data->stream_prepared[cpu_dai->id]) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		data->stream_prepared[cpu_dai->id] = false;
-	}
 
-	return 0;
+	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
 static const struct snd_soc_ops sdm845_be_ops = {
-- 
2.51.0


