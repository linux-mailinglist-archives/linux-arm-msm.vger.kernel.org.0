Return-Path: <linux-arm-msm+bounces-70373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FB3B315CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61CF31D02BA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B009C2FC002;
	Fri, 22 Aug 2025 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMjPWodC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9E42FB620
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859782; cv=none; b=fnLyh6plakBqNoooSpPDhzAPLrHc/ktNTGLzZLPgCY7RLQUNsPsV9UjIkwcLcPoG3e3lv0k161XUXQ5Ci0cJ9ikJubgnNr/RQWur+XeeIAUaS3Gxhr26NDQzELf8g687vk606wKh9J6h0BJl+BoYr4ZnG4bXAsS1WJBf0in/qNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859782; c=relaxed/simple;
	bh=gU1SLqaAPQRfFwDFQT/0V3tOXM0o/jut7U+hyYSnWMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RW/rKHQM9dvctLy6KjLSXq/vUlE/GIvZX2UymNAwVZApxWfyhheHAa/thdFc2Q2fHoX7lH9Les3TWhHY8XP0DVz77VqzTVak6Tfhzr/4Wt1swuyDOoKe0kReoZ6GD2b+LoT0m6seo+wqdKZUAnAdZnngPK66fzzAdkHvssmUFhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMjPWodC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UHud003542
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6WRdE5pc/KU
	3jHiPoKjTCr5CuURCFbTk+NT8Fmcx9DA=; b=aMjPWodCF7ZKc5OmI3YvA2Ofc+Q
	+OYVAX40t9pQt9jHjpBtej5NAfkfVKIjb5pSLIbMUJdfrjNF9Qd6lB/tLiLuX/ik
	BDve64AgXauPewmaaOlBZL9NX3LB/pUqTvVkZy4/5JyH3HyvsVSmXljn7lv9tdRG
	oP2kEeosShVUf5/VBkhXKSqVV1XT3tgkSYOySOzTlpMNbwx42JXjavwE1F2bOCpj
	o7J0yNV7l05dsdVf3ZQq454365IQpBJxNKRFsdvL6RqvmcYOBepNyy7/+9n3FDpJ
	wZmuGLCnnSvlOyRCrgbtPIYYSHj7X2nO6SUU3scF3qg/lImF4jDo1VeMDhQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5298vf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:49:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109be525eso44150491cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755859778; x=1756464578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WRdE5pc/KU3jHiPoKjTCr5CuURCFbTk+NT8Fmcx9DA=;
        b=eOC8zcaqYKwqgf4xUAkUqYBQLdSIEgERupDzP0GdecUof7fg02VngRQwtvH0tUd988
         FxxXySzU0IyblG6cPEzM59f7cjX3jV3zLLFem+cHUvXrYZ7WDINOQ2sVbAggmc7g/diF
         DB5x2sNN99L+39QytvpvjIsCQTqm2NmNuMZdLQcwbXTTGqM/Py9SMyzHgfEU+UBoap0A
         /mtzfUhFUfiUmRYljZ8fBXTOQ5dMk6lykCISQQCS2vrGHw94o9QZDtX0anW6vDlX9wXb
         0P/mPTeVSr5+MBB9FD/YFgBDb3QzEm9TgiyXPHciAdOXVzydIuVJNQ7ptU1u5aV9uImw
         rg0w==
X-Forwarded-Encrypted: i=1; AJvYcCWjy4IracVHtny6oS4OiXdwPYxx2s00u+epI+F6anbyvPFWKrIFYanhVfS54I5SHh3t/1Z1xecQzXg/iN+x@vger.kernel.org
X-Gm-Message-State: AOJu0YwSvdg1OKyMDGxL0mF+DQqA+A6XHMiUAEoDta3DR8xwwQM8sjps
	Gel08Fy9X+aikhTHMyqCKp9vAh2KhAUGKMvGVwoY7FtkTKTFSIZcHl8r4r8gmkwGJq1l+QhE5Pr
	5Wt81/+83laV+KirqZMNcAerOkB2tye8ClQNhXuz+ooA+M9LPT6Eyi+JS3TuHB9MAOhhm
