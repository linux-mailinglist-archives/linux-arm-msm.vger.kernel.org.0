Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8ED54C060C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 01:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236383AbiBWA2b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 19:28:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236186AbiBWA2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 19:28:23 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29481541A2;
        Tue, 22 Feb 2022 16:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645576077; x=1677112077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=lQNhUNRJ6jhE4wofcy3rrI3mYvQRhxudjndjPhWyZSk=;
  b=MFUXMvmZEaykaO3ieJAhPincNIQmlNtfynPeU0x3OYXoljLJ+LrQaMil
   MpZy9YEUdtmcjeNSU8b0fCCADNv3LrSN8nEA72mhMsWQ0pRd6bMNt/n0m
   0dySyySncDAKEBiowipzZl7DpE6y3YctrMeivf30PjbwTmvZv7fLwhEHn
   Q=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 22 Feb 2022 16:27:57 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 16:27:56 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 22 Feb 2022 16:27:56 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 22 Feb 2022 16:27:55 -0800
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
        <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <quic_aravindh@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 4/4] drm/msm/dp: enable widebus feature for display port
Date:   Tue, 22 Feb 2022 16:27:40 -0800
Message-ID: <1645576060-3046-5-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645576060-3046-1-git-send-email-quic_khsieh@quicinc.com>
References: <1645576060-3046-1-git-send-email-quic_khsieh@quicinc.com>
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
-- static inline bool msm_dp_wide_bus_enable() in msm_drv.h

Changes in v7:
-- add Tested-by

Changes in v9:
-- add wide_bus_en to msm_dp_desc

Changes in v10:
-- add wide_bus_en boolean to dp_catalog struc to avoid passing it as parameter

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reported-by: kernel test robot <lkp@intel.com>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 +++-
 drivers/gpu/drm/msm/dp/dp_catalog.c         | 32 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h         |  2 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c            |  7 ++++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h            |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c         | 21 +++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_display.h         |  2 ++
 drivers/gpu/drm/msm/msm_drv.h               |  6 ++++++
 8 files changed, 70 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9a8d992..5356d50 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2138,8 +2138,10 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 		timer_setup(&dpu_enc->vsync_event_timer,
 				dpu_encoder_vsync_event_handler,
 				0);
-	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
+	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS) {
 		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
+		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(dpu_enc->dp);
+	}
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 6ae9b29..c789f4e 100644
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
@@ -743,6 +761,7 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
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
+	if (dp_catalog->wide_bus_en)
+		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
+	else
+		reg &= ~DP_INTF_CONFIG_DATABUS_WIDEN;
+
+
+	DRM_DEBUG_DP("wide_bus_en=%d reg=%x\n", dp_catalog->wide_bus_en, reg);
+
+	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 6965afa..02a3e8a 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -70,6 +70,7 @@ struct dp_catalog {
 	enum dp_catalog_audio_sdp_type sdp_type;
 	enum dp_catalog_audio_header_type sdp_header;
 	u32 audio_data;
+	bool wide_bus_en;
 };
 
 /* Debug module */
@@ -95,6 +96,7 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
 void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
 				u32 stream_rate_khz, bool fixed_nvid);
 int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog, u32 pattern);
+u32 dp_catalog_hw_revision(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
 bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c724cb0..b714c5c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1799,6 +1799,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 	int ret = 0;
 	bool mainlink_ready = false;
 	struct dp_ctrl_private *ctrl;
+	unsigned long pixel_rate_orig;
 
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
@@ -1846,7 +1851,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
 
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
index 7cc4d21..ba76358 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -115,12 +115,15 @@ struct dp_display_private {
 	struct dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
+	bool wide_bus_en;
+
 	struct dp_audio *audio;
 };
 
 struct msm_dp_desc {
 	phys_addr_t io_start;
 	unsigned int connector_type;
+	bool wide_bus_en;
 };
 
 struct msm_dp_config {
@@ -137,8 +140,8 @@ static const struct msm_dp_config sc7180_dp_cfg = {
 
 static const struct msm_dp_config sc7280_dp_cfg = {
 	.descs = (const struct msm_dp_desc[]) {
-		[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
-		[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP },
+		[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
+		[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
 	},
 	.num_descs = 2,
 };
@@ -808,6 +811,10 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error_ctrl;
 	}
 
+	/* populate wide_bus_en to differernt layers */
+	dp->ctrl->wide_bus_en = dp->wide_bus_en;
+	dp->catalog->wide_bus_en = dp->wide_bus_en;
+
 	return rc;
 
 error_ctrl:
@@ -1251,6 +1258,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	dp->pdev = pdev;
 	dp->name = "drm_dp";
 	dp->dp_display.connector_type = desc->connector_type;
+	dp->wide_bus_en = desc->wide_bus_en;
 
 	rc = dp_init_sub_modules(dp);
 	if (rc) {
@@ -1437,6 +1445,15 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
 }
 
+bool msm_dp_wide_bus_available(struct msm_dp *dp_display)
+{
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	return dp->wide_bus_en;
+}
+
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 {
 	struct dp_display_private *dp;
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
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d7574e6..d413deb 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -399,6 +399,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
+bool msm_dp_wide_bus_available(struct msm_dp *dp_display);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -449,6 +450,11 @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
 {
 }
 
+static inline bool msm_dp_wide_bus_available(struct msm_dp *dp_display)
+{
+	return false;
+}
+
 #endif
 
 void __init msm_mdp_register(void);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

