Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFFB485C17
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 00:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245312AbiAEXKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 18:10:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245317AbiAEXKj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 18:10:39 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B946C061245
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 15:10:39 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id k27so1276115ljc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 15:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cKFdnFAMjQClpKd8n9xcWEAjx8yd8OmN176D7J/0hro=;
        b=dKcNBpM4phoaoo+N61fjEjk3erL0PS4VvBLeHl1EbEtEgw5btQUwRu3fUgtO+Q1ROT
         Wxlwbat53hR8brvc37hbPOyx5iVB6+bGl9f8OFVMvV7UA05kCJnBnj12sR1b6Etz+JvN
         fAvtw/7gDC8sqVmlHGRz1HtAliojB5G5+mevf4BgtrVy72CRbaQfo/FBUInyHuwETZGN
         0J/pH8U3qi6+jOhHAiXYTLmDbrt0JyirgEP18iX6dJLqtUpWOxTrNu+J7Ad1KzC19G5I
         pSMVJQBKa7TLYlOeUy5sMUZMYdMH5JQXkbTM9o9l9MroV39FpH42iNEZT97OYTJxAGhc
         quGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cKFdnFAMjQClpKd8n9xcWEAjx8yd8OmN176D7J/0hro=;
        b=UNMVrmTww1jA8UIbuZecZtPtyoGGNi5lfDb7Xt8FXukiHFvHfVmRkMJKItsadCP6hb
         mLXWnHxq3CNf/jH1eCYd7iBGuh3O0X5ZX9zJhDdYp73z999xP0qtlbIM/yJIsdzzBXGZ
         ViRxSPY2yGLsrDxHlpzFSrPfKOWltb5TrPDQvGlCJUE405udmXUCCsSsQOvVB8phDjX0
         /4oGAKKHZKVFy6XEvuJkXj+IuEnQ0fCOrpQ5Vix/6cqDpebb6gK55MPItE08cL57gyMW
         3+GIpwUJu02o3Qk220zBVqwsIzyJMBK53ynrAe54FUMMEa/WQaSo27R0HjnPUB1A4Xph
         Fz9w==
X-Gm-Message-State: AOAM531lUjwlrcZJybPFKwtxnWx9oXy6+gdW+xzJ79Ayetn1zTCmRPIo
        gwwgsRvQtFbUjzcefA/KhXtNHg==
X-Google-Smtp-Source: ABdhPJyqC79wwdQqf4vhzvlQWaO8mIovfMAV43Arrurz3w2lH6rHPcr/IYFPGdU+TVDA8S3UxpYvOQ==
X-Received: by 2002:a2e:b894:: with SMTP id r20mr45981989ljp.304.1641424237433;
        Wed, 05 Jan 2022 15:10:37 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a13sm27187lff.104.2022.01.05.15.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 15:10:36 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 3/5] drm/msm/dpu: get INTF blocks directly rather than through RM
Date:   Thu,  6 Jan 2022 02:10:29 +0300
Message-Id: <20220105231031.436020-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

INTF blocks are not really handled by resource manager, they are
assigned at dpu_encoder_setup_display using dpu_encoder_get_intf().
Then this allocation is passed to RM and then returned to then
dpu_encoder.
So allocate them outside of RM and use them directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 36 +---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   | 16 -----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  5 --
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  8 ---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  8 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 68 ++-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  8 +++
 8 files changed, 16 insertions(+), 134 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1e648db439f9..11f7126728db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -420,26 +420,6 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
 	return linecount;
 }
 
