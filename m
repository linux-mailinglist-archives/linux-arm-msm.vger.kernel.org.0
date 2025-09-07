Return-Path: <linux-arm-msm+bounces-72430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF0BB47AE6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 13:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B40223B8507
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 11:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE632690C0;
	Sun,  7 Sep 2025 11:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dD+Jc1Vs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDEE261B96
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 11:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757244142; cv=none; b=iPk4ssovFWWOLk8I+ENd2f//0ktlW2zkAEyqqQgH+bBkCdcE9npfRwaGwu7iBoRFkTqTt226FTibGy5Q+a1WGm6b3hrxhWcHvWIV2C0zvDTyhGOX5T/1BH96ilgPgqWQBqUiw1xtl+CT+JveOZLeVnSMSQYsQhgBRL8zwK0G5RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757244142; c=relaxed/simple;
	bh=2RdZuj2+bnEq4lFI1TvOAOQLbIHMBgnyjO4wWEhvPd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fgS6OSUbNm0XCye6PaoVHyMPpGIEvZu+R1NdK6N7+DFo4zHvxHng0oQF9s26lhVTDpUf67tix+0cU4qcqZ3e1PAsmA4zYZ90y1gyUHZCUaXnWviwf5uY/RRUf6gGrRsVje3ulAuV/maeO6xxQ/2ENt+u/ZWezFQfQJ6Uv1w8ZFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dD+Jc1Vs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5878jTTH020794
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 11:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s7WquEsfgwY
	isqBTd7oid9YlC00m48Huneeh+WYoicw=; b=dD+Jc1VsCLoNa0soEH6B/0K60YT
	YVvS7HJODmLufuJqB7YN2Wf5mZF8+T+9hrmN9yPlScMHhCAXG2HHiZdpCuUgdFBr
	DmBpAZVzIEJPjWhi92DXerYd3lPoGp8NP3vBrfrRQpaTqG+jnXCHVdZ9gap5laPS
	OfMR5xWx5pPH1ItZm9nE1HHvFUrP8VdxrEX+k61uCVvQZLQkot/WJdEiWBa2S/Ct
	wlqwbRoERiaVKaH2vYy7I4mO6DSiMbRYCuHDylmXIlaHKKygldeQO+wv3m3kebbo
	mBUkzi0HV/jaL85p20sBcSRuVHPU+LO5ZqIpSOTT1qpdCoqOqP4wjCW22Ow==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8t3f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 11:22:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-726a649957dso76907146d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 04:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757244139; x=1757848939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7WquEsfgwYisqBTd7oid9YlC00m48Huneeh+WYoicw=;
        b=bj2RHlOdTe6s2aaCBlSnVRUrWsQC762B4ycyMStwIqF6zMbEodgof8TmIVvsK1eJo5
         qHl+ac2YYXtapEQh8SbkWhH1hfTrlQdLTJYea5DjKOBGyKc+mBVc6JvDRXW6QqThFyLa
         9vzyys3+dZIo0qjUcfFEzCUj2QmhESs8tBKhzAnrLp3JY/p9t/m4VtpcWCnFKbUjYJK8
         wA6kcBw81OZFfy2ST1c1wcz/m1EAH8CgY+S22G9o2Rk9uS+sa6PknVRWoLn3Wa/ObZ2I
         S+YImy79w4GdF5KBSOYnFcUFa1lkBoztKbaHomK6uXKx0uAu4ldlt+oRxuFXO+WyaGvL
         3eWg==
X-Forwarded-Encrypted: i=1; AJvYcCUkFWUQCKay8uvMxdM+VA/FD8dgkf7Eetllefmy5spOBU6icTkagbC3Ykgu+6ctUMTbRENgcORiWHANOWDM@vger.kernel.org
X-Gm-Message-State: AOJu0YzUEAcLLOBc3LwLydPns02oQ/KJfUU6v8cE6RiSA2uuRNns9cSH
	xnKRM2G30PxmPe2llpHK+oVrCKbf7bji6UYIZmSZAsNf2kURFtsonA+/UwgmleY8jgBhzlBhfZe
	QPzsUjI+s+S4WVmJHRNojFSgkkCBfLYX41huYlpCZqIHBoL54/XxS79nLUojc66X27zzy
X-Gm-Gg: ASbGncvzem1BipYjfCkmZK1M1ytme2PcWjh85DTC1oMfTf6MubFxSRWBZyr2lAk6T+G
	TG2FdIJDF9w8U7uzq3Mm6TzcP7GQBIDoeCkPRQKxSgfkvgweEvTP6+Dgv/d3978N0xYR7fO5ffB
	rMowrFcpeZByeIZWN8KUrJT4viPpM2Ki+Wq9duThJRlPIt9CYCRaiIv0fu24pTmBJLI+BhbQBNC
	WjXJ0AuXohRI95OwDMaNO74WmsRUK9cLqao8lSh71ygGxsfXnlGSJrLzb6eRZdtSr11V6c2pmUQ
	6OWbUEUOG/q20h0ljcwf0WbqfDAS2M5hEvvDo6JLLYPrKVrpjrDEmQ==
X-Received: by 2002:a05:6214:c64:b0:70d:7751:4309 with SMTP id 6a1803df08f44-73921b3a881mr43562446d6.8.1757244139135;
        Sun, 07 Sep 2025 04:22:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMFWegjMkjf+SpLg/jV7csKDJqY2/Q4u2f9F5Gx3h9fT6Lg+VfiBDl7XZXg9h9zLUpNv6/0g==
