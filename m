Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08673901E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 15:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233151AbhEYNO4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 09:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233152AbhEYNOz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 09:14:55 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE66C06138A
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 06:13:25 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id b26so29945106lfq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 06:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5sW33GXxIwKL71zaUkehyeAY+23LfL51/jiHAzznEu8=;
        b=P5XxOaa3ICzWzXCQUS+XSTWEiRVC3i7i+ICfy387qNZzFl9QcteOrHOwSuvuNLGBvs
         pKIZxBdnSyIQ6WUFWI9B6vaF1R6970aYfLANBSlXAs0FeRO5Hq4eCzNuDjBmNkPaIJX9
         8/X2R7qczNasPiWhx5vqJEWpLBFYLinChDzlmUgzylT8npf+wTMsdP7apykaHVWcnjho
         pjAr/dRB9gUVtQSUL2jHBpTuh0relqX9vyZl/RvIt5Z9lZ6Sp5UnHh4KAbL786ze/xaw
         mQ553cct1nIxQ8l7H818EHhLb4wK9RZ2+A1IO5K+r2os/GVgzE/K+TH3MHtBPCOzOtnb
         OISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5sW33GXxIwKL71zaUkehyeAY+23LfL51/jiHAzznEu8=;
        b=ZE3RClLccR0trSprnVdeEroXwOMp84DUriJysFiLzm9Czz3RzdN4LLo4/VvCzsSJiO
         2CM/MN+NKmHfvDBiAhPJ1Vnk9D6t9KqWF5r17OFZVL/tIxbev0YkEWi9iqfwzwPkk5n6
         WlI/bIU2f7q+SGmtF8Syw15yqT6pGRQBtPIIAaiR0u96JCOCsiOohdq6p+MMnvXCKrmF
         axsoHC2XVG4o8I+vytWGKOq4lfml4HS7PxVy1N9b09aVCRcX2ttRAMI/Aue+6CLWwKkK
         09HlbDFzk04FVU/82kYXCHeypGqXkg1jT4icf6q5c5kzJ7sI/jWEdfHaz+XpEQFGc5gm
         b6Jg==
X-Gm-Message-State: AOAM531uyeWNaRdnIuUcsUuLPsQgKo6Voxr6cR8H7GpucB1bk75/0ceb
        lzhGPR8Kl4tIaOq1B9YDCzzRBw==
X-Google-Smtp-Source: ABdhPJzCLK6JKCnFBR+48FYMCwx9UbYZA67ABD4YWDMdPw3FS5XJh4+g4YugslklKjZU5995iTlk9g==
X-Received: by 2002:ac2:592c:: with SMTP id v12mr13797985lfi.632.1621948403761;
        Tue, 25 May 2021 06:13:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 06:13:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 7/7] drm/msm/mdp5: provide dynamic bandwidth management
Date:   Tue, 25 May 2021 16:13:16 +0300
Message-Id: <20210525131316.3117809-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
References: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of using static bandwidth setup, manage bandwidth dynamically,
depending on the amount of allocated planes, their format and
resolution.

Co-developed-with: James Willcox <jwillcox@squareup.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  |  44 ++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   | 119 ++++++++++++++-------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h   |  12 +++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c |  42 ++++++++
 4 files changed, 181 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index f482e0911d03..a9332078aa13 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -43,6 +43,9 @@ struct mdp5_crtc {
 	/* for unref'ing cursor bo's after scanout completes: */
 	struct drm_flip_work unref_cursor_work;
 
+	/* for lowering down the bandwidth after previous frame is complete */
+	struct drm_flip_work lower_bw_work;
+
 	struct mdp_irq vblank;
 	struct mdp_irq err;
 	struct mdp_irq pp_done;
@@ -171,12 +174,28 @@ static void unref_cursor_worker(struct drm_flip_work *work, void *val)
 	drm_gem_object_put(val);
 }
 