-void dpu_encoder_get_hw_resources(struct drm_encoder *drm_enc,
-				  struct dpu_encoder_hw_resources *hw_res)
-{
-	struct dpu_encoder_virt *dpu_enc = NULL;
-	int i = 0;
-
-	dpu_enc = to_dpu_encoder_virt(drm_enc);
-	DPU_DEBUG_ENC(dpu_enc, "\n");
-
-	/* Query resources used by phys encs, expected to be without overlap */
-	memset(hw_res, 0, sizeof(*hw_res));
-
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-		if (phys->ops.get_hw_resources)
-			phys->ops.get_hw_resources(phys, hw_res);
-	}
-}
-
 static void dpu_encoder_destroy(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
@@ -973,7 +953,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
 	int num_lm, num_ctl, num_pp;
-	int i, j;
+	int i;
 
 	if (!drm_enc) {
 		DPU_ERROR("invalid encoder\n");
@@ -1040,8 +1020,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	cstate->num_mixers = num_lm;
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		int num_blk;
-		struct dpu_hw_blk *hw_blk[MAX_CHANNELS_PER_ENC];
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
 		if (!dpu_enc->hw_pp[i]) {
@@ -1059,16 +1037,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 		phys->hw_pp = dpu_enc->hw_pp[i];
 		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
 
-		num_blk = dpu_rm_get_assigned_resources(&dpu_kms->rm,
-			global_state, drm_enc->base.id, DPU_HW_BLK_INTF,
-			hw_blk, ARRAY_SIZE(hw_blk));
-		for (j = 0; j < num_blk; j++) {
-			struct dpu_hw_intf *hw_intf;
-
-			hw_intf = to_dpu_hw_intf(hw_blk[i]);
-			if (hw_intf->idx == phys->intf_idx)
-				phys->hw_intf = hw_intf;
-		}
+		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
+			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
 
 		if (!phys->hw_intf) {
 			DPU_ERROR_ENC(dpu_enc,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index e241914a9677..722dd7db6bdf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -18,22 +18,6 @@
 
 #define IDLE_TIMEOUT	(66 - 16/2)
 
-/**
- * Encoder functions and data types
- * @intfs:	Interfaces this encoder is using, INTF_MODE_NONE if unused
- */
-struct dpu_encoder_hw_resources {
-	enum dpu_intf_mode intfs[INTF_MAX];
-};
-
-/**
- * dpu_encoder_get_hw_resources - Populate table of required hardware resources
- * @encoder:	encoder pointer
- * @hw_res:	resource table to populate with encoder required resources
- */
-void dpu_encoder_get_hw_resources(struct drm_encoder *encoder,
-				  struct dpu_encoder_hw_resources *hw_res);
-
 /**
  * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
  * @encoder:	encoder pointer
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index e7270eb6b84b..42febfce79c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -91,9 +91,6 @@ struct dpu_encoder_virt_ops {
  * @disable:			DRM Call. Disable mode.
  * @atomic_check:		DRM Call. Atomic check new DRM state.
  * @destroy:			DRM Call. Destroy and release resources.
- * @get_hw_resources:		Populate the structure with the hardware
- *				resources that this phys_enc is using.
- *				Expect no overlap between phys_encs.
  * @control_vblank_irq		Register/Deregister for VBLANK IRQ
  * @wait_for_commit_done:	Wait for hardware to have flushed the
  *				current pending frames to hardware
@@ -129,8 +126,6 @@ struct dpu_encoder_phys_ops {
 			    struct drm_crtc_state *crtc_state,
 			    struct drm_connector_state *conn_state);
 	void (*destroy)(struct dpu_encoder_phys *encoder);
-	void (*get_hw_resources)(struct dpu_encoder_phys *encoder,
-				 struct dpu_encoder_hw_resources *hw_res);
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
 	int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
 	int (*wait_for_tx_complete)(struct dpu_encoder_phys *phys_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 34a6940d12c5..7d2beea9cc4e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -534,13 +534,6 @@ static void dpu_encoder_phys_cmd_destroy(struct dpu_encoder_phys *phys_enc)
 	kfree(cmd_enc);
 }
 
-static void dpu_encoder_phys_cmd_get_hw_resources(
-		struct dpu_encoder_phys *phys_enc,
-		struct dpu_encoder_hw_resources *hw_res)
-{
-	hw_res->intfs[phys_enc->intf_idx - INTF_0] = INTF_MODE_CMD;
-}
-
 static void dpu_encoder_phys_cmd_prepare_for_kickoff(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -736,7 +729,6 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->enable = dpu_encoder_phys_cmd_enable;
 	ops->disable = dpu_encoder_phys_cmd_disable;
 	ops->destroy = dpu_encoder_phys_cmd_destroy;
-	ops->get_hw_resources = dpu_encoder_phys_cmd_get_hw_resources;
 	ops->control_vblank_irq = dpu_encoder_phys_cmd_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_cmd_wait_for_commit_done;
 	ops->prepare_for_kickoff = dpu_encoder_phys_cmd_prepare_for_kickoff;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ddd9d89cd456..db6a9b896e42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -465,13 +465,6 @@ static void dpu_encoder_phys_vid_destroy(struct dpu_encoder_phys *phys_enc)
 	kfree(phys_enc);
 }
 
-static void dpu_encoder_phys_vid_get_hw_resources(
-		struct dpu_encoder_phys *phys_enc,
-		struct dpu_encoder_hw_resources *hw_res)
-{
-	hw_res->intfs[phys_enc->intf_idx - INTF_0] = INTF_MODE_VIDEO;
-}
-
 static int dpu_encoder_phys_vid_wait_for_vblank(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -680,7 +673,6 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->enable = dpu_encoder_phys_vid_enable;
 	ops->disable = dpu_encoder_phys_vid_disable;
 	ops->destroy = dpu_encoder_phys_vid_destroy;
-	ops->get_hw_resources = dpu_encoder_phys_vid_get_hw_resources;
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
 	ops->wait_for_vblank = dpu_encoder_phys_vid_wait_for_vblank;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 2d385b4b7f5e..3f518c809e33 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -144,7 +144,6 @@ struct dpu_global_state {
 	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
 	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
-	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
 	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 63ed0d7df848..8df21a46308e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -28,7 +28,6 @@ static inline bool reserved_by_other(uint32_t *res_map, int idx,
  */
 struct dpu_rm_requirements {
 	struct msm_display_topology topology;
-	struct dpu_encoder_hw_resources hw_res;
 };
 
 int dpu_rm_destroy(struct dpu_rm *rm)
@@ -448,54 +447,6 @@ static int _dpu_rm_reserve_ctls(
 	return 0;
 }
 
-static int _dpu_rm_reserve_intf(
-		struct dpu_rm *rm,
-		struct dpu_global_state *global_state,
-		uint32_t enc_id,
-		uint32_t id)
-{
-	int idx = id - INTF_0;
-
-	if (idx < 0 || idx >= ARRAY_SIZE(rm->intf_blks)) {
-		DPU_ERROR("invalid intf id: %d", id);
-		return -EINVAL;
-	}
-
-	if (!rm->intf_blks[idx]) {
-		DPU_ERROR("couldn't find intf id %d\n", id);
-		return -EINVAL;
-	}
-
-	if (reserved_by_other(global_state->intf_to_enc_id, idx, enc_id)) {
-		DPU_ERROR("intf id %d already reserved\n", id);
-		return -ENAVAIL;
-	}
-
-	global_state->intf_to_enc_id[idx] = enc_id;
-	return 0;
-}
-
-static int _dpu_rm_reserve_intf_related_hw(
-		struct dpu_rm *rm,
-		struct dpu_global_state *global_state,
-		uint32_t enc_id,
-		struct dpu_encoder_hw_resources *hw_res)
-{
-	int i, ret = 0;
-	u32 id;
-
-	for (i = 0; i < ARRAY_SIZE(hw_res->intfs); i++) {
-		if (hw_res->intfs[i] == INTF_MODE_NONE)
-			continue;
-		id = i + INTF_0;
-		ret = _dpu_rm_reserve_intf(rm, global_state, enc_id, id);
-		if (ret)
-			return ret;
-	}
-
-	return ret;
-}
-
 static int _dpu_rm_make_reservation(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
@@ -517,11 +468,6 @@ static int _dpu_rm_make_reservation(
 		return ret;
 	}
 
-	ret = _dpu_rm_reserve_intf_related_hw(rm, global_state, enc->base.id,
-				&reqs->hw_res);
-	if (ret)
-		return ret;
-
 	return ret;
 }
 
@@ -530,8 +476,6 @@ static int _dpu_rm_populate_requirements(
 		struct dpu_rm_requirements *reqs,
 		struct msm_display_topology req_topology)
 {
-	dpu_encoder_get_hw_resources(enc, &reqs->hw_res);
-
 	reqs->topology = req_topology;
 
 	DRM_DEBUG_KMS("num_lm: %d num_enc: %d num_intf: %d\n",
@@ -561,8 +505,6 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->mixer_to_enc_id), enc->base.id);
 	_dpu_rm_clear_mapping(global_state->ctl_to_enc_id,
 		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
-	_dpu_rm_clear_mapping(global_state->intf_to_enc_id,
-		ARRAY_SIZE(global_state->intf_to_enc_id), enc->base.id);
 }
 
 int dpu_rm_reserve(
@@ -626,11 +568,6 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		hw_to_enc_id = global_state->ctl_to_enc_id;
 		max_blks = ARRAY_SIZE(rm->ctl_blks);
 		break;
-	case DPU_HW_BLK_INTF:
-		hw_blks = rm->intf_blks;
-		hw_to_enc_id = global_state->intf_to_enc_id;
-		max_blks = ARRAY_SIZE(rm->intf_blks);
-		break;
 	case DPU_HW_BLK_DSPP:
 		hw_blks = rm->dspp_blks;
 		hw_to_enc_id = global_state->dspp_to_enc_id;
@@ -656,3 +593,8 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	return num_blks;
 }
+
+struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_intf intf_idx)
+{
+	return to_dpu_hw_intf(rm->intf_blks[intf_idx - INTF_0]);
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 0f27759211b5..ee50f6651b6e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -84,5 +84,13 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
+
+/**
+ * dpu_rm_get_intf - Return a struct dpu_hw_intf instance given it's index.
+ * @rm: DPU Resource Manager handle
+ * @intf_idx: INTF's index
+ */
+struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_intf intf_idx);
+
 #endif /* __DPU_RM_H__ */
 
-- 
2.34.1