X-Gm-Gg: ASbGncvOanUbrJYtXqpi/jilOrpEvTW0J1Fzp5kltt+BEFsBLoXKeynZBdMebql/kct
	eWbqnsqZDy/kXcHz1HPFf3WcVx6R+jLbgNfUIU3FmQwsA4xKunfMQK9SM/AUSqUeTsmzHHbAV2f
	gNhiTut87GzkMoT+4Hcvd2PyLIetQnKOJfpKYLHSXL9ToHAETgEDZB8QT7aEuA104kYShs8GlBN
	21L+cRJa9R0OaULG432XergXb4zT1T9zy9NUJbi9vs16LaUBPqs2+HWzKdHrKS1NDQW9klii2Mo
	R9SPUbKrRyWCIL/o6a+ZWp9NzH1jVsI9WtLhNhNYhkL79Z4mrTHHYw==
X-Received: by 2002:a05:622a:30a:b0:4b0:e934:85e5 with SMTP id d75a77b69052e-4b2aaa57331mr27169851cf.5.1755859777318;
        Fri, 22 Aug 2025 03:49:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8VNQp2/fHLYaDtt2DLbF2OoVMMyeBHVbV4cL2dGx0c/0Y2wkJo8wG88KZ1GiCYbiuBkfeFw==
X-Received: by 2002:a05:622a:30a:b0:4b0:e934:85e5 with SMTP id d75a77b69052e-4b2aaa57331mr27169471cf.5.1755859776637;
        Fri, 22 Aug 2025 03:49:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e4249bsm31367155e9.25.2025.08.22.03.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:49:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 6/8] ASoC: codecs: wcd-common: move status_update callback to common
Date: Fri, 22 Aug 2025 11:49:25 +0100
Message-ID: <20250822104927.2621866-7-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a84b43 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=lLZ5r3BOYuU-AXZT-04A:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: -XQUaoxl5Q3UhKw3zAPzCxTd54DsYHXJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxVhJbTPaxvfL
 UA+ftJamZatzohim3yuGNId2O8BircrfGOqlyVpwGJjlGIpVkJzrFCm6RcS2inGDzMSG3VAz52m
 o55U1BX1AvAVYjPVD3DgsBMvYBJXgrDpLgNmcfwKAfi7KSLv4nc8cpqm0qWeaGTW4DJQd+Xln38
 AJPdjUXe1f88v/m/p7gzIbUEkwb8pNncEz8XQDOJ8sYrYPBIoDLr55hUNNJPG5vXedszlO9t7Hj
 K7LaelhZ0HV6j4WslDKvRJE+5xE0Daxmf3Jt1thGnpsnPvZx2fweU7pFpj0RCItA8C9Eb8H/1Tr
 7z4ynXxtUbqEKODz3VPQeJuMbc6P+nrcIdqUtSARvcMufbarQuafgocCEDqLy/vNr21aXo4gses
 fkpC0ZMLEND9DlQm7l7VWHXmT+9Xpg==
X-Proofpoint-GUID: -XQUaoxl5Q3UhKw3zAPzCxTd54DsYHXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

Soundwire update_status, bus_config and interrupt callbacks for wcd937x,
wcd938x, wcd939x soundwire codecs are exactly identlical, move them to
common driver to remove this duplicate code.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd-common.c  | 46 ++++++++++++++++++++++++++++++++++
 sound/soc/codecs/wcd-common.h  | 10 ++++++++
 sound/soc/codecs/wcd937x-sdw.c | 28 +++------------------
 sound/soc/codecs/wcd938x-sdw.c | 41 +++---------------------------
 sound/soc/codecs/wcd939x-sdw.c | 42 +++----------------------------
 5 files changed, 67 insertions(+), 100 deletions(-)

diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
index 0c1ffa015403..2592e8ed2d13 100644
--- a/sound/soc/codecs/wcd-common.c
+++ b/sound/soc/codecs/wcd-common.c
@@ -9,9 +9,14 @@
 #include <linux/printk.h>
 #include <linux/component.h>
 #include <linux/pm_runtime.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <linux/regmap.h>
 
 #include "wcd-common.h"
 