X-Received: by 2002:a05:6214:c64:b0:70d:7751:4309 with SMTP id 6a1803df08f44-73921b3a881mr43562126d6.8.1757244138659;
        Sun, 07 Sep 2025 04:22:18 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm37523289f8f.61.2025.09.07.04.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 04:22:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 11/13] ASoC: codecs: wcd-common: move status_update callback to common
Date: Sun,  7 Sep 2025 12:21:58 +0100
Message-ID: <20250907112201.259405-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250907112201.259405-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68bd6aec cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=lLZ5r3BOYuU-AXZT-04A:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: p_12diQXmyxANZeiI__ctIVDCOcvjNvi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX0zks/0ccJZz/
 DnVfCqX7DyLObLT6Gshlc76s39k6NjSVCZLngg4Y+dgz16MDuFmLwNJlxAkD5EQPiEk9WGFYLNq
 pFVdBDIkskdKuPDiZDIwIfgB83pqZz0/N1VOW2RouukGz1cZ7EmQzRXQUYsQgUJPVFQ3bt8HBQo
 AGNVzrZ1dy2lJ2BlY0w/yfam/JBotx/SstbHgIKXZpEp3Mh9XljqXZC6vgSAhD2lsyI8NUOE8QN
 7NDG16797kCS3AltdIknHPynf3+k1WXkPQd96/+6BjgIohunxsqlQ00phDrbjzAEzKIU79i3bBP
 JJJYAMw8LUP2qcLghd3mL5PsR+49vMpYbB67VhadlnvqldRcEflnGRHQ05lhg987Y4JC6Jl0BcF
 1soI4wfe
X-Proofpoint-ORIG-GUID: p_12diQXmyxANZeiI__ctIVDCOcvjNvi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Soundwire update_status, bus_config and interrupt callbacks for wcd937x,
wcd938x, wcd939x soundwire codecs are exactly identlical, move them to
common driver to remove this duplicate code.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/codecs/wcd-common.c  | 46 ++++++++++++++++++++++++++++++++++
 sound/soc/codecs/wcd-common.h  |  5 ++++
 sound/soc/codecs/wcd937x-sdw.c | 28 +++------------------
 sound/soc/codecs/wcd938x-sdw.c | 41 +++---------------------------
 sound/soc/codecs/wcd939x-sdw.c | 42 +++----------------------------
 5 files changed, 62 insertions(+), 100 deletions(-)

diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
index 585d3e036900..6aaa6e2c955a 100644
--- a/sound/soc/codecs/wcd-common.c
+++ b/sound/soc/codecs/wcd-common.c
@@ -9,6 +9,9 @@
 #include <linux/printk.h>
 #include <linux/component.h>
 #include <linux/pm_runtime.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <linux/regmap.h>
 
 #include "wcd-common.h"
 
@@ -16,6 +19,8 @@
 #define WCD_DEF_MICBIAS_MV	1800
 #define WCD_MAX_MICBIAS_MV	2850
 
+#define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
+
 int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv)
 {
 	/* min micbias voltage is 1V and maximum is 2.85V */
@@ -93,5 +98,46 @@ const struct component_ops wcd_sdw_component_ops = {
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
index 0d4e9f8e39f2..d5c156e641fc 100644
--- a/sound/soc/codecs/wcd-common.h
+++ b/sound/soc/codecs/wcd-common.h
@@ -37,5 +37,10 @@ struct wcd_common {
 extern const struct component_ops wcd_sdw_component_ops;
 int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv);
 int wcd_dt_parse_micbias_info(struct wcd_common *common);
+int wcd_update_status(struct sdw_slave *slave, enum sdw_slave_status status);
+int wcd_bus_config(struct sdw_slave *slave, struct sdw_bus_params *params);
+int wcd_interrupt_callback(struct sdw_slave *slave, struct irq_domain *slave_irq,
+		unsigned int wcd_intr_status0, unsigned int wcd_intr_status1,
+		unsigned int wcd_intr_status2);
 
 #endif /* __WCD_COMMON_H__  */
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
index 92714aef09d5..add907cb2706 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -20,8 +20,6 @@
 #include "wcd938x.h"
 #include "wcd-common.h"
 
-#define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
-
 static const struct wcd_sdw_ch_info wcd938x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD938X_HPH_L, WCD938X_HPH_PORT, BIT(0)),
 	WCD_SDW_CH(WCD938X_HPH_R, WCD938X_HPH_PORT, BIT(1)),
@@ -142,44 +140,13 @@ int wcd938x_sdw_set_sdw_stream(struct wcd938x_sdw_priv *wcd,
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
@@ -1177,9 +1144,9 @@ static const struct regmap_config wcd938x_regmap_config = {
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
index 38da706d80be..d369100a2457 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -22,8 +22,6 @@
 #include "wcd939x.h"
 #include "wcd-common.h"
 
-#define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
-
 static const struct wcd_sdw_ch_info wcd939x_sdw_rx_ch_info[] = {
 	WCD_SDW_CH(WCD939X_HPH_L, WCD939X_HPH_PORT, BIT(0)),
 	WCD_SDW_CH(WCD939X_HPH_R, WCD939X_HPH_PORT, BIT(1)),
@@ -187,29 +185,6 @@ int wcd939x_sdw_set_sdw_stream(struct wcd939x_sdw_priv *wcd,
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
@@ -220,18 +195,9 @@ static int wcd9390_interrupt_callback(struct sdw_slave *slave,
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
@@ -1364,9 +1330,9 @@ static const struct regmap_config wcd939x_regmap_config = {
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


