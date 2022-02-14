Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE7924B5DCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 23:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231931AbiBNWja (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 17:39:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiBNWj3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 17:39:29 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1653A145AEF;
        Mon, 14 Feb 2022 14:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644878361; x=1676414361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=zfQ0yd8HGCECVgbTaCcizLwdc8w4+7vi7EjIFK0kETs=;
  b=iiQ/hdOiKciSnvt9m615ZLvoHYixaJP6wyiU7/humCPaa9q3EWXPVbJh
   36Z79sL9ExauEHjGdvI/buUWSKUnTDsOT7CLoPs/whYdOmwnLhzXVMcmx
   WbJo5Wo7c/clDvb6XP0vw/zgHPEK5V4uH3uT0bnoU8dUdt/DZbG286lIu
   U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Feb 2022 14:39:20 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 14:39:20 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 14 Feb 2022 14:39:20 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 14 Feb 2022 14:39:19 -0800
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <vkoul@kernel.org>,
        <daniel@ffwll.ch>, <airlied@linux.ie>, <agross@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <bjorn.andersson@linaro.org>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <quic_aravindh@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/2] drm/msm/dp:  revise timing engine programming to support widebus feature
Date:   Mon, 14 Feb 2022 14:39:05 -0800
Message-ID: <1644878346-28511-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644878346-28511-1-git-send-email-quic_khsieh@quicinc.com>
References: <1644878346-28511-1-git-send-email-quic_khsieh@quicinc.com>
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
Timing engine provides driving force for this purpose. This patch base
on HPG (Hardware Programming Guide) to revise timing engine register
setting to accommodate both widebus and non widebus application. Also
horizontal width parameters need to be reduced by half since two pixel
data are clocked out per pixel clock when widebus feature enabled.

Widebus can be enabled individually at DP. However at DSI, widebus have
to be enabled along with DSC enabled to achieve pixel clock rate be
scaled down with same ratio as compression ratio when 10 bits per source
component. Therefore this patch have both widebus and compression covered
together so tat less efforts will be required when DSC enabled later.

Changes in v2:
-- remove compression related code from timing
-- remove op_info from  struct msm_drm_private
-- remove unnecessary wide_bus_en variables
-- pass wide_bus_en into timing configuration by struct msm_dp

Changes in v3:
-- split patch into 3 patches

Changes in v4:
-- rework timing engine to not interfere with dsi/hdmi
-- cover both widebus and compression

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 10 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  2 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 99 ++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  6 ++
 5 files changed, 115 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0d315b4..0c22839 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -208,6 +208,8 @@ struct dpu_encoder_virt {
 
 	u32 idle_timeout;
 
+	bool wide_bus_en;
+
 	struct msm_dp *dp;
 };
 
@@ -217,6 +219,14 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
 };
 
+
+bool dpu_encoder_is_widebus_enabled(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	return dpu_enc->wide_bus_en;
+}
+
 static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
 {
 	struct dpu_hw_dither_cfg dither_cfg = { 0 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 99a5d73..893d74d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -168,4 +168,6 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
  */
 int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc);
 
+bool dpu_encoder_is_widebus_enabled(struct drm_encoder *drm_enc);
+
 #endif /* __DPU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 185379b..2af2bb7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -110,6 +110,20 @@ static void drm_mode_to_intf_timing_params(
 		timing->v_back_porch += timing->v_front_porch;
 		timing->v_front_porch = 0;
 	}
+
+	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
+
+	/*
+	 * for DP, divide the horizonal parameters by 2 when
+	 * widebus is enabled
+	 */
+	if (phys_enc->hw_intf->cap->type == INTF_DP && timing->wide_bus_en) {
+		timing->width = timing->width >> 1;
+		timing->xres = timing->xres >> 1;
+		timing->h_back_porch = timing->h_back_porch >> 1;
+		timing->h_front_porch = timing->h_front_porch >> 1;
+		timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
+	}
 }
 
 static u32 get_horizontal_total(const struct intf_timing_params *timing)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 116e2b5..3b9273e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -33,6 +33,7 @@
 #define INTF_TP_COLOR1                  0x05C
 #define INTF_CONFIG2                    0x060
 #define INTF_DISPLAY_DATA_HCTL          0x064
+#define INTF_ACTIVE_DATA_HCTL           0x068
 #define INTF_FRAME_LINE_COUNT_EN        0x0A8
 #define INTF_FRAME_COUNT                0x0AC
 #define   INTF_LINE_COUNT               0x0B0
@@ -60,6 +61,14 @@
 
 #define   INTF_MUX                      0x25C
 
+#define BIT_INTF_CFG_ACTIVE_H_EN	BIT(29)
+#define BIT_INTF_CFG_ACTIVE_V_EN	BIT(30)
+
+#define BIT_INTF_CFG2_DATABUS_WIDEN	BIT(0)
+#define BIT_INTF_CFG2_DATA_HCTL_EN	BIT(4)
+#define BIT_INTF_CFG2_DCE_DATA_COMPRESS	BIT(12)
+
+
 static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
 		const struct dpu_mdss_cfg *m,
 		void __iomem *addr,
@@ -90,15 +99,23 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	u32 hsync_period, vsync_period;
 	u32 display_v_start, display_v_end;
 	u32 hsync_start_x, hsync_end_x;
+	u32 hsync_data_start_x, hsync_data_end_x;
 	u32 active_h_start, active_h_end;
 	u32 active_v_start, active_v_end;
 	u32 active_hctl, display_hctl, hsync_ctl;
 	u32 polarity_ctl, den_polarity, hsync_polarity, vsync_polarity;
 	u32 panel_format;