+static void lower_bw_worker(struct drm_flip_work *work, void *val)
+{
+	struct mdp5_crtc *mdp5_crtc =
+		container_of(work, struct mdp5_crtc, lower_bw_work);
+	struct drm_crtc *crtc = &mdp5_crtc->base;
+	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
+	struct mdp5_kms *mdp5_kms = get_kms(&mdp5_crtc->base);
+
+	if (mdp5_cstate->old_crtc_bw > mdp5_cstate->new_crtc_bw) {
+		DBG("DOWN BW to %lld\n", mdp5_cstate->new_crtc_bw);
+		mdp5_kms_set_bandwidth(mdp5_kms);
+		mdp5_cstate->old_crtc_bw = mdp5_cstate->new_crtc_bw;
+	}
+}
+
 static void mdp5_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 
 	drm_crtc_cleanup(crtc);
 	drm_flip_work_cleanup(&mdp5_crtc->unref_cursor_work);
+	drm_flip_work_cleanup(&mdp5_crtc->lower_bw_work);
 
 	kfree(mdp5_crtc);
 }
@@ -691,6 +710,7 @@ static int mdp5_crtc_atomic_check(struct drm_crtc *crtc,
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
 	struct mdp5_kms *mdp5_kms = get_kms(crtc);
+	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc_state);
 	struct drm_plane *plane;
 	struct drm_device *dev = crtc->dev;
 	struct plane_state pstates[STAGE_MAX + 1];
