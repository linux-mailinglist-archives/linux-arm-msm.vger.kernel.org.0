Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F84E4467E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 18:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234296AbhKERbO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 13:31:14 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:38836 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbhKERbN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 13:31:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636133314; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=7R79BvDTeO6LbJs7f5vtqHWLrzxOGSrgoeB4iEkArII=; b=HXArl13sepGchCV2zLIvuJdDQKbeeDjaweDjZJmTyav5YlHvGUuhKdsrndH4pSXRm6SCiB5x
 G2uWacIO1f+sx8v0SsFosNK6LDdHvc+d6bKqHW94SBAwXJxqVcVbufcNuWHqi5+OftCD73fZ
 rB9hUkqJblDnLh+K4nXt/aN3tGw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 618569b5aea46563ff2f7511 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Nov 2021 17:28:21
 GMT
Sender: quic_khsieh=quicinc.com@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2C1FAC4360C; Fri,  5 Nov 2021 17:28:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 96240C43460;
        Fri,  5 Nov 2021 17:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 96240C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=quicinc.com
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, dmitry.baryshkov@linaro.org,
        bjorn.andersson@linaro.org
Cc:     quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kuogee Hsieh <khsieh@codeaurora.org>
Subject: [PATCH] drm/msm/dp: do not initialize phy until plugin interrupt received
Date:   Fri,  5 Nov 2021 10:28:11 -0700
Message-Id: <1636133291-10551-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Kuogee Hsieh <khsieh@codeaurora.org>

Combo phy supports both USB and DP simultaneously. There may has a
possible conflict during phy initialization phase between USB and
DP driver which may cause USB phy timeout when USB tries to power
up its phy. This patch has the DP driver not initialize its phy
during DP driver initialization phase. Instead DP driver only enable
required regulators and clocks so that it is able to receive HPD
interrupts after completion of initialization phase. DP driver will
initialize its phy when HPD plug-in interrupt received.
This patch also provides a positive side effects which balance regulator
enable count since regulator only enabled at initialize phase and resume
and disabled at followed suspend.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 97 ++++++++++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  9 ++--
 drivers/gpu/drm/msm/dp/dp_display.c | 71 ++++++++++++++++++++-------
 3 files changed, 119 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 7ec155d..e0e5dc9 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1364,7 +1364,41 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
-int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
+void dp_ctrl_irq_enable(struct dp_ctrl *dp_ctrl, bool flip)
+{
+	struct dp_ctrl_private *ctrl;
+
+	if (!dp_ctrl) {
+		DRM_ERROR("Invalid input data\n");
+		return;
+	}
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	ctrl->dp_ctrl.orientation = flip;
+
+	dp_catalog_ctrl_reset(ctrl->catalog);
+
+	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
+}
+
+void dp_ctrl_irq_disable(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl;
+
+	if (!dp_ctrl) {
+		DRM_ERROR("Invalid input data\n");
+		return;
+	}
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	dp_catalog_ctrl_reset(ctrl->catalog);
+
+	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
+}
+
+void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
 	struct dp_io *dp_io;
@@ -1372,34 +1406,24 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
 
 	if (!dp_ctrl) {
 		DRM_ERROR("Invalid input data\n");
-		return -EINVAL;
+		return;
 	}
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 	dp_io = &ctrl->parser->io;
 	phy = dp_io->phy;
 
-	ctrl->dp_ctrl.orientation = flip;
-
-	if (reset)
-		dp_catalog_ctrl_reset(ctrl->catalog);
+	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
+		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
 
-	DRM_DEBUG_DP("flip=%d\n", flip);
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_init(phy);
-	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
 
-	return 0;
+	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
+		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
 }
 
-/**
- * dp_ctrl_host_deinit() - Uninitialize DP controller
- * @dp_ctrl: Display Port Driver data
- *
- * Perform required steps to uninitialize DP controller
- * and its resources.
- */
-void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
+void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
 	struct dp_io *dp_io;