-	u32 intf_cfg, intf_cfg2 = 0, display_data_hctl = 0;
+	u32 intf_cfg, intf_cfg2 = 0;
+	u32 display_data_hctl = 0, active_data_hctl = 0;
+	u32 data_width;
+	bool dp_intf = false;
 
 	/* read interface_cfg */
 	intf_cfg = DPU_REG_READ(c, INTF_CONFIG);
+
+	if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP)
+		dp_intf = true;
+
 	hsync_period = p->hsync_pulse_width + p->h_back_porch + p->width +
 	p->h_front_porch;
 	vsync_period = p->vsync_pulse_width + p->v_back_porch + p->height +
@@ -112,7 +129,10 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	hsync_start_x = p->h_back_porch + p->hsync_pulse_width;
 	hsync_end_x = hsync_period - p->h_front_porch - 1;
 
-	if (p->width != p->xres) {
+	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
+	display_hctl = (hsync_end_x << 16) | hsync_start_x;
+
+	if (p->width != p->xres) { /* border fill added */
 		active_h_start = hsync_start_x;
 		active_h_end = active_h_start + p->xres - 1;
 	} else {
@@ -130,27 +150,78 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 
 	if (active_h_end) {
 		active_hctl = (active_h_end << 16) | active_h_start;
-		intf_cfg |= BIT(29);	/* ACTIVE_H_ENABLE */
+		intf_cfg |= BIT_INTF_CFG_ACTIVE_H_EN;
 	} else {
 		active_hctl = 0;
 	}
 
 	if (active_v_end)
-		intf_cfg |= BIT(30); /* ACTIVE_V_ENABLE */
+		intf_cfg |= BIT_INTF_CFG_ACTIVE_V_EN;
 
-	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
-	display_hctl = (hsync_end_x << 16) | hsync_start_x;
+	/*
+	 * DATA_HCTL_EN controls data timing which can be different from
+	 * video timing. It is recommended to enable it for all cases, except
+	 * if compression is enabled in 1 pixel per clock mode
+	 */
+	if (!p->compression_en || p->wide_bus_en)
+		intf_cfg2 |= BIT_INTF_CFG2_DATA_HCTL_EN;
+
+	if (p->wide_bus_en)
+		intf_cfg2 |=  BIT_INTF_CFG2_DATABUS_WIDEN;
+
+	/*
+	 * If widebus is disabled:
+	 * For uncompressed stream, the data is valid for the entire active
+	 * window period.
+	 * For compressed stream, data is valid for a shorter time period
+	 * inside the active window depending on the compression ratio.
+	 *
+	 * If widebus is enabled:
+	 * For uncompressed stream, data is valid for only half the active
+	 * window, since the data rate is doubled in this mode.
+	 * p->width holds the adjusted width for DP but unadjusted width for DSI
+	 * For compressed stream, data validity window needs to be adjusted for
+	 * compression ratio and then further halved.
+	 */
+	data_width = p->width;
+
+	if (p->compression_en) {
+		data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 3);
+
+		if (p->wide_bus_en)
+			data_width >>= 1;
+	} else if (!dp_intf && p->wide_bus_en) {
+		data_width = p->width >> 1;
+	}
+
+	hsync_data_start_x = hsync_start_x;
+	hsync_data_end_x =  hsync_start_x + data_width - 1;
+
+	display_data_hctl = (hsync_data_end_x << 16) | hsync_data_start_x;
+
+	if (dp_intf) {
+		/* DP timing adjustment */
+		display_v_start += p->hsync_pulse_width + p->h_back_porch;
+		display_v_end   -= p->h_front_porch;
 
-	if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP) {
 		active_h_start = hsync_start_x;
 		active_h_end = active_h_start + p->xres - 1;
 		active_v_start = display_v_start;
 		active_v_end = active_v_start + (p->yres * hsync_period) - 1;
 
-		display_v_start += p->hsync_pulse_width + p->h_back_porch;
-
 		active_hctl = (active_h_end << 16) | active_h_start;
 		display_hctl = active_hctl;
+
+		intf_cfg |= BIT_INTF_CFG_ACTIVE_H_EN;
+		intf_cfg |= BIT_INTF_CFG_ACTIVE_V_EN;
+
+		if (p->compression_en) {
+			active_data_hctl = (hsync_start_x +
+					p->extra_dto_cycles) << 16;
+			active_data_hctl += hsync_start_x;
+
+			display_data_hctl = active_data_hctl;
+		}
 	}
 
 	den_polarity = 0;
@@ -180,13 +251,6 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 				(COLOR_8BIT << 4) |
 				(0x21 << 8));
 
-	if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
-		intf_cfg2 |= BIT(4);
-		display_data_hctl = display_hctl;
-		DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
-		DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
-	}
-
 	DPU_REG_WRITE(c, INTF_HSYNC_CTL, hsync_ctl);
 	DPU_REG_WRITE(c, INTF_VSYNC_PERIOD_F0, vsync_period * hsync_period);
 	DPU_REG_WRITE(c, INTF_VSYNC_PULSE_WIDTH_F0,
@@ -204,6 +268,9 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
 	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
 	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
+	DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
+	DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
+	DPU_REG_WRITE(c, INTF_ACTIVE_DATA_HCTL, active_data_hctl);
 }
 
 static void dpu_hw_intf_enable_timing_engine(
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 3568be8..299c9c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -30,6 +30,12 @@ struct intf_timing_params {
 	u32 border_clr;
 	u32 underflow_clr;
 	u32 hsync_skew;
+
+	bool wide_bus_en;
+	bool compression_en;
+	u32 extra_dto_cycles;   /* for DP only */
+	bool dsc_4hs_merge;     /* DSC 4HS merge */
+	u32 dce_bytes_per_line;
 };
 
 struct intf_prog_fetch {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

