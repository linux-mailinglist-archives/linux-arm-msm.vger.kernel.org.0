Return-Path: <linux-arm-msm+bounces-72331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D5B45CCF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1E185A4E02
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1787306B39;
	Fri,  5 Sep 2025 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Js+iTkaZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE778302170
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 15:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087084; cv=none; b=HyUn1YbLlGXyep59fWqrtLB4Q2u7h5nj1PRKtGjEFERphLozdBPDCP3H5J1Us6zXd/l+nzfk7F8gOQp0GVGGwAuIun+tR31X1c3FqMQb/hdgFEdhtPdqxZNpNimA+WLV2HozItUdzeJPnrIeisdUqMgCkhz+54nUUxO948ur0/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087084; c=relaxed/simple;
	bh=cVy7tXWBKEHoP/U0JsXIR9YXHxWo2Q7wpYa7sp87Jsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lHod3OtgsngUUsRJnYJRoAflYIY9A+Ofq7HkkhEf8rjjl1OfpTkds8HXqXxJlUzVnJZRrbuEh05axQ+V2ghRk+Mjy5GzYiV23TLkWKT/pZky599200AXMBN+7/zZwjEVZUb0IZfOn1BzmdMdgXIRk/OuCfVxr7wPgcmGMWI4spY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Js+iTkaZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857JQV7013602
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 15:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l+W1WoroOPJ
	8XJoWecoC0R6dzcX5hWnGc4gF8mkYIdA=; b=Js+iTkaZ/Je4vmljuZc+2nabgYc
	GJbzbTJT8yGIHncaOg1sWks0uDjEB/Bmg/OP66BOc3vgyRdncksYAlV5tnTyLsC2
	o17GOjYTzI/dgerlyaXLSHg7+TnSGwoNPUnM5S0jf/pU+M6kuDA7Qr4SI2d2EYDp
	nX7YWcQWwkUZgICyvcs6oPi/b+fUuuEfCi+xBa+Ch09dU//RrInq1II3MLoAe2Kt
	dY3AnulfnxPZGuvDyOTkrUmELgoHJJvor7naeevOccUwLuuaoR90KUZpsvfMLbIN
	wP/sf0rSmI+HWBGTUFhn6TPf49fa1I/4RfNs4o8b/w7hX5D3kvuqJtAp3Tg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyfj9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 15:44:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b3349c2c38so64907641cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 08:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087081; x=1757691881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+W1WoroOPJ8XJoWecoC0R6dzcX5hWnGc4gF8mkYIdA=;
        b=H0JcH3Oo63HFK6iYdi2cLAVcGX52KP2dWWZC1AWfoS4Iso8epQMR+h4ILiSFLuwLSP
         0Fa0J6wSCWhWJfyMr5HWB7i3JPe4tbWooVFqVBBcrqBLafWNGkAYUH5H6e5mL2GFCMd5
         3bQajb4f3jYlD9Yu9v+89s4Oocajh9YUFgfhZOaUij7ehVlH+vWkXljA+/iwm360cOpW
         +qtsnTSme+yJJ9tWkxGzb6kB5Fpt2hTFMBGBuFyLZWE6lt4BbEX0PriSF3ku3D258vaV
         3TcU8G2IgZw3h8gdes3QIJ12JjzrBSmsePly7mNJTmqYJ/PwoJ+CdpqhGicRMA800Se1
         V8Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWiKZMbOtcHdu1sq7lpTuMvT+Jj3hptGUlrct945f3ipupPnvetkGO7lLC8aCzVOBkah/XlR9kWrGwKj76D@vger.kernel.org
X-Gm-Message-State: AOJu0YzdeEDVD4HU+sVmCeKsaAqGDYRW3P4Ua2xOIXgIOrdyUtv/RW7D
	/DWvqYY3tBVBp7Mlkx6bFcZhkKFtIKsot8cB7kz37O40sb/xcOKHAj0zieku5v1dkub+iszHwIq
	qb8eijv+TDzDTAhlpjUKzq3imzJ9Pzi6vIrDv+Xdo3jwNpvTIAq2k3Db8N4Icvq2GSYpI
X-Gm-Gg: ASbGncvk21ugGfaDu3+Qs5/mFkkLvxmH9sd6lCJG3rBeZRCBjnFIxXgcz0UlUuHC9sk
	mxKXk0z8h718oMe21YaYIN0GZFiI+RCKatzmWElbzjAtjdBAdkCtVK+svOEMFUPfokrJrOmz1In
	42rSBGZcpHohscBfWSxcpq64Z44MXD2ZKIy8zZV/wKo0hpc5kcdImHELmoIc+BQ0nnzZzjCVKkx
	xOew8OyvXksujlomrCLh1lLVMpQB2bAEdm/s9x3v4qyDAzXXGhKUxImwyDR1Ud/sJXdmghcJ65D
	VCE4BZzastSa+d7wwkWxbyj09fZHe242NIgvULbrLal0b3LKKbNDbw==
