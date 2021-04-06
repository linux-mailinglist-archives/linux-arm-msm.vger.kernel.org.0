Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41A3354C20
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 07:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243756AbhDFFKm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 01:10:42 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26087 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243713AbhDFFKa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 01:10:30 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 05 Apr 2021 22:10:24 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Apr 2021 22:10:22 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Apr 2021 10:40:10 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id E466221B31; Tue,  6 Apr 2021 10:40:08 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        kalyan_t@codeaurora.org, dianders@chromium.org
Subject: [PATCH v1 3/4] drm/msm/disp/dpu1: add support to program fetch active in ctl path
Date:   Tue,  6 Apr 2021 10:39:51 +0530
Message-Id: <1617685792-14376-4-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617685792-14376-1-git-send-email-mkrishn@codeaurora.org>
References: <1617685792-14376-1-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A new register called CTL_FETCH_ACTIVE is introduced in
SC7280 family which is used to inform the HW about
the pipes which are active in the current ctl path.
This change adds support to program this register
based on the active pipes in the current composition.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c   |  7 ++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  3 +++
 3 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9607a76..4d2f7d7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -130,7 +130,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	uint32_t stage_idx, lm_idx;
 	int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
 	bool bg_alpha_enable = false;
+	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
+	memset(fetch_active, 0, sizeof(fetch_active));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		state = plane->state;
 		if (!state)
@@ -140,7 +142,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		fb = state->fb;
 
 		dpu_plane_get_ctl_flush(plane, ctl, &flush_mask);
-
+		set_bit(dpu_plane_pipe(plane), fetch_active);
 		DPU_DEBUG("crtc %d stage:%d - plane %d sspp %d fb %d\n",
 				crtc->base.id,
 				pstate->stage,
@@ -180,6 +182,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		}
 	}
 
+	if (ctl->ops.set_active_pipes)
+		ctl->ops.set_active_pipes(ctl, fetch_active);
+
 	 _dpu_crtc_program_lm_output_roi(crtc);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 8981cfa..3cf489b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -27,6 +27,7 @@
 #define   CTL_MERGE_3D_FLUSH            0x100
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_INTF_MASTER               0x134
+#define   CTL_FETCH_PIPE_ACTIVE         0x0FC
 
 #define CTL_MIXER_BORDER_OUT            BIT(24)
 #define CTL_FLUSH_MASK_CTL              BIT(17)
@@ -34,6 +35,11 @@
 #define DPU_REG_RESET_TIMEOUT_US        2000
 #define  MERGE_3D_IDX   23
 #define  INTF_IDX       31
+#define CTL_INVALID_BIT                 0xffff
+
+static const u32 fetch_tbl[SSPP_MAX] = {CTL_INVALID_BIT, 16, 17, 18, 19,
+	CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, 0,
+	1, 2, 3, CTL_INVALID_BIT, CTL_INVALID_BIT};
 
 static const struct dpu_ctl_cfg *_ctl_offset(enum dpu_ctl ctl,
 		const struct dpu_mdss_cfg *m,
@@ -344,6 +350,8 @@ static void dpu_hw_ctl_clear_all_blendstages(struct dpu_hw_ctl *ctx)
 		DPU_REG_WRITE(c, CTL_LAYER_EXT2(LM_0 + i), 0);
 		DPU_REG_WRITE(c, CTL_LAYER_EXT3(LM_0 + i), 0);
 	}
+
+	DPU_REG_WRITE(c, CTL_FETCH_PIPE_ACTIVE, 0);
 }
 
 static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
@@ -529,6 +537,23 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(c, CTL_TOP, intf_cfg);
 }
 
+static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
+	unsigned long *fetch_active)
+{
+	int i;
+	u32 val = 0;
+
+	if (fetch_active) {
+		for (i = 0; i < SSPP_MAX; i++) {
+			if (test_bit(i, fetch_active) &&
+				fetch_tbl[i] != CTL_INVALID_BIT)
+				val |= BIT(fetch_tbl[i]);
+		}
+	}
+
+	DPU_REG_WRITE(&ctx->hw, CTL_FETCH_PIPE_ACTIVE, val);
+}
+
 static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 		unsigned long cap)
 {
@@ -558,6 +583,8 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 	ops->get_bitmask_sspp = dpu_hw_ctl_get_bitmask_sspp;
 	ops->get_bitmask_mixer = dpu_hw_ctl_get_bitmask_mixer;
 	ops->get_bitmask_dspp = dpu_hw_ctl_get_bitmask_dspp;
+	if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
+		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
 };
 
 static struct dpu_hw_blk_ops dpu_hw_ops;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index e93a42a..806c171 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -167,6 +167,9 @@ struct dpu_hw_ctl_ops {
 	 */
 	void (*setup_blendstage)(struct dpu_hw_ctl *ctx,
 		enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg);
+
+	void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
+		unsigned long *fetch_active);
 };
 
 /**
-- 
2.7.4

