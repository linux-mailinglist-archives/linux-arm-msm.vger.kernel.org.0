Return-Path: <linux-arm-msm+bounces-70370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3502B315C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE7251D0212D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4432FAC18;
	Fri, 22 Aug 2025 10:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWPMesvr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9947222581
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859779; cv=none; b=D2zdvqj3zjGuVt18cev+OAJx5TQ8ef53rLTEOajPFqIiuyyrzpOnlHBmQAhZ/4yTVucSs/e84j9QRraG3MKBeHLcbpC3d44qQitlLy8dCGlp9eCAsGgd974ZC2WoeT2hXTlc68DilrCyKEZO64MgnTauRSPJ8Pag/oLRXWf24T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859779; c=relaxed/simple;
	bh=rX6mbFXmiWuR0WOt4Gj3YwAIPY62xld35Tev0r7nSXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PjpVxNo4lktTauAYEPktw64+luqEaWrWiPNIztrgbyGCpth3HX5v4wqvTJN5DVFFhNApkaRHrjLXu/e7GpQ+mvPxmQQ2R6NbrrQ+S+BhhiCkfXPn6TZ5sG+0Onm8sKppMaO44XMHN8eXQ9okoacFHsC+YSrlaMZRyqWQUZlhQS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWPMesvr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8Uh4O028185
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gvkamk2QPbU
	UrJhmFkaZd6WzufgyMIG+rGpkmfH8iS0=; b=hWPMesvrUH7zsF/L/V7pDx09rdL
	mVNbIHRzAqMBMAioMeJf0Q/azFsqX1SbwEy/g7BaU6KbRExI6H/rAkZVM+HxB37w
	Ne4am9z+JEp2xMMWrmsyQqbC31Uwa5B2qoBw7szpbqkP4FfRTGoAJbeFTpucqKoA
	0r0FN5TWRUxVE+/MF+f/5vLR1ON1tPeGRenKUngUb5fCaSapLRKkHpCyyH5uMrgJ
	+pS7DZMtveF10OBe1cJWccKEXyYCmxRIE0G4+9T0GYXoQjOA8NB+2IpmD4QtDWVh
	UwdEhGSVyL9YrV+dxOrVoOCrP8zBCZ4o53cnY0oj2giZB0OOVQpmKDoi0WQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5298x8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b0faa8d615so78791061cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859775; x=1756464575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gvkamk2QPbUUrJhmFkaZd6WzufgyMIG+rGpkmfH8iS0=;
        b=OuL8Or2oo1GuewL61dKO4FsnFl+a9OBAgUf101jRA5ID49jlkfhAeKQS2udSJSZLM+
         sMdvFw8bw+GfoSl+gcUjq+PAU3n/C2DqQNmVTaj9DwyYbA+P614zpFWi5g+Ctpn1Nvtr
         Cc1zim6jCJs6HLv2xIdqcyuROHks/31F9ZePHNpZ9BJCGAAT0ftcPQ982ePz5DgyTHwD
         rJUI8mI24ScXzjGQ5d/dGDYAMWktBUglkPOWCRpPe4+tjncjX4BzOzhpmdffat15mCtB
         QkWUZ42k4N400AoTE6Vf1rduhHPZl4NqHb7jDf6ShsFo0dxX7tizOjA8ddOxrh+5OSxJ
         70sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwUanj4vSwVRrKsVVuhn5cH65haDG0FocRfUB+N8q9pQBUhLRZWhUAgvEA78wWs40en4lT5x1KoSdpLiBd@vger.kernel.org
X-Gm-Message-State: AOJu0YwXDvipa30dmKJ5B+XLjFOgJOPMQXOuQajPulwbnH4WY1Xptu6H
	uZ1G8HgjzSdCBWWAcd7PJdY39gKmaj8m2KKcOAakRCNKD2gID69iUWhywHPBTVIe9wzdL2MqpzZ
	O0tjfdHFSUUnwdegg6QUd4jsL5ACLnQedEGL9rzUqQbbImQic8DEHNc4ZPu8IRvFxOzda
X-Gm-Gg: ASbGncss8b6mxM1ciQw3Q06V+GDKTwpfn8shNWGiJAMOBV+BU+jIUByMN/bn/ivsUH5
	EFTx6kwDyIUWV2UBjt8VxjnmqlX2nid7GaycUFzIegHYEoXTtZ4gOE03xzTh1ujrYpVdgvQw9s/
	eJDD/WvIoozU3K1k6S2EwTIYDwRgJ1/ysyodNTxDC7hgMWojW2zpgSFNKc4uzIjVevFxh56ipIB
	bB/EVjaTEZe8sDs2Vt+qn3LXithICW1Xvp7vCV7Q67L7UTT4FvS0YBkFt/3fjrFfbACSCeYc8OA
	rVmVvG0u1w00ypjwFroh1GLBy6KXnrOzVSbFA7CAzXKr+Zx8Zo9+Aw==
