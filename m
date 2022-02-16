Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA9D4B939B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 23:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236363AbiBPWF6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 17:05:58 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236554AbiBPWF5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 17:05:57 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871F92AE72F;
        Wed, 16 Feb 2022 14:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645049145; x=1676585145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=BIRQ/Lmi92H2TM6N5D5wvffDuJ2KMpXz1ShqIaGF6Yo=;
  b=ZkZdm/J6ce2NMhkAwADXmnk5oLbrkJusdKg2kLx0mcOEX5H27Xp9fTZs
   zC22DNtmdSxGPZyYPeeokB9soUWXzSg3Gz3vcCE9XaxeZYn8X8NGkd/Cv
   dnF8z+xHEaTUlnku7tRFpvpIfOQVkiH3mxDphev34qiwt1BOJ+JCB9CTT
   g=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 16 Feb 2022 14:05:44 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 14:05:43 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 14:05:24 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 16 Feb 2022 14:05:23 -0800
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
        <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <quic_aravindh@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 4/4] drm/msm/dp: enable widebus feature for display port
Date:   Wed, 16 Feb 2022 14:05:06 -0800
Message-ID: <1645049106-30481-5-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645049106-30481-1-git-send-email-quic_khsieh@quicinc.com>
References: <1645049106-30481-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Widebus feature will transmit two pixel data per pixel clock to interface.
This feature now is required to be enabled to easy migrant to higher
resolution applications in future. However since some legacy chipsets
does not support this feature, this feature is enabled base on chip's
hardware revision.

changes in v2:
-- remove compression related code from timing
-- remove op_info from  struct msm_drm_private
-- remove unnecessary wide_bus_en variables
-- pass wide_bus_en into timing configuration by struct msm_dp

Changes in v3:
-- split patch into 3 patches
-- enable widebus feature base on chip hardware revision

Changes in v5:
-- DP_INTF_CONFIG_DATABUS_WIDEN

Changes in v6:
-- fix Reported-bya issue
-- fix static inline bool msm_dp_wide_bus_enable() at msm_drv.h

Changes in v7:
-- add Tested-by

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reported-by: kernel test robot <lkp@intel.com>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 +++-
 drivers/gpu/drm/msm/dp/dp_catalog.c         | 34 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_catalog.h         |  3 ++-
 drivers/gpu/drm/msm/dp/dp_ctrl.c            | 13 +++++++----
 drivers/gpu/drm/msm/dp/dp_ctrl.h            |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c         | 32 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h         |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c           |  4 ++--
 drivers/gpu/drm/msm/dp/dp_panel.h           |  2 +-
 drivers/gpu/drm/msm/msm_drv.h               |  6 +++++
 10 files changed, 90 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2b2dbb7..1e96cede 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2138,8 +2138,10 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 		timer_setup(&dpu_enc->vsync_event_timer,
 				dpu_encoder_vsync_event_handler,
 				0);
-	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
+	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS) {
 		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
+		dpu_enc->wide_bus_en = msm_dp_wide_bus_enable(dpu_enc->dp);
+	}
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 6ae9b29..524eccc 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -24,6 +24,8 @@
 #define DP_INTERRUPT_STATUS_ACK_SHIFT	1
 #define DP_INTERRUPT_STATUS_MASK_SHIFT	2
 
+#define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
+
 #define DP_INTERRUPT_STATUS1 \
 	(DP_INTR_AUX_I2C_DONE| \
 	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
@@ -483,6 +485,22 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog,
 }
 
 /**
+ * dp_catalog_hw_revision() - retrieve DP hw revision
+ *
+ * @dp_catalog: DP catalog structure
+ *
+ * Return: DP controller hw revision
+ *
+ */
+u32 dp_catalog_hw_revision(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	return dp_read_ahb(catalog, REG_DP_HW_VERSION);
+}
+
+/**
  * dp_catalog_ctrl_reset() - reset DP controller
  *
  * @dp_catalog: DP catalog structure
@@ -739,10 +757,11 @@ u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog)
 }
 
 /* panel related catalog functions */
-int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
+int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog, bool wide_bus_en)
 {
 	struct dp_catalog_private *catalog = container_of(dp_catalog,
 				struct dp_catalog_private, dp_catalog);
+	u32 reg;
 
 	dp_write_link(catalog, REG_DP_TOTAL_HOR_VER,
 				dp_catalog->total);
@@ -751,7 +770,18 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
 	dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY,
 				dp_catalog->width_blanking);
 	dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, dp_catalog->dp_active);
-	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, 0);
+
+	reg = dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
+
+	if (wide_bus_en)
+		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
+	else
+		reg &= ~DP_INTF_CONFIG_DATABUS_WIDEN;
+
+
+	DRM_DEBUG_DP("wide_bus_en=%d reg=%x\n", wide_bus_en, reg);
+
+	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 6965afa..2ba1ea4 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -95,6 +95,7 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
 void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
 				u32 stream_rate_khz, bool fixed_nvid);
 int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog, u32 pattern);
+u32 dp_catalog_hw_revision(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
 bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
@@ -115,7 +116,7 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
 u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog);
 
 /* DP Panel APIs */
-int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog);
+int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog, bool wide_bus_en);
 void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
 void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
 				struct drm_display_mode *drm_mode);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c724cb0..b07574c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -154,7 +154,7 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
 	dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
 }
 
-static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
+static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl, bool wide_bus_en)
 {
 	u32 cc, tb;
 
@@ -167,7 +167,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
 		ctrl->panel->dp_mode.bpp);
 	cc = dp_link_get_colorimetry_config(ctrl->link);
 	dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
