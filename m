Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC5D243251
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 03:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgHMB4A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 21:56:00 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:52645 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726670AbgHMB4A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 21:56:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597283758; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ZuFOsYq1Bpf02zASDjBgNJvDBpzoxFtjk2PdtP2NNeo=; b=whrzdh8Y3OkCltKfLMYdlvhYUILpOTPm0SUvDFh0P1wLhYo9rjyf1UdAvuZpBTRGd5Pi7mUd
 3N53beoWj2yzdqTpqAPFWRoB7VU3ZKEfqlqjDXf/4ycXEK9mvDdW207fM3sSYhBABs1p5npP
 aAeuMliu5L1oppMr1F4KwnsTI38=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f349d77c85a1092b088a941 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 Aug 2020 01:55:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BC655C433CB; Thu, 13 Aug 2020 01:55:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C5353C433C9;
        Thu, 13 Aug 2020 01:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C5353C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        cychiang@chromium.org, khsieh@codeaurora.org,
        vsujithk@codeaurora.org, rohitkr@codeaurora.org
Subject: [PATCH 3/4] drm/msm/dp: add hook_plugged_cb hdmi-codec op for MSM DP driver
Date:   Wed, 12 Aug 2020 18:54:38 -0700
Message-Id: <20200813015439.4174-4-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200813015439.4174-1-abhinavk@codeaurora.org>
References: <20200813015439.4174-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the hook_plugged_cb op for the MSM DP driver to signal connect
and disconnect events to the hdmi-codec driver which in-turn shall
notify the audio subsystem to start a new or teardown an existing
session.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 25 ++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.c | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  7 +++++++
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 75556eea1059..11fa5ad7a801 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -10,7 +10,6 @@
 
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_edid.h>
-#include <sound/hdmi-codec.h>
 
 #include "dp_catalog.h"
 #include "dp_audio.h"
@@ -442,6 +441,29 @@ static struct dp_audio_private *dp_audio_get_data(struct platform_device *pdev)
 	return container_of(dp_audio, struct dp_audio_private, dp_audio);
 }
 
+static int dp_audio_hook_plugged_cb(struct device *dev, void *data,
+		hdmi_codec_plugged_cb fn,
+		struct device *codec_dev)
+{
+
+	struct platform_device *pdev;
+	struct msm_dp *dp_display;
+
+	pdev = to_platform_device(dev);
+	if (!pdev) {
+		pr_err("invalid input\n");
+		return -ENODEV;
+	}
+
+	dp_display = platform_get_drvdata(pdev);
+	if (!dp_display) {
+		pr_err("invalid input\n");
+		return -ENODEV;
+	}
+
+	return dp_display_set_plugged_cb(dp_display, fn, codec_dev);
+}
+
 static int dp_audio_get_eld(struct device *dev,
 	void *data, uint8_t *buf, size_t len)
 {
@@ -513,6 +535,7 @@ static const struct hdmi_codec_ops dp_audio_codec_ops = {
 	.hw_params = dp_audio_hw_params,
 	.audio_shutdown = dp_audio_shutdown,
 	.get_eld = dp_audio_get_eld,
+	.hook_plugged_cb = dp_audio_hook_plugged_cb,
 };
 
 static struct hdmi_codec_pdata codec_data = {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0e3e13337d23..302cf7ea65d7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -711,6 +711,13 @@ static int dp_display_prepare(struct msm_dp *dp)
 	return 0;
 }
 
+static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
+		bool plugged)
+{
+	if (dp_display->plugged_cb && dp_display->codec_dev)
+		dp_display->plugged_cb(dp_display->codec_dev, plugged);
+}
+
 static int dp_display_enable(struct dp_display_private *dp, u32 data)
 {
 	int rc = 0;
@@ -741,6 +748,8 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 		dp->audio->lane_count = dp->link->link_params.num_lanes;
 	}
 
+	/* signal the connect event late to synchronize video and display */
+	dp_display_handle_plugged_change(dp_display, true);
 	return 0;
 }
 
@@ -750,6 +759,9 @@ static int dp_display_pre_disable(struct msm_dp *dp_display)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
+	/* signal the disconnect event early to ensure proper teardown */
+	dp_display_handle_plugged_change(dp_display, false);
+
 	return 0;
 }
 
@@ -772,6 +784,19 @@ static int dp_display_unprepare(struct msm_dp *dp)
 	return 0;
 }
 
+int dp_display_set_plugged_cb(struct msm_dp *dp_display,
+		hdmi_codec_plugged_cb fn, struct device *codec_dev)
+{
+	bool plugged;
+
+	dp_display->plugged_cb = fn;
+	dp_display->codec_dev = codec_dev;
+	plugged = dp_display->is_connected;
+	dp_display_handle_plugged_change(dp_display, plugged);
+
+	return 0;
+}
+
 int dp_display_validate_mode(struct msm_dp *dp, u32 mode_pclk_khz)
 {
 	const u32 num_components = 3, default_bpp = 24;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 1e0d2b9d9a2a..5020faf360db 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -7,18 +7,25 @@
 #define _DP_DISPLAY_H_
 
 #include "dp_panel.h"
+#include <sound/hdmi-codec.h>
 
 struct msm_dp {
 	struct drm_device *drm_dev;
+	struct device *codec_dev;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	bool is_connected;
+
+	hdmi_codec_plugged_cb plugged_cb;
+
 	u32 max_pclk_khz;
 
 	u32 max_dp_lanes;
 	struct dp_audio *dp_audio;
 };
 
+int dp_display_set_plugged_cb(struct msm_dp *dp_display,
+		hdmi_codec_plugged_cb fn, struct device *codec_dev);
 int dp_display_validate_mode(struct msm_dp *dp_display, u32 mode_pclk_khz);
 int dp_display_get_modes(struct msm_dp *dp_display,
 		struct dp_display_mode *dp_mode);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

