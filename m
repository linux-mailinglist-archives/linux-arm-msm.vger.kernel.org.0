Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5CA7103892
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 12:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfKTLUW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 06:20:22 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:47373 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726689AbfKTLUW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 06:20:22 -0500
X-Greylist: delayed 368 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 Nov 2019 06:20:19 EST
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Nov 2019 16:44:10 +0530
IronPort-SDR: pn+R0V5Xz7YUQJm6myK8AB+Q6GrdHvnsam5vCD842OkTeVewAshWlUHlwP//hkd7PnkiyJ3c2B
 igXx7kptD2VFmXBfqPo3bvhWSL7sStxzNt6nPWfyoYoE/6H2Us5me1MPbFeeYzOnN5ZXzU3Jom
 fSyRxvKTXmlg60X3nu+Oqb/CsVgKGqm3hxJF02p+R37H/GEiM5nBgdoiwrs3eEj3BoS0SUcEGq
 HFB1siXgMPks/VV6Q+/wBjImenYwNu91WfxpeMfIQqlHuVCY5ljGe+XXUYtxDphLTX4UEzBrs1
 WC7dRh19EGSQqtCcVZzs+7dm
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg02-blr.qualcomm.com with ESMTP; 20 Nov 2019 16:43:43 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 66BD94347; Wed, 20 Nov 2019 16:43:42 +0530 (IST)
From:   Kalyan Thota <kalyan_t@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org, dhar@codeaurora.org,
        jsanka@codeaurora.org, chandanu@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org
Subject: [PATCH v2] msm:disp:dpu1: setup display datapath for SC7180 target
Date:   Wed, 20 Nov 2019 16:43:38 +0530
Message-Id: <1574248418-20147-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add changes to setup display datapath on SC7180 target.

Changes in v1:
 - Add changes to support ctl_active on SC7180 target.
 - While selecting the number of mixers in the topology
   consider the interface width.

Changes in v2:
 - Spawn topology mixer selection into seperate patch (Rob Clark).
 - Add co-developed-by tags in the commit msg (Stephen Boyd).

This patch has dependency on the below series

https://patchwork.kernel.org/patch/11253539/

Co-developed-by: Shubhashree Dhar <dhar@codeaurora.org>
Signed-off-by: Shubhashree Dhar <dhar@codeaurora.org>
Co-developed-by: Raviteja Tamatam <travitej@codeaurora.org>
Signed-off-by: Raviteja Tamatam <travitej@codeaurora.org>
Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 21 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 84 +++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         | 24 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 28 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  6 ++
 6 files changed, 159 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index b9c84fb..8cc8ad12 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -280,6 +280,14 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
 			&timing_params, fmt);
 	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
+
+	/* setup which pp blk will connect to this intf */
+	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
+		phys_enc->hw_intf->ops.bind_pingpong_blk(
+				phys_enc->hw_intf,
+				true,
+				phys_enc->hw_pp->idx);
+
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 
 	programmable_fetch_config(phys_enc, &timing_params);
@@ -435,6 +443,7 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_ctl *ctl;
 	u32 flush_mask = 0;
+	u32 intf_flush_mask = 0;
 
 	ctl = phys_enc->hw_ctl;
 
@@ -459,10 +468,18 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 	ctl->ops.get_bitmask_intf(ctl, &flush_mask, phys_enc->hw_intf->idx);
 	ctl->ops.update_pending_flush(ctl, flush_mask);
 
+	if (ctl->ops.get_bitmask_active_intf)
+		ctl->ops.get_bitmask_active_intf(ctl, &intf_flush_mask,
+			phys_enc->hw_intf->idx);
+
+	if (ctl->ops.update_pending_intf_flush)
+		ctl->ops.update_pending_intf_flush(ctl, intf_flush_mask);
+
 skip_flush:
 	DPU_DEBUG_VIDENC(phys_enc,
-			 "update pending flush ctl %d flush_mask %x\n",
-			 ctl->idx - CTL_0, flush_mask);
+		"update pending flush ctl %d flush_mask 0%x intf_mask 0x%x\n",
+		ctl->idx - CTL_0, flush_mask, intf_flush_mask);
+
 
 	/* ctl_flush & timing engine enable will be triggered by framework */
 	if (phys_enc->enable_state == DPU_ENC_DISABLED)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 1cf4509..0ee2b6c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -374,6 +374,7 @@
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x280, \
+	.features = BIT(DPU_CTL_ACTIVE_CFG), \
 	.type = _type, \
 	.controller_id = _ctrl_id, \
 	.prog_fetch_lines_worst_case = 24 \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 179e8d5..2ce4b5a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -22,11 +22,15 @@
 #define   CTL_PREPARE                   0x0d0
 #define   CTL_SW_RESET                  0x030
 #define   CTL_LAYER_EXTN_OFFSET         0x40