-	dp_panel_timing_cfg(ctrl->panel);
+	dp_panel_timing_cfg(ctrl->panel, wide_bus_en);
 }
 
 /*
@@ -1799,6 +1799,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 	int ret = 0;
 	bool mainlink_ready = false;
 	struct dp_ctrl_private *ctrl;
+	u32 pixel_rate_orig;
 
 	if (!dp_ctrl)
 		return -EINVAL;
@@ -1807,6 +1808,10 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 
 	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
 
+	pixel_rate_orig = ctrl->dp_ctrl.pixel_rate;
+	if (dp_ctrl->wide_bus_en)
+		ctrl->dp_ctrl.pixel_rate >>= 1;
+
 	DRM_DEBUG_DP("rate=%d, num_lanes=%d, pixel_rate=%d\n",
 		ctrl->link->link_params.rate,
 		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
@@ -1842,11 +1847,11 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 	 */
 	reinit_completion(&ctrl->video_comp);
 
-	dp_ctrl_configure_source_params(ctrl);
+	dp_ctrl_configure_source_params(ctrl, dp_ctrl->wide_bus_en);
 
 	dp_catalog_ctrl_config_msa(ctrl->catalog,
 		ctrl->link->link_params.rate,
-		ctrl->dp_ctrl.pixel_rate, dp_ctrl_use_fixed_nvid(ctrl));
+		pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl));
 
 	dp_ctrl_setup_tr_unit(ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 2363a2d..a0a5fbb 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -17,6 +17,7 @@ struct dp_ctrl {
 	bool orientation;
 	atomic_t aborted;
 	u32 pixel_rate;
+	bool wide_bus_en;
 };
 
 int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7cc4d21..8ecccf2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -115,6 +115,8 @@ struct dp_display_private {
 	struct dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
+	bool wide_bus_en;
+
 	struct dp_audio *audio;
 };
 
@@ -848,6 +850,8 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
+	dp->ctrl->wide_bus_en = dp->wide_bus_en;
+
 	rc = dp_ctrl_on_stream(dp->ctrl);
 	if (!rc)
 		dp_display->power_on = true;
@@ -972,6 +976,7 @@ int dp_display_get_modes(struct msm_dp *dp,
 		dp->connector, dp_mode);
 	if (dp_mode->drm_mode.clock)
 		dp->max_pclk_khz = dp_mode->drm_mode.clock;
+
 	return ret;
 }
 
@@ -1437,6 +1442,28 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
 }
 
+bool msm_dp_wide_bus_enable(struct msm_dp *dp_display)
+{
+	struct dp_display_private *dp;
+	u32 revision, major, minor;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	/* for the time being widebus only support on DP */
+	if (dp_display->connector_type  == DRM_MODE_CONNECTOR_DisplayPort) {
+		revision = dp_catalog_hw_revision(dp->catalog);
+		major = ((revision >> 28) & 0x0ff);
+		minor = ((revision >> 16) & 0x0fff);
+
+		DRM_DEBUG_DP("id=%d major=%d minor=%d\n", dp->id, major, minor);
+
+		if (major >= 1 && minor >= 2)
+			return true;
+	}
+
+	return false;
+}
+
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 {
 	struct dp_display_private *dp;
@@ -1460,6 +1487,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
 	struct msm_drm_private *priv;
+	struct dp_display_private *dp_priv;
 	int ret;
 
 	if (WARN_ON(!encoder) || WARN_ON(!dp_display) || WARN_ON(!dev))
@@ -1468,6 +1496,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 	priv = dev->dev_private;
 	dp_display->drm_dev = dev;
 
+	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
+
 	ret = dp_display_request_irq(dp_display);
 	if (ret) {
 		DRM_ERROR("request_irq failed, ret=%d\n", ret);
@@ -1498,6 +1528,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
 	priv->bridges[priv->num_bridges++] = dp_display->bridge;
 
+	dp_priv->wide_bus_en = msm_dp_wide_bus_enable(dp_display);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index e3adcd5..b718cc9 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -24,6 +24,8 @@ struct msm_dp {
 
 	hdmi_codec_plugged_cb plugged_cb;
 
+	bool wide_bus_en;
+
 	u32 max_pclk_khz;
 
 	u32 max_dp_lanes;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 71db10c..71deb1e 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -353,7 +353,7 @@ void dp_panel_dump_regs(struct dp_panel *dp_panel)
 	dp_catalog_dump_regs(catalog);
 }
 
-int dp_panel_timing_cfg(struct dp_panel *dp_panel)
+int dp_panel_timing_cfg(struct dp_panel *dp_panel, bool wide_bus_en)
 {
 	u32 data, total_ver, total_hor;
 	struct dp_catalog *catalog;
@@ -404,7 +404,7 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
 
 	catalog->dp_active = data;
 
-	dp_catalog_panel_timing_cfg(catalog);
+	dp_catalog_panel_timing_cfg(catalog, wide_bus_en);
 	panel->panel_on = true;
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 9023e5b..5ec341a 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -57,7 +57,7 @@ struct dp_panel {
 
 int dp_panel_init_panel_info(struct dp_panel *dp_panel);
 int dp_panel_deinit(struct dp_panel *dp_panel);
-int dp_panel_timing_cfg(struct dp_panel *dp_panel);
+int dp_panel_timing_cfg(struct dp_panel *dp_panel, bool wide_bus_en);
 void dp_panel_dump_regs(struct dp_panel *dp_panel);
 int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 		struct drm_connector *connector);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d7574e6..4f9c24e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -399,6 +399,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
+bool msm_dp_wide_bus_enable(struct msm_dp *dp_display);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -449,6 +450,11 @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
 {
 }
 
+static inline bool msm_dp_wide_bus_enable(struct msm_dp *dp_display)
+{
+	return false;
+}
+
 #endif
 
 void __init msm_mdp_register(void);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

