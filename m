Return-Path: <linux-arm-msm+bounces-72758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8842CB4FA9C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8377C1C26E56
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCA51B78F3;
	Tue,  9 Sep 2025 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJAcIMDR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31653375BC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420428; cv=none; b=D/xHu2Y6dzLVVeya/rygQrphScwUzj5zA8e5HuWKa0HO86vLjpF1RDsNad0i4edk1iYIQop1PbDOkhWv9DddBcf0KprWz3pN2ohvYQACr79DPNOG1D8s8CfSKaY+NG4fsZ5vPCh1aUShcazFXbizKHBr0gmg7hd/eHoLyBwtxB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420428; c=relaxed/simple;
	bh=4NDb3BHQkI2X3E5eiL6I24at9ebSdCFIXHWDhEFcgdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABMAMEmkGXFGs+7/LRlAF9eHOIBfPo00bMdHvUDhttMurkpGC/Ys8Hfg+eRbByp2LEQKcKoD6ay+YKOWjP/K6TIjYQAZEmjOE+XGufoL9R8VHpKqmv4CffhsDHrFd/f30OWaU2qLZXl2zUyKrWi0wm251A2FPi7igVgdBhOcnjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJAcIMDR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LRKb032181
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 12:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C34AfntxGUQ
	tcgOzSpdk0iKg2eP3zakUjCy6JAxDmas=; b=LJAcIMDRofWTMIwTHdbsR4ojTuD
	QjtkNENFmJBirNGNPtrk1+EEFg0y+7gynDLxkh7YxIbuF6Bv6DsLmxJ02FqHOoPy
	4CYyi1q4NIIXt3mK3YvwG1o4YmYdOYyYj/j44RUCO/2L4Sy9a4bdlZ8n97zxpXCP
	/aBfxeSNUgeswg5qwmqq2fXYGwHTKi9eUEV3zds2AU3fWEREW1Let9ijzbhNHSKr
	rjW7Q1xNVpZ9u1djhvFCrgNK7tuAIFiHWns+XsuyMqxn8SEgP7aLNHgCV3pzDisG
	rMpouVeQaxv/uE5VS16JcpuXI5Twi0l+Vh2AhYbiJhegt6LsJw0JatsiKHA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m023s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 12:20:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7507804a7f7so33181786d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 05:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420424; x=1758025224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C34AfntxGUQtcgOzSpdk0iKg2eP3zakUjCy6JAxDmas=;
        b=kjzF+Ok5rffFcXYJVlbpYRuon07Sw0ld6Spak9r9EGOo8AGtX/f365nxSxxS9MdI1r
         sVxMLxh+aLluQFXy8lddVM3lzM8GVCI80UjEd3/dj4FjdAj2b1U2suvpbxVpkyYL1SHT
         QdhdgZ+oreBD+EJH39xTjH7IDt/yP/PG6ul3Zc3kp7opsptAxNe8YVGtN6rcJXQociDT
         BVTgGyAkZUkRPQQa/gnjAAV2YsHV3frsU/SilXSmg7tFOEgsIKNQjs5QBsL0E3IsbwrC
         cqxFqmjc3SmGH8xsHYOuVQOFnnS5qFS+1MoBhH807W8eGqJ6V4aqcb08rjL2sDIQGkgn
         M4aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVitkpiBL9U9+jk54Td6ikMgKa+lVH3vLId13XWm5xaO2EcvlO/ussvkW8IBE6LJBqgV5VYA/ov+uhPHRPY@vger.kernel.org
X-Gm-Message-State: AOJu0YzboCfRrimJ7DiJst+y0Q68imr1j1QqxmJ/QfJXk00IeSoQse9R
	LW8c1w4CwMTUwUG9ywHxP+0KONoWry2UxJf3pYktmK6ZQUY5/XTGzW/jTmpJu7o6NvRL1p6dyu4
	WaCHWpUsBDOVOuYSbCEErVWY9QGv77bEjzXmV6quHPSeqAf18EgqcZkMt0wmNrcx/HBqx4iS6kQ
	UM
X-Gm-Gg: ASbGncuqLfXqoHD7O6qf8DuMb6O0rtTzKADpPxY5ae+20MoYG35CUXQbCHyqtLRhOGj
	OZMKHOaDjBoT6HolcKlRkEqRiGcerqrHmwaTnfEAvWsr2SvEYBsSJjTjO3pgWEly6El6PaJ+iiK
	zIbZzjBKQUHVsR9R8g3XRcZw0rjQfyKLEXLO+GwMQl/52sICRrBwlyYElyEumWY2bp5lOzicG3o
	CNOIVEFdQ8DuPfuHEZBN+8vLO5lFw1dPqcilVUXB1bKGj84snrF6pCJEsNKzXQL3jiD9hIXYCrl
	Go7j/nezip1wkuK9TkHUwWLJKuuzSb1Pa9NYOFQpY1t8FO/PWj2+gA==
X-Received: by 2002:ad4:5be4:0:b0:70d:dbb8:2a08 with SMTP id 6a1803df08f44-72bbdceb182mr156038136d6.3.1757420423907;
        Tue, 09 Sep 2025 05:20:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRLHhHYhnAnZgwOz6EmXo53Q0xNjmylA1B23jjIxeH/FjfAFEZIkqOuOd5Hjm9+D1oYLRV/g==
