Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36E774A806B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 09:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345346AbiBCI0i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 03:26:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349583AbiBCI0a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 03:26:30 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FEEEC061759
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 00:26:19 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b9so4360517lfq.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 00:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kxx+KIsoHDhwboQa53vIY1pbo+Mq+g9OnoduNhwfSIo=;
        b=xYYyUP7csIEsiSPKFNcA1VEGne27p5LLKWa6gWf18Co1jtWThk7R1WLbVYLZZK6PHk
         o5EYCDDf5rmBDRbk+ISwmaPIWZUAZWeqlDsmXDXiFWcUBn/EeN+3pubgaTodzAyIKSEu
         8PNC+ghgflkmaLBmoQrBlN+WEtf2SQ+8Fzztm1lp5xk0Z4o0fHbzc23aJ+Pb7rxs8htJ
         Rt5IVSDIZSCGArLGH/0me3d4xD8CNmCJHsM5FynYKv/mwrxB08Lu5f9sXm6hm/W5NvQH
         TncZGwnAvNd7n6jmhc0u8GdVVphoeoPY8r7RS5G5xCvhU3Emy0GrrpTx/k+6IIQKIi4I
         psQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kxx+KIsoHDhwboQa53vIY1pbo+Mq+g9OnoduNhwfSIo=;
        b=aHWWCPWRgkAF5OmzH6MNXiT25UvfDNHA7ff0dobg0exQAhCJA4/veOAZgMWv3RGkSz
         OR1+3rVFaNH279w9bh3vww8xTiJ712KaWSRG3VMr7OzxYlG1A9+RWAaSv2mjuC4SzQJz
         zmkc7QjDxYizZRb47+C9SDIRZZmtA8yNmLZZQN4wBE32Ml3ZNETXGfx4NIrsWZc09ZYh
         FxNbOGVDvZ5twEH9pS6uk7sOtlXbqnkBhJlcPDeauf1M7zilDR809n6o5lvsJc3C0xyA
         xzI++k8i3BXEZYhqAImGkMFcRXG7heOm+9eOiJ86LfCf9BLVy7cy7MseXBgMoM8AFK1r
         tZdw==
X-Gm-Message-State: AOAM5338hkW4vb+MrVmlFHL6wmrZvPvKgnLqnOx0CEv+OtiKJQRTieRU
        uqGJkl4qPbfLEeF/TYTtrwwXVw==
X-Google-Smtp-Source: ABdhPJxVBknx0e2O0VOPFZ5x9Z9ypx3moLc2DO8GsIt+Aspqc19qZ4hFLhqhXkSQnfDp9r/xa+p2Eg==
X-Received: by 2002:a05:6512:2316:: with SMTP id o22mr22064856lfu.244.1643876777798;
        Thu, 03 Feb 2022 00:26:17 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n15sm4083440ljh.36.2022.02.03.00.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 00:26:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 6/7] drm/msm/dpu: switch dpu_encoder to use atomic_mode_set
Date:   Thu,  3 Feb 2022 11:26:10 +0300
Message-Id: <20220203082611.2654810-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make dpu_encoder use atomic_mode_set to receive connector and CRTC
states as arguments rather than finding connector and CRTC by manually
looping through the respective lists.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 37 +++++--------------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  8 ++--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 18 ++-------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 14 ++-----
 4 files changed, 21 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index e1c43a0c0643..1462c426c14c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -930,16 +930,13 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 	return 0;
 }
 
-static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
-				      struct drm_display_mode *mode,
-				      struct drm_display_mode *adj_mode)
+static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
+					     struct drm_crtc_state *crtc_state,
+					     struct drm_connector_state *conn_state)
 {
 	struct dpu_encoder_virt *dpu_enc;
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
-	struct list_head *connector_list;
-	struct drm_connector *conn = NULL, *conn_iter;
-	struct drm_crtc *drm_crtc;
 	struct dpu_crtc_state *cstate;
 	struct dpu_global_state *global_state;
 	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
@@ -959,7 +956,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
-	connector_list = &dpu_kms->dev->mode_config.connector_list;
 
 	global_state = dpu_kms_get_existing_global_state(dpu_kms);
 	if (IS_ERR_OR_NULL(global_state)) {
@@ -969,22 +965,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 	trace_dpu_enc_mode_set(DRMID(drm_enc));
 
-	list_for_each_entry(conn_iter, connector_list, head)
-		if (conn_iter->encoder == drm_enc)
-			conn = conn_iter;
-
-	if (!conn) {
-		DPU_ERROR_ENC(dpu_enc, "failed to find attached connector\n");
-		return;
-	} else if (!conn->state) {
-		DPU_ERROR_ENC(dpu_enc, "invalid connector state\n");
-		return;
-	}
-
-	drm_for_each_crtc(drm_crtc, drm_enc->dev)
-		if (drm_crtc->state->encoder_mask & drm_encoder_mask(drm_enc))
-			break;
-
 	/* Query resource that have been reserved in atomic check step. */
 	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
@@ -1001,7 +981,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
 						: NULL;
 
-	cstate = to_dpu_crtc_state(drm_crtc->state);
+	cstate = to_dpu_crtc_state(crtc_state);
 
 	for (i = 0; i < num_lm; i++) {
 		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
@@ -1050,9 +1030,10 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
-		phys->connector = conn->state->connector;
-		if (phys->ops.mode_set)
-			phys->ops.mode_set(phys, mode, adj_mode);
+		phys->connector = conn_state->connector;
+		phys->cached_mode = crtc_state->adjusted_mode;
+		if (phys->ops.atomic_mode_set)
+			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
 	}
 }
 
@@ -2057,7 +2038,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 }
 
 static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