+#define   CTL_INTF_ACTIVE               0x0F4
+#define   CTL_INTF_FLUSH                0x110
+#define   CTL_INTF_MASTER               0x134
 
 #define CTL_MIXER_BORDER_OUT            BIT(24)
 #define CTL_FLUSH_MASK_CTL              BIT(17)
 
 #define DPU_REG_RESET_TIMEOUT_US        2000
+#define  INTF_IDX       31
 
 static struct dpu_ctl_cfg *_ctl_offset(enum dpu_ctl ctl,
 		struct dpu_mdss_cfg *m,
@@ -100,11 +104,27 @@ static inline void dpu_hw_ctl_update_pending_flush(struct dpu_hw_ctl *ctx,
 	ctx->pending_flush_mask |= flushbits;
 }
 
+static inline void dpu_hw_ctl_update_pending_intf_flush(struct dpu_hw_ctl *ctx,
+		u32 flushbits)
+{
+	ctx->pending_intf_flush_mask |= flushbits;
+}
+
 static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
 {
 	return ctx->pending_flush_mask;
 }
 
+static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
+{
+
+	if (ctx->pending_flush_mask & BIT(INTF_IDX))
+		DPU_REG_WRITE(&ctx->hw, CTL_INTF_FLUSH,
+				ctx->pending_intf_flush_mask);
+
+	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
+}
+
 static inline void dpu_hw_ctl_trigger_flush(struct dpu_hw_ctl *ctx)
 {
 	trace_dpu_hw_ctl_trigger_pending_flush(ctx->pending_flush_mask,
@@ -222,6 +242,36 @@ static int dpu_hw_ctl_get_bitmask_intf(struct dpu_hw_ctl *ctx,
 	return 0;
 }
 
+static int dpu_hw_ctl_get_bitmask_intf_v1(struct dpu_hw_ctl *ctx,
+		u32 *flushbits, enum dpu_intf intf)
+{
+	switch (intf) {
+	case INTF_0:
+	case INTF_1:
+		*flushbits |= BIT(31);
+		break;
+	default:
+		return 0;
+	}
+	return 0;
+}
+
+static int dpu_hw_ctl_active_get_bitmask_intf(struct dpu_hw_ctl *ctx,
+		u32 *flushbits, enum dpu_intf intf)
+{
+	switch (intf) {
+	case INTF_0:
+		*flushbits |= BIT(0);
+		break;
+	case INTF_1:
+		*flushbits |= BIT(1);
+		break;
+	default:
+		return 0;
+	}
+	return 0;
+}
+
 static u32 dpu_hw_ctl_poll_reset_status(struct dpu_hw_ctl *ctx, u32 timeout_us)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
@@ -422,6 +472,24 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(c, CTL_LAYER_EXT3(lm), mixercfg_ext3);
 }
 
+
+static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
+		struct dpu_hw_intf_cfg *cfg)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	u32 intf_active = 0;
+	u32 mode_sel = 0;
+
+	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
+		mode_sel |= BIT(17);
+
+	intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
+	intf_active |= BIT(cfg->intf - INTF_0);
+
+	DPU_REG_WRITE(c, CTL_TOP, mode_sel);
+	DPU_REG_WRITE(c, CTL_INTF_ACTIVE, intf_active);
+}
+
 static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
 		struct dpu_hw_intf_cfg *cfg)
 {
@@ -455,21 +523,31 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
 static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 		unsigned long cap)
 {
+	if (cap & BIT(DPU_CTL_ACTIVE_CFG)) {
+		ops->trigger_flush = dpu_hw_ctl_trigger_flush_v1;
+		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
+		ops->get_bitmask_intf = dpu_hw_ctl_get_bitmask_intf_v1;
+		ops->get_bitmask_active_intf =
+			dpu_hw_ctl_active_get_bitmask_intf;
+		ops->update_pending_intf_flush =
+			dpu_hw_ctl_update_pending_intf_flush;
+	} else {
+		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
+		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
+		ops->get_bitmask_intf = dpu_hw_ctl_get_bitmask_intf;
+	}
 	ops->clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
 	ops->update_pending_flush = dpu_hw_ctl_update_pending_flush;
 	ops->get_pending_flush = dpu_hw_ctl_get_pending_flush;
-	ops->trigger_flush = dpu_hw_ctl_trigger_flush;
 	ops->get_flush_register = dpu_hw_ctl_get_flush_register;
 	ops->trigger_start = dpu_hw_ctl_trigger_start;
 	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
-	ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
 	ops->reset = dpu_hw_ctl_reset_control;
 	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
 	ops->clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
 	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	ops->get_bitmask_sspp = dpu_hw_ctl_get_bitmask_sspp;
 	ops->get_bitmask_mixer = dpu_hw_ctl_get_bitmask_mixer;
-	ops->get_bitmask_intf = dpu_hw_ctl_get_bitmask_intf;
 };
 
 static struct dpu_hw_blk_ops dpu_hw_ops;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index d3ae939..1e3973c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -91,6 +91,15 @@ struct dpu_hw_ctl_ops {
 		u32 flushbits);
 
 	/**
+	 * OR in the given flushbits to the cached pending_intf_flush_mask
+	 * No effect on hardware
+	 * @ctx       : ctl path ctx pointer
+	 * @flushbits : module flushmask
+	 */
+	void (*update_pending_intf_flush)(struct dpu_hw_ctl *ctx,
+		u32 flushbits);
+
+	/**
 	 * Write the value of the pending_flush_mask to hardware
 	 * @ctx       : ctl path ctx pointer
 	 */
