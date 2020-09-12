Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDED267C5C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Sep 2020 22:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgILUuH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Sep 2020 16:50:07 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55103 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725923AbgILUuD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Sep 2020 16:50:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599943802; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=bSaBKcd9zAk+4I6yRXTmsSpeKn7+kwQwPjR6y6SbNJc=; b=pFbyFke/8FjuXC+3wAnBlRKUFP3rFk4uMbz1nAmEoQywC6fFEw5DY7BFxz2FEF5goHc0qPG1
 CFd64lwiFVD6f481N6uZGfIpH4D2Wm+U8Zdhbg9w+RYXRD3O21lBmU/lZACZqn4RZ9xGMbqH
 8JTFmTTRc08PSx6nITlg9yBhLvk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f5d346f25e1ee7586233290 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 12 Sep 2020 20:49:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E1F6CC43395; Sat, 12 Sep 2020 20:49:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1C164C43387;
        Sat, 12 Sep 2020 20:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1C164C43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        tanmay@codeaurora.org, cychiang@chromium.org,
        khsieh@codeaurora.org, vsujithk@codeaurora.org,
        rohitkr@codeaurora.org
Subject: [PATCH v6 3/5] drm/msm/dp: add hook_plugged_cb hdmi-codec op for MSM DP driver
Date:   Sat, 12 Sep 2020 13:49:30 -0700
Message-Id: <20200912204932.21232-4-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200912204932.21232-1-abhinavk@codeaurora.org>
References: <20200912204932.21232-1-abhinavk@codeaurora.org>
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

Changes in v2: none
Changes in v3: none
Changes in v4: rebase on top of latest patchset of dependency
Changes in v5: rebase on top of latest patchset of dependency
Changes in v6: none

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 25 ++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  7 +++++++
 3 files changed, 55 insertions(+), 1 deletion(-)

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
index e6dca0df4f87..f88ebfdf08bb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -780,6 +780,13 @@ static int dp_display_prepare(struct msm_dp *dp)
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
@@ -812,6 +819,8 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 		dp->audio->lane_count = dp->link->link_params.num_lanes;
 	}
 
+	/* signal the connect event late to synchronize video and display */
+	dp_display_handle_plugged_change(dp_display, true);
 	return 0;
 }
 
@@ -834,6 +843,19 @@ static int dp_display_unprepare(struct msm_dp *dp)
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
@@ -1350,6 +1372,8 @@ int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	dp_ctrl_push_idle(dp_display->ctrl);
 
+	dp_display_handle_plugged_change(dp, false);
+
 	return 0;
 }
 
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

