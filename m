Return-Path: <linux-arm-msm+bounces-62842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A71AEBC78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95FA0641A7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7577B2EA72B;
	Fri, 27 Jun 2025 15:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZ3GhbRV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E982E9EC8
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039503; cv=none; b=o9vuSxJJik9y0PeimGVP8AJBVy1rIeRXqgsc+3nnLcPc6aEV+805dWq/uDMvbHM9Pnciv5G+R/DM69+kbZdU2gcnEzsrcuv3Vsy2/CtXvj02kcJTFInKFari5Mm5nHaBFvtdc+sHKDuMxxqZ610zqMdyp16VTJL5lTydO9pbdZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039503; c=relaxed/simple;
	bh=rrpMQ1E4iwggRxxnDMouaI49aKRceYXQAlCbBGAsp6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvaTb7Qk1vnYpfqNwnyqLsfO4CRk3xyjfxBX41nmUKvIuNU/TRriR5Ex8ViUXBTBw7jZuWT/mBvJXkOR8oK9dP4xJk7qQBXmh/lNBRtHcXCIsR8cBgrn5BBhWR+laFNXQqpCCuAaji7ZSiXNzMWtiyOokEsUBiHDQ9lVN599pJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZ3GhbRV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCBCej009538
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2vhRT9pyQld
	uYdOZGVvt9iYSzdMJUQQ042+Y51qekQ4=; b=FZ3GhbRVnAGalPJjAjSTRuBATrT
	6CyvNTaTRnkzs5dVGGDMmYrim10Cf2Vb1wYTbBKg4bDKPVVewOIiJKwcogBgWxJv
	1t8ZnEIr0G9el6ITG0qP2oC6eD11cO8nTggKYg1iYURZddtpSytPfzflzaXqN3b7
	56Ly5AOu++oS5hN5loE9ywW9rlPISqBI8U6dLTAY4SLjqMIozQO74J34okWjMAsw
	8KIZLdzOsJkP7CzvafGxE+LAv9OmP2wTKvZJ6MoeYWPcTxdKz+d/G1ZWifDRlZRa
	3Sd8t/W88Xm+/rA8jEWash2aycXYlCWp0HYjNF76MgCwH43NopH1XuiIgZQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b478yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:51:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d40f335529so483295785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 08:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039499; x=1751644299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vhRT9pyQlduYdOZGVvt9iYSzdMJUQQ042+Y51qekQ4=;
        b=L8FIK0Kh7CqXRhsrdZhjpOLtvYCzs5Ak6Mw/8NNAqssPflx6EPi3eqBSrnU5i37c1/
         xSflwa1vByfOtbJ0vncsSuF+DE0kcBmfuRzc6VQexQ18nyShoaNrDGd4xXaRinbcr1W1
         wNaeBqJmd3Ws+1Gdo9H5BJG/+BLFUPBAFa1wYo0sDRI7/oKk1LAQZXjdOE3nLoX1U9yx
         NoIthGZuswcv7ZrLlwmOqxPjTDwn38LqbhsgSkSbvyb/sG4UFwuqJcU4V9C6qLQYvDMT
         +ne6BnyC0gY73HUgYtFBOc04Ab9My0ndDUAxaSTQGbVkJfSv3r2GDWCh09lhzijixu7I
         AdHw==
X-Forwarded-Encrypted: i=1; AJvYcCWJwaaspm/EpPzxhLsSpeG9HrVG64oIjHIAoujxa41bUwKpYjbTF02E0mLE3swxHxUYjvbR6VqvdpdSNC7h@vger.kernel.org
X-Gm-Message-State: AOJu0YzUoImgmsYYUtOHck1jCLVrviEDmMcn0mNkU3jHZBWdOjQodela
	6gfr80/Iadr3gEu1eWSUYYFnUjf+krVe9HEgd5Dq5I2tqlyChZwjpdTuTH6cOjCUiaG4jFBZEaa
	H6QXjUvy2OgHOmovCbhIEjopaIReW6Qy9yuG+XVSgr1I5U5ARnf+pcwTnMoQaLRQzwJjC
X-Gm-Gg: ASbGnct/l7WKfvDQS/DmaYQPAMD58HB709HjofdPJ+C8nYPPWb5CNG9bXuBEUjgbVeg
	1qcw6Ewp27SmsuqM1dTKlPdSL/qLmWJmJqJhKk1y2dd0didHrLISy9Bg222KCWdIvcSIzpBSfHI
	uke3qfGkMZxfWAS//Nl7LTJcBaRdayA3WTH4E89dqIAQLpX2OxCXc09oKNVJcT73fylYm/7tG80
	oZspdlF9aQ6JNWKNaEL1uAqn9OUT21gcsMKvTU2WwshY8ibjDArqiC97Iax4L+OgWWtPips8NxE
	VsDvJ5hWoUkohmgAM4AmVHaj2P4yjBtJlnErjFXuukC9yQPnu7Sptno=
