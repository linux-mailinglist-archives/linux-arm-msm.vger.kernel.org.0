Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EEB248E138
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jan 2022 00:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiAMXxy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jan 2022 18:53:54 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:41664 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235840AbiAMXxw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jan 2022 18:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1642118033; x=1673654033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=9d1Mn2eAGZpT2MmhsOgRBvH3l8yTcwTa5c1EZitcBj0=;
  b=fkJcC2H4OuXOl/qqQlk7XNyNLr3BbQQqQFWlOSeQaUut+XpMLY5xEtof
   l6k4nAA709tnvaOut6stJKuwsuxUJ981zgS77WiDCI2+rUqFszv7JCmUI
   j5o4AbdD5JGbwCNcf9LhSAq8n4nZqx73GPGvyPvyqd5PTA7lrgWDjWbnY
   w=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 13 Jan 2022 15:53:52 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 15:53:51 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 13 Jan 2022 15:53:51 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 13 Jan 2022 15:53:50 -0800
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
        <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <aravindh@codeaurora.org>,
        <quic_sbillaka@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v13 1/4] drm/msm/dp: do not initialize phy until plugin interrupt received
Date:   Thu, 13 Jan 2022 15:53:36 -0800
Message-ID: <1642118019-18673-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642118019-18673-1-git-send-email-quic_khsieh@quicinc.com>
References: <1642118019-18673-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Current DP drivers have regulators, clocks, irq and phy are grouped
together within a function and executed not in a symmetric manner.
This increase difficulty of code maintenance and limited code scalability.
This patch divides the driver life cycle of operation into four states,
resume (including booting up), dongle plugin, dongle unplugged and suspend.
Regulators, core clocks and irq are grouped together and enabled at resume
(or booting up) so that the DP controller is armed and ready to receive HPD
plugin interrupts. HPD plugin interrupt is generated when a dongle plugs
into DUT (device under test). Once HPD plugin interrupt is received, DP
controller will initialize phy so that dpcd read/write will function and
following link training can be proceeded successfully. DP phy will be
disabled after main link is teared down at end of unplugged HPD interrupt
handle triggered by dongle unplugged out of DUT. Finally regulators, code
clocks and irq are disabled at corresponding suspension.

Changes in V2:
-- removed unnecessary dp_ctrl NULL check
-- removed unnecessary phy init_count and power_count DRM_DEBUG_DP logs
-- remove flip parameter out of dp_ctrl_irq_enable()
-- add fixes tag

Changes in V3:
-- call dp_display_host_phy_init() instead of dp_ctrl_phy_init() at
        dp_display_host_init() for eDP

Changes in V4:
-- rewording commit text to match this commit changes

Changes in V5:
-- rebase on top of msm-next branch

Changes in V6:
-- delete flip variable

Changes in V7:
-- dp_ctrl_irq_enable/disabe() merged into dp_ctrl_reset_irq_ctrl()

Changes in V8:
-- add more detail comment regrading dp phy at dp_display_host_init()

Changes in V9:
-- remove set phy_initialized to false when -ECONNRESET detected

Changes in v10:
--  group into one series

Changes in v11:
-- drop drm/msm/dp: dp_link_parse_sink_count() return immediately if aux read

Changes in v12:
-- move dp_display_host_phy_exit() after dp_display_host_deinit()

Changes in v13:
-- do not execute phy_init until plugged_in interrupt for edp, same as DP.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 80 +++++++++++++---------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  8 ++--
 drivers/gpu/drm/msm/dp/dp_display.c | 85 +++++++++++++++++++++++--------------
 3 files changed, 89 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c724cb0..9c80b49 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1365,60 +1365,44 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
-int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
+void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
+{
+	struct dp_ctrl_private *ctrl;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	dp_catalog_ctrl_reset(ctrl->catalog);
+
+	if (enable)
+		dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
+}
+
+void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
 	struct dp_io *dp_io;
 	struct phy *phy;
 
-	if (!dp_ctrl) {
-		DRM_ERROR("Invalid input data\n");
-		return -EINVAL;
-	}
-
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 	dp_io = &ctrl->parser->io;
 	phy = dp_io->phy;
 
-	ctrl->dp_ctrl.orientation = flip;
-
-	if (reset)
-		dp_catalog_ctrl_reset(ctrl->catalog);
-
-	DRM_DEBUG_DP("flip=%d\n", flip);
 	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_init(phy);
-	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
-
-	return 0;
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
 	struct phy *phy;
 
-	if (!dp_ctrl) {
-		DRM_ERROR("Invalid input data\n");
-		return;
-	}
-
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 	dp_io = &ctrl->parser->io;
 	phy = dp_io->phy;
 
-	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
+	dp_catalog_ctrl_phy_reset(ctrl->catalog);
 	phy_exit(phy);
-
-	DRM_DEBUG_DP("Host deinitialized successfully\n");
 }
 
 static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
@@ -1488,7 +1472,10 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	}
 
 	phy_power_off(phy);
+
+	/* aux channel down, reinit phy */
 	phy_exit(phy);
+	phy_init(phy);
 
 	return 0;
 }
@@ -1893,8 +1880,14 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
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
@@ -1903,23 +1896,6 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
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
@@ -1947,10 +1923,14 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
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
index 2363a2d..2433edb 100644
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
@@ -34,4 +31,9 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_power *power, struct dp_catalog *catalog,
 			struct dp_parser *parser);
 
