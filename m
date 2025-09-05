Return-Path: <linux-arm-msm+bounces-72336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C31E3B45CE6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62327A078E7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B49350D58;
	Fri,  5 Sep 2025 15:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfH3DnsX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF6D31328C
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087092; cv=none; b=sH7ic+HKtbK/EF93Ym4MnRuwYuqlq60jAkKV7wdOQxH1xOhtaELuUq2MdgGX7CbApO54rYMOf06tvLj9yCmhn/34+D3DZMbkUiUFtJ1zXFrp9Df8krV8khPBgewgtpae4BBgunjS4yqunTKP3NnWscVDmnzPjVmcdQEmvOMti9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087092; c=relaxed/simple;
	bh=akR3Yzvusad4i+UCHWyqsSQvBIYsdFkmvXNaMfYcDRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9/F2+8PgW/ihWHiOGyIzFrHaqNc+f0XhYtdNjE5vb1/nkpjQ0cR1n81+Gik1Tg2XF5THrLTwy9a+hgRdcjzyfitkXnFbzC/VA+w8OyXpcor9BFK3PKz0KUekB0Bl3YSDmiKN2AP/UGWOM4xiwWl/g5eQPht/JSavAHIjtRieKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfH3DnsX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5858hGVY015017
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 15:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lZRvyA2vNm6
	fxL6Jok3NTa76zr2CFM+a5QQAwIqtQn0=; b=hfH3DnsXfaYQYAQaxk3qaca9ABp
	YyqyLU2Bx6rQwCqlMYz2UejRjwX7TKcKbnDBdVZZg01VhbLY/UOVcQKZxZIcBqUs
	6BXzvgQjLKRl09J2pw7wifQBYRTqWdX8as1bh01AL12BZWLrOO5hBhfKQSc9nZA+
	hFPgoSXeP4X9zVJSUgFz8/63pq9z//buhoLTnHT88FJ86AFJ4k1KTVU/fB+A7vZJ
	oZo79sU9b1PD4FEw7cEfpWs79jmAcRqwaQHOlLTpraWeXWdWCPj0kor7MMzKvN8B
	iz7xRbOb+tbV7SEKkvRgIrAjwYRYGrcyMPiAntGXQPzb+8aPQAqZfa4y4bA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpkrbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 15:44:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5f4e4fe41so6760931cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 08:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087089; x=1757691889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZRvyA2vNm6fxL6Jok3NTa76zr2CFM+a5QQAwIqtQn0=;
        b=WeQtispGq4PBP9VWqslsknznE8OPxt5r+xOzTXZKxtE6tQsYF6Ixy39bOx6kNF8kjh
         QtqzKCasbTgoWQEYxH3zKKWGGrNHQPNGXAwQN/g6Hr/ydtT796B3lru0clTUtJd7CGct
         lfc77cTtaBvKYcUNtmJgcDWZCgnDnLvsoKBR6hh92xolUqW9EGY6v06aNNMJN8jbsA6B
         1t4CpKWz4kZv/S+QLbwma1VgYDol5wUkMLkVw71Ln52msE7AGbU4sHLwRk5oQZHE9VNl
         oUIKKdiCE3880mZDX1J6S6GLmwU86X1BsPni1LSffI6BKr70RZFG+5A/sBZN6lypvuXB
         Yotw==
X-Forwarded-Encrypted: i=1; AJvYcCUcBzXZ3NgMq9hZoufXk3DPMAyobl61g/jrjAayXhFaS7ZJiwivro1vv4DsM6vHfTUuNJOZeiYIm55mKNJ9@vger.kernel.org
X-Gm-Message-State: AOJu0YzAxnviL0VSWFplEJWUWyhNkDByND/wXmsp7O9lpR1rTfTItCWS
	mSciZg1/U8TnB3U3aTZLT3GM5H/13SeocwHfhxZIMJcVWuO+dN79kPM4uWutSSTGhqAVQBEXr/5
	BfjDc7l4jnl+IHe8ggot5Z4Q6ZofQOubCGHafPRnSyZ6UybYE2XFxlZgG5bPvDOEpMDr8
X-Gm-Gg: ASbGncv+G0RjzEQQcf6ccD2xid+peAeuzEyEQnxAgOglzd3U/FAsVNSP38vPZUaIK9K
	PvFWMxK3KYKHDLinhuZH0jWwdVRCTIn7/lAOsWl1Mku4/mOKcXT1Y/CfaLy+UhhfVo0Gdvy4Y1c
	Eh01H6R3eKtYE5SVQh5uPQW/bEmAj0WtZa7CMcpSjWPu/TUnkyt7sDQqbZSvcr8VIqck+0/VXJk
	Ge2nXSnCsU91dtKuxaGHG4MgMen/oOWbZqXRNyNGOszmdMd9w0M6poTsm3O/zRJZBmEk2dhiM23
	11JKHJ3YQ8PybWhZTXfFNa6aycKpi0J1+VVCorhD60ikFs1bmNN1Fg==
X-Received: by 2002:a05:622a:a953:10b0:4b4:91f8:3b13 with SMTP id d75a77b69052e-4b491f83e49mr109615561cf.63.1757087088718;
        Fri, 05 Sep 2025 08:44:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSG0XGNMp/AQ4ikUx9DdF4h05Yh44/Dzm6gF3o/VyuLO/Ifik/KWlx9cIobfmm9FA2GXcPwQ==
X-Received: by 2002:a05:622a:a953:10b0:4b4:91f8:3b13 with SMTP id d75a77b69052e-4b491f83e49mr109615291cf.63.1757087088181;
        Fri, 05 Sep 2025 08:44:48 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 09/12] ASoC: codecs: wcd939x: get regmap directly
Date: Fri,  5 Sep 2025 16:44:27 +0100
Message-ID: <20250905154430.12268-10-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250905154430.12268-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: p1NfXrrETRsWZ5MJ-ZDC9s_tUB9ECynp
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bb0571 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jWMDT5uzmWzhJut3sAYA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: p1NfXrrETRsWZ5MJ-ZDC9s_tUB9ECynp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX3Z2m3td1GdDK
 z37T+v66dqaUfoUZTIuZl1vjQ7pLBgoKZTTPojGA4eK7LxvA4mTpDS2FdplvjPOhcj14tyzfuXn
 9Ut1T32N7UXvzs1ycuhTl8C0lhZxg+LruaA3S9Bd/1D6cnzA8O3U4UYdfllbqElxqEpWx2B27Lw
 g/XYMI5sVsOv84glEurCaosPCuJ0wTqgKqL+P7EuEveqlKfSEHN9Cq7UMHvDhsvxUHyR8bP/+fR
 NicOxYdlSkzNOA/SYXsF2Lmz8TD0MDyZV+164GfgI9aJBqQ7XBPBh/kUGQ6QQEJsAHpf8wQigtl
 9sYKTkBK1jYCMd8Vq0olTDq5c62eyJKTZGWzGmS2DY1HAl/1gr4tzzF1CXih9qR6Ec/WZdzjhXw
 U2nvAw8e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

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
index 6aecad2a28aa..38da706d80be 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -187,15 +187,6 @@ int wcd939x_sdw_set_sdw_stream(struct wcd939x_sdw_priv *wcd,
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
index a414cd99b946..e74e6f013131 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3374,10 +3374,10 @@ static int wcd939x_bind(struct device *dev)
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
index ca6353222ea0..6bd2366587a8 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -918,8 +918,6 @@ int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
-
-struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd);
 #else
 
 static inline int wcd939x_sdw_free(struct wcd939x_sdw_priv *wcd,
@@ -944,10 +942,6 @@ static inline int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
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


