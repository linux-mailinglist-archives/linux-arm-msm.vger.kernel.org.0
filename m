Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D3C4AF80A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238146AbiBIRZ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238147AbiBIRZZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:25 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1C5C05CB89
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:27 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id f18so5494782lfj.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eiorjxT3naR/T7EJ/DaKzLjuonKdNGzy22GtwNwJ4aM=;
        b=eQkTJjMlT7BP7ioHoGAGTsHC6OhnDbRqrjiQkfy4XENJJdSL17T9P/tc88GfB2dUol
         u4asvbPjXX9xPZ1rEO19olks22DGoErVcky+R3g6YeXiiYbUz/D/KrNprCZH8zr2JViM
         Lt0i+5rdxDeG66roM0kK3ofvWDIiCkzLuv2Xj6m57Ar0FPV5MNx2ooE2zn+8CmJNrPW+
         vaJzsaROKpBkLkOHph/XHLDb1wF2T16pzp/vhzgJI+/xQX4PuSQgQ2qI2PS1pAWGy7OW
         da05TXPtRlmruaAOJItyG43/k9SsqbFQ/tZuvuRNh+uQTuSFxeY+/FLXsAyR0grEDBmT
         vi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eiorjxT3naR/T7EJ/DaKzLjuonKdNGzy22GtwNwJ4aM=;
        b=QC9cPBEurYOohmB8TbsoqCqCPTaMvZxHoywEj2FtDfB1nYPR4jsp2IhrtfR7ZuHD78
         eYRdSA0qICo4OkiYtSvI7j7eOLoySZknvIMda9m8+Osh64SNIcF1BnJ7aOJooS/weOna
         fEyzA/0eaZCisOCLbC5AviNC95tnKKMtjQKSe3/l/K9pO+vHILY3EEwvNJWKdcLfth5c
         MSkbnlByRhy9sECDyDMHk8oLDvAApOScz8iMrUgnX0xAyDUVkBjZ169dbg1Y7Di9mR/0
         O5XhwlwG8b8eXo3h8VwZiGwU2gpsYOqqiKll2IkSpPnSROMrmfQcqV51xH1maO4rlESJ
         QEOg==
X-Gm-Message-State: AOAM530MJg4Dx1ro8X8MHOp2+7R6vCG2uuXUPqVEyi2ax3ivZ5561DzU
        Plp2G02DoHO7orTmki1yXVAQ3g==
X-Google-Smtp-Source: ABdhPJzuvvlZ5h3TPN/GMACPh2vUD1LfMuaRzZfC0rVeW/TBua0tP4fzS9mJ0l5SyBDWwsYYwnEz1A==
X-Received: by 2002:a05:6512:3993:: with SMTP id j19mr2199933lfu.178.1644427525317;
        Wed, 09 Feb 2022 09:25:25 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:24 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 03/25] drm/msm/dpu: add support for SSPP allocation to RM
Date:   Wed,  9 Feb 2022 20:24:58 +0300
Message-Id: <20220209172520.3719906-4-dmitry.baryshkov@linaro.org>
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

Add support for handling and allocting SSPP blocks through the resource
manager. Handling code is not converted to use it though.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 10 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 18 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 81 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  6 ++
 5 files changed, 104 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 1b18de957500..f805c30643b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -388,6 +388,16 @@ struct dpu_hw_pipe {
 };
 
 struct dpu_kms;
+/**
+ * to_dpu_hw_pipe - convert base object dpu_hw_base to container
+ * @hw: Pointer to base hardware block
+ * return: Pointer to hardware block container
+ */
+static inline struct dpu_hw_pipe *to_dpu_hw_pipe(struct dpu_hw_blk *hw)
+{
+	return container_of(hw, struct dpu_hw_pipe, base);
+}
+
 /**
  * dpu_hw_sspp_init - initializes the sspp hw driver object.
  * Should be called once before accessing every pipe.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 2d385b4b7f5e..824495ad2392 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -146,6 +146,7 @@ struct dpu_global_state {
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
 	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
 	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
+	uint32_t pipe_to_plane_id[SSPP_MAX - SSPP_NONE];
 };
 
 struct dpu_global_state
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c04c3be16d85..146dbccd79cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1235,8 +1235,6 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
 
-		dpu_hw_sspp_destroy(pdpu->pipe_hw);
-
 		kfree(pdpu);
 	}
 }
@@ -1445,14 +1443,13 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	pdpu->pipe = pipe;
 
 	/* initialize underlying h/w driver */
-	pdpu->pipe_hw = dpu_hw_sspp_init(pipe, kms->mmio, kms->catalog);
-	if (IS_ERR(pdpu->pipe_hw)) {
-		DPU_ERROR("[%u]SSPP init failed\n", pipe);
-		ret = PTR_ERR(pdpu->pipe_hw);
+	if (!kms->rm.sspp_blks[pipe - SSPP_NONE])
 		goto clean_plane;
-	} else if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
+	pdpu->pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pipe - SSPP_NONE]);
+
+	if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
 		DPU_ERROR("[%u]SSPP init returned invalid cfg\n", pipe);
-		goto clean_sspp;
+		goto clean_plane;
 	}
 
 	format_list = pdpu->pipe_hw->cap->sblk->format_list;
@@ -1462,7 +1459,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 				format_list, num_formats,
 				supported_format_modifiers, type, NULL);
 	if (ret)
-		goto clean_sspp;
+		goto clean_plane;
 
 	pdpu->catalog = kms->catalog;
 
