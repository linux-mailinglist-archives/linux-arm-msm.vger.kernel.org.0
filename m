Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE6EB4A806A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 09:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349507AbiBCI0h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 03:26:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349512AbiBCI0a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 03:26:30 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3134C06175A
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 00:26:18 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id a25so2755514lji.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 00:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=01vAlF56txli9i+1P79Ks55klOiBe1vcVce2eYfWMVQ=;
        b=Wwc/jzjgCn8dBk34LwuCEYK7m8y/9uNjBKjS95Z8q5v6Y21BZUn6KR0FhGQoG/PKXc
         EsIwTQLDOQcobQw2eQt95hM4x1kEht2VWMCk2YoCebgreM9CBdiR4kvKTJgI4IoVqW9G
         yBEKL2LXHKmqu/KxzaGllFSPDZQk6RZVWHvW88XCI0chqDTxEwOYrmfnO/HXrJHyO456
         p3oN5pgq41HdxkP2ITwqqwNHvHxyzxc4kZNBUhUsAQ2NBocpZzHvhlCgAeIuKuja6qDg
         hkz5N0LZG9XTP7yQP53PDM0KBB/CHPKiCCbbgEJuTjxZGBYApGVo4uYqPZAOlYrGCsVo
         uaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=01vAlF56txli9i+1P79Ks55klOiBe1vcVce2eYfWMVQ=;
        b=ZC8gM8bE9Sah1y5Ey9ZQUACVzTTFPUnaZMYG6JCwWG+s1YnwjNqyXdhHnTlrHTPBTc
         q3EajValqteYTZGyLq1+I7LOqEaoDAqr5nnnd+tb/CmYEuOgQPAYj4a4VvGscH3irGpY
         VhUieQfz956AS9n65bjKqrNNdUS0r39zzBe1J7xdPoTJD6fHmz+0zDdXA/ZHJww0wRMy
         9VP1ZOqPrr7HX8iNHSNpUq09HBv17zYwMFM5mJcNX3F4q1vRQ2QMSf0Zo22aDF+0Y8x2
         tXsCsjm0ynr1v9fb/eHxAeYsmDeIs/BMXtUTAlPv/LP/ZBPGZfr3jMccsYDM8N1l5GSm
         ggGg==
X-Gm-Message-State: AOAM533eKX+XlS3lR/MDXcRimppKkTdNS30q8vDr5+FGSByP+rpkyZ3Q
        AWYI8/f6ySjdnQeKzM3nt/nIpA==
X-Google-Smtp-Source: ABdhPJyH274nfTSpuj2FBKolFllZJM/qsDNBJ4zyPoyCUHpzwjQifqg9Nan8aMRgBd8gmAINP8vPVw==
X-Received: by 2002:a2e:96c6:: with SMTP id d6mr22096258ljj.215.1643876777023;
        Thu, 03 Feb 2022 00:26:17 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n15sm4083440ljh.36.2022.02.03.00.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 00:26:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 5/7] drm/msm/dpu: encoder: drop unused callbacks
