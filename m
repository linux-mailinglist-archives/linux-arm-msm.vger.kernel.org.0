Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D415267C5D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Sep 2020 22:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbgILUuM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Sep 2020 16:50:12 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55103 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbgILUuK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Sep 2020 16:50:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599943809; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=xSye/SqzxL/PeyJXSgkQupOQvi1c8wwglx9XUME2CcQ=; b=TvDx3aHf+C2iD1F3gw1han3mjVleLIjiw3Pr+su2YBg02Xc3+cPtgXmWmrFOONTznnchUbO6
 DGByjFoq5K0q0cazfnMyVaXESGAvJA0OPyC30JsySU6ag9nxGEUtV9Lx8+HKigOU2hfRKAru
 zUiUM6lt8vJAB0ssnKxsIDpmr4w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f5d34794ba82a82fdc6ffd1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 12 Sep 2020 20:50:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0418FC433FF; Sat, 12 Sep 2020 20:50:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D37AEC43387;
        Sat, 12 Sep 2020 20:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D37AEC43387
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
Subject: [PATCH v6 5/5] drm/msm/dp: wait for audio notification before disabling clocks
Date:   Sat, 12 Sep 2020 13:49:32 -0700
Message-Id: <20200912204932.21232-6-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200912204932.21232-1-abhinavk@codeaurora.org>
References: <20200912204932.21232-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the current implementation, there is a very small window for
the audio side to safely signal the hdmi_code_shutdown() before
the clocks are disabled.

Add some synchronization between the DP display and DP audio module
to safely disable the clocks to avoid unclocked access from audio
side.

In addition, audio side can open the sound card even if DP monitor
is not connected. Avoid programming hardware registers in this case
and bail out early.

Changes in v4:
- removed some leftover prints

Changes in v5:
- fix crash when user tries to play audio in suspended
  state