@@ -1494,9 +1491,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 					pipe, plane->base.id);
 	return plane;
 
-clean_sspp:
-	if (pdpu && pdpu->pipe_hw)
-		dpu_hw_sspp_destroy(pdpu->pipe_hw);
 clean_plane:
 	kfree(pdpu);
 	return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f9c83d6e427a..21c9e513f1f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -8,6 +8,7 @@
 #include "dpu_hw_lm.h"
 #include "dpu_hw_ctl.h"
 #include "dpu_hw_pingpong.h"
+#include "dpu_hw_sspp.h"
 #include "dpu_hw_intf.h"
 #include "dpu_hw_dspp.h"
 #include "dpu_hw_merge3d.h"
@@ -35,6 +36,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 {
 	int i;
 
+	for (i = 0; i < ARRAY_SIZE(rm->sspp_blks); i++) {
+		struct dpu_hw_pipe *hw;
+
+		if (rm->sspp_blks[i]) {
+			hw = to_dpu_hw_pipe(rm->sspp_blks[i]);
+			dpu_hw_sspp_destroy(hw);
+		}
+	}
 	for (i = 0; i < ARRAY_SIZE(rm->pingpong_blks); i++) {
 		struct dpu_hw_pingpong *hw;
 
@@ -166,6 +175,24 @@ int dpu_rm_init(struct dpu_rm *rm,
 		rm->pingpong_blks[pp->id - PINGPONG_0] = &hw->base;
 	}
 
+	for (i = 0; i < cat->sspp_count; i++) {
+		struct dpu_hw_pipe *hw;
+		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
+
+		if (sspp->id <= SSPP_NONE || sspp->id >= SSPP_MAX) {
+			DPU_ERROR("skip sspp %d with invalid id\n", sspp->id);
+			continue;
+		}
+		hw = dpu_hw_sspp_init(sspp->id, mmio, cat);
+		if (IS_ERR_OR_NULL(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_ERROR("failed sspp object creation: err %d\n",
+				rc);
+			goto fail;
+		}
+		rm->sspp_blks[sspp->id - SSPP_NONE] = &hw->base;
+	}
+
 	for (i = 0; i < cat->intf_count; i++) {
 		struct dpu_hw_intf *hw;
 		const struct dpu_intf_cfg *intf = &cat->intf[i];
@@ -660,3 +687,57 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	return num_blks;
 }
+
+enum dpu_sspp dpu_rm_get_sspp(struct dpu_rm *rm, struct dpu_global_state *global_state, uint32_t plane_id, bool yuv, bool scale)
+{
+	int i;
+	enum dpu_sspp pipe = SSPP_NONE;
+	struct dpu_hw_pipe *pipe_hw;
+	bool retry = false;
+
+retry_loop:
+	for (i = 0; i < ARRAY_SIZE(rm->sspp_blks) && pipe == SSPP_NONE; i++) {
+		if (!rm->sspp_blks[i])
+			continue;
+		if (reserved_by_other(global_state->pipe_to_plane_id, i, plane_id))
+			continue;
+
+		pipe_hw = to_dpu_hw_pipe(rm->sspp_blks[i]);
+
+		/* skip incompatible planes */
+		if (scale && !(pipe_hw->cap->features & DPU_SSPP_SCALER))
+			continue;
+
+		if (yuv && (!(pipe_hw->cap->features & DPU_SSPP_SCALER) ||
+			    !(pipe_hw->cap->features & DPU_SSPP_CSC_ANY)))
+			continue;
+
+		/* For non-yuv, non-scaled planes try to find simple (DMA)
+		 * plane, fallback to VIG on a second try.
+		 *
+		 * This way we'd leave VIG pipes to be later used for YUV formats.
+		 */
+
+		if (!scale && !yuv && !retry &&
+		    (pipe_hw->cap->features & (DPU_SSPP_SCALER | DPU_SSPP_CSC_ANY)))
+			continue;
+
+		pipe = i + SSPP_NONE;
+	};
+
+	if (!scale && !yuv && !retry && pipe == SSPP_NONE) {
+		retry = true;
+		goto retry_loop;
+	}
+
+	if (pipe != SSPP_NONE)
+		global_state->pipe_to_plane_id[pipe - SSPP_NONE] = plane_id;
+
+	return pipe;
+}
+
+void dpu_rm_release_sspp(struct dpu_rm *rm, struct dpu_global_state *global_state, uint32_t plane_id)
+{
+	_dpu_rm_clear_mapping(global_state->pipe_to_plane_id,
+			ARRAY_SIZE(global_state->pipe_to_plane_id), plane_id);
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 1f12c8d5b8aa..b759fe39f6d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -16,6 +16,7 @@ struct dpu_global_state;
 /**
  * struct dpu_rm - DPU dynamic hardware resource manager
  * @pingpong_blks: array of pingpong hardware resources
+ * @sspp_blks: array of sspp hardware resources
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
  * @intf_blks: array of intf hardware resources
@@ -25,6 +26,7 @@ struct dpu_global_state;
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
+	struct dpu_hw_blk *sspp_blks[SSPP_MAX - SSPP_NONE];
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
@@ -88,5 +90,9 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
+
+enum dpu_sspp dpu_rm_get_sspp(struct dpu_rm *rm, struct dpu_global_state *global_state, uint32_t plane_id, bool yuv, bool scale);
+void dpu_rm_release_sspp(struct dpu_rm *rm, struct dpu_global_state *global_state, uint32_t plane_id);
+
 #endif /* __DPU_RM_H__ */
 
-- 
2.34.1

