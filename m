Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDBB64AF807
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238142AbiBIRZX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238138AbiBIRZW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:22 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28FCCC0613C9
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:25 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id k10so1439539ljq.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jNRh9Ig2qINxS7QeiruEGOYdw+z+53aIGWoU+Z5FYqo=;
        b=VjdX3cCvYG3nbVdjIGekQJsoSbsg9dVTzUc7Wd7JhMLYVDmmxBJIOgb7ot5PBS0oBo
         I7wK710vKlqJsjwUKB721SIbydyTw6tnlt11EJphGKBz+JE1ZSo79ga6KiucMMybHxD9
         ZKK30q6A3Hxyx+s53T4rvdfLmpmI9hxW8Leus/pwd1wso+8fXD/p1L4sbgQO2Z2sMQnn
         bMFzy/ge7mMlEwvn7JzCMtUpI2dhXlOHX36q5BPWQdswYIn4+txZlG23D/ZfWZW4w/vT
         RjE/OcLjyhxQdrOWpHQKuMHE1qAKcnTWwcqpTORtpZtc8B604ExBW0JuQ0hxI6IMTxgU
         /s8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jNRh9Ig2qINxS7QeiruEGOYdw+z+53aIGWoU+Z5FYqo=;
        b=smgwXXRV9Cf7lCOVgcPn2tBlrjMGv5qRgBe/tKSEXzPUMCoUdlGyoIx+lmJt8YjN4Q
         lVVt/1uFg9MM8otdpp2xQc3tKLD4NVsuUnogTYNvP1bnKQ7FJ44yvQNE8CZGnAQRf73Q
         vMBR+JFXFVlcDB6bXqFFgga025Tep7x23axhYt6p0CH3H/YlCZpuiqUrIxtAJg/Ub23J
         ja0hxtA9gJN4TJEn18WAv/ecyX+zZrq5YmgiDV1dLlkObQ2MfbGQXEmXfzhfEthXRERa
         zuv0Y4hLFiVTZDo9VS4zj8OFlFiPoL3WrnAFuJ+sY37yDoUWALNgCEKt1FvYRvxG/Z6S
         cAfQ==
X-Gm-Message-State: AOAM532ucAzDSCXo7EZPy7DyH7UxGkYM7Jj8pTB5KF6K3K2q0uts45yF
        2SDyaYKFrRAWeuo+0ubaePTQHA==
X-Google-Smtp-Source: ABdhPJw7Ryqi6zsbKIldqp9FS55W7ew6sauYWhGV+VrsmIq40FqDDjdnR6ATPICU7HJLexRo1cLYeA==
X-Received: by 2002:a2e:7a06:: with SMTP id v6mr2194639ljc.301.1644427523397;
        Wed, 09 Feb 2022 09:25:23 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:23 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 01/25] drm/msm/dpu: rip out master planes support
Date:   Wed,  9 Feb 2022 20:24:56 +0300
Message-Id: <20220209172520.3719906-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
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

Master/virtual planes were used for multirect support. In preparation to
reworking DPU planes, drop support for master planes (which was not used
anyway).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 11 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 72 ++++-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   | 13 +---
 6 files changed, 18 insertions(+), 87 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e7c9fe1a250f..7318bd45637a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1138,17 +1138,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	}
 
 	for (i = 1; i < SSPP_MAX; i++) {
-		if (pipe_staged[i]) {
+		if (pipe_staged[i])
 			dpu_plane_clear_multirect(pipe_staged[i]);
-
-			if (is_dpu_plane_virtual(pipe_staged[i]->plane)) {
-				DPU_ERROR(
-					"r1 only virt plane:%d not supported\n",
-					pipe_staged[i]->plane->base.id);
-				rc  = -EINVAL;
-				goto end;
-			}
-		}
 	}
 
 	z_pos = -1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 09cdc3576653..8714ee767346 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -783,8 +783,7 @@ static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
 }
 
 struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