X-Received: by 2002:a05:622a:1c07:b0:4b3:4a3a:48b8 with SMTP id d75a77b69052e-4b34a3a7654mr170182591cf.73.1757087081056;
        Fri, 05 Sep 2025 08:44:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVF4pA9I2dJ2DRQMzkVTojWkJxOt2uCZE7XwoEveMWSKKsqVUG43lQCkNjtbyDZ4hMmDlHDA==
X-Received: by 2002:a05:622a:1c07:b0:4b3:4a3a:48b8 with SMTP id d75a77b69052e-4b34a3a7654mr170182191cf.73.1757087080438;
        Fri, 05 Sep 2025 08:44:40 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 04/12] ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
Date: Fri,  5 Sep 2025 16:44:22 +0100
Message-ID: <20250905154430.12268-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68bb056a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VO0QnzvMDvqADXZeruwA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: tdg31kCszj-IEm4yNw46Vtc7benyqHl5
X-Proofpoint-ORIG-GUID: tdg31kCszj-IEm4yNw46Vtc7benyqHl5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX6s85RX9Wr4M2
 +kWCinkL/x1tQ7HrZSH2GfsAQLsAdmyxhHJn/2S6BP4/e0bZpB+2GUd3mQU5sldVhoIYUD/5oaG
 dGOldIm3BJ0mfST1iBoh+JspzcATA6KaCKH6eu4P/SGBznA45S4bs5f3BZMf6chyH9/S22QtLus
 CeFrz8xYKJfUKNQgS1mvj1H8CUoK3Qh1uJ7lvowb41LKjqd8aV3UtC8VudJhD49Lzl6etdW+OwQ
 1YnBqZo93yrEvRqZZ5GJgPZgpyMoz6wCGhEai0eDpp7exoDoIoWl3pap34CJ0YPPiMEJgJNOAkp
 CJ57lSW7CIQ9TSXnFAzaLqLVv0RHXMj3QX6hRdnyOjt8pTxE1GLa9CAWc/TXeZu/Am4P880xevl
 wa+GJjrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

use of_sdw_find_device_by_node helper function, rather than duplicating
this function in every codec driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x-sdw.c | 6 ------
 sound/soc/codecs/wcd937x.c     | 4 ++--
 sound/soc/codecs/wcd937x.h     | 2 --
 sound/soc/codecs/wcd938x-sdw.c | 7 -------
 sound/soc/codecs/wcd938x.c     | 4 ++--
 sound/soc/codecs/wcd938x.h     | 6 ------
 sound/soc/codecs/wcd939x-sdw.c | 6 ------
 sound/soc/codecs/wcd939x.c     | 4 ++--
 sound/soc/codecs/wcd939x.h     | 6 ------
 9 files changed, 6 insertions(+), 39 deletions(-)

diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index 1bfe7383b311..e7cc699bd8bc 100644
--- a/sound/soc/codecs/wcd937x-sdw.c
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -78,12 +78,6 @@ static struct sdw_dpn_prop wcd937x_dpn_prop[WCD937X_MAX_SWR_PORTS] = {
 	}
 };
 
-struct device *wcd937x_sdw_device_get(struct device_node *np)
-{
-	return bus_find_device_by_of_node(&sdw_bus_type, np);
-}
-EXPORT_SYMBOL_GPL(wcd937x_sdw_device_get);
-
 int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index de2dff3c56d3..b78f37c582ca 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2788,7 +2788,7 @@ static int wcd937x_bind(struct device *dev)
 		return ret;
 	}
 
-	wcd937x->rxdev = wcd937x_sdw_device_get(wcd937x->rxnode);
+	wcd937x->rxdev = of_sdw_find_device_by_node(wcd937x->rxnode);
 	if (!wcd937x->rxdev) {
 		dev_err(dev, "could not find slave with matching of node\n");
 		return -EINVAL;
@@ -2797,7 +2797,7 @@ static int wcd937x_bind(struct device *dev)
 	wcd937x->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd937x->rxdev);
 	wcd937x->sdw_priv[AIF1_PB]->wcd937x = wcd937x;
 