X-Received: by 2002:a05:622a:1990:b0:4b2:8ac4:f098 with SMTP id d75a77b69052e-4b2a00fcd7fmr70271941cf.34.1755859774981;
        Fri, 22 Aug 2025 03:49:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENBCYO+zCaK9Vfrzu0+xJ+X0RKS1I+T3xKBx/Int59QuZRo62XPmjlOPh9t3n87N6dEP7Cuw==
X-Received: by 2002:a05:622a:1990:b0:4b2:8ac4:f098 with SMTP id d75a77b69052e-4b2a00fcd7fmr70271751cf.34.1755859774351;
        Fri, 22 Aug 2025 03:49:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e4249bsm31367155e9.25.2025.08.22.03.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:49:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/8] ASoC: codecs: wcd-common: move component ops to common
Date: Fri, 22 Aug 2025 11:49:23 +0100
Message-ID: <20250822104927.2621866-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a84b41 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=eQjB__F64b99YC4tFhYA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: hDUctmuB10TIZp-El2yIXl3cvxVLBTWh
X-Proofpoint-GUID: hDUctmuB10TIZp-El2yIXl3cvxVLBTWh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX12cQHZB0RTn9
 fk174r0ZY3JSZP9JpNVX//ZuIAsp7p/MLkA8lg2uD71/GkySDUfhVaQaQWsa6USypx7N5GQrCuY
 XaRUeu3mlwj3cahriAWM+FQAMWweL58SPiLGIW0CN2n8NAkLYLlaqht+mcmD0gmxy+h/cdmh9IA
 3wwBx4Pckk9dfcbDmMqoCjSkJii4anRgavN9C3SlW2GaYwwuENNLYZJ6WDooR8ESqqsETIENnsB
 NLkQWq7FmDEAqRitfwL8kiY8q5seGlhLzDxXrzj2aqqzMzvQ7er/KUo1xhf7lrhu4lrMcHJ5WJe
 zm+OBj6uKetT6AsT9qfuNOZ5rY0T0m9m5TH9lEeMYa8/iHUhOX9OBxJhyFlLapBfCn1rLHBHtr/
 U746xXAUS+4o2vnRXGxmwTIwGmvBvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

component_ops for wcd97x, wcd938x, wcd939x soundwire codecs are exactly
identlical, move them to common driver to remove this duplicate code.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd-common.c  | 27 +++++++++++++++++++++++++++
 sound/soc/codecs/wcd-common.h  |  1 +
 sound/soc/codecs/wcd937x-sdw.c | 29 ++---------------------------
 sound/soc/codecs/wcd938x-sdw.c | 20 ++------------------
 sound/soc/codecs/wcd939x-sdw.c | 29 ++---------------------------
 5 files changed, 34 insertions(+), 72 deletions(-)

diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
index dffb0431a48c..0c1ffa015403 100644
--- a/sound/soc/codecs/wcd-common.c
+++ b/sound/soc/codecs/wcd-common.c
@@ -7,6 +7,8 @@
 #include <linux/device.h>
 #include <linux/of.h>
 #include <linux/printk.h>
+#include <linux/component.h>
+#include <linux/pm_runtime.h>
 
 #include "wcd-common.h"
 
