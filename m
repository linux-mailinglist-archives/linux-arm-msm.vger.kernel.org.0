Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E63594B974B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 04:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233234AbiBQDyY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 22:54:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233203AbiBQDyW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 22:54:22 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B3C2A22A4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:54:08 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id g39so7543442lfv.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YsUUu5BvoJNRI6RGzauZ8dUCGqmoZlgd2cuYyPZSuuo=;
        b=l8wJRykiNIfm33vrkQZTVrnWzsapuUXU9j/oX4jKf2rmddED6IEDRo6FyBCmcNj2/k
         KtQ3R1OqOYqsH3TWfO8uVyX8emrAwU6dt7H2xpP5JHO0ekUiL7LSf2CUm6CE06ZdtXjm
         3K2HM3orUL/ahC/MUSVWRBgBj0XHQdQMAovdUifhAiyK9FcmE1F+fT/XaaJILJF+aLnP
         ftXCRcXi1L8rOPRDKam94f5OgqE2epHheHc48Bhl2acaIIHesufyBGwlny41/ajLdApW
         2eOOdJbkUOjORvju2l0HKkA3ErS7Gecqq34gRYG3JW7kJVlotLHT2A72ReDA1CvwUpqZ
         NXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YsUUu5BvoJNRI6RGzauZ8dUCGqmoZlgd2cuYyPZSuuo=;
        b=vog1w5W4I3Zj9sXhXIx5bjFSk/lIZxHdCF4roownWNLFPEp3Fbb8yTMRjbV1XitEuC
         UQIcnOtNXcSvNTrtXwby1GZP66D9fpeOHaocGyjnqklGzse2K1dADWFU5RG7tLlkxrL1
         9NYbAnU4awXVdeEdIRs/4l42MUAIFdfkRjYUtCNp12qF5zMqzkCDxGEkhtAtJ19ENLtA
         GfAUbqFb2CHWjft8GMyCcTg2LXaPFVG6UOLm3EyGs36LgcAuiGlQHXj+8xxK0/OndR8/
         f13ImjQFIZ2KPxOdQB+LhLspFe3yS1WmCX/HSZ1E9aKJ3fEdjIBhQ2TOm2oMfr0BIxFU
         n1hA==
X-Gm-Message-State: AOAM531KnCDdIjmzhzpQVfoR3gqDU2EucM3C7XbvuipayRU2fEV25bHM
        ys+um1c1dosWe40+32jKuguV1Q==
X-Google-Smtp-Source: ABdhPJzYbOw79uWenHEiWIZKhFaAmLRO4B0WdipbYwpS8Mfv+pgIa8bMQ8Nk4iR9X6KvG/UIq0wi+A==
X-Received: by 2002:ac2:58d8:0:b0:442:bc4b:afb7 with SMTP id u24-20020ac258d8000000b00442bc4bafb7mr752514lfo.99.1645070045525;
        Wed, 16 Feb 2022 19:54:05 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h9sm1575454ljb.77.2022.02.16.19.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 19:54:05 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 6/7] drm/msm/dpu: switch dpu_encoder to use atomic_mode_set
Date:   Thu, 17 Feb 2022 06:53:57 +0300
Message-Id: <20220217035358.465904-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
References: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make dpu_encoder use atomic_mode_set to receive connector and CRTC
states as arguments rather than finding connector and CRTC by manually
looping through the respective lists.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 37 +++++--------------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  8 ++--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 18 ++-------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 14 ++-----
 4 files changed, 21 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5b2eeea37d54..a8c9f5a4dd67 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -947,16 +947,13 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
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
@@ -976,7 +973,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
-	connector_list = &dpu_kms->dev->mode_config.connector_list;
 
 	global_state = dpu_kms_get_existing_global_state(dpu_kms);
 	if (IS_ERR_OR_NULL(global_state)) {
@@ -986,22 +982,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
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
@@ -1018,7 +998,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
 						: NULL;
 
-	cstate = to_dpu_crtc_state(drm_crtc->state);
+	cstate = to_dpu_crtc_state(crtc_state);
 
 	for (i = 0; i < num_lm; i++) {
 		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
@@ -1067,9 +1047,10 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
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
 
@@ -2084,7 +2065,7 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 }
 
 static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
-	.mode_set = dpu_encoder_virt_mode_set,
+	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
 	.disable = dpu_encoder_virt_disable,
 	.enable = dpu_encoder_virt_enable,
 	.atomic_check = dpu_encoder_virt_atomic_check,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 7b14948c4c87..6309c5e30d20 100644
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
@@ -116,9 +116,9 @@ struct dpu_encoder_phys_ops {
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
 	int (*atomic_check)(struct dpu_encoder_phys *encoder,
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

