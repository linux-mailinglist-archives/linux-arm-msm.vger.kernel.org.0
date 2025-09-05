Return-Path: <linux-arm-msm+bounces-72335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C76B45CDE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC41D7B2141
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210A7313296;
	Fri,  5 Sep 2025 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OIrXD5DU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DC631326B
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087090; cv=none; b=g6KBX1iYzOU4+8/7xO+U4Mw5M3CSjg7aZnnBn2v00S2856Oe4A2/sLYAMkxsF3AsAslrCAWIPkqcnTaFxiMA5MDwuH0gSC9nOHR0JxY24wK7SdInNrGEBll8L70i5aaNfh0ThxDeeEKYULuiW5tRBF3pvVSS4bbntTDTWh8yVTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087090; c=relaxed/simple;
	bh=+lRquaM51dxX8JXB+bAfJaVIJHFdA0SHDaYrJorpboE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uPxe/ILeFr4azpdGCpj6uP/g37RZuqAeSiOWg2tSNIzS4BMn1ku53MlnYVIocASB0BKiVbceKYT4rDrwGg2+fG+a0+3WoDDGJsSLvCRLSG7HoeGH+UIz3m4nMmwJgZBYLXFGEbTxgwT7eek9k+Cax2tp91L5TgN+4EJrT4fG8Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OIrXD5DU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857TMI0031754
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 15:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cI7DDVHRTaw
	wq/wL1fsHHzj2jmP533uEbcYvxWbbLHU=; b=OIrXD5DUwZO7axT8T6m9eIAnKNh
	2/hgi7GAdPwnlGRzKqKwXwUHtdbVu30ICGt+8r7vj1QQE9zo/T+aKpkrzdDUSMyP
	tljD60+0psdfBKGXuMg28d55Q1sJO5/Mr6JwERAhG5Ak49ePhPplr1f23wbjW7U7
	hApyc7OCI1P65XXWpC0NxlMks1x/T60jWXsZ+McJsErY68Wga4sK0sPdlONy7rh3
	H0eJ0OawHJQ1GU6cbrdgtx7QqZb30T2LgFXLvOt90wWgIv9NZF4RAK1X3132xzSn
	XyGBQHD7w20fi7PdUrS8uL4SYwUDkHtcufBxNnaBWRyYzDK1+R/5dQTl7fA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0bnwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 15:44:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5e178be7eso46939441cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 08:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087086; x=1757691886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cI7DDVHRTawwq/wL1fsHHzj2jmP533uEbcYvxWbbLHU=;
        b=A1PIC+wa9coBV3R1m2Kz5Eo+nJQCSipqDKapH/NA+WVP/G3RML4MsV75tJ8Tgo47k+
         nb37/Cgv2V05ZjJktS+NkVlNBh8XFEiG6G/r8arfC9oOmRxnK6F0X8C3FUz4D2yyX5+9
         gvo8FHqJBHLp+hS1nxEU05fAJDphZGwbu/wmjzzeGLKCXhgGqMR+9bKDBTjvZtbcN41A
         kZOuboCDkSuerDXyq18jKX8GTf+tzKTsvzR6KRCvJ5y2f7ybJ71SNuPuylBJqYLHF4f/
         Vvi2S2KFVuKfEzApL6Z4QGVSp5M93yb8UgIuXqgh+TW7Ngl6vFqBg+T9HiKCKvbsp4wi
         oILg==
X-Forwarded-Encrypted: i=1; AJvYcCWl/gT7YNiGlrAdsJy48NCn9HvReA7z+aM13j83nxUgXNTaQIrN97hXGJTZG8xV72u8n+Wp/g7xIsmXfedU@vger.kernel.org
X-Gm-Message-State: AOJu0YzHrylv2hG70Tz85AUfThOz7mDboRfK86tWQWbdBP6f52yyC4b9
	jyVyKkQxd/t6QWj/EGLAO89CSlnHEOj1clnw0PLarE61gZ539n1hJ1w+B5wOIx7DQTUO0V6Izxq
	d0wFvqcoHvs2/FubQjoAyeSvh/OGi098j6QZ8ywqAUFvhKa73Rn63PcND7z2Y2doQ0NnH
X-Gm-Gg: ASbGnctfzXVJao4wCOB97rQgpC9BjSbbMe0pyZD8jKz2kqxB6QF+gsM0yrS8y4+WMw/
	aEvU3UMSRBzU/bjBiaaMY5iaf7gO7TZHSlS0YFUtXqrmHZ0AX3WKHFYZ7BSkp+GYCjjG0ZQCSRF
	21hKrxCL0ApWWObe+pzFx91ytLNz6NYHdcXPtcU4xly4H8+8vDk4/weJ/I/KjNJ1zoZb9Rn84kb
	Ho8X+D7xZShWhmcSHIF4qI35UmSwS1lXwJ7xgGgGdtp6+EcUt3k5vwgS7i70btFPq8l1WjSYCM/
	ZmFxb4ey7dn74QdRkjjDXHdGGKqovNuoYufi7uX4L9RuQ903F0k1HQ==
