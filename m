Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99DF14F5FA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 15:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbiDFNIB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 09:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232304AbiDFNHa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 09:07:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C63F50D25C;
        Wed,  6 Apr 2022 02:41:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EB767613E2;
        Wed,  6 Apr 2022 09:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5DCC385A1;
        Wed,  6 Apr 2022 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649238070;
        bh=gLzhooWZnfiX9aZwYUtYUD+UyWXX0qoGyyOQreTJlLE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G1ji7/75j0DgeutrAzMpQOyVSnhoxD3o2LddvRN9fMH4bm66qzA0/eHE1MVd7Dzhr
         Q7aSXksge/duYDC4OqgAfaN+OmQ80UN2uroyrROAy6+D4/xUeqJ0Dn/SeY7zinCYoU
         gHkO4ZzVC6gf/zFNpYyy9uzy1IiQNwjFwirTQnL6VcwVa/AzF4FDYFMXinmPHeJiDn
         e8ImoM4LsqVPaIkQG/OkrX4ZLB44DIRjaLOf5k/GXZED9C4EzkAM6p62RaMrqb0q2/
         fSrQnmlDmzZmBTk1hG5W3wYmZMijQFMxD317lOjpz28mI7R1sK57dON21ZGAbNjZFk
         X1a4t23pTbsjQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v7 07/14] drm/msm/disp/dpu1: Add support for DSC in encoder
Date:   Wed,  6 Apr 2022 15:10:24 +0530
Message-Id: <20220406094031.1027376-8-vkoul@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220406094031.1027376-1-vkoul@kernel.org>
References: <20220406094031.1027376-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We need to configure the encoder for DSC configuration and calculate DSC
parameters for the given timing so this patch adds that support by
adding dpu_encoder_prep_dsc() which is invoked when DSC is enabled.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 128 +++++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   8 ++
 2 files changed, 135 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3940b9c6323b..4052486f19d8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -21,6 +21,7 @@
 #include "dpu_hw_intf.h"
 #include "dpu_hw_ctl.h"
 #include "dpu_hw_dspp.h"
+#include "dpu_hw_dsc.h"
 #include "dpu_formats.h"
 #include "dpu_encoder_phys.h"
 #include "dpu_crtc.h"
