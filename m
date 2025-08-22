Return-Path: <linux-arm-msm+bounces-70371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B6BB315BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82B2D622835
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3032FA0E5;
	Fri, 22 Aug 2025 10:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hO9XTDjW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F8E2F5484
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859780; cv=none; b=pdGeYisO2WeXyT/njfJ8aT8fdEs6ZCNHbp32Q4oVhEnvV495PXu5zeaihFMsZNPtj+QipPeYBD3lbNbQOwEKaWZNJYAracZ1PjiE4seWo7XuW5j/z1Y+aUwzlCOx7WnreC6gJoHLYYF6hBJk0lDpsFIid5IDh8l3QF3lYDvUFeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859780; c=relaxed/simple;
	bh=asxvysqqAjgkKstONlIrpBzxu2GRO9SXusBJVqCmX5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxHZhSiMlS6jq8oIsSPbLmNYtaxG7IOxcM1aEOQDIbhy0e0Ke+TzVuROzJ6/L1MqIZ6V4bg5ghxy8G2gM8516uBzO+Q4L5I+fexWetfLqXl9u46QOr1MpKSlT7dyRA5E+NFsjYw7xT//fwktScp8gAAdQZPX+8PMClPwc5w+AQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hO9XTDjW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UM0B028648
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WCblndB5WM/
	7lEa4Lxpv6vxarG8aRPyFWHgtcjT569A=; b=hO9XTDjW1Eq/ynBaonlnvuT/TGr
	Lo/up7YFycRVngRSwP5vC211CGfK5jE5zLxNggmmdfGN29m9NZmEcRASQcxyEt1J
	7G+seHnBPib6twNe16KSOePt7La0pNzw354AHv3oLGK5MCEPCq9DbWCsByZz4Fe5
	QVh4jmia8xUbeUZWfbuK5VNDQyYKpV9K6Liel6PTIDci9TT6vSWB0cdf8SiKt8/L
	CjWJ+X3JitWdmRoYQw5fmQUzQWb0cqfINxMwVqgW8lyv3xOHbX4VeFyhZCKtzTWu
	fGylvbqfjTdXz+fyQByTfoj3Hg+lNPF3FvD1voNY7HMNf/krumTZD6+s6mw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52crx4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d9f5bdf67so8703696d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859776; x=1756464576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCblndB5WM/7lEa4Lxpv6vxarG8aRPyFWHgtcjT569A=;
        b=GXMueATRRIT3e7KmjwcpOA6HWybWHYUEb61vnPyOaFHAjDHlWsXLH7pWr/AYR+uLsO
         n1mpXuGG3hyu4cY77/11obsiTjrIqnvPEgO/xYA4M7nLe3ArGGU19VTIRg2xlo0hKg2F
         mRMJWR88q8VnnvmtsjdCpBsLfuSUoMdJtSFrqyjDGPqWcbXYmhv3oVaLelHM8RzTLcru
         N9EAyMSljJltPOC/7eAaY2sszcEXF2+4ptavtJ4EnP27C4STaqspIcrvrnxPJo6ArWbR
         VNi8hGG/2kFKvtOf1tl2x40RE05Aj+LZD5RWvgDTAZqzSkyFAhRGkIZVBUt20n/KSX2p
         9gRA==
X-Forwarded-Encrypted: i=1; AJvYcCX7Vi0L9jlF7YynA+Se4exslIPMTASsI/w1mYDQ3lPCZSkstRNdsS2YdphJ9NZ09eCgdK7daXO3Fydk0+rY@vger.kernel.org
X-Gm-Message-State: AOJu0Yys972zRBHSKpaf0oas3rMtOk6MAf4LDLzReTONlDABYhDbRtEp
	pevjm3wWVLZnhBkHsEuDf6NOgfuULCh+7jealoJwto8DQRxGA1PVnDA5OHpc6oDQcz7emZ0kPAN
	gmzAyLzo6kJlFw07zxjf75NRaiua4s+8/yxwLEV+ucqNBj9S1LbqrRg487Zhmg1NgDD9b
X-Gm-Gg: ASbGnctVI4t0qtErpifkZ8uoC6A8fJZ3c0cK2D+b894Gz///KMFXeqJLu0K59r8TXVH
	cibfJq69SxxlWnYNKB+VYof6OyZvXJNkRCSUscaS1kJxFJAQYTxcForgsY5VOuk2I88yW0DfbKn
	wW/NI73C+fKBYE73tf+Rx46JGYPAesJKGmfGw1gyG1azs4uIqO85Vi9NjKTL+MhRS/7EHD5JuxO
	IZ3M/Q82nfAGvuA32wGE2egRpfoZ0L21U8T5JG7FEcwpHojbzcACSAXk8qxyiuMsvqbGsSeDq9r
	1tF0L/rXP8ytyc6wV42sLMfA3wJ6a7t6J6c/bt/oKqQXVHYFSY9Yrw==