-	wcd937x->txdev = wcd937x_sdw_device_get(wcd937x->txnode);
+	wcd937x->txdev = of_sdw_find_device_by_node(wcd937x->txnode);
 	if (!wcd937x->txdev) {
 		dev_err(dev, "could not find txslave with matching of node\n");
 		return -EINVAL;
diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 3ab21bb5846e..49e5dce6f8c9 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -549,8 +549,6 @@ int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
 
-struct device *wcd937x_sdw_device_get(struct device_node *np);
-
 #else
 int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
 		     struct snd_pcm_substream *substream,
diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index e822cc145250..a7514d716086 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -82,13 +82,6 @@ static struct sdw_dpn_prop wcd938x_dpn_prop[WCD938X_MAX_SWR_PORTS] = {
 	}
 };
 
-struct device *wcd938x_sdw_device_get(struct device_node *np)
-{
-	return bus_find_device_by_of_node(&sdw_bus_type, np);
-
-}
-EXPORT_SYMBOL_GPL(wcd938x_sdw_device_get);
-
 int wcd938x_swr_get_current_bank(struct sdw_slave *sdev)
 {
 	int bank;
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 711f373ece24..e2cb0758bca7 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3400,7 +3400,7 @@ static int wcd938x_bind(struct device *dev)
 		return ret;
 	}
 
-	wcd938x->rxdev = wcd938x_sdw_device_get(wcd938x->rxnode);
+	wcd938x->rxdev = of_sdw_find_device_by_node(wcd938x->rxnode);
 	if (!wcd938x->rxdev) {
 		dev_err(dev, "could not find slave with matching of node\n");
 		ret = -EINVAL;
@@ -3409,7 +3409,7 @@ static int wcd938x_bind(struct device *dev)
 	wcd938x->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd938x->rxdev);
 	wcd938x->sdw_priv[AIF1_PB]->wcd938x = wcd938x;
 
-	wcd938x->txdev = wcd938x_sdw_device_get(wcd938x->txnode);
+	wcd938x->txdev = of_sdw_find_device_by_node(wcd938x->txnode);
 	if (!wcd938x->txdev) {
 		dev_err(dev, "could not find txslave with matching of node\n");
 		ret = -EINVAL;
diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index fb6a0e4ef337..dbafcae247f4 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -670,7 +670,6 @@ int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
 
-struct device *wcd938x_sdw_device_get(struct device_node *np);
 int wcd938x_swr_get_current_bank(struct sdw_slave *sdev);
 
 #else
@@ -697,11 +696,6 @@ static inline int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-static inline struct device *wcd938x_sdw_device_get(struct device_node *np)
-{
-	return NULL;
-}
-
 static inline int wcd938x_swr_get_current_bank(struct sdw_slave *sdev)
 {
 	return 0;
diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index f7a9323a9fea..e487a1bb0194 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -128,12 +128,6 @@ static struct sdw_dpn_prop wcd939x_tx_dpn_prop[WCD939X_MAX_TX_SWR_PORTS] = {
 	}
 };
 
-struct device *wcd939x_sdw_device_get(struct device_node *np)
-{
-	return bus_find_device_by_of_node(&sdw_bus_type, np);
-}
-EXPORT_SYMBOL_GPL(wcd939x_sdw_device_get);
-
 unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
 {
 	return FIELD_GET(SDW_SCP_STAT_CURR_BANK,
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 64f082e474c1..5a56c79a8922 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3383,7 +3383,7 @@ static int wcd939x_bind(struct device *dev)
 		goto err_put_typec_switch;
 	}
 
-	wcd939x->rxdev = wcd939x_sdw_device_get(wcd939x->rxnode);
+	wcd939x->rxdev = of_sdw_find_device_by_node(wcd939x->rxnode);
 	if (!wcd939x->rxdev) {
 		dev_err(dev, "could not find slave with matching of node\n");
 		ret = -EINVAL;
@@ -3392,7 +3392,7 @@ static int wcd939x_bind(struct device *dev)
 	wcd939x->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd939x->rxdev);
 	wcd939x->sdw_priv[AIF1_PB]->wcd939x = wcd939x;
 
-	wcd939x->txdev = wcd939x_sdw_device_get(wcd939x->txnode);
+	wcd939x->txdev = of_sdw_find_device_by_node(wcd939x->txnode);
 	if (!wcd939x->txdev) {
 		dev_err(dev, "could not find txslave with matching of node\n");
 		ret = -EINVAL;
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 3204fb10b58d..3f189e5cafd5 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -930,7 +930,6 @@ int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
 
-struct device *wcd939x_sdw_device_get(struct device_node *np);
 unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev);
 
 struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd);
@@ -958,11 +957,6 @@ static inline int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-static inline struct device *wcd939x_sdw_device_get(struct device_node *np)
-{
-	return NULL;
-}
-
 static inline unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
 {
 	return 0;
-- 
2.50.0