@@ -1414,10 +1438,14 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
 	dp_io = &ctrl->parser->io;
 	phy = dp_io->phy;
 
-	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
+	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
+		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
+
+	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_exit(phy);
 
-	DRM_DEBUG_DP("Host deinitialized successfully\n");
+	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
+		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
 }
 
 static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
@@ -1895,8 +1923,14 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 		return ret;
 	}
 
+	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
+		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
+
 	phy_power_off(phy);
 
+	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
+		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
+
 	/* aux channel down, reinit phy */
 	phy_exit(phy);
 	phy_init(phy);
@@ -1905,23 +1939,6 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	return ret;
 }
 
-void dp_ctrl_off_phy(struct dp_ctrl *dp_ctrl)
-{
-	struct dp_ctrl_private *ctrl;
-	struct dp_io *dp_io;
-	struct phy *phy;
-
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-	dp_io = &ctrl->parser->io;
-	phy = dp_io->phy;
-
-	dp_catalog_ctrl_reset(ctrl->catalog);
-
-	phy_exit(phy);
-
-	DRM_DEBUG_DP("DP off phy done\n");
-}
-
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
@@ -1949,10 +1966,14 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
 	}
 
+	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
+		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
+
 	phy_power_off(phy);
-	phy_exit(phy);
 
-	DRM_DEBUG_DP("DP off done\n");
+	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
+		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 2363a2d..c1e4b1b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,12 +19,9 @@ struct dp_ctrl {
 	u32 pixel_rate;
 };
 
-int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset);
-void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
-void dp_ctrl_off_phy(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
@@ -34,4 +31,10 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_power *power, struct dp_catalog *catalog,
 			struct dp_parser *parser);
 
+void dp_ctrl_irq_enable(struct dp_ctrl *dp_ctrl, bool flip);
+void dp_ctrl_irq_disable(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
+
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e41dd40..17d2d5c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -84,6 +84,7 @@ struct dp_display_private {
 
 	/* state variables */
 	bool core_initialized;
+	bool phy_initialized;
 	bool hpd_irq_on;
 	bool audio_supported;
 
@@ -387,7 +388,7 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	return rc;
 }
 
-static void dp_display_host_init(struct dp_display_private *dp, int reset)
+static void dp_display_host_init(struct dp_display_private *dp)
 {
 	bool flip = false;
 
@@ -400,12 +401,37 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
 	if (dp->usbpd->orientation == ORIENTATION_CC2)
 		flip = true;
 
-	dp_power_init(dp->power, flip);
-	dp_ctrl_host_init(dp->ctrl, flip, reset);
+	dp_power_init(dp->power, false);
+	dp_ctrl_irq_enable(dp->ctrl, flip);
+
+	if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP)
+		dp_ctrl_phy_init(dp->ctrl);
+
 	dp_aux_init(dp->aux);
 	dp->core_initialized = true;
 }
 