-		void __iomem *addr, struct dpu_mdss_cfg *catalog,
-		bool is_virtual_pipe)
+		void __iomem *addr, struct dpu_mdss_cfg *catalog)
 {
 	struct dpu_hw_pipe *hw_pipe;
 	const struct dpu_sspp_cfg *cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 92b071b78fdb..1b18de957500 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -394,11 +394,9 @@ struct dpu_kms;
  * @idx:  Pipe index for which driver object is required
  * @addr: Mapped register io address of MDP
  * @catalog : Pointer to mdss catalog data
- * @is_virtual_pipe: is this pipe virtual pipe
  */
 struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
-		void __iomem *addr, struct dpu_mdss_cfg *catalog,
-		bool is_virtual_pipe);
+		void __iomem *addr, struct dpu_mdss_cfg *catalog);
 
 /**
  * dpu_hw_sspp_destroy(): Destroys SSPP driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 47fe11a84a77..4d2b75f3bc89 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -738,7 +738,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			  catalog->sspp[i].features & BIT(DPU_SSPP_CURSOR));
 
 		plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
-				       (1UL << max_crtc_count) - 1, 0);
+				       (1UL << max_crtc_count) - 1);
 		if (IS_ERR(plane)) {
 			DPU_ERROR("dpu_plane_init failed\n");
 			ret = PTR_ERR(plane);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ca75089c9d61..3fcc964dec0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -89,7 +89,7 @@ enum dpu_plane_qos {
 /*
  * struct dpu_plane - local dpu plane structure
  * @aspace: address space pointer
- * @mplane_list: List of multirect planes of the same pipe
+ * @csc_ptr: Points to dpu_csc_cfg structure to use for current
  * @catalog: Points to dpu catalog structure
  * @revalidate: force revalidation of all the plane properties
  */
@@ -104,8 +104,6 @@ struct dpu_plane {
 	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
-	bool is_virtual;
-	struct list_head mplane_list;
 	struct dpu_mdss_cfg *catalog;
 };
 