@@ -701,6 +721,7 @@ static int mdp5_crtc_atomic_check(struct drm_crtc *crtc,
 	bool need_right_mixer = false;
 	int cnt = 0, i;
 	int ret;
+	u64 crtc_bw = 0;
 	enum mdp_mixer_stage_id start;
 
 	DBG("%s: check", crtc->name);
@@ -718,6 +739,9 @@ static int mdp5_crtc_atomic_check(struct drm_crtc *crtc,
 		 */
 		if (pstates[cnt].state->r_hwpipe)
 			need_right_mixer = true;
+
+		crtc_bw += pstates[cnt].state->plane_bw;
+
 		cnt++;
 
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
@@ -730,6 +754,10 @@ static int mdp5_crtc_atomic_check(struct drm_crtc *crtc,
 
 	hw_cfg = mdp5_cfg_get_hw_config(mdp5_kms->cfg);
 
+	if (hw_cfg->perf.ab_inefficiency)
+		crtc_bw = mult_frac(crtc_bw, hw_cfg->perf.ab_inefficiency, 100);
+	mdp5_cstate->new_crtc_bw = crtc_bw;
+
 	/*
 	 * we need a right hwmixer if the mode's width is greater than a single
 	 * LM's max width
@@ -785,6 +813,7 @@ static void mdp5_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
 	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
+	struct mdp5_kms *mdp5_kms = get_kms(crtc);
 	struct drm_device *dev = crtc->dev;
 	unsigned long flags;
 
@@ -808,6 +837,12 @@ static void mdp5_crtc_atomic_flush(struct drm_crtc *crtc,
 
 	blend_setup(crtc);
 
+	if (mdp5_cstate->old_crtc_bw < mdp5_cstate->new_crtc_bw) {
+		DBG("UP BW to %lld\n", mdp5_cstate->new_crtc_bw);
+		mdp5_kms_set_bandwidth(mdp5_kms);
+		mdp5_cstate->old_crtc_bw = mdp5_cstate->new_crtc_bw;
+	}
+
 	/* PP_DONE irq is only used by command mode for now.
 	 * It is better to request pending before FLUSH and START trigger
 	 * to make sure no pp_done irq missed.
@@ -1155,6 +1190,7 @@ static void mdp5_crtc_vblank_irq(struct mdp_irq *irq, uint32_t irqstatus)
 {
 	struct mdp5_crtc *mdp5_crtc = container_of(irq, struct mdp5_crtc, vblank);
 	struct drm_crtc *crtc = &mdp5_crtc->base;
+	struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
 	struct msm_drm_private *priv = crtc->dev->dev_private;
 	unsigned pending;
 
@@ -1162,6 +1198,11 @@ static void mdp5_crtc_vblank_irq(struct mdp_irq *irq, uint32_t irqstatus)
 
 	pending = atomic_xchg(&mdp5_crtc->pending, 0);
 
+	if (mdp5_cstate->old_crtc_bw > mdp5_cstate->new_crtc_bw) {
+		drm_flip_work_queue(&mdp5_crtc->lower_bw_work, NULL);
+		drm_flip_work_commit(&mdp5_crtc->lower_bw_work, priv->wq);
+	}
+
 	if (pending & PENDING_FLIP) {
 		complete_flip(crtc, NULL);
 	}
@@ -1318,6 +1359,9 @@ struct drm_crtc *mdp5_crtc_init(struct drm_device *dev,
 	drm_flip_work_init(&mdp5_crtc->unref_cursor_work,
 			"unref cursor", unref_cursor_worker);
 
+	drm_flip_work_init(&mdp5_crtc->lower_bw_work,
+			"lower bw", lower_bw_worker);
+
 	drm_crtc_helper_add(crtc, &mdp5_crtc_helper_funcs);
 
 	return crtc;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 15aed45022bc..3e1b28d3e41b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -19,6 +19,8 @@
 #include "msm_mmu.h"
 #include "mdp5_kms.h"
 
+#define MDP5_DEFAULT_BW MBps_to_icc(6400)
+
 static int mdp5_hw_init(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
@@ -296,6 +298,28 @@ static const struct mdp_kms_funcs kms_funcs = {
 	.set_irqmask         = mdp5_set_irqmask,
 };
 
+void mdp5_kms_set_bandwidth(struct mdp5_kms *mdp5_kms)
+{
+	int i;
+	u32 full_bw = 0;
+	struct drm_crtc *tmp_crtc;
+
+	if (!mdp5_kms->num_paths)
+		return;
+
+	drm_for_each_crtc(tmp_crtc, mdp5_kms->dev) {
+		if (!tmp_crtc->enabled)
+			continue;
+
+		full_bw += Bps_to_icc(to_mdp5_crtc_state(tmp_crtc->state)->new_crtc_bw / mdp5_kms->num_paths);
+	}
+
+	DBG("SET BW to %d\n", full_bw);
+
+	for (i = 0; i < mdp5_kms->num_paths; i++)
+		icc_set_bw(mdp5_kms->paths[i], full_bw, full_bw);
+}
+
 static int mdp5_disable(struct mdp5_kms *mdp5_kms)
 {
 	DBG("");
@@ -313,6 +337,14 @@ static int mdp5_disable(struct mdp5_kms *mdp5_kms)
 	if (mdp5_kms->lut_clk)
 		clk_disable_unprepare(mdp5_kms->lut_clk);
 
+	if (!mdp5_kms->enable_count) {
+		int i;
+
+		for (i = 0; i < mdp5_kms->num_paths; i++)
+			icc_set_bw(mdp5_kms->paths[i], 0, 0);
+		icc_set_bw(mdp5_kms->path_rot, 0, 0);
+	}
+
 	return 0;
 }
 
@@ -322,6 +354,14 @@ static int mdp5_enable(struct mdp5_kms *mdp5_kms)
 
 	mdp5_kms->enable_count++;
 
+	if (mdp5_kms->enable_count == 1) {
+		int i;
+
+		for (i = 0; i < mdp5_kms->num_paths; i++)
+			icc_set_bw(mdp5_kms->paths[i], 0, MDP5_DEFAULT_BW);
+		icc_set_bw(mdp5_kms->path_rot, 0, MDP5_DEFAULT_BW);
+	}
+
 	clk_prepare_enable(mdp5_kms->ahb_clk);
 	clk_prepare_enable(mdp5_kms->axi_clk);
 	clk_prepare_enable(mdp5_kms->core_clk);
@@ -828,6 +868,40 @@ static int interface_init(struct mdp5_kms *mdp5_kms)
 	return 0;
 }
 
+static int mdp5_setup_interconnect(struct mdp5_kms *mdp5_kms)
+{
+	struct icc_path *path0 = of_icc_get(&mdp5_kms->pdev->dev, "mdp0-mem");
+	struct icc_path *path1 = of_icc_get(&mdp5_kms->pdev->dev, "mdp1-mem");
+	struct icc_path *path_rot = of_icc_get(&mdp5_kms->pdev->dev, "rotator-mem");
+
+	if (IS_ERR(path0))
+		return PTR_ERR(path0);
+
+	if (!path0) {
+		/* no interconnect support is not necessarily a fatal
+		 * condition, the platform may simply not have an
+		 * interconnect driver yet.  But warn about it in case
+		 * bootloader didn't setup bus clocks high enough for
+		 * scanout.
+		 */
+		dev_warn(&mdp5_kms->pdev->dev, "No interconnect support may cause display underflows!\n");
+		return 0;
+	}
+
+	mdp5_kms->paths[0] = path0;
+	mdp5_kms->num_paths = 1;
+
+	if (!IS_ERR_OR_NULL(path1)) {
+		mdp5_kms->paths[1] = path1;
+		mdp5_kms->num_paths++;
+	}
+
+	if (!IS_ERR_OR_NULL(path_rot))
+		mdp5_kms->path_rot = path_rot;
+
+	return 0;
+}
+
 static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -835,6 +909,7 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	struct mdp5_cfg *config;
 	u32 major, minor;
 	int ret;
+	int i;
 
 	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
 	if (!mdp5_kms) {
@@ -859,6 +934,14 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 		goto fail;
 	}
 
+	ret = mdp5_setup_interconnect(mdp5_kms);
+	if (ret)
+		goto fail;
+
+	for (i = 0; i < mdp5_kms->num_paths; i++)
+		icc_set_bw(mdp5_kms->paths[i], 0, MDP5_DEFAULT_BW);
+	icc_set_bw(mdp5_kms->path_rot, 0, MDP5_DEFAULT_BW);
+
 	/* mandatory clocks: */
 	ret = get_clk(pdev, &mdp5_kms->axi_clk, "bus", true);
 	if (ret)
@@ -968,46 +1051,10 @@ static const struct component_ops mdp5_ops = {
 	.unbind = mdp5_unbind,
 };
 
-static int mdp5_setup_interconnect(struct platform_device *pdev)
-{
-	struct icc_path *path0 = of_icc_get(&pdev->dev, "mdp0-mem");
-	struct icc_path *path1 = of_icc_get(&pdev->dev, "mdp1-mem");
-	struct icc_path *path_rot = of_icc_get(&pdev->dev, "rotator-mem");
-
-	if (IS_ERR(path0))
-		return PTR_ERR(path0);
-
-	if (!path0) {
-		/* no interconnect support is not necessarily a fatal
-		 * condition, the platform may simply not have an
-		 * interconnect driver yet.  But warn about it in case
-		 * bootloader didn't setup bus clocks high enough for
-		 * scanout.
-		 */
-		dev_warn(&pdev->dev, "No interconnect support may cause display underflows!\n");
-		return 0;
-	}
-
-	icc_set_bw(path0, 0, MBps_to_icc(6400));
-
-	if (!IS_ERR_OR_NULL(path1))
-		icc_set_bw(path1, 0, MBps_to_icc(6400));
-	if (!IS_ERR_OR_NULL(path_rot))
-		icc_set_bw(path_rot, 0, MBps_to_icc(6400));
-
-	return 0;
-}
-
 static int mdp5_dev_probe(struct platform_device *pdev)
 {
-	int ret;
-
 	DBG("");
 
-	ret = mdp5_setup_interconnect(pdev);
-	if (ret)
-		return ret;
-
 	return component_add(&pdev->dev, &mdp5_ops);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index ac269a6802df..918ce1e1bbbd 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -17,6 +17,7 @@
 #include "mdp5_ctl.h"
 #include "mdp5_smp.h"
 
+struct icc_path;
 struct mdp5_kms {
 	struct mdp_kms base;
 
@@ -68,6 +69,10 @@ struct mdp5_kms {
 	struct mdp_irq error_handler;
 
 	int enable_count;
+
+	int num_paths;
+	struct icc_path *paths[2];
+	struct icc_path *path_rot;
 };
 #define to_mdp5_kms(x) container_of(x, struct mdp5_kms, base)
 
@@ -100,6 +105,8 @@ struct mdp5_plane_state {
 
 	/* assigned by crtc blender */
 	enum mdp_mixer_stage_id stage;
+
+	u64 plane_bw;
 };
 #define to_mdp5_plane_state(x) \
 		container_of(x, struct mdp5_plane_state, base)
@@ -130,6 +137,9 @@ struct mdp5_crtc_state {
 	 * writing CTL[n].START until encoder->enable()
 	 */
 	bool defer_start;
+
+	u64 new_crtc_bw;
+	u64 old_crtc_bw;
 };
 #define to_mdp5_crtc_state(x) \
 		container_of(x, struct mdp5_crtc_state, base)
@@ -292,6 +302,8 @@ void mdp5_encoder_set_intf_mode(struct drm_encoder *encoder, bool cmd_mode);
 int mdp5_encoder_get_linecount(struct drm_encoder *encoder);
 u32 mdp5_encoder_get_framecount(struct drm_encoder *encoder);
 
+void mdp5_kms_set_bandwidth(struct mdp5_kms *mdp5_kms);
+
 #ifdef CONFIG_DRM_MSM_DSI
 void mdp5_cmd_encoder_mode_set(struct drm_encoder *encoder,
 			       struct drm_display_mode *mode,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index c6b69afcbac8..85275665558b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -154,6 +154,46 @@ static void mdp5_plane_cleanup_fb(struct drm_plane *plane,
 	msm_framebuffer_cleanup(fb, kms->aspace);
 }
 
+/* based on _dpu_plane_calc_bw */
+static void mdp5_plane_calc_bw(struct drm_plane_state *state, struct drm_crtc_state *crtc_state)
+{
+	struct drm_framebuffer *fb = state->fb;
+	struct mdp5_plane_state *pstate = to_mdp5_plane_state(state);
+	struct drm_display_mode *mode = &crtc_state->mode;
+	int bpp;
+	int src_width, src_height, dst_height, fps;
+	u64 plane_bw;
+	u32 hw_latency_lines;
+	u32 prefill_div;
+	u64 scale_factor;
+	int vbp, vpw, vfp;
+
+	src_width = drm_rect_width(&state->src) >> 16;
+	src_height = drm_rect_height(&state->src) >> 16;
+	dst_height = drm_rect_height(&state->dst);
+	fps = drm_mode_vrefresh(mode);
+	vbp = mode->vtotal - mode->vsync_end;
+	vpw = mode->vsync_end - mode->vsync_start;
+	vfp = mode->vsync_start - mode->vdisplay;
+	scale_factor = src_height > dst_height ?
+		mult_frac(src_height, 1, dst_height) : 1;
+
+	bpp = to_mdp_format(msm_framebuffer_format(fb))->cpp;
+
+	plane_bw = src_width * mode->vtotal * fps * bpp * scale_factor;
+
+	hw_latency_lines = 21; /* or 24? */
+	prefill_div = hw_latency_lines;
+	if (vbp + vpw > hw_latency_lines)
+		prefill_div = vbp + vpw;
+#if 0
+	else if (vbp + vpw + vfp < hw_latency_lines)
+		prefill_div = vbp + vpw + vfp;
+#endif
+
+	pstate->plane_bw = max(plane_bw, mult_frac(plane_bw, hw_latency_lines, prefill_div));
+}
+
 static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
 					      struct drm_plane_state *state)
 {
@@ -297,6 +337,8 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
 			mdp5_pipe_release(state->state, old_hwpipe);
 			mdp5_pipe_release(state->state, old_right_hwpipe);
 		}
+
+		mdp5_plane_calc_bw(state, crtc_state);
 	} else {
 		mdp5_pipe_release(state->state, mdp5_state->hwpipe);
 		mdp5_pipe_release(state->state, mdp5_state->r_hwpipe);
-- 
2.30.2