X-Received: by 2002:ac8:570f:0:b0:4b5:ed9d:7bcd with SMTP id d75a77b69052e-4b5ed9d7e9dmr30935931cf.16.1757087085641;
        Fri, 05 Sep 2025 08:44:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4WvMUoDvxSAN603DuIaOljtHSUjPhwERnfhL6Um8GJkFedqQolzxDTxosGub2VKLwajiEsg==
X-Received: by 2002:ac8:570f:0:b0:4b5:ed9d:7bcd with SMTP id d75a77b69052e-4b5ed9d7e9dmr30935391cf.16.1757087084920;
        Fri, 05 Sep 2025 08:44:44 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9bcda91dsm165716585e9.6.2025.09.05.08.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:44 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 08/12] ASoC: codecs: wcd-common: move component ops to common
Date: Fri,  5 Sep 2025 16:44:26 +0100
Message-ID: <20250905154430.12268-9-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: hh0nOvzrHORsExQ0HIfCLlFy2PyNAUfe
X-Proofpoint-ORIG-GUID: hh0nOvzrHORsExQ0HIfCLlFy2PyNAUfe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX3chPJnnI/5Ls
 8WjcZlwFj/Oh/uREIQLSc9dHlZ2fnfLSH4MwER02aYvjZ1kI8bNx85mW4La0qWNPBGl7y/PX2/L
 ZNuIxOxKVgjFaqyfJ5JYf1uW2PDFmw3nASlQoMPujJdYrcd8bkFrSAuMz6G6aofMKgJP4Eb29P8
 L5QGBbOGxLfxpIHTVHq1aPHdbqPmc/3ANHi3VM+bYTAbrJ64wL8rpsWcojldXwjRx/UhJSBeXII
 B3UYx98qUYL6AzmJoY8DR4KrRKt6xboIYZ95K7P6VO58i7R92A9POHdsQ1k24Edg4HLtW1gSWEh
 JoU0Xpuwgudeo9aF0H46cehWFOFTNwCWOXkZxMv8urQs3wO9U619Hq9tCHT6a74AzE/sJ1KrZeA
 BqJqC7xC
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68bb056f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eQjB__F64b99YC4tFhYA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

component_ops for wcd97x, wcd938x, wcd939x soundwire codecs are exactly
identlical, move them to common driver to remove this duplicate code.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/codecs/wcd-common.c  | 27 +++++++++++++++++++++++++++
 sound/soc/codecs/wcd-common.h  |  1 +
 sound/soc/codecs/wcd937x-sdw.c | 29 ++---------------------------
 sound/soc/codecs/wcd938x-sdw.c | 20 ++------------------
 sound/soc/codecs/wcd939x-sdw.c | 29 ++---------------------------
 5 files changed, 34 insertions(+), 72 deletions(-)

diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
index 25c0a48ff858..585d3e036900 100644
--- a/sound/soc/codecs/wcd-common.c
+++ b/sound/soc/codecs/wcd-common.c
@@ -7,6 +7,8 @@
 #include <linux/device.h>
 #include <linux/of.h>
 #include <linux/printk.h>
+#include <linux/component.h>
+#include <linux/pm_runtime.h>
 
 #include "wcd-common.h"
 
@@ -66,5 +68,30 @@ int wcd_dt_parse_micbias_info(struct wcd_common *common)
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
index ca602718c9ba..85e5818b9b0c 100644
--- a/sound/soc/codecs/wcd-common.h
+++ b/sound/soc/codecs/wcd-common.h
@@ -32,6 +32,7 @@ struct wcd_common {
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
index 1dc13b6fabfa..92714aef09d5 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1182,22 +1182,6 @@ static const struct sdw_slave_ops wcd9380_slave_ops = {
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
@@ -1262,7 +1246,7 @@ static int wcd9380_probe(struct sdw_slave *pdev,
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	ret = component_add(dev, &wcd938x_sdw_component_ops);
+	ret = component_add(dev, &wcd_sdw_component_ops);
 	if (ret)
 		goto err_disable_rpm;
 
@@ -1280,7 +1264,7 @@ static int wcd9380_remove(struct sdw_slave *pdev)
 {
 	struct device *dev = &pdev->dev;
 
-	component_del(dev, &wcd938x_sdw_component_ops);
+	component_del(dev, &wcd_sdw_component_ops);
 
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index 97a829e3ce4f..6aecad2a28aa 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -1378,31 +1378,6 @@ static const struct sdw_slave_ops wcd9390_slave_ops = {
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
@@ -1466,7 +1441,7 @@ static int wcd9390_probe(struct sdw_slave *pdev, const struct sdw_device_id *id)
 		regcache_cache_only(wcd->regmap, true);
 	}
 
-	ret = component_add(dev, &wcd939x_sdw_component_ops);
+	ret = component_add(dev, &wcd_sdw_component_ops);
 	if (ret)
 		return ret;
 
@@ -1481,7 +1456,7 @@ static int wcd9390_remove(struct sdw_slave *pdev)
 	struct device *dev = &pdev->dev;
 	struct wcd939x_sdw_priv *wcd = dev_get_drvdata(dev);
 
-	component_del(dev, &wcd939x_sdw_component_ops);
+	component_del(dev, &wcd_sdw_component_ops);
 
 	if (wcd->regmap)
 		regmap_exit(wcd->regmap);
-- 
2.50.0