+static void dp_display_host_phy_init(struct dp_display_private *dp)
+{
+	DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
+			dp->core_initialized, dp->phy_initialized);
+	if (dp->phy_initialized == false) {
+		dp_ctrl_phy_init(dp->ctrl);
+		dp->phy_initialized = true;
+	}
+}
+
+static void dp_display_host_phy_exit(struct dp_display_private *dp)
+{
+	DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
+			dp->core_initialized, dp->phy_initialized);
+
+	if (dp->phy_initialized == true) {
+		dp_ctrl_phy_exit(dp->ctrl);
+		dp->phy_initialized = false;
+	}
+}
+
 static void dp_display_host_deinit(struct dp_display_private *dp)
 {
 	if (!dp->core_initialized) {
@@ -413,7 +439,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 		return;
 	}
 
-	dp_ctrl_host_deinit(dp->ctrl);
+	dp_ctrl_irq_disable(dp->ctrl);
 	dp_aux_deinit(dp->aux);
 	dp_power_deinit(dp->power);
 
@@ -424,7 +450,7 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 {
 	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 
-	dp_display_host_init(dp, true);
+	dp_display_host_phy_init(dp);
 
 	return dp_display_process_hpd_high(dp);
 }
@@ -551,7 +577,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 		dp->hpd_state = ST_DISCONNECTED;
 
 		if (ret == -ECONNRESET) { /* cable unplugged */
-			dp->core_initialized = false;
+			dp->phy_initialized = false;
 		}
 
 	} else {
@@ -623,9 +649,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	if (state == ST_DISCONNECTED) {
 		/* triggered by irq_hdp with sink_count = 0 */
 		if (dp->link->sink_count == 0) {
-			dp_ctrl_off_phy(dp->ctrl);
+			dp_display_host_phy_exit(dp);
 			hpd->hpd_high = 0;
-			dp->core_initialized = false;
 		}
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -716,7 +741,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 
 	ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
 	if (ret == -ECONNRESET) { /* cable unplugged */
-		dp->core_initialized = false;
+		dp->phy_initialized = false;
 	}
 	DRM_DEBUG_DP("hpd_state=%d\n", state);
 
@@ -918,12 +943,19 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 
 	dp_display->audio_enabled = false;
 
-	/* triggered by irq_hpd with sink_count = 0 */
 	if (dp->link->sink_count == 0) {
+		/*
+		 * irq_hpd with sink_count = 0
+		 * hdmi unplugged out of dongle
+		 */
 		dp_ctrl_off_link_stream(dp->ctrl);
 	} else {
+		/*
+		 * unplugged interrupt
+		 * dongle unplugged out of DUT
+		 */
 		dp_ctrl_off(dp->ctrl);
-		dp->core_initialized = false;
+		dp_display_host_phy_exit(dp);
 	}
 
 	dp_power_panel_on(dp->power, false);
@@ -1059,7 +1091,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 static void dp_display_config_hpd(struct dp_display_private *dp)
 {
 
-	dp_display_host_init(dp, true);
+	dp_display_host_init(dp);
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
 	/* Enable interrupt first time
@@ -1338,7 +1370,7 @@ static int dp_pm_resume(struct device *dev)
 	dp->hpd_state = ST_DISCONNECTED;
 
 	/* turn on dp ctrl/phy */
-	dp_display_host_init(dp, true);
+	dp_display_host_init(dp);
 
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
@@ -1346,12 +1378,15 @@ static int dp_pm_resume(struct device *dev)
 	 * set sink to normal operation mode -- D0
 	 * before dpcd read
 	 */
-	dp_link_psm_config(dp->link, &dp->panel->link_info, false);
-
 	if (dp_catalog_link_is_connected(dp->catalog)) {
+		dp_display_host_phy_init(dp);
+
+		dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 		sink_count = drm_dp_read_sink_count(dp->aux);
 		if (sink_count < 0)
 			sink_count = 0;
+
+		dp_display_host_phy_exit(dp);
 	}
 
 	dp->link->sink_count = sink_count;
@@ -1399,6 +1434,8 @@ static int dp_pm_suspend(struct device *dev)
 		dp_display_host_deinit(dp);
 	}
 
+	dp_display_host_phy_exit(dp);
+
 	dp->hpd_state = ST_SUSPENDED;
 
 	/* host_init will be called at pm_resume */
@@ -1473,7 +1510,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 		enable_irq(dp->irq);
 		dp_hpd_connect(dp->usbpd, true);
 	} else {
-		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, dp->id * 10);
+		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
 	}
 }
 
@@ -1567,7 +1604,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 	state =  dp_display->hpd_state;
 
 	if (state == ST_DISPLAY_OFF)
-		dp_display_host_init(dp_display, true);
+		dp_display_host_phy_init(dp_display);
 
 	dp_display_enable(dp_display, 0);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

