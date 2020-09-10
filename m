Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258EF264E4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 21:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725803AbgIJTJR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 15:09:17 -0400
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:52358
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727010AbgIJTHg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 15:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599764855;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=eQH7o7PXtVcH2u0LzPMMuSouoeMlwxtes+oM1giaHZU=;
        b=AQasa/a9TuH4iOx5a7SxMMlPcATPW5yzLnzXl6m4NQnCm25uu3HD5d8wL4tutysh
        ZZ4pjYWiJxnPUre8b1YCahsxkjDkOZ3wA5vKjW3qZ1kqESG1+N6MiIQwjqtlI6ZihPA
        nNEf321+9Ondk6RNu1LHSAjQLualV8vgQ2kB3feQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599764855;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=eQH7o7PXtVcH2u0LzPMMuSouoeMlwxtes+oM1giaHZU=;
        b=f9ZVqoSoufEif35pVCS9p2Aq6J4nldxQbd4x3BL/LGzNVcNloYviMapIHo9UXF/b
        g1Z4gndXEtDB+IzreCHsKRfuY0I9JgdjYvDHbdQQJeEL3Dn3J+vJkASXg8rU6j8i3c2
        dsT/ZzuhVfECllwIdHCZZzWPmTi9rmczfCrrThr4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4EAA4C433FF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        cychiang@chromium.org, khsieh@codeaurora.org,
        vsujithk@codeaurora.org, rohitkr@codeaurora.org
Subject: [PATCH v5 3/5] drm/msm/dp: add hook_plugged_cb hdmi-codec op for MSM DP driver
Date:   Thu, 10 Sep 2020 19:07:35 +0000
Message-ID: <01010174796a7c19-83331771-deb6-424c-99ae-5b332eadee5d-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200910190718.13929-1-abhinavk@codeaurora.org>
References: <20200910190718.13929-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.09.10-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
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
index 5ffb9bf1af08..43e5240a87ad 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -776,6 +776,13 @@ static int dp_display_prepare(struct msm_dp *dp)
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
@@ -806,6 +813,8 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 		dp->audio->lane_count = dp->link->link_params.num_lanes;
 	}
 
+	/* signal the connect event late to synchronize video and display */
+	dp_display_handle_plugged_change(dp_display, true);
 	return 0;
 }
 
@@ -828,6 +837,19 @@ static int dp_display_unprepare(struct msm_dp *dp)
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
@@ -1322,6 +1344,8 @@ int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 
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