X-Received: by 2002:ad4:5be4:0:b0:70d:dbb8:2a08 with SMTP id 6a1803df08f44-72bbdceb182mr156037706d6.3.1757420423308;
        Tue, 09 Sep 2025 05:20:23 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 06/13] ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper
Date: Tue,  9 Sep 2025 13:19:47 +0100
Message-ID: <20250909121954.225833-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX5WbbmBraefHI
 M4OWwFqzz73EZw+XWtQRr1xFLwNoBpqeEgtjUo6wzJ+RdW2+2roKkR9DBgbbFK67iB4uy7ULpnD
 z0vP4Vi9HPY6b7B+ko9tMJdRVYvp3HPzyjyMBxfqxrNhxKPtueyjCGFVNr4t0FNWwMp0UheL/0d
 tEysH4B9uUiml4h14Py5r+3ReHKQX4yOwGlULZ5Ed+6Q1GlTlc2G9xOhU7/fMUMNHR0bPs0uscG
 KfJ047xiq5u5jKoeN1nQK8gAwuaM17506V5qiHFXBvANDN6b+dSIuY2/chFEEWy09CbHWqDaiy7
 nmJyg+8cgvdMypD29nm5Vh+j0AzlN/WjAVOdwefbZdqn2Foo/Rk9lkJT2ejEhA7Hps5Dj/UmUu0
 gQyQT1vj
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c01b8a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WmG1VI7HpiTX60UEcG8A:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Ukzccsf6_nXUiICDQAqeUZbFZdVjtQBu
X-Proofpoint-ORIG-GUID: Ukzccsf6_nXUiICDQAqeUZbFZdVjtQBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

use sdw_slave_get_current_bank() helper function, rather than duplicating
this function in every codec driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 sound/soc/codecs/wcd938x-sdw.c | 10 ----------
 sound/soc/codecs/wcd938x.c     |  3 +--
 sound/soc/codecs/wcd938x.h     |  7 -------
 sound/soc/codecs/wcd939x-sdw.c |  7 -------
 sound/soc/codecs/wcd939x.c     |  2 +-
 sound/soc/codecs/wcd939x.h     |  7 -------
 6 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index a7514d716086..8bcd8396f375 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -82,16 +82,6 @@ static struct sdw_dpn_prop wcd938x_dpn_prop[WCD938X_MAX_SWR_PORTS] = {
 	}
 };
 
-int wcd938x_swr_get_current_bank(struct sdw_slave *sdev)
-{
-	int bank;
-
-	bank  = sdw_read(sdev, SDW_SCP_CTRL);
-
-	return ((bank & 0x40) ? 1 : 0);
-}
-EXPORT_SYMBOL_GPL(wcd938x_swr_get_current_bank);
-
 int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index e2cb0758bca7..f8d7bf27a6ed 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1094,8 +1094,7 @@ static int wcd938x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
 	int bank;
 	int rate;
 
-	bank = (wcd938x_swr_get_current_bank(wcd938x->sdw_priv[AIF1_CAP]->sdev)) ? 0 : 1;
-	bank = bank ? 0 : 1;
+	bank = sdw_slave_get_current_bank(wcd938x->sdw_priv[AIF1_CAP]->sdev);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index dbafcae247f4..54ee56b7fbd6 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -669,9 +669,6 @@ int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
-
-int wcd938x_swr_get_current_bank(struct sdw_slave *sdev);
-
 #else
 
 static inline int wcd938x_sdw_free(struct wcd938x_sdw_priv *wcd,
@@ -696,9 +693,5 @@ static inline int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-static inline int wcd938x_swr_get_current_bank(struct sdw_slave *sdev)
-{
-	return 0;
-}
 #endif /* CONFIG_SND_SOC_WCD938X_SDW */
 #endif /* __WCD938X_H__ */
diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index e487a1bb0194..477d6cf27d32 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -128,13 +128,6 @@ static struct sdw_dpn_prop wcd939x_tx_dpn_prop[WCD939X_MAX_TX_SWR_PORTS] = {
 	}
 };
 
-unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
-{
-	return FIELD_GET(SDW_SCP_STAT_CURR_BANK,
-			 sdw_read(sdev, SDW_SCP_CTRL));
-}
-EXPORT_SYMBOL_GPL(wcd939x_swr_get_current_bank);
-
 int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 5a56c79a8922..85730ae40c2c 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -1017,7 +1017,7 @@ static int wcd939x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
 	int bank;
 	int rate;
 
-	bank = wcd939x_swr_get_current_bank(wcd939x->sdw_priv[AIF1_CAP]->sdev);
+	bank = sdw_slave_get_current_bank(wcd939x->sdw_priv[AIF1_CAP]->sdev);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 3f189e5cafd5..e70445b1a4bc 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -930,8 +930,6 @@ int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
 
-unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev);
-
 struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd);
 #else
 
@@ -957,11 +955,6 @@ static inline int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-static inline unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
-{
-	return 0;
-}
-
 struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd)
 {
 	return PTR_ERR(-EINVAL);
-- 
2.50.0