X-Received: by 2002:a05:6214:500d:b0:70d:6df4:1afb with SMTP id 6a1803df08f44-70d97259921mr28591346d6.57.1755859776099;
        Fri, 22 Aug 2025 03:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1sltVyJoaXvdkN/CS1sTPSfuTTarGRljY+oqL1ag+7erN2DvvnbX/OYAcjAovJ7/4cO1sLA==
X-Received: by 2002:a05:6214:500d:b0:70d:6df4:1afb with SMTP id 6a1803df08f44-70d97259921mr28591146d6.57.1755859775540;
        Fri, 22 Aug 2025 03:49:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e4249bsm31367155e9.25.2025.08.22.03.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:49:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 5/8] ASoC: codecs: wcd939x: get regmap directly
Date: Fri, 22 Aug 2025 11:49:24 +0100
Message-ID: <20250822104927.2621866-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZbrxVOoHyXrcQkU459EjU_4ZrpLZemTI
X-Proofpoint-ORIG-GUID: ZbrxVOoHyXrcQkU459EjU_4ZrpLZemTI
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a84b41 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=lWraB9NP_8A8gAq8GzkA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyzSAdXPt70Of
 hAP5cAxQkevmwiVSnaJgt4CJnl901d9Yz1m6o2ZMFqy1Gko0m9Vwlcm0yjl5jdJWYTog3qRMLv5
 IKbMP0x/TBAjWa19e4sQPiiaDXSKvzod9TXZU3MvOwcBtrxK3B89hR6S2bl7WcFT9zZYn84lpSE
 xfmQk4WjERr1uPgHTWf/K+bqz8z6tjMRXqCmHCbPJgm4I4sf2HrMxvXPIBsqzckXsIxFoBujTEh
 oZ79V4zsMAEI4QW3cGmZ5O1Dgk9VcV46D/QIjzGzYPYHK/upjv6b5gkiHBw9Ki0JpXkQ8TJ8yGr
 yArjn82ED8jOlyHEXoxnR0xFeAlJmAuxoTmYDZZFsQ6JcuN/FIAST0Uy5Lqyt+SiipbAo0ZRvS4
 Oo6gBQBt/QhPoMd0fqVpE9QI7DqXfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

for some reason we ended up with a boiler plate for dev_get_regmap in
wcd939x codec and started exporting a symbol for this. Remove this
redundant wrapper and direclty get regmap.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd939x-sdw.c | 9 ---------
 sound/soc/codecs/wcd939x.c     | 6 +++---
 sound/soc/codecs/wcd939x.h     | 6 ------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index df71d7777b71..2b0aa2108f33 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -186,15 +186,6 @@ int wcd939x_sdw_set_sdw_stream(struct wcd939x_sdw_priv *wcd,
 }
 EXPORT_SYMBOL_GPL(wcd939x_sdw_set_sdw_stream);
 
-struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd)
-{
-	if (wcd->regmap)
-		return wcd->regmap;
-
-	return ERR_PTR(-EINVAL);
-}
-EXPORT_SYMBOL_GPL(wcd939x_swr_get_regmap);
-
 static int wcd9390_update_status(struct sdw_slave *slave,
 				 enum sdw_slave_status status)
 {
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 6bbdfa426365..ac45699ec067 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3373,10 +3373,10 @@ static int wcd939x_bind(struct device *dev)
 	}
 
 	/* Get regmap from TX SoundWire device */
-	wcd939x->regmap = wcd939x_swr_get_regmap(wcd939x->sdw_priv[AIF1_CAP]);
-	if (IS_ERR(wcd939x->regmap)) {
+	wcd939x->regmap = wcd939x->sdw_priv[AIF1_CAP]->regmap;
+	if (!wcd939x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
-		ret = PTR_ERR(wcd939x->regmap);
+		ret = -ENODEV;
 		goto err_remove_rx_link;
 	}
 
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 0ee0fbb49ff9..eba8205cdd0d 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -919,8 +919,6 @@ int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
-
-struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd);
 #else
 
 static inline int wcd939x_sdw_free(struct wcd939x_sdw_priv *wcd,
@@ -945,10 +943,6 @@ static inline int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd)
-{
-	return PTR_ERR(-EINVAL);
-}
 #endif /* CONFIG_SND_SOC_WCD939X_SDW */
 
 #endif /* __WCD939X_H__ */
-- 
2.50.0