Date:   Thu,  3 Feb 2022 11:26:09 +0300
Message-Id: <20220203082611.2654810-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Both cmd and vid backends provide no atomic_check() callbacks and
useless mode_fixup() callbacks. Drop support for both of them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 39 +++++--------------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  8 ----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 10 -----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 14 -------
 4 files changed, 9 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 4530549850f0..e1c43a0c0643 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -573,7 +573,6 @@ static int dpu_encoder_virt_atomic_check(
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
 	struct dpu_global_state *global_state;
-	int i = 0;
 	int ret = 0;
 
 	if (!drm_enc || !crtc_state || !conn_state) {
@@ -595,39 +594,19 @@ static int dpu_encoder_virt_atomic_check(
 
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
-	/* perform atomic check on the first physical encoder (master) */
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-		if (phys->ops.atomic_check)
-			ret = phys->ops.atomic_check(phys, crtc_state,
-					conn_state);
-		else if (phys->ops.mode_fixup)
-			if (!phys->ops.mode_fixup(phys, mode, adj_mode))
-				ret = -EINVAL;
-
-		if (ret) {
-			DPU_ERROR_ENC(dpu_enc,
-					"mode unsupported, phys idx %d\n", i);
-			break;
-		}
-	}
-
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
 
 	/* Reserve dynamic resources now. */
-	if (!ret) {
-		/*
-		 * Release and Allocate resources on every modeset
-		 * Dont allocate when active is false.
-		 */
-		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
-			dpu_rm_release(global_state, drm_enc);
+	/*
+	 * Release and Allocate resources on every modeset
+	 * Dont allocate when active is false.
+	 */
+	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+		dpu_rm_release(global_state, drm_enc);
 
-			if (!crtc_state->active_changed || crtc_state->active)
-				ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-						drm_enc, crtc_state, topology);
-		}
+		if (!crtc_state->active_changed || crtc_state->active)
+			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
+					drm_enc, crtc_state, topology);
 	}
 
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index e7270eb6b84b..159deb8ed7fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -84,12 +84,10 @@ struct dpu_encoder_virt_ops {
  * @is_master:			Whether this phys_enc is the current master
  *				encoder. Can be switched at enable time. Based
  *				on split_role and current mode (CMD/VID).
- * @mode_fixup:			DRM Call. Fixup a DRM mode.
  * @mode_set:			DRM Call. Set a DRM mode.
  *				This likely caches the mode, for use at enable.
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
- * @atomic_check:		DRM Call. Atomic check new DRM state.
  * @destroy:			DRM Call. Destroy and release resources.
  * @get_hw_resources:		Populate the structure with the hardware
  *				resources that this phys_enc is using.
@@ -117,17 +115,11 @@ struct dpu_encoder_phys_ops {
 			struct dentry *debugfs_root);
 	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
-	bool (*mode_fixup)(struct dpu_encoder_phys *encoder,
-			const struct drm_display_mode *mode,
-			struct drm_display_mode *adjusted_mode);
 	void (*mode_set)(struct dpu_encoder_phys *encoder,
 			struct drm_display_mode *mode,
 			struct drm_display_mode *adjusted_mode);
 	void (*enable)(struct dpu_encoder_phys *encoder);
 	void (*disable)(struct dpu_encoder_phys *encoder);
-	int (*atomic_check)(struct dpu_encoder_phys *encoder,
-			    struct drm_crtc_state *crtc_state,
-			    struct drm_connector_state *conn_state);
 	void (*destroy)(struct dpu_encoder_phys *encoder);
 	void (*get_hw_resources)(struct dpu_encoder_phys *encoder,
 				 struct dpu_encoder_hw_resources *hw_res);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 34a6940d12c5..45fe97fb612d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -45,15 +45,6 @@ static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
 	return (phys_enc->split_role != ENC_ROLE_SLAVE);
 }
 
-static bool dpu_encoder_phys_cmd_mode_fixup(
-		struct dpu_encoder_phys *phys_enc,
-		const struct drm_display_mode *mode,
-		struct drm_display_mode *adj_mode)
-{
-	DPU_DEBUG_CMDENC(to_dpu_encoder_phys_cmd(phys_enc), "\n");
-	return true;
-}
-
 static void _dpu_encoder_phys_cmd_update_intf_cfg(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -732,7 +723,6 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
 	ops->is_master = dpu_encoder_phys_cmd_is_master;
 	ops->mode_set = dpu_encoder_phys_cmd_mode_set;
-	ops->mode_fixup = dpu_encoder_phys_cmd_mode_fixup;
 	ops->enable = dpu_encoder_phys_cmd_enable;
 	ops->disable = dpu_encoder_phys_cmd_disable;
 	ops->destroy = dpu_encoder_phys_cmd_destroy;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ddd9d89cd456..1831fe37c88c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -225,19 +225,6 @@ static void programmable_fetch_config(struct dpu_encoder_phys *phys_enc,
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 }
 
-static bool dpu_encoder_phys_vid_mode_fixup(
-		struct dpu_encoder_phys *phys_enc,
-		const struct drm_display_mode *mode,
-		struct drm_display_mode *adj_mode)
-{
-	DPU_DEBUG_VIDENC(phys_enc, "\n");
-
-	/*
-	 * Modifying mode has consequences when the mode comes back to us
-	 */
-	return true;
-}
-
 static void dpu_encoder_phys_vid_setup_timing_engine(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -676,7 +663,6 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_vid_is_master;
 	ops->mode_set = dpu_encoder_phys_vid_mode_set;
-	ops->mode_fixup = dpu_encoder_phys_vid_mode_fixup;
 	ops->enable = dpu_encoder_phys_vid_enable;
 	ops->disable = dpu_encoder_phys_vid_disable;
 	ops->destroy = dpu_encoder_phys_vid_destroy;
-- 
2.34.1

