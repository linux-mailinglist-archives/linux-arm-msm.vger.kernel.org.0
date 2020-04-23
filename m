Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186C31B5F5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 17:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729277AbgDWPed (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 11:34:33 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:33055 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729273AbgDWPec (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 11:34:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587656071; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=RAXs1ZeSABGEzLjYk+mvvwLddROk837UOMFG46uzVbY=; b=H60MzP1wRInP39OM7aHZizizChELvtnY4kMeFVaGhRB+uiCatKU4jfzwky0EvjrjTVNrVVch
 RenXCRI5MOsMYE8DSabh+vjJhF3bT/0a3BdisPxilaxSFv/twLSgbj7CVpZOFhkiVCZD1RAu
 d6Cw27M2xXFwWNdhVcf0o19xLYc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea1b584.7f5aabcf98b8-smtp-out-n05;
 Thu, 23 Apr 2020 15:34:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9DDD3C43637; Thu, 23 Apr 2020 15:34:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D35AC433BA;
        Thu, 23 Apr 2020 15:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1D35AC433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, robh@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-fbdev@vger.kernel.org
Cc:     Kiran Gunda <kgunda@codeaurora.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: [PATCH V6 2/4] backlight: qcom-wled: Add callback functions
Date:   Thu, 23 Apr 2020 21:03:35 +0530
Message-Id: <1587656017-27911-3-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add wled_cabc_config, wled_sync_toggle, wled_ovp_fault_status
and wled_ovp_delay and wled_auto_detection_required callback
functions to prepare the driver for adding WLED5 support.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/qcom-wled.c | 213 ++++++++++++++++++++++++------------
 1 file changed, 141 insertions(+), 72 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index df53fbd..7b0095e 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -147,6 +147,7 @@ struct wled {
 	u32 max_brightness;
 	u32 short_count;
 	u32 auto_detect_count;
+	u32 version;
 	bool disabled_by_short;
 	bool has_short_detect;
 	int short_irq;
@@ -154,7 +155,30 @@ struct wled {
 
 	struct wled_config cfg;
 	struct delayed_work ovp_work;
+
+	/* Configures the brightness. Applicable for wled3, wled4 and wled5 */
 	int (*wled_set_brightness)(struct wled *wled, u16 brightness);
+
+	/* Configures the cabc register. Applicable for wled4 and wled5 */
+	int (*wled_cabc_config)(struct wled *wled, bool enable);
+
+	/*
+	 * Toggles the sync bit for the brightness update to take place.
+	 * Applicable for WLED3, WLED4 and WLED5.
+	 */
+	int (*wled_sync_toggle)(struct wled *wled);
+
+	/*
+	 * Time to wait before checking the OVP status after wled module enable.
+	 * Applicable for WLED4 and WLED5.
+	 */
+	int (*wled_ovp_delay)(struct wled *wled);
+
+	/*
+	 * Determines if the auto string detection is required.
+	 * Applicable for WLED4 and WLED5
+	 */
+	bool (*wled_auto_detection_required)(struct wled *wled);
 };
 
 static int wled3_set_brightness(struct wled *wled, u16 brightness)
@@ -237,7 +261,7 @@ static int wled_module_enable(struct wled *wled, int val)
 	return 0;
 }
 
-static int wled_sync_toggle(struct wled *wled)
+static int wled3_sync_toggle(struct wled *wled)
 {
 	int rc;
 	unsigned int mask = GENMASK(wled->max_string_count - 1, 0);
@@ -255,6 +279,46 @@ static int wled_sync_toggle(struct wled *wled)
 	return rc;
 }
 
+static int wled_ovp_fault_status(struct wled *wled, bool *fault_set)
+{
+	int rc;
+	u32 int_rt_sts, fault_sts;
+
+	*fault_set = false;
+	rc = regmap_read(wled->regmap,
+			wled->ctrl_addr + WLED3_CTRL_REG_INT_RT_STS,
+			&int_rt_sts);
+	if (rc < 0) {
+		dev_err(wled->dev, "Failed to read INT_RT_STS rc=%d\n", rc);
+		return rc;
+	}
+
+	rc = regmap_read(wled->regmap,
+			wled->ctrl_addr + WLED3_CTRL_REG_FAULT_STATUS,
+			&fault_sts);
+	if (rc < 0) {
+		dev_err(wled->dev, "Failed to read FAULT_STATUS rc=%d\n", rc);
+		return rc;
+	}
+
+	if (int_rt_sts & WLED3_CTRL_REG_OVP_FAULT_STATUS)
+		*fault_set = true;
+
+	if (fault_sts & WLED3_CTRL_REG_OVP_FAULT_BIT)
+		*fault_set = true;
+
+	if (*fault_set)
+		dev_dbg(wled->dev, "WLED OVP fault detected, int_rt_sts=0x%x fault_sts=0x%x\n",
+			int_rt_sts, fault_sts);
+
+	return rc;
+}
+
+static int wled4_ovp_delay(struct wled *wled)
+{
+	return WLED_SOFT_START_DLY_US;
+}
+
 static int wled_update_status(struct backlight_device *bl)
 {
 	struct wled *wled = bl_get_data(bl);
@@ -275,7 +339,7 @@ static int wled_update_status(struct backlight_device *bl)
 			goto unlock_mutex;
 		}
 
-		rc = wled_sync_toggle(wled);
+		rc = wled->wled_sync_toggle(wled);
 		if (rc < 0) {
 			dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
 			goto unlock_mutex;
@@ -298,6 +362,25 @@ static int wled_update_status(struct backlight_device *bl)
 	return rc;
 }
 
+static int wled4_cabc_config(struct wled *wled, bool enable)
+{
+	int i, j, rc;
+	u8 val;
+
+	for (i = 0; i < wled->cfg.num_strings; i++) {
+		j = wled->cfg.enabled_strings[i];
+
+		val = enable ? WLED4_SINK_REG_STR_CABC_MASK : 0;
+		rc = regmap_update_bits(wled->regmap, wled->sink_addr +
+					WLED4_SINK_REG_STR_CABC(j),
+					WLED4_SINK_REG_STR_CABC_MASK, val);
+		if (rc < 0)
+			return rc;
+	}
+
+	return 0;
+}
+
 #define WLED_SHORT_DLY_MS			20
 #define WLED_SHORT_CNT_MAX			5
 #define WLED_SHORT_RESET_CNT_DLY_US		USEC_PER_SEC
@@ -345,9 +428,10 @@ static irqreturn_t wled_short_irq_handler(int irq, void *_wled)
 
 static void wled_auto_string_detection(struct wled *wled)
 {
-	int rc = 0, i;
-	u32 sink_config = 0, int_sts;
+	int rc = 0, i, delay_time_us;
+	u32 sink_config = 0;
 	u8 sink_test = 0, sink_valid = 0, val;
+	bool fault_set;
 
 	/* Read configured sink configuration */
 	rc = regmap_read(wled->regmap, wled->sink_addr +
@@ -376,14 +460,9 @@ static void wled_auto_string_detection(struct wled *wled)
 	}
 
 	if (wled->cfg.cabc) {
-		for (i = 0; i < wled->cfg.num_strings; i++) {
-			rc = regmap_update_bits(wled->regmap, wled->sink_addr +
-						WLED4_SINK_REG_STR_CABC(i),
-						WLED4_SINK_REG_STR_CABC_MASK,
-						0);
-			if (rc < 0)
-				goto failed_detect;
-		}
+		rc = wled->wled_cabc_config(wled, false);
+		if (rc < 0)
+			goto failed_detect;
 	}
 
 	/* Disable all sinks */
@@ -427,18 +506,17 @@ static void wled_auto_string_detection(struct wled *wled)
 			goto failed_detect;
 		}
 
-		usleep_range(WLED_SOFT_START_DLY_US,
-			     WLED_SOFT_START_DLY_US + 1000);
+		delay_time_us = wled->wled_ovp_delay(wled);
+		usleep_range(delay_time_us, delay_time_us + 1000);
 
-		rc = regmap_read(wled->regmap, wled->ctrl_addr +
-				 WLED3_CTRL_REG_INT_RT_STS, &int_sts);
+		rc = wled_ovp_fault_status(wled, &fault_set);
 		if (rc < 0) {
-			dev_err(wled->dev, "Error in reading WLED3_CTRL_INT_RT_STS rc=%d\n",
+			dev_err(wled->dev, "Error in getting OVP fault_sts, rc=%d\n",
 				rc);
 			goto failed_detect;
 		}
 
-		if (int_sts & WLED3_CTRL_REG_OVP_FAULT_STATUS)
+		if (fault_set)
 			dev_dbg(wled->dev, "WLED OVP fault detected with SINK %d\n",
 				i + 1);
 		else
@@ -478,30 +556,30 @@ static void wled_auto_string_detection(struct wled *wled)
 	}
 
 	/* Enable valid sinks */
-	for (i = 0; i < wled->cfg.num_strings; i++) {
-		if (wled->cfg.cabc) {
-			rc = regmap_update_bits(wled->regmap, wled->sink_addr +
-						WLED4_SINK_REG_STR_CABC(i),
-						WLED4_SINK_REG_STR_CABC_MASK,
-						WLED4_SINK_REG_STR_CABC_MASK);
-			if (rc < 0)
+	if (wled->version == 4) {
+		for (i = 0; i < wled->cfg.num_strings; i++) {
+			if (sink_config &
+			    BIT(WLED4_SINK_REG_CURR_SINK_SHFT + i))
+				val = WLED4_SINK_REG_STR_MOD_MASK;
+			else
+				/* Disable modulator_en for unused sink */
+				val = 0;
+
+			rc = regmap_write(wled->regmap, wled->sink_addr +
+					  WLED4_SINK_REG_STR_MOD_EN(i), val);
+			if (rc < 0) {
+				dev_err(wled->dev, "Failed to configure MODULATOR_EN rc=%d\n",
+					rc);
 				goto failed_detect;
-		}
-
-		if (sink_config & BIT(WLED4_SINK_REG_CURR_SINK_SHFT + i))
-			val = WLED4_SINK_REG_STR_MOD_MASK;
-		else
-			val = 0x0; /* Disable modulator_en for unused sink */
-
-		rc = regmap_write(wled->regmap, wled->sink_addr +
-				  WLED4_SINK_REG_STR_MOD_EN(i), val);
-		if (rc < 0) {
-			dev_err(wled->dev, "Failed to configure MODULATOR_EN rc=%d\n",
-				rc);
-			goto failed_detect;
+			}
 		}
 	}
 
+	/* Enable CABC */
+	rc = wled->wled_cabc_config(wled, true);
+	if (rc < 0)
+		goto failed_detect;
+
 	/* Restore the feedback setting */
 	rc = regmap_write(wled->regmap,
 			  wled->ctrl_addr + WLED3_CTRL_REG_FEEDBACK_CONTROL, 0);
@@ -534,7 +612,8 @@ static void wled_auto_string_detection(struct wled *wled)
 
 #define WLED_AUTO_DETECT_OVP_COUNT		5
 #define WLED_AUTO_DETECT_CNT_DLY_US		USEC_PER_SEC
-static bool wled_auto_detection_required(struct wled *wled)
+
+static bool wled4_auto_detection_required(struct wled *wled)
 {
 	s64 elapsed_time_us;
 
@@ -570,29 +649,19 @@ static bool wled_auto_detection_required(struct wled *wled)
 static int wled_auto_detection_at_init(struct wled *wled)
 {
 	int rc;
-	u32 fault_status, rt_status;
+	bool fault_set;
 
 	if (!wled->cfg.auto_detection_enabled)
 		return 0;
 
-	rc = regmap_read(wled->regmap,
-			 wled->ctrl_addr + WLED3_CTRL_REG_INT_RT_STS,
-			 &rt_status);
-	if (rc < 0) {
-		dev_err(wled->dev, "Failed to read RT status rc=%d\n", rc);
-		return rc;
-	}
-
-	rc = regmap_read(wled->regmap,
-			 wled->ctrl_addr + WLED3_CTRL_REG_FAULT_STATUS,
-			 &fault_status);
+	rc = wled_ovp_fault_status(wled, &fault_set);
 	if (rc < 0) {
-		dev_err(wled->dev, "Failed to read fault status rc=%d\n", rc);
+		dev_err(wled->dev, "Error in getting OVP fault_sts, rc=%d\n",
+			rc);
 		return rc;
 	}
 
-	if ((rt_status & WLED3_CTRL_REG_OVP_FAULT_STATUS) ||
-	    (fault_status & WLED3_CTRL_REG_OVP_FAULT_BIT)) {
+	if (fault_set) {
 		mutex_lock(&wled->lock);
 		wled_auto_string_detection(wled);
 		mutex_unlock(&wled->lock);
@@ -629,7 +698,7 @@ static irqreturn_t wled_ovp_irq_handler(int irq, void *_wled)
 			int_sts, fault_sts);
 
 	if (fault_sts & WLED3_CTRL_REG_OVP_FAULT_BIT) {
-		if (wled_auto_detection_required(wled)) {
+		if (wled->wled_auto_detection_required(wled)) {
 			mutex_lock(&wled->lock);
 			wled_auto_string_detection(wled);
 			mutex_unlock(&wled->lock);
@@ -811,17 +880,12 @@ static int wled4_setup(struct wled *wled)
 					wled->cfg.string_i_limit);
 		if (rc < 0)
 			return rc;
-
-		addr = wled->sink_addr +
-				WLED4_SINK_REG_STR_CABC(j);
-		rc = regmap_update_bits(wled->regmap, addr,
-					WLED4_SINK_REG_STR_CABC_MASK,
-					wled->cfg.cabc ?
-					WLED4_SINK_REG_STR_CABC_MASK : 0);
-		if (rc < 0)
-			return rc;
 	}
 
+	rc = wled4_cabc_config(wled, wled->cfg.cabc);
+	if (rc < 0)
+		return rc;
+
 	rc = regmap_update_bits(wled->regmap, wled->ctrl_addr +
 				WLED3_CTRL_REG_MOD_EN,
 				WLED3_CTRL_REG_MOD_EN_MASK,
@@ -835,7 +899,7 @@ static int wled4_setup(struct wled *wled)
 	if (rc < 0)
 		return rc;
 
-	rc = wled_sync_toggle(wled);
+	rc = wled->wled_sync_toggle(wled);
 	if (rc < 0) {
 		dev_err(wled->dev, "Failed to toggle sync reg rc:%d\n", rc);
 		return rc;
@@ -943,7 +1007,7 @@ static u32 wled_values(const struct wled_var_cfg *cfg, u32 idx)
 	return idx;
 }
 
-static int wled_configure(struct wled *wled, int version)
+static int wled_configure(struct wled *wled)
 {
 	struct wled_config *cfg = &wled->cfg;
 	struct device *dev = wled->dev;
@@ -1027,12 +1091,13 @@ static int wled_configure(struct wled *wled, int version)
 	if (rc)
 		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
 
-	switch (version) {
+	switch (wled->version) {
 	case 3:
 		u32_opts = wled3_opts;
 		size = ARRAY_SIZE(wled3_opts);
 		*cfg = wled3_config_defaults;
 		wled->wled_set_brightness = wled3_set_brightness;
+		wled->wled_sync_toggle = wled3_sync_toggle;
 		wled->max_string_count = 3;
 		wled->sink_addr = wled->ctrl_addr;
 		break;
@@ -1042,6 +1107,11 @@ static int wled_configure(struct wled *wled, int version)
 		size = ARRAY_SIZE(wled4_opts);
 		*cfg = wled4_config_defaults;
 		wled->wled_set_brightness = wled4_set_brightness;
+		wled->wled_sync_toggle = wled3_sync_toggle;
+		wled->wled_cabc_config = wled4_cabc_config;
+		wled->wled_ovp_delay = wled4_ovp_delay;
+		wled->wled_auto_detection_required =
+					wled4_auto_detection_required;
 		wled->max_string_count = 4;
 
 		prop_addr = of_get_address(dev->of_node, 1, NULL, NULL);
@@ -1178,7 +1248,6 @@ static int wled_probe(struct platform_device *pdev)
 	struct backlight_device *bl;
 	struct wled *wled;
 	struct regmap *regmap;
-	int version;
 	u32 val;
 	int rc;
 
@@ -1195,18 +1264,18 @@ static int wled_probe(struct platform_device *pdev)
 	wled->regmap = regmap;
 	wled->dev = &pdev->dev;
 
-	version = (uintptr_t)of_device_get_match_data(&pdev->dev);
-	if (!version) {
+	wled->version = (uintptr_t)of_device_get_match_data(&pdev->dev);
+	if (!wled->version) {
 		dev_err(&pdev->dev, "Unknown device version\n");
 		return -ENODEV;
 	}
 
 	mutex_init(&wled->lock);
-	rc = wled_configure(wled, version);
+	rc = wled_configure(wled);
 	if (rc)
 		return rc;
 
-	switch (version) {
+	switch (wled->version) {
 	case 3:
 		wled->cfg.auto_detection_enabled = false;
 		rc = wled3_setup(wled);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