@@ -223,7 +221,7 @@ static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_hw_pipe_cfg
 static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 		const struct dpu_format *fmt, u32 src_width)
 {
-	struct dpu_plane *pdpu, *tmp;
+	struct dpu_plane *pdpu;
 	struct dpu_plane_state *pstate;
 	u32 fixed_buff_size;
 	u32 total_fl;
@@ -237,19 +235,7 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 	pstate = to_dpu_plane_state(plane->state);
 	fixed_buff_size = pdpu->catalog->caps->pixel_ram_size;
 
-	list_for_each_entry(tmp, &pdpu->mplane_list, mplane_list) {
-		u32 tmp_width;
-
-		if (!tmp->base.state->visible)
-			continue;
-		tmp_width = drm_rect_width(&tmp->base.state->src) >> 16;
-		DPU_DEBUG("plane%d/%d src_width:%d/%d\n",
-				pdpu->base.base.id, tmp->base.base.id,
-				src_width,
-				tmp_width);
-		src_width = max_t(u32, src_width,
-				  tmp_width);
-	}
+	/* FIXME: in multirect case account for the src_width of all the planes */
 
 	if (fmt->fetch_planes == DPU_PLANE_PSEUDO_PLANAR) {
 		if (fmt->chroma_sample == DPU_CHROMA_420) {
@@ -848,13 +834,8 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
 	}
 
 done:
-	if (dpu_plane[R0]->is_virtual) {
-		pstate[R0]->multirect_index = DPU_SSPP_RECT_1;
-		pstate[R1]->multirect_index = DPU_SSPP_RECT_0;
-	} else {
-		pstate[R0]->multirect_index = DPU_SSPP_RECT_0;
-		pstate[R1]->multirect_index = DPU_SSPP_RECT_1;
-	}
+	pstate[R0]->multirect_index = DPU_SSPP_RECT_0;
+	pstate[R1]->multirect_index = DPU_SSPP_RECT_1;
 
 	DPU_DEBUG_PLANE(dpu_plane[R0], "R0: %d - %d\n",
 		pstate[R0]->multirect_mode, pstate[R0]->multirect_index);
@@ -1213,19 +1194,13 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 {
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct drm_plane_state *state = plane->state;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
 
-	trace_dpu_plane_disable(DRMID(plane), is_dpu_plane_virtual(plane),
+	trace_dpu_plane_disable(DRMID(plane), false,
 				pstate->multirect_mode);
 
 	pstate->pending = true;
-
-	if (is_dpu_plane_virtual(plane) &&
-			pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_multirect)
-		pdpu->pipe_hw->ops.setup_multirect(pdpu->pipe_hw,
-				DPU_SSPP_RECT_SOLO, DPU_SSPP_MULTIRECT_NONE);
 }
 
 static void dpu_plane_atomic_update(struct drm_plane *plane,
@@ -1444,17 +1419,12 @@ enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane)
 	return plane ? to_dpu_plane(plane)->pipe : SSPP_NONE;
 }
 
-bool is_dpu_plane_virtual(struct drm_plane *plane)
-{
-	return plane ? to_dpu_plane(plane)->is_virtual : false;
-}
-
 /* initialize plane */
 struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
-		unsigned long possible_crtcs, u32 master_plane_id)
+		unsigned long possible_crtcs)
 {
-	struct drm_plane *plane = NULL, *master_plane = NULL;
+	struct drm_plane *plane = NULL;
 	const uint32_t *format_list;
 	struct dpu_plane *pdpu;
 	struct msm_drm_private *priv = dev->dev_private;
@@ -1474,18 +1444,9 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	/* cache local stuff for later */
 	plane = &pdpu->base;
 	pdpu->pipe = pipe;
-	pdpu->is_virtual = (master_plane_id != 0);
-	INIT_LIST_HEAD(&pdpu->mplane_list);
-	master_plane = drm_plane_find(dev, NULL, master_plane_id);
-	if (master_plane) {
-		struct dpu_plane *mpdpu = to_dpu_plane(master_plane);
-
-		list_add_tail(&pdpu->mplane_list, &mpdpu->mplane_list);
-	}
 
 	/* initialize underlying h/w driver */
-	pdpu->pipe_hw = dpu_hw_sspp_init(pipe, kms->mmio, kms->catalog,
-							master_plane_id != 0);
+	pdpu->pipe_hw = dpu_hw_sspp_init(pipe, kms->mmio, kms->catalog);
 	if (IS_ERR(pdpu->pipe_hw)) {
 		DPU_ERROR("[%u]SSPP init failed\n", pipe);
 		ret = PTR_ERR(pdpu->pipe_hw);
@@ -1495,14 +1456,8 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		goto clean_sspp;
 	}
 
-	if (pdpu->is_virtual) {
-		format_list = pdpu->pipe_hw->cap->sblk->virt_format_list;
-		num_formats = pdpu->pipe_hw->cap->sblk->virt_num_formats;
-	}
-	else {
-		format_list = pdpu->pipe_hw->cap->sblk->format_list;
-		num_formats = pdpu->pipe_hw->cap->sblk->num_formats;
-	}
+	format_list = pdpu->pipe_hw->cap->sblk->format_list;
+	num_formats = pdpu->pipe_hw->cap->sblk->num_formats;
 
 	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
 				format_list, num_formats,
@@ -1543,15 +1498,14 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 
 	mutex_init(&pdpu->lock);
 
-	DPU_DEBUG("%s created for pipe:%u id:%u virtual:%u\n", plane->name,
-					pipe, plane->base.id, master_plane_id);
+	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
+					pipe, plane->base.id);
 	return plane;
 
 clean_sspp:
 	if (pdpu && pdpu->pipe_hw)
 		dpu_hw_sspp_destroy(pdpu->pipe_hw);
 clean_plane:
-	list_del(&pdpu->mplane_list);
 	kfree(pdpu);
 	return ERR_PTR(ret);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 9d51dad5c6a5..d2f60810434e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -59,14 +59,6 @@ struct dpu_multirect_plane_states {
  */
 enum dpu_sspp dpu_plane_pipe(struct drm_plane *plane);
 
-/**
- * is_dpu_plane_virtual - check for virtual plane
- * @plane: Pointer to DRM plane object
- * returns: true - if the plane is virtual
- *          false - if the plane is primary
- */
-bool is_dpu_plane_virtual(struct drm_plane *plane);
-
 /**
  * dpu_plane_get_ctl_flush - get control flush mask
  * @plane:   Pointer to DRM plane object
@@ -94,14 +86,11 @@ void dpu_plane_set_error(struct drm_plane *plane, bool error);
  * @pipe:  dpu hardware pipe identifier
  * @type:  Plane type - PRIMARY/OVERLAY/CURSOR
  * @possible_crtcs: bitmask of crtc that can be attached to the given pipe
- * @master_plane_id: primary plane id of a multirect pipe. 0 value passed for
- *                   a regular plane initialization. A non-zero primary plane
- *                   id will be passed for a virtual pipe initialization.
  *
  */
 struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
-		unsigned long possible_crtcs, u32 master_plane_id);
+		unsigned long possible_crtcs);
 
 /**
  * dpu_plane_validate_multirecti_v2 - validate the multirect planes
-- 
2.34.1