+void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable);
+void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
+
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7cc4d21..b3c5404 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -83,6 +83,7 @@ struct dp_display_private {
 
 	/* state variables */
 	bool core_initialized;
+	bool phy_initialized;
 	bool hpd_irq_on;
 	bool audio_supported;
 
@@ -372,21 +373,38 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	return rc;
 }
 
-static void dp_display_host_init(struct dp_display_private *dp, int reset)
+static void dp_display_host_phy_init(struct dp_display_private *dp)
 {
-	bool flip = false;
+	DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
+			dp->core_initialized, dp->phy_initialized);
 
+	if (!dp->phy_initialized) {
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
+	if (dp->phy_initialized) {
+		dp_ctrl_phy_exit(dp->ctrl);
+		dp->phy_initialized = false;
+	}
+}
+
+static void dp_display_host_init(struct dp_display_private *dp)
+{
 	DRM_DEBUG_DP("core_initialized=%d\n", dp->core_initialized);
 	if (dp->core_initialized) {
 		DRM_DEBUG_DP("DP core already initialized\n");
 		return;
 	}
 
-	if (dp->usbpd->orientation == ORIENTATION_CC2)
-		flip = true;
-
-	dp_power_init(dp->power, flip);
-	dp_ctrl_host_init(dp->ctrl, flip, reset);
+	dp_power_init(dp->power, false);
+	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
 	dp_aux_init(dp->aux);
 	dp->core_initialized = true;
 }
@@ -398,7 +416,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 		return;
 	}
 
-	dp_ctrl_host_deinit(dp->ctrl);
+	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
 	dp_aux_deinit(dp->aux);
 	dp_power_deinit(dp->power);
 
@@ -409,7 +427,7 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 {
 	struct dp_display_private *dp = dev_get_dp_display_private(dev);
 
-	dp_display_host_init(dp, false);
+	dp_display_host_phy_init(dp);
 
 	return dp_display_process_hpd_high(dp);
 }
@@ -530,11 +548,6 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	ret = dp_display_usbpd_configure_cb(&dp->pdev->dev);
 	if (ret) {	/* link train failed */
 		dp->hpd_state = ST_DISCONNECTED;
-
-		if (ret == -ECONNRESET) { /* cable unplugged */
-			dp->core_initialized = false;
-		}
-
 	} else {
 		/* start sentinel checking in case of missing uevent */
 		dp_add_event(dp, EV_CONNECT_PENDING_TIMEOUT, 0, tout);
@@ -604,8 +617,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	if (state == ST_DISCONNECTED) {
 		/* triggered by irq_hdp with sink_count = 0 */
 		if (dp->link->sink_count == 0) {
-			dp_ctrl_off_phy(dp->ctrl);
-			dp->core_initialized = false;
+			dp_display_host_phy_exit(dp);
 		}
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -696,12 +708,9 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 	 * dp core (ahb/aux clks) must be initialized before
 	 * irq_hpd be handled
 	 */
-	if (dp->core_initialized) {
+	if (dp->core_initialized)
 		ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
-		if (ret == -ECONNRESET) { /* cable unplugged */
-			dp->core_initialized = false;
-		}
-	}
+
 	DRM_DEBUG_DP("hpd_state=%d\n", state);
 
 	mutex_unlock(&dp->event_mutex);
@@ -892,12 +901,19 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 
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
 
 	dp_display->power_on = false;
@@ -1027,7 +1043,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 static void dp_display_config_hpd(struct dp_display_private *dp)
 {
 
-	dp_display_host_init(dp, true);
+	dp_display_host_init(dp);
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
 	/* Enable interrupt first time
@@ -1306,20 +1322,23 @@ static int dp_pm_resume(struct device *dev)
 	dp->hpd_state = ST_DISCONNECTED;
 
 	/* turn on dp ctrl/phy */
-	dp_display_host_init(dp, true);
+	dp_display_host_init(dp);
 
 	dp_catalog_ctrl_hpd_config(dp->catalog);
 
-	/*
-	 * set sink to normal operation mode -- D0
-	 * before dpcd read
-	 */
-	dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
 	if (dp_catalog_link_is_connected(dp->catalog)) {
+		/*
+		 * set sink to normal operation mode -- D0
+		 * before dpcd read
+		 */
+		dp_display_host_phy_init(dp);
+		dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 		sink_count = drm_dp_read_sink_count(dp->aux);
 		if (sink_count < 0)
 			sink_count = 0;
+
+		dp_display_host_phy_exit(dp);
 	}
 
 	dp->link->sink_count = sink_count;
@@ -1363,7 +1382,11 @@ static int dp_pm_suspend(struct device *dev)
 		if (dp_power_clk_status(dp->power, DP_CTRL_PM))
 			dp_ctrl_off_link_stream(dp->ctrl);
 
+		dp_display_host_phy_exit(dp);
+
 		dp_display_host_deinit(dp);
+	} else {
+		dp_display_host_phy_exit(dp);
 	}
 
 	dp->hpd_state = ST_SUSPENDED;
@@ -1535,7 +1558,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 	state =  dp_display->hpd_state;
 
 	if (state == ST_DISPLAY_OFF)
-		dp_display_host_init(dp_display, true);
+		dp_display_host_phy_init(dp_display);
 
 	dp_display_enable(dp_display, 0);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