+#define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
+
 int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv)
 {
 	/* min micbias voltage is 1V and maximum is 2.85V */
@@ -89,5 +94,46 @@ const struct component_ops wcd_sdw_component_ops = {
 };
 EXPORT_SYMBOL_GPL(wcd_sdw_component_ops);
 
+int wcd_update_status(struct sdw_slave *slave, enum sdw_slave_status status)
+{
+	struct regmap *regmap = dev_get_regmap(&slave->dev, NULL);
+
+	if (regmap && status == SDW_SLAVE_ATTACHED) {
+		/* Write out any cached changes that happened between probe and attach */
+		regcache_cache_only(regmap, false);
+		return regcache_sync(regmap);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(wcd_update_status);
+
+int wcd_bus_config(struct sdw_slave *slave, struct sdw_bus_params *params)
+{
+	sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank), 0x01);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(wcd_bus_config);
+
+int wcd_interrupt_callback(struct sdw_slave *slave, struct irq_domain *slave_irq,
+		unsigned int wcd_intr_status0, unsigned int wcd_intr_status1,
+		unsigned int wcd_intr_status2)
+{
+	struct regmap *regmap = dev_get_regmap(&slave->dev, NULL);
+	u32 sts1, sts2, sts3;
+
+	do {
+		handle_nested_irq(irq_find_mapping(slave_irq, 0));
+		regmap_read(regmap, wcd_intr_status0, &sts1);
+		regmap_read(regmap, wcd_intr_status1, &sts2);
+		regmap_read(regmap, wcd_intr_status2, &sts3);
+
+	} while (sts1 || sts2 || sts3);
+
+	return IRQ_HANDLED;
+}
+EXPORT_SYMBOL_GPL(wcd_interrupt_callback);
+
 MODULE_DESCRIPTION("Common Qualcomm WCD Codec helpers driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/wcd-common.h b/sound/soc/codecs/wcd-common.h
index deb78241236b..0cb6365bea4b 100644
--- a/sound/soc/codecs/wcd-common.h
+++ b/sound/soc/codecs/wcd-common.h
@@ -6,11 +6,16 @@
 #ifndef __WCD_COMMON_H__
 #define __WCD_COMMON_H___
 
+#include <linux/device.h>
+#include <linux/soundwire/sdw.h>
+
 #define WCD_MIN_MICBIAS_MV	1000
 #define WCD_DEF_MICBIAS_MV	1800
 #define WCD_MAX_MICBIAS_MV	2850
 #define WCD_MAX_MICBIAS		4
 
+
+
 struct wcd_sdw_ch_info {
 	int port_num;
 	unsigned int ch_mask;
@@ -32,5 +37,10 @@ struct wcd_common {
 extern const struct component_ops wcd_sdw_component_ops;
 int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv);
 int wcd_dt_parse_micbias_info(struct wcd_common *common);
+int wcd_update_status(struct sdw_slave *slave, enum sdw_slave_status status);
+int wcd_bus_config(struct sdw_slave *slave, struct sdw_bus_params *params);
+int wcd_interrupt_callback(struct sdw_slave *slave, struct irq_domain *slave_irq,
+		unsigned int wcd_intr_status0, unsigned int wcd_intr_status1,
+		unsigned int wcd_intr_status2);
 
 #endif /* __WCD_COMMON_H___  */
diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index 59c353cafd31..1878d67e3fa1 100644
--- a/sound/soc/codecs/wcd937x-sdw.c
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -112,19 +112,6 @@ int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 }
 EXPORT_SYMBOL_GPL(wcd937x_sdw_hw_params);
 
-static int wcd9370_update_status(struct sdw_slave *slave, enum sdw_slave_status status)
-{
-	struct wcd937x_sdw_priv *wcd = dev_get_drvdata(&slave->dev);
-
-	if (wcd->regmap && status == SDW_SLAVE_ATTACHED) {
-		/* Write out any cached changes that happened between probe and attach */
-		regcache_cache_only(wcd->regmap, false);
-		return regcache_sync(wcd->regmap);
-	}
-
-	return 0;
-}
-
 /*
  * Handle Soundwire out-of-band interrupt event by triggering
  * the first irq of the slave_irq irq domain, which then will
@@ -135,18 +122,9 @@ static int wcd9370_interrupt_callback(struct sdw_slave *slave,
 				      struct sdw_slave_intr_status *status)
 {
 	struct wcd937x_sdw_priv *wcd = dev_get_drvdata(&slave->dev);
-	struct irq_domain *slave_irq = wcd->slave_irq;
-	u32 sts1, sts2, sts3;
-
-	do {
-		handle_nested_irq(irq_find_mapping(slave_irq, 0));
-		regmap_read(wcd->regmap, WCD937X_DIGITAL_INTR_STATUS_0, &sts1);
-		regmap_read(wcd->regmap, WCD937X_DIGITAL_INTR_STATUS_1, &sts2);
-		regmap_read(wcd->regmap, WCD937X_DIGITAL_INTR_STATUS_2, &sts3);
-
-	} while (sts1 || sts2 || sts3);
 
-	return IRQ_HANDLED;
+	return wcd_interrupt_callback(slave, wcd->slave_irq, WCD937X_DIGITAL_INTR_STATUS_0,
+				WCD937X_DIGITAL_INTR_STATUS_1, WCD937X_DIGITAL_INTR_STATUS_2);
 }
 
 static const struct reg_default wcd937x_defaults[] = {
@@ -979,7 +957,7 @@ static const struct regmap_config wcd937x_regmap_config = {
 };
 
 static const struct sdw_slave_ops wcd9370_slave_ops = {
-	.update_status = wcd9370_update_status,
+	.update_status = wcd_update_status,
 	.interrupt_callback = wcd9370_interrupt_callback,
 };
 
diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index e43d6ac1c913..9636501c90ac 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -19,8 +19,6 @@
 #include <sound/soc-dapm.h>
 #include "wcd938x.h"
 
-#define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
-
 static const struct wcd_sdw_ch_info wcd938x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD938X_HPH_L, WCD938X_HPH_PORT, BIT(0)),
 	WCD_SDW_CH(WCD938X_HPH_R, WCD938X_HPH_PORT, BIT(1)),
@@ -141,44 +139,13 @@ int wcd938x_sdw_set_sdw_stream(struct wcd938x_sdw_priv *wcd,
 }
 EXPORT_SYMBOL_GPL(wcd938x_sdw_set_sdw_stream);
 
-static int wcd9380_update_status(struct sdw_slave *slave,
-				 enum sdw_slave_status status)
-{
-	struct wcd938x_sdw_priv *wcd = dev_get_drvdata(&slave->dev);
-
-	if (wcd->regmap && (status == SDW_SLAVE_ATTACHED)) {
-		/* Write out any cached changes that happened between probe and attach */
-		regcache_cache_only(wcd->regmap, false);
-		return regcache_sync(wcd->regmap);
-	}
-
-	return 0;
-}
-
-static int wcd9380_bus_config(struct sdw_slave *slave,
-			      struct sdw_bus_params *params)
-{
-	sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank),  0x01);
-
-	return 0;
-}
-
 static int wcd9380_interrupt_callback(struct sdw_slave *slave,
 				      struct sdw_slave_intr_status *status)
 {
 	struct wcd938x_sdw_priv *wcd = dev_get_drvdata(&slave->dev);
-	struct irq_domain *slave_irq = wcd->slave_irq;
-	u32 sts1, sts2, sts3;
-
-	do {
-		handle_nested_irq(irq_find_mapping(slave_irq, 0));
-		regmap_read(wcd->regmap, WCD938X_DIGITAL_INTR_STATUS_0, &sts1);
-		regmap_read(wcd->regmap, WCD938X_DIGITAL_INTR_STATUS_1, &sts2);
-		regmap_read(wcd->regmap, WCD938X_DIGITAL_INTR_STATUS_2, &sts3);
-
-	} while (sts1 || sts2 || sts3);
 
-	return IRQ_HANDLED;
+	return wcd_interrupt_callback(slave, wcd->slave_irq, WCD938X_DIGITAL_INTR_STATUS_0,
+				WCD938X_DIGITAL_INTR_STATUS_1, WCD938X_DIGITAL_INTR_STATUS_2);
 }
 
 static const struct reg_default wcd938x_defaults[] = {
@@ -1176,9 +1143,9 @@ static const struct regmap_config wcd938x_regmap_config = {
 };
 
 static const struct sdw_slave_ops wcd9380_slave_ops = {
-	.update_status = wcd9380_update_status,
+	.update_status = wcd_update_status,
 	.interrupt_callback = wcd9380_interrupt_callback,
-	.bus_config = wcd9380_bus_config,
+	.bus_config = wcd_bus_config,
 };
 
 static int wcd9380_probe(struct sdw_slave *pdev,
diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index 2b0aa2108f33..8bc89401beb9 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -21,8 +21,6 @@
 #include <sound/soc-dapm.h>
 #include "wcd939x.h"
 
-#define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
-
 static const struct wcd_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD939X_HPH_L, WCD939X_HPH_PORT, BIT(0)),
 	WCD_SDW_CH(WCD939X_HPH_R, WCD939X_HPH_PORT, BIT(1)),
@@ -186,29 +184,6 @@ int wcd939x_sdw_set_sdw_stream(struct wcd939x_sdw_priv *wcd,
 }
 EXPORT_SYMBOL_GPL(wcd939x_sdw_set_sdw_stream);
 
-static int wcd9390_update_status(struct sdw_slave *slave,
-				 enum sdw_slave_status status)
-{
-	struct wcd939x_sdw_priv *wcd = dev_get_drvdata(&slave->dev);
-
-	if (wcd->regmap && status == SDW_SLAVE_ATTACHED) {
-		/* Write out any cached changes that happened between probe and attach */
-		regcache_cache_only(wcd->regmap, false);
-		return regcache_sync(wcd->regmap);
-	}
-
-	return 0;
-}
-
-static int wcd9390_bus_config(struct sdw_slave *slave,
-			      struct sdw_bus_params *params)
-{
-	sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank),
-		  0x01);
-
-	return 0;
-}
-
 /*
  * Handle Soundwire out-of-band interrupt event by triggering
  * the first irq of the slave_irq irq domain, which then will
@@ -219,18 +194,9 @@ static int wcd9390_interrupt_callback(struct sdw_slave *slave,
 				      struct sdw_slave_intr_status *status)
 {
 	struct wcd939x_sdw_priv *wcd = dev_get_drvdata(&slave->dev);
-	struct irq_domain *slave_irq = wcd->slave_irq;
-	u32 sts1, sts2, sts3;
-
-	do {
-		handle_nested_irq(irq_find_mapping(slave_irq, 0));
-		regmap_read(wcd->regmap, WCD939X_DIGITAL_INTR_STATUS_0, &sts1);
-		regmap_read(wcd->regmap, WCD939X_DIGITAL_INTR_STATUS_1, &sts2);
-		regmap_read(wcd->regmap, WCD939X_DIGITAL_INTR_STATUS_2, &sts3);
-
-	} while (sts1 || sts2 || sts3);
 
-	return IRQ_HANDLED;
+	return wcd_interrupt_callback(slave, wcd->slave_irq, WCD939X_DIGITAL_INTR_STATUS_0,
+			WCD939X_DIGITAL_INTR_STATUS_1, WCD939X_DIGITAL_INTR_STATUS_2);
 }
 
 static const struct reg_default wcd939x_defaults[] = {
@@ -1363,9 +1329,9 @@ static const struct regmap_config wcd939x_regmap_config = {
 };
 
 static const struct sdw_slave_ops wcd9390_slave_ops = {
-	.update_status = wcd9390_update_status,
+	.update_status = wcd_update_status,
 	.interrupt_callback = wcd9390_interrupt_callback,
-	.bus_config = wcd9390_bus_config,
+	.bus_config = wcd_bus_config,
 };
 
 static int wcd9390_probe(struct sdw_slave *pdev, const struct sdw_device_id *id)
-- 
2.50.0


