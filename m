Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB7FF1712A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 09:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728542AbgB0Ii6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 03:38:58 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:32090 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728440AbgB0Ii6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 03:38:58 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Feb 2020 14:08:53 +0530
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg02-blr.qualcomm.com with ESMTP; 27 Feb 2020 14:08:33 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 44BD02210; Thu, 27 Feb 2020 14:08:32 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: [v2 1/2] drm/msm/dpu: add DP support for sc7180 target
Date:   Thu, 27 Feb 2020 14:08:30 +0530
Message-Id: <1582792711-26935-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the required changes to support Display Port
for sc7180 target.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Changes in v2:
	- Change in commit message

This patch has dependency on the below series
https://patchwork.kernel.org/patch/11269169/
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 12 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c     |  4 ++++
 5 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f8ac3bf..136e4d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1109,6 +1109,12 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 	}
 
 	if (dpu_enc->cur_master->hw_mdptop &&
+		(dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS) &&
+			dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
+		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
+			dpu_enc->cur_master->hw_mdptop);
+
+	if (dpu_enc->cur_master->hw_mdptop &&
 			dpu_enc->cur_master->hw_mdptop->ops.reset_ubwc)
 		dpu_enc->cur_master->hw_mdptop->ops.reset_ubwc(
 				dpu_enc->cur_master->hw_mdptop,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c567917..60f350f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -109,8 +109,9 @@
 	{
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
-	.features = 0,
+	.features = BIT(DPU_MDP_DP_PHY_SEL),
 	.highest_bank_bit = 0x3,
+	.dp_phy_intf_sel = 0x41,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 09df7d8..fbcf14b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -77,6 +77,7 @@ enum {
  * @DPU_MDP_UBWC_1_0,      This chipsets supports Universal Bandwidth
  *                         compression initial revision
  * @DPU_MDP_UBWC_1_5,      Universal Bandwidth compression version 1.5
+ * @DPU_MDP_DP_PHY_SEL     DP PHY interface select for controller
  * @DPU_MDP_MAX            Maximum value
 
  */
@@ -86,6 +87,7 @@ enum {
 	DPU_MDP_BWC,
 	DPU_MDP_UBWC_1_0,
 	DPU_MDP_UBWC_1_5,
+	DPU_MDP_DP_PHY_SEL,
 	DPU_MDP_MAX
 };
 
@@ -421,6 +423,7 @@ struct dpu_clk_ctrl_reg {
  * @highest_bank_bit:  UBWC parameter
  * @ubwc_static:       ubwc static configuration
  * @ubwc_swizzle:      ubwc default swizzle setting
+ * @dp_phy_intf_sel:   dp phy interface select for controller
  * @clk_ctrls          clock control register definition
  */
 struct dpu_mdp_cfg {
@@ -428,6 +431,7 @@ struct dpu_mdp_cfg {
 	u32 highest_bank_bit;
 	u32 ubwc_static;
 	u32 ubwc_swizzle;
+	u32 dp_phy_intf_sel;
 	struct dpu_clk_ctrl_reg clk_ctrls[DPU_CLK_CTRL_MAX];
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index efe9a57..ae96ede 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -144,10 +144,22 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
 	display_hctl = (hsync_end_x << 16) | hsync_start_x;
 
+	if (ctx->cap->type == INTF_DP) {
+		active_h_start = hsync_start_x;
+		active_h_end = active_h_start + p->xres - 1;
+		active_v_start = display_v_start;
+		active_v_end = active_v_start + (p->yres * hsync_period) - 1;
+		active_hctl = (active_h_end << 16) | active_h_start;
+		display_hctl = active_hctl;
+	}
+
 	den_polarity = 0;
 	if (ctx->cap->type == INTF_HDMI) {
 		hsync_polarity = p->yres >= 720 ? 0 : 1;
 		vsync_polarity = p->yres >= 720 ? 0 : 1;
+	} else if (ctx->cap->type == INTF_DP) {
+		hsync_polarity = p->hsync_polarity;
+		vsync_polarity = p->vsync_polarity;
 	} else {
 		hsync_polarity = 0;
 		vsync_polarity = 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index f9af52a..9591d42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -41,6 +41,7 @@
 #define MDP_WD_TIMER_4_CTL                0x440
 #define MDP_WD_TIMER_4_CTL2               0x444
 #define MDP_WD_TIMER_4_LOAD_VALUE         0x448
+#define DP_PHY_INTF_SEL                   0x460
 
 #define MDP_TICK_COUNT                    16
 #define XO_CLK_RATE                       19200
@@ -275,6 +276,9 @@ static void dpu_hw_intf_audio_select(struct dpu_hw_mdp *mdp)
 	c = &mdp->hw;
 
 	DPU_REG_WRITE(c, HDMI_DP_CORE_SELECT, 0x1);
+
+	if (mdp->caps->features & BIT(DPU_MDP_DP_PHY_SEL))
+		DPU_REG_WRITE(c, DP_PHY_INTF_SEL, mdp->caps->dp_phy_intf_sel);
 }
 
 static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
-- 
1.9.1