-	.mode_set = dpu_encoder_virt_mode_set,
+	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
 	.disable = dpu_encoder_virt_disable,
 	.enable = dpu_encoder_virt_enable,
 	.atomic_check = dpu_encoder_virt_atomic_check,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 159deb8ed7fb..6e80321b13c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -84,7 +84,7 @@ struct dpu_encoder_virt_ops {
  * @is_master:			Whether this phys_enc is the current master
  *				encoder. Can be switched at enable time. Based
  *				on split_role and current mode (CMD/VID).
- * @mode_set:			DRM Call. Set a DRM mode.
+ * @atomic_mode_set:		DRM Call. Set a DRM mode.
  *				This likely caches the mode, for use at enable.
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
@@ -115,9 +115,9 @@ struct dpu_encoder_phys_ops {
 			struct dentry *debugfs_root);
 	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
-	void (*mode_set)(struct dpu_encoder_phys *encoder,
-			struct drm_display_mode *mode,
-			struct drm_display_mode *adjusted_mode);
+	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
+			struct drm_crtc_state *crtc_state,
+			struct drm_connector_state *conn_state);
 	void (*enable)(struct dpu_encoder_phys *encoder);
 	void (*disable)(struct dpu_encoder_phys *encoder);
 	void (*destroy)(struct dpu_encoder_phys *encoder);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 45fe97fb612d..6de298d521ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -135,23 +135,13 @@ static void dpu_encoder_phys_cmd_underrun_irq(void *arg, int irq_idx)
 			phys_enc);
 }
 
-static void dpu_encoder_phys_cmd_mode_set(
+static void dpu_encoder_phys_cmd_atomic_mode_set(
 		struct dpu_encoder_phys *phys_enc,
-		struct drm_display_mode *mode,
-		struct drm_display_mode *adj_mode)
+		struct drm_crtc_state *crtc_state,
+		struct drm_connector_state *conn_state)
 {
-	struct dpu_encoder_phys_cmd *cmd_enc =
-		to_dpu_encoder_phys_cmd(phys_enc);
 	struct dpu_encoder_irq *irq;
 
-	if (!mode || !adj_mode) {
-		DPU_ERROR("invalid args\n");
-		return;
-	}
-	phys_enc->cached_mode = *adj_mode;
-	DPU_DEBUG_CMDENC(cmd_enc, "caching mode:\n");
-	drm_mode_debug_printmodeline(adj_mode);
-
 	irq = &phys_enc->irq[INTR_IDX_CTL_START];
 	irq->irq_idx = phys_enc->hw_ctl->caps->intr_start;
 
@@ -722,7 +712,7 @@ static void dpu_encoder_phys_cmd_init_ops(
 {
 	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
 	ops->is_master = dpu_encoder_phys_cmd_is_master;
-	ops->mode_set = dpu_encoder_phys_cmd_mode_set;
+	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_cmd_enable;
 	ops->disable = dpu_encoder_phys_cmd_disable;
 	ops->destroy = dpu_encoder_phys_cmd_destroy;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 1831fe37c88c..0c07db5021eb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -348,19 +348,13 @@ static bool dpu_encoder_phys_vid_needs_single_flush(
 	return phys_enc->split_role != ENC_ROLE_SOLO;
 }
 
-static void dpu_encoder_phys_vid_mode_set(
+static void dpu_encoder_phys_vid_atomic_mode_set(
 		struct dpu_encoder_phys *phys_enc,
-		struct drm_display_mode *mode,
-		struct drm_display_mode *adj_mode)
+		struct drm_crtc_state *crtc_state,
+		struct drm_connector_state *conn_state)
 {
 	struct dpu_encoder_irq *irq;
 
-	if (adj_mode) {
-		phys_enc->cached_mode = *adj_mode;
-		drm_mode_debug_printmodeline(adj_mode);
-		DPU_DEBUG_VIDENC(phys_enc, "caching mode:\n");
-	}
-
 	irq = &phys_enc->irq[INTR_IDX_VSYNC];
 	irq->irq_idx = phys_enc->hw_intf->cap->intr_vsync;
 
@@ -662,7 +656,7 @@ static int dpu_encoder_phys_vid_get_frame_count(
 static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_vid_is_master;
-	ops->mode_set = dpu_encoder_phys_vid_mode_set;
+	ops->atomic_mode_set = dpu_encoder_phys_vid_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_vid_enable;
 	ops->disable = dpu_encoder_phys_vid_disable;
 	ops->destroy = dpu_encoder_phys_vid_destroy;
-- 
2.34.1