@@ -62,5 +64,30 @@ int wcd_dt_parse_micbias_info(struct wcd_common *common)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(wcd_dt_parse_micbias_info);
+
+static int wcd_sdw_component_bind(struct device *dev, struct device *master, void *data)
+{
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static void wcd_sdw_component_unbind(struct device *dev, struct device *master, void *data)
+{
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+}
+
+const struct component_ops wcd_sdw_component_ops = {
+	.bind = wcd_sdw_component_bind,
+	.unbind = wcd_sdw_component_unbind,
+};
+EXPORT_SYMBOL_GPL(wcd_sdw_component_ops);
+
 MODULE_DESCRIPTION("Common Qualcomm WCD Codec helpers driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/wcd-common.h b/sound/soc/codecs/wcd-common.h
index ee101f8547d5..deb78241236b 100644
--- a/sound/soc/codecs/wcd-common.h
+++ b/sound/soc/codecs/wcd-common.h
@@ -29,6 +29,7 @@ struct wcd_common {
 	u32 micb_vout[WCD_MAX_MICBIAS];
 };
 
+extern const struct component_ops wcd_sdw_component_ops;
 int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv);
 int wcd_dt_parse_micbias_info(struct wcd_common *common);
 
diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index 8f2819163527..59c353cafd31 100644
--- a/sound/soc/codecs/wcd937x-sdw.c
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -983,31 +983,6 @@ static const struct sdw_slave_ops wcd9370_slave_ops = {
 	.interrupt_callback = wcd9370_interrupt_callback,
 };
 
-static int wcd937x_sdw_component_bind(struct device *dev,
-				      struct device *master, void *data)
-{
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-
-	return 0;
-}
-
-static void wcd937x_sdw_component_unbind(struct device *dev,
-					 struct device *master, void *data)
-{
-	pm_runtime_disable(dev);
-	pm_runtime_set_suspended(dev);
-	pm_runtime_dont_use_autosuspend(dev);
-}
-
-static const struct component_ops wcd937x_sdw_component_ops = {
-	.bind = wcd937x_sdw_component_bind,
-	.unbind = wcd937x_sdw_component_unbind,
-};
-
 static int wcd9370_probe(struct sdw_slave *pdev,
 			 const struct sdw_device_id *id)
 {
@@ -1093,7 +1068,7 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 	}
 
 
-	ret = component_add(dev, &wcd937x_sdw_component_ops);
+	ret = component_add(dev, &wcd_sdw_component_ops);
 	if (ret)
 		return ret;
 
@@ -1107,7 +1082,7 @@ static int wcd9370_remove(struct sdw_slave *pdev)
 {
 	struct device *dev = &pdev->dev;
 
-	component_del(dev, &wcd937x_sdw_component_ops);
+	component_del(dev, &wcd_sdw_component_ops);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index 40c6896eb781..e43d6ac1c913 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1181,22 +1181,6 @@ static const struct sdw_slave_ops wcd9380_slave_ops = {
 	.bus_config = wcd9380_bus_config,
 };
 
-static int wcd938x_sdw_component_bind(struct device *dev,
-				      struct device *master, void *data)
-{
-	return 0;
-}
-
-static void wcd938x_sdw_component_unbind(struct device *dev,
-					 struct device *master, void *data)
-{
-}
-
-static const struct component_ops wcd938x_sdw_component_ops = {
-	.bind   = wcd938x_sdw_component_bind,
-	.unbind = wcd938x_sdw_component_unbind,
-};
-
 static int wcd9380_probe(struct sdw_slave *pdev,
 			 const struct sdw_device_id *id)
 {
@@ -1261,7 +1245,7 @@ static int wcd9380_probe(struct sdw_slave *pdev,
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	ret = component_add(dev, &wcd938x_sdw_component_ops);
+	ret = component_add(dev, &wcd_sdw_component_ops);
 	if (ret)
 		goto err_disable_rpm;
 
@@ -1279,7 +1263,7 @@ static int wcd9380_remove(struct sdw_slave *pdev)
 {
 	struct device *dev = &pdev->dev;
 
-	component_del(dev, &wcd938x_sdw_component_ops);
+	component_del(dev, &wcd_sdw_component_ops);
 
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index b5a35c3b22e1..df71d7777b71 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -1377,31 +1377,6 @@ static const struct sdw_slave_ops wcd9390_slave_ops = {
 	.bus_config = wcd9390_bus_config,
 };
 
-static int wcd939x_sdw_component_bind(struct device *dev, struct device *master,
-				      void *data)
-{
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-
-	return 0;
-}
-
-static void wcd939x_sdw_component_unbind(struct device *dev,
-					 struct device *master, void *data)
-{
-	pm_runtime_disable(dev);
-	pm_runtime_set_suspended(dev);
-	pm_runtime_dont_use_autosuspend(dev);
-}
-
-static const struct component_ops wcd939x_sdw_component_ops = {
-	.bind = wcd939x_sdw_component_bind,
-	.unbind = wcd939x_sdw_component_unbind,
-};
-
 static int wcd9390_probe(struct sdw_slave *pdev, const struct sdw_device_id *id)
 {
 	struct device *dev = &pdev->dev;
@@ -1465,7 +1440,7 @@ static int wcd9390_probe(struct sdw_slave *pdev, const struct sdw_device_id *id)
 		regcache_cache_only(wcd->regmap, true);
 	}
 
-	ret = component_add(dev, &wcd939x_sdw_component_ops);
+	ret = component_add(dev, &wcd_sdw_component_ops);
 	if (ret)
 		return ret;
 
@@ -1480,7 +1455,7 @@ static int wcd9390_remove(struct sdw_slave *pdev)
 	struct device *dev = &pdev->dev;
 	struct wcd939x_sdw_priv *wcd = dev_get_drvdata(dev);
 
-	component_del(dev, &wcd939x_sdw_component_ops);
+	component_del(dev, &wcd_sdw_component_ops);
 
 	if (wcd->regmap)
 		regmap_exit(wcd->regmap);
-- 
2.50.0


