Return-Path: <linux-arm-msm+bounces-72762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D25B4FAA3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BED3344C7D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375A1338F48;
	Tue,  9 Sep 2025 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mup4SmyB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9F8335BB4
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420432; cv=none; b=Ms99zr7g2CzpFCk3FkFXWbdiYJOSjFnu51UOpxPXfkVIB2cK8MH4qQ8dlUf/UPIVbEapp43GOZK80L6QfPqU2TAkbqqJ8ojAIoxSdokHTtDhrqewcNoB70xjR497AqUZmBNRRjHGzR9EHZJAqjdDBmlA6AHuAiRlgj43HmcpucY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420432; c=relaxed/simple;
	bh=Vob2QVOiy3TJum+gYviV62RlyAAAfxmjXX+ywQHAW1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=friTedh0AUWi+w15yvWIZwAHfQX7n3zFPczJHHe9wzTzNM6jrVke4MxHtmz++SV2miFiIx9PW3+hOki2TrrSWS9tCt4HlaZGDqgp8NVUqRCRcRBYMGw81I7Sh9/mncJjZ7VPD2/qTxvzSfSP2ktWhHGPYkcR02zDpOkp+vOv5DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mup4SmyB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LW7I024393
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 12:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8G8MT1LjzV5
	F7x7h2zP9USaReyOZ6QfiVzZlkcEwqQo=; b=mup4SmyBrX3q3NupGxjVD7ylL3O
	d4yLScnxDeH4FNQGGIDQbx65SaIle3x14fvG3KUBi/v92eTD2ctopYm747WnKG2r
	/ebIzFVjLTXvIDjpTVnQNER4i+VaDmqkttrdbvzTIA2RQ4Yz6L9wu8ertV7VC/Q8
	YIbIPVQat7yenzmcLPXchlXfpM0IqhlXp3QtIoM/VPeImePgSjzva+6H3tb4zilF
	AJ6IKPBz0+p72QDrzi+VfFqm/PSLhB+8GjUo7FohY9/Zj3lhB1vbG+d2KPFazihr
	Ihz/eUG84ncooXYJYZHi8FBMVLMjtpYmoy2kp0gpVx7iW4S2dOH4rVOf0vg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by907jd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 12:20:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b302991816so126907761cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 05:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420428; x=1758025228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8G8MT1LjzV5F7x7h2zP9USaReyOZ6QfiVzZlkcEwqQo=;
        b=lKLkw67j4kLVvBb3koD0U+DuCj3h6Cq3eXkj0OokcqvJkJasBngOxPs5P1RLsERzoI
         0Jg6pztZoPg1WplGSga7/qPA+bace3D5g8g6W0yYQCG1xFNw+nxlrawTgplqLhrClFMl
         UYhXM/QHHMa710gDqigRGnyYhcychiI5P+l4i5ZGHf3mwLHU05KkUGuwkN0qgIq7EiaW
         vSVdFJcGbh40BZQDDOKHBg7lUdZZ/nIYfDCWyxqoT5vMoZwmlAppXW5Ku9B2InSaCJvw
         8/fKJDChPxgXRKboEb313V9M6u9QQa/Ww7px8eh4jV4jLswvhoVboxTnSopYfLp6sJ6Y
         9jrw==
X-Forwarded-Encrypted: i=1; AJvYcCUGVhMgoKrSNJlHfdPfEd2Esq1iIvZP01TPd7cTm0t/9qZm8Cko6xRNfh7dGacW8abPV3h2wNuzUn0djrzg@vger.kernel.org
X-Gm-Message-State: AOJu0YwayitvGmo9polsl+rw3gZiKa6PkmS+S2o5zZZF8EC2LwyiXlUy
	Z7fZks6Yyr4uBhH+dMIAgRpkYK6ZfQzKzFjJC6txFHkKpwg500ZHYTaC5SMTfl0aR7UzptMb3eP
	eHI1VsR248+8aISwxh0TOZS7T8YWeeN+94KLrbS0kWYNqOA2xOXhNkZrcrSSttTqpojrZ
X-Gm-Gg: ASbGncuOsh6qOZTNEC7ICJ0B/BVPqhLR9xv7HgTqnTSiSyiTsbARpuskwybF9F0pwXv
	wpFDzaOMGol8imZzeBVzWo/ROMkpIwMWnGU83PR5OU3z9eGiw7+Zk+2DBjM+yuZRfp309aLfLcW
	eB6bMVvxlT0apgIQ+0PV/jvVN058TEGPFMjZHy1OAs8ExHUJ9cB52OBwgSG10hX7+n4/Wb1HK5/
	QxMrQ4/XVP86m5kTaab/TySXjDAHToh9dJwSlo0fG00NWS771URUB3HCmU/KMHgJ8VckGCccn34
	KuLRmoNhiAt1ZKRB3SeVy8QQSfCsYYKaxf27iES/f8zNy8q7aZj2bw==
X-Received: by 2002:a05:622a:4816:b0:4b5:146b:4f23 with SMTP id d75a77b69052e-4b5f8593458mr120757121cf.72.1757420427348;
        Tue, 09 Sep 2025 05:20:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyE4o5g2tzXIgE/waSqSN++D8rmhx3Yy+KxD2D6Mc7aqdCmqk4G3HEZ9A5YJcSuuGHZBatKg==
X-Received: by 2002:a05:622a:4816:b0:4b5:146b:4f23 with SMTP id d75a77b69052e-4b5f8593458mr120756711cf.72.1757420426575;
        Tue, 09 Sep 2025 05:20:26 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:26 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 09/13] ASoC: codecs: wcd-common: move component ops to common
Date: Tue,  9 Sep 2025 13:19:50 +0100
Message-ID: <20250909121954.225833-10-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c01b8d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eQjB__F64b99YC4tFhYA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: -5wLWIw8Ml1F6pxgeLDaocNQdMGvC-2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX0wyvB3ou4aQg
 0rzwWGjj8D2FtyQQnpOE2yOzgmDDahkgEQ4ugRedSxVuTZsvpiKyVlKBi3b8LRGRroB7MbxazT8
 f3zOe6nWPKgrQ9KJzAL81BRiwRy0IANHlDh4VbzkQnJFLc6Z5kgM5Jb6D8geyPRfcj/tRpzC0JZ
 +6XwCc1BXzd06gs7qD5QTocbokZV0GkV3SYZ+HhhfivQyZBGb+7LQd4iDG7SjR8lfmEJhUT4kQy
 ZGXZzREHSiV3HD3k04sRDX9A/m1kT8CzZ69G8Yl0pqdS13Eubd/1ZsYuxUTovkgQyQ/MJZDn3Cp
 ixPZQhHDH7M1JKN8gf8i5D6zOu1yFpmvVu0DKx6T3DKV0h13OGIf5renztekMfQPcDuSUFKG3s0
 CUj4zxwi
X-Proofpoint-ORIG-GUID: -5wLWIw8Ml1F6pxgeLDaocNQdMGvC-2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

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
index 8f3c0806cdc9..7a48cc5064cc 100644
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
index d94e8879a1d7..0d4e9f8e39f2 100644
--- a/sound/soc/codecs/wcd-common.h
+++ b/sound/soc/codecs/wcd-common.h
@@ -34,6 +34,7 @@ struct wcd_common {
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