X-Received: by 2002:a05:620a:2846:b0:7d4:4a26:41f with SMTP id af79cd13be357-7d44a2605demr142906285a.1.1751039499024;
        Fri, 27 Jun 2025 08:51:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvaTcwAPq1YNRUVMbQaKWyHye8wAp4l3xvIwPgQOh7wtKWTPWLTcKoZ4P4hWbFXtRiRc2UAA==
X-Received: by 2002:a05:620a:2846:b0:7d4:4a26:41f with SMTP id af79cd13be357-7d44a2605demr142902985a.1.1751039498522;
        Fri, 27 Jun 2025 08:51:38 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8absm3082663f8f.95.2025.06.27.08.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:51:38 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/4] ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
Date: Fri, 27 Jun 2025 16:51:02 +0100
Message-ID: <20250627155103.441547-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOSBTYWx0ZWRfX83TYG5qFgSY8
 KW9+0vHNPN82w0CJr3re5lvs7Kci0Tpv9Hw0LCNdiNozv5C8BHmlw6g+Umo0ND7Ot4fpD1GfySb
 SM4g3vKOcx7lf9NZympEDE/ZalbeOaoRsTPHkuY7wlNInFLDZ77JGaDJh357p56v47hIN/anjcG
 289+ccv9vUBweeDPEJqC38DgWYVaY7oJxV4PuIW7DtWevU/SYj3dgWkQmYxzr/65mksn1tpaAbk
 PJPmJxGibOe4NFfQRFo5soXmjszYPitamiLX7XkhSj0Yf+RO/QdoEb/WxtTyDl1thOXfzA67UV6
 wJkznMkbh3+EQLtMm0tUspFyQ0Ui5MCsmHJSeCmg+C+nNTMJ1GGgW+2E0vC4Ou3AisWZhcWysbk
 dryyMxJF9O3XEDj6QegDkj8VM6/S90HPDLXUQbvl6gFeIXqRh3dKdjUfyqP1x/oTQoGFLyrn
X-Proofpoint-ORIG-GUID: Ir8_Tn0bmwcut3M-7RXxbD0KTJIDrn_L
X-Proofpoint-GUID: Ir8_Tn0bmwcut3M-7RXxbD0KTJIDrn_L
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685ebe0c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VO0QnzvMDvqADXZeruwA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270129

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

use of_sdw_find_device_by_node helper function, rather than duplicating
this function in every codec driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
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
index 3b1a1518e764..ad1ec0a2b38d 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2789,7 +2789,7 @@ static int wcd937x_bind(struct device *dev)
 		return ret;
 	}
 
-	wcd937x->rxdev = wcd937x_sdw_device_get(wcd937x->rxnode);
+	wcd937x->rxdev = of_sdw_find_device_by_node(wcd937x->rxnode);
 	if (!wcd937x->rxdev) {
 		dev_err(dev, "could not find slave with matching of node\n");
 		return -EINVAL;
@@ -2798,7 +2798,7 @@ static int wcd937x_bind(struct device *dev)
 	wcd937x->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd937x->rxdev);
 	wcd937x->sdw_priv[AIF1_PB]->wcd937x = wcd937x;
 
-	wcd937x->txdev = wcd937x_sdw_device_get(wcd937x->txnode);
+	wcd937x->txdev = of_sdw_find_device_by_node(wcd937x->txnode);
 	if (!wcd937x->txdev) {
 		dev_err(dev, "could not find txslave with matching of node\n");
 		return -EINVAL;
diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 4ef57c496c37..09b87984cecc 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -550,8 +550,6 @@ int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
 
-struct device *wcd937x_sdw_device_get(struct device_node *np);
-
 #else
 int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
 		     struct snd_pcm_substream *substream,
diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index cabddadc90ef..b4a0b66b34df 100644
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
index 8c9f67dedb83..7c345217298d 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3412,7 +3412,7 @@ static int wcd938x_bind(struct device *dev)
 		return ret;
 	}
 
-	wcd938x->rxdev = wcd938x_sdw_device_get(wcd938x->rxnode);
+	wcd938x->rxdev = of_sdw_find_device_by_node(wcd938x->rxnode);
 	if (!wcd938x->rxdev) {
 		dev_err(dev, "could not find slave with matching of node\n");
 		ret = -EINVAL;
@@ -3421,7 +3421,7 @@ static int wcd938x_bind(struct device *dev)
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
index 16c670e00aa8..0727af4789cb 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3390,7 +3390,7 @@ static int wcd939x_bind(struct device *dev)
 		goto err_put_typec_switch;
 	}
 
-	wcd939x->rxdev = wcd939x_sdw_device_get(wcd939x->rxnode);
+	wcd939x->rxdev = of_sdw_find_device_by_node(wcd939x->rxnode);
 	if (!wcd939x->rxdev) {
 		dev_err(dev, "could not find slave with matching of node\n");
 		ret = -EINVAL;
@@ -3399,7 +3399,7 @@ static int wcd939x_bind(struct device *dev)
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
2.49.0