@@ -135,6 +136,8 @@ enum dpu_enc_rc_states {
  * @cur_slave:		As above but for the slave encoder.
  * @hw_pp:		Handle to the pingpong blocks used for the display. No.
  *			pingpong blocks can be different than num_phys_encs.
+ * @hw_dsc:		Handle to the DSC blocks used for the display.
+ * @dsc_mask:		Bitmask of used DSC blocks.
  * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
  *			for partial update right-only cases, such as pingpong
  *			split where virtual pingpong does not generate IRQs
@@ -168,6 +171,7 @@ enum dpu_enc_rc_states {
  * @vsync_event_work:		worker to handle vsync event for autorefresh
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @dsc:			msm_display_dsc_config pointer, for DSC-enabled encoders
  */
 struct dpu_encoder_virt {
 	struct drm_encoder base;
@@ -180,6 +184,9 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
+
+	unsigned int dsc_mask;
 
 	bool intfs_swapped;
 
@@ -206,6 +213,9 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
+
+	/* DSC configuration */
+	struct msm_display_dsc_config *dsc;
 };
 
 #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
@@ -942,7 +952,9 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
-	int num_lm, num_ctl, num_pp;
+	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
+	int num_lm, num_ctl, num_pp, num_dsc;
+	unsigned int dsc_mask = 0;
 	int i;
 
 	if (!drm_enc) {
@@ -980,6 +992,18 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
 						: NULL;
 
+	if (dpu_enc->dsc) {
+		num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+							drm_enc->base.id, DPU_HW_BLK_DSC,
+							hw_dsc, ARRAY_SIZE(hw_dsc));
+		for (i = 0; i < num_dsc; i++) {
+			dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
+			dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
+		}
+	}
+
+	dpu_enc->dsc_mask = dsc_mask;
+
 	cstate = to_dpu_crtc_state(crtc_state);
 
 	for (i = 0; i < num_lm; i++) {
@@ -1677,6 +1701,95 @@ static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
 			nsecs_to_jiffies(ktime_to_ns(wakeup_time)));
 }
 
+static u32
+dpu_encoder_dsc_initial_line_calc(struct msm_display_dsc_config *dsc,
+				  u32 enc_ip_width)
+{
+	int ssm_delay, total_pixels, soft_slice_per_enc;
+
+	soft_slice_per_enc = enc_ip_width / dsc->drm->slice_width;
+
+	/*
+	 * minimum number of initial line pixels is a sum of:
+	 * 1. sub-stream multiplexer delay (83 groups for 8bpc,
+	 *    91 for 10 bpc) * 3
+	 * 2. for two soft slice cases, add extra sub-stream multiplexer * 3
+	 * 3. the initial xmit delay
+	 * 4. total pipeline delay through the "lock step" of encoder (47)
+	 * 5. 6 additional pixels as the output of the rate buffer is
+	 *    48 bits wide
+	 */
+	ssm_delay = ((dsc->drm->bits_per_component < 10) ? 84 : 92);
+	total_pixels = ssm_delay * 3 + dsc->drm->initial_xmit_delay + 47;
+	if (soft_slice_per_enc > 1)
+		total_pixels += (ssm_delay * 3);
+	return DIV_ROUND_UP(total_pixels, dsc->drm->slice_width);
+}
+
+static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
+				     struct dpu_hw_pingpong *hw_pp,
+				     struct msm_display_dsc_config *dsc,
+				     u32 common_mode,
+				     u32 initial_lines)
+{
+	if (hw_dsc->ops.dsc_config)
+		hw_dsc->ops.dsc_config(hw_dsc, dsc, common_mode, initial_lines);
+
+	if (hw_dsc->ops.dsc_config_thresh)
+		hw_dsc->ops.dsc_config_thresh(hw_dsc, dsc);
+
+	if (hw_pp->ops.setup_dsc)
+		hw_pp->ops.setup_dsc(hw_pp);
+
+	if (hw_pp->ops.enable_dsc)
+		hw_pp->ops.enable_dsc(hw_pp);
+}
+
+static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
+				 struct msm_display_dsc_config *dsc)
+{
+	/* coding only for 2LM, 2enc, 1 dsc config */
+	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
+	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
+	int this_frame_slices;
+	int intf_ip_w, enc_ip_w;
+	int dsc_common_mode;
+	int pic_width;
+	u32 initial_lines;
+	int i;
+
+	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+		hw_pp[i] = dpu_enc->hw_pp[i];
+		hw_dsc[i] = dpu_enc->hw_dsc[i];
+
+		if (!hw_pp[i] || !hw_dsc[i]) {
+			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
+			return;
+		}
+	}
+
+	dsc_common_mode = 0;
+	pic_width = dsc->drm->pic_width;
+
+	dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
+	if (enc_master->intf_mode == INTF_MODE_VIDEO)
+		dsc_common_mode |= DSC_MODE_VIDEO;
+
+	this_frame_slices = pic_width / dsc->drm->slice_width;
+	intf_ip_w = this_frame_slices * dsc->drm->slice_width;
+
+	/*
+	 * dsc merge case: when using 2 encoders for the same stream,
+	 * no. of slices need to be same on both the encoders.
+	 */
+	enc_ip_w = intf_ip_w / 2;
+	initial_lines = dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
+
+	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+		dpu_encoder_dsc_pipe_cfg(hw_dsc[i], hw_pp[i], dsc, dsc_common_mode, initial_lines);
+}
+
 void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
@@ -1708,6 +1821,9 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
 			dpu_encoder_helper_hw_reset(dpu_enc->phys_encs[i]);
 		}
 	}
+
+	if (dpu_enc->dsc)
+		dpu_encoder_prep_dsc(dpu_enc, dpu_enc->dsc);
 }
 
 void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
@@ -1953,6 +2069,8 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		dpu_enc->idle_pc_supported =
 				dpu_kms->catalog->caps->has_idle_pc;
 
+	dpu_enc->dsc = disp_info->dsc;
+
 	mutex_lock(&dpu_enc->enc_lock);
 	for (i = 0; i < disp_info->num_of_h_tiles && !ret; i++) {
 		/*
@@ -2180,3 +2298,11 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
 
 	return INTF_MODE_NONE;
 }
+
+unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
+{
+	struct drm_encoder *encoder = phys_enc->parent;
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
+
+	return dpu_enc->dsc_mask;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index fa8493ac0340..4842070fdfa8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -321,6 +321,14 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 	return BLEND_3D_NONE;
 }
 
+/**
+ * dpu_encoder_helper_get_dsc - get DSC blocks mask for the DPU encoder
+ *   This helper function is used by physical encoder to get DSC blocks mask
+ *   used for this encoder.
+ * @phys_enc: Pointer to physical encoder structure
+ */
+unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
+
 /**
  * dpu_encoder_helper_split_config - split display configuration helper function
  *	This helper function may be used by physical encoders to configure
-- 
2.34.1

