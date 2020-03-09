Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB0AE17E120
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 14:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgCIN1M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 09:27:12 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:27369 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726702AbgCIN1M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 09:27:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583760431; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=68EsyXGUzdLIawLyIVCLBm8Bb1s9J5ol+wgvzvuPly0=; b=i10TwGh1dfBwi8/MulioWDoSuFuIM6jjcIAgSabXEzx/yOrw8lJ2yxsjyNeS90qIZkj6s2Xe
 ufeWCT9vE7Gw/G2FS/Qbzi5v6SSYSH1o2+giAwVbOX8L9kU+isMIxP9h/NRng+p6wadW/Zs9
 /Rs7iSa/xv9TMBEvYVGhGWRSAFM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e664426.7ff793b16618-smtp-out-n05;
 Mon, 09 Mar 2020 13:27:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4085AC433CB; Mon,  9 Mar 2020 13:26:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 91D1BC433CB;
        Mon,  9 Mar 2020 13:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 91D1BC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-fbdev@vger.kernel.org
Cc:     Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V3 4/4] backlight: qcom-wled: Update auto calibration support for WLED5
Date:   Mon,  9 Mar 2020 18:56:02 +0530
Message-Id: <1583760362-26978-5-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583760362-26978-1-git-send-email-kgunda@codeaurora.org>
References: <1583760362-26978-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, auto calibration logic checks only for OVP_FAULT bit
to be set in FAULT_STATUS register to detect OVP fault. This works
well for WLED4 type. However, WLED5 type has OVP_PRE_ALARM bit
which can indicate a potential OVP fault. Use that as well for
detecting OVP fault and run auto calibration to fix the sink
configuration.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
 drivers/video/backlight/qcom-wled.c | 90 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index edbbcb2..5079f1f 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -27,6 +27,7 @@
 #define  WLED3_CTRL_REG_ILIM_FAULT_BIT			BIT(0)
 #define  WLED3_CTRL_REG_OVP_FAULT_BIT			BIT(1)
 #define  WLED4_CTRL_REG_SC_FAULT_BIT			BIT(2)
+#define  WLED5_CTRL_REG_OVP_PRE_ALARM_BIT		BIT(4)
 
 #define WLED3_CTRL_REG_INT_RT_STS			0x10
 #define  WLED3_CTRL_REG_OVP_FAULT_STATUS		BIT(1)
@@ -104,6 +105,10 @@
 
 #define WLED4_SINK_REG_BRIGHT(n)			(0x57 + (n * 0x10))
 
+/* WLED5 specific control registers */
+#define WLED5_CTRL_REG_OVP_INT_CTL			0x5f
+#define  WLED5_CTRL_REG_OVP_INT_TIMER_MASK		GENMASK(2, 0)
+
 /* WLED5 specific sink registers */
 #define WLED5_SINK_REG_MOD_A_EN				0x50
 #define WLED5_SINK_REG_MOD_B_EN				0x60
@@ -394,11 +399,67 @@ static int wled4_ovp_fault_status(struct wled *wled, bool *fault_set)
 	return rc;
 }
 
+static int wled5_ovp_fault_status(struct wled *wled, bool *fault_set)
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
+	if (fault_sts & (WLED3_CTRL_REG_OVP_FAULT_BIT |
+			       WLED5_CTRL_REG_OVP_PRE_ALARM_BIT))
+		*fault_set = true;
+
+	if (*fault_set)
+		dev_dbg(wled->dev, "WLED OVP fault detected, int_rt_sts=0x%x fault_sts=0x%x\n",
+			int_rt_sts, fault_sts);
+
+	return rc;
+}
+
 static int wled4_ovp_delay(struct wled *wled)
 {
 	return WLED_SOFT_START_DLY_US;
 }
 
+static int wled5_ovp_delay(struct wled *wled)
+{
+	int rc, delay_us;
+	u32 val;
+	u8 ovp_timer_ms[8] = {1, 2, 4, 8, 12, 16, 20, 24};
+
+	/* For WLED5, get the delay based on OVP timer */
+	rc = regmap_read(wled->regmap, wled->ctrl_addr +
+			 WLED5_CTRL_REG_OVP_INT_CTL, &val);
+	if (rc < 0)
+		delay_us =
+		ovp_timer_ms[val & WLED5_CTRL_REG_OVP_INT_TIMER_MASK] * 1000;
+	else
+		delay_us = 2 * WLED_SOFT_START_DLY_US;
+
+	dev_dbg(wled->dev, "delay_time_us: %d\n", *delay_us);
+
+	return delay_us;
+}
+
 static int wled_update_status(struct backlight_device *bl)
 {
 	struct wled *wled = bl_get_data(bl);
@@ -736,9 +797,32 @@ static bool wled_auto_detection_required(struct wled *wled)
 	if (!wled->auto_detection_ovp_count) {
 		wled->start_ovp_fault_time = ktime_get();
 		wled->auto_detection_ovp_count++;
-	} else {
+		return false;
+	}
+
+	if (wled->version == 5) {
+		/*
+		 * WLED5 has OVP fault density interrupt configuration i.e. to
+		 * count the number of OVP alarms for a certain duration before
+		 * triggering OVP fault interrupt. By default, number of OVP
+		 * fault events counted before an interrupt is fired is 32 and
+		 * the time interval is 12 ms. If we see more than one OVP fault
+		 * interrupt, then that should qualify for a real OVP fault
+		 * condition to run auto calibration algorithm.
+		 */
+
+		if (wled->auto_detection_ovp_count > 1) {
+			elapsed_time_us = ktime_us_delta(ktime_get(),
+					wled->start_ovp_fault_time);
+			wled->auto_detection_ovp_count = 0;
+			dev_dbg(wled->dev, "Elapsed time: %lld us\n",
+				elapsed_time_us);
+			return true;
+		}
+		wled->auto_detection_ovp_count++;
+	} else if (wled->version == 4) {
 		elapsed_time_us = ktime_us_delta(ktime_get(),
-						 wled->start_ovp_fault_time);
+					 wled->start_ovp_fault_time);
 		if (elapsed_time_us > WLED_AUTO_DETECT_CNT_DLY_US)
 			wled->auto_detection_ovp_count = 0;
 		else
@@ -1424,6 +1508,8 @@ static int wled_configure(struct wled *wled)
 		wled->wled_set_brightness = wled5_set_brightness;
 		wled->wled_sync_toggle = wled5_sync_toggle;
 		wled->cabc_config = wled5_cabc_config;
+		wled->wled_ovp_fault_status = wled5_ovp_fault_status;
+		wled->wled_ovp_delay = wled5_ovp_delay;
 		wled->max_string_count = 4;
 
 		prop_addr = of_get_address(dev->of_node, 1, NULL, NULL);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