@@ -130,11 +139,24 @@ struct dpu_hw_ctl_ops {
 	uint32_t (*get_bitmask_mixer)(struct dpu_hw_ctl *ctx,
 		enum dpu_lm blk);
 
+	/**
+	 * Query the value of the intf flush mask
+	 * No effect on hardware
+	 * @ctx       : ctl path ctx pointer
+	 */
 	int (*get_bitmask_intf)(struct dpu_hw_ctl *ctx,
 		u32 *flushbits,
 		enum dpu_intf blk);
 
 	/**
+	 * Query the value of the intf active flush mask
+	 * No effect on hardware
+	 * @ctx       : ctl path ctx pointer
+	 */
+	int (*get_bitmask_active_intf)(struct dpu_hw_ctl *ctx,
+		u32 *flushbits, enum dpu_intf blk);
+
+	/**
 	 * Set all blend stages to disabled
 	 * @ctx       : ctl path ctx pointer
 	 */
@@ -159,6 +181,7 @@ struct dpu_hw_ctl_ops {
  * @mixer_count: number of mixers
  * @mixer_hw_caps: mixer hardware capabilities
  * @pending_flush_mask: storage for pending ctl_flush managed via ops
+ * @pending_intf_flush_mask: pending INTF flush
  * @ops: operation list
  */
 struct dpu_hw_ctl {
@@ -171,6 +194,7 @@ struct dpu_hw_ctl {
 	int mixer_count;
 	const struct dpu_lm_cfg *mixer_hw_caps;
 	u32 pending_flush_mask;
+	u32 pending_intf_flush_mask;
 
 	/* ops */
 	struct dpu_hw_ctl_ops ops;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index dcd87cd..eff5e6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -56,6 +56,8 @@
 #define   INTF_FRAME_COUNT              0x0AC
 #define   INTF_LINE_COUNT               0x0B0
 
+#define   INTF_MUX                      0x25C
+
 static struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
 		struct dpu_mdss_cfg *m,
 		void __iomem *addr,
@@ -218,6 +220,30 @@ static void dpu_hw_intf_setup_prg_fetch(
 	DPU_REG_WRITE(c, INTF_CONFIG, fetch_enable);
 }
 
+static void dpu_hw_intf_bind_pingpong_blk(
+		struct dpu_hw_intf *intf,
+		bool enable,
+		const enum dpu_pingpong pp)
+{
+	struct dpu_hw_blk_reg_map *c;
+	u32 mux_cfg;
+
+	if (!intf)
+		return;
+
+	c = &intf->hw;
+
+	mux_cfg = DPU_REG_READ(c, INTF_MUX);
+	mux_cfg &= ~0xf;
+
+	if (enable)
+		mux_cfg |= (pp - PINGPONG_0) & 0x7;
+	else
+		mux_cfg |= 0xf;
+
+	DPU_REG_WRITE(c, INTF_MUX, mux_cfg);
+}
+
 static void dpu_hw_intf_get_status(
 		struct dpu_hw_intf *intf,
 		struct intf_status *s)
@@ -254,6 +280,8 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 	ops->get_status = dpu_hw_intf_get_status;
 	ops->enable_timing = dpu_hw_intf_enable_timing_engine;
 	ops->get_line_count = dpu_hw_intf_get_line_count;
+	if (cap & BIT(DPU_CTL_ACTIVE_CFG))
+		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
 }
 
 static struct dpu_hw_blk_ops dpu_hw_ops;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index b03acc2..a1e0ef3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -52,6 +52,8 @@ struct intf_status {
  * @ enable_timing: enable/disable timing engine
  * @ get_status: returns if timing engine is enabled or not
  * @ get_line_count: reads current vertical line counter
+ * @bind_pingpong_blk: enable/disable the connection with pingpong which will
+ *                     feed pixels to this interface
  */
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
@@ -68,6 +70,10 @@ struct dpu_hw_intf_ops {
 			struct intf_status *status);
 
 	u32 (*get_line_count)(struct dpu_hw_intf *intf);
+
+	void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
+			bool enable,
+			const enum dpu_pingpong pp);
 };
 
 struct dpu_hw_intf {
-- 
1.9.1