Changes in v6:
- rebased on top of latest patchset of dependency

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 32 +++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.c | 40 +++++++++++++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_display.h |  3 +++
 3 files changed, 70 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 11fa5ad7a801..82a8673ab8da 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -497,8 +497,23 @@ int dp_audio_hw_params(struct device *dev,
 	int rc = 0;
 	struct dp_audio_private *audio;
 	struct platform_device *pdev;
+	struct msm_dp *dp_display;
 
 	pdev = to_platform_device(dev);
+	dp_display = platform_get_drvdata(pdev);
+
+	/*
+	 * there could be cases where sound card can be opened even
+	 * before OR even when DP is not connected . This can cause
+	 * unclocked access as the audio subsystem relies on the DP
+	 * driver to maintain the correct state of clocks. To protect
+	 * such cases check for connection status and bail out if not
+	 * connected.
+	 */
+	if (!dp_display->power_on) {
+		rc = -EINVAL;
+		goto end;
+	}
 
 	audio = dp_audio_get_data(pdev);
 	if (IS_ERR(audio)) {
@@ -512,6 +527,8 @@ int dp_audio_hw_params(struct device *dev,
 	dp_audio_setup_acr(audio);
 	dp_audio_safe_to_exit_level(audio);
 	dp_audio_enable(audio, true);
+	dp_display->audio_enabled = true;
+
 end:
 	return rc;
 }
@@ -520,15 +537,30 @@ static void dp_audio_shutdown(struct device *dev, void *data)
 {
 	struct dp_audio_private *audio;
 	struct platform_device *pdev;
+	struct msm_dp *dp_display;
 
 	pdev = to_platform_device(dev);
+	dp_display = platform_get_drvdata(pdev);
 	audio = dp_audio_get_data(pdev);
 	if (IS_ERR(audio)) {
 		DRM_ERROR("failed to get audio data\n");
 		return;
 	}
 
+	/*
+	 * if audio was not enabled there is no need
+	 * to execute the shutdown and we can bail out early.
+	 * This also makes sure that we dont cause an unclocked
+	 * access when audio subsystem calls this without DP being
+	 * connected. is_connected cannot be used here as its set
+	 * to false earlier than this call
+	 */
+	if (!dp_display->audio_enabled)
+		return;
+
 	dp_audio_enable(audio, false);
+	/* signal the dp display to safely shutdown clocks */
+	dp_display_signal_audio_complete(dp_display);
 }
 
 static const struct hdmi_codec_ops dp_audio_codec_ops = {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e3ad8793fd3f..857ae04e48ef 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -82,7 +82,6 @@ struct dp_display_private {
 
 	/* state variables */
 	bool core_initialized;
-	bool power_on;
 	bool hpd_irq_on;
 	bool audio_supported;
 
@@ -104,6 +103,9 @@ struct dp_display_private {
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
 
+	/* wait for audio signaling */
+	struct completion audio_comp;
+
 	/* event related only access by event thread */
 	struct mutex event_mutex;
 	wait_queue_head_t event_q;
@@ -177,6 +179,15 @@ static int dp_del_event(struct dp_display_private *dp_priv, u32 event)
 	return 0;
 }
 
+void dp_display_signal_audio_complete(struct msm_dp *dp_display)
+{
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	complete_all(&dp->audio_comp);
+}
+
 static int dp_display_bind(struct device *dev, struct device *master,
 			   void *data)
 {
@@ -599,6 +610,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 
 	/* signal the disconnect event early to ensure proper teardown */
 	dp_display_handle_plugged_change(g_dp_display, false);
+	reinit_completion(&dp->audio_comp);
 
 	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK |
 					DP_DP_IRQ_HPD_INT_MASK, true);
@@ -793,15 +805,18 @@ static int dp_display_prepare(struct msm_dp *dp)
 static int dp_display_enable(struct dp_display_private *dp, u32 data)
 {
 	int rc = 0;
+	struct msm_dp *dp_display;
 
-	if (dp->power_on) {
+	dp_display = g_dp_display;
+
+	if (dp_display->power_on) {
 		DRM_DEBUG_DP("Link already setup, return\n");
 		return 0;
 	}
 
 	rc = dp_ctrl_on_stream(dp->ctrl);
 	if (!rc)
-		dp->power_on = true;
+		dp_display->power_on = true;
 
 	/* complete resuem_comp regardless it is armed or not */
 	complete(&dp->resume_comp);
@@ -829,14 +844,27 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 
 static int dp_display_disable(struct dp_display_private *dp, u32 data)
 {
-	if (!dp->power_on)
+	struct msm_dp *dp_display;
+
+	dp_display = g_dp_display;
+
+	if (!dp_display->power_on)
 		return -EINVAL;
 
+	/* wait only if audio was enabled */
+	if (dp_display->audio_enabled) {
+		if (!wait_for_completion_timeout(&dp->audio_comp,
+				HZ * 5))
+			DRM_ERROR("audio comp timeout\n");
+	}
+
+	dp_display->audio_enabled = false;
+
 	dp_ctrl_off(dp->ctrl);
 
 	dp->core_initialized = false;
 
-	dp->power_on = false;
+	dp_display->power_on = false;
 
 	return 0;
 }
@@ -1152,6 +1180,8 @@ static int dp_display_probe(struct platform_device *pdev)
 	/* Store DP audio handle inside DP display */
 	g_dp_display->dp_audio = dp->audio;
 
+	init_completion(&dp->audio_comp);
+
 	platform_set_drvdata(pdev, g_dp_display);
 
 	rc = component_add(&pdev->dev, &dp_display_comp_ops);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 5020faf360db..8b78b40bbd6c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -15,6 +15,8 @@ struct msm_dp {
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	bool is_connected;
+	bool audio_enabled;
+	bool power_on;
 
 	hdmi_codec_plugged_cb plugged_cb;
 
@@ -32,6 +34,7 @@ int dp_display_get_modes(struct msm_dp *dp_display,
 int dp_display_request_irq(struct msm_dp *dp_display);
 bool dp_display_check_video_test(struct msm_dp *dp_display);
 int dp_display_get_test_bpp(struct msm_dp *dp_display);
+void dp_display_signal_audio_complete(struct msm_dp *dp_display);
 
 void __init msm_dp_pll_driver_register(void);
 void __exit msm_dp_pll_driver_unregister(void);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

