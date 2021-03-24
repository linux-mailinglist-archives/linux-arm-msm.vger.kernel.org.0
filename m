Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE58347B7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236381AbhCXPA6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236388AbhCXPAq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:00:46 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE5FC061763
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:45 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 184so30595721ljf.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 08:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ymuaM6Pd6xrvcM6FbW+2BkGMeDk6kUhNBZmYCuS0atM=;
        b=XZS/71IelK6zWNH+FZpYDt0mLjGgnRIKztIMBl4jX14TorIG1BVzITyDd1rCACNEFA
         fxf8BpmHATvgSQ+43t+wJBWkOos52lECPy0Ey7wu5Um8P7EeWetGbmcKrwLWwU8tgV1d
         EPlw3cIXhOXG9wxrri+ZWKbdh1tQt+4RvK3WxHCFR6NO43BLegiYcED1/cvvRhITy7Ar
         FmAuSXhXwOPwFTRJpcldmRepcsKyW7BSNN9jLheR/ZbExwECYIECEC/UWZr8lKYeLcoi
         EFsRTxL003dytcW9+4m5/u9UhhwuJjem5NqoHvpwGTZp/4y7TmmwU2/Cnr0f94MXEvSL
         9o4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ymuaM6Pd6xrvcM6FbW+2BkGMeDk6kUhNBZmYCuS0atM=;
        b=LY+dMk3XttTpkH24OESNp/9FKRFlusES54TCRo9XrU684N7fagI1bo7uzTEfjSLWzD
         gpAXAmQkCpo5SRu1J+IVKz3r5SGwWIDwXHXu+hg+TZP68Prx5MgMRcPGV2pwZQeL62XA
         c1nZMBMlgDj7jMyzhxbDz0KFUcbmJnTsSGu7mGocslv2ez2iw89I85JiOinrOfTtGBvv
         wNqHQFLReEO2tB1xzOZTHyj3y396xc8KSdZek8T+bni6maIcmR3wEhWnDqosFeTdV2D9
         NkcM8XJ4QyTKhwSv2Bv4oQxgB7VtZSq9HQdJoKxOi7iMth7DWG9NiTv4W1wjAEEDXo0d
         Ak0Q==
X-Gm-Message-State: AOAM531ljMay08pSBEZMvXLEftLYadWklrBH2Jl00S7K3ph/dJBMmQqE
        IGhXUuH/FrtgFW2MGpyalWjWPQ==
X-Google-Smtp-Source: ABdhPJySUCVwKnhGyJG+czzaQ664CjjfSBftCDz968Vrk2wFwEhmxwKfP11qz6iIc/OqdN+PdMGR8A==
X-Received: by 2002:a2e:bc25:: with SMTP id b37mr2403770ljf.342.1616598043831;
        Wed, 24 Mar 2021 08:00:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:00:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 11/21] drm/msm/dpu: call hw_lm ops directly
Date:   Wed, 24 Mar 2021 18:00:14 +0300
Message-Id: <20210324150024.2768215-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace dpu_hw_lm callbacks with direct functions calls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 19 ++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h | 59 ++++++++++-------------
 3 files changed, 33 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 56eb22554197..5a0a6741a431 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -84,7 +84,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 			DPU_BLEND_BG_INV_ALPHA;
 	}
 
-	lm->ops.setup_blend_config(lm, pstate->stage,
+	dpu_hw_lm_setup_blend_config(lm, pstate->stage,
 				0xFF, 0, blend_op);
 
 	DPU_DEBUG("format:%s, alpha_en:%u blend_op:0x%x\n",
@@ -112,7 +112,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 		cfg.out_height = drm_rect_height(lm_roi);
 		cfg.right_mixer = lm_horiz_position++;
 		cfg.flags = 0;
-		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
+		dpu_hw_lm_setup_mixer_out(hw_lm, &cfg);
 	}
 }
 
@@ -217,7 +217,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 		ctl = mixer[i].lm_ctl;
 		lm = mixer[i].hw_lm;
 
-		lm->ops.setup_alpha_out(lm, mixer[i].mixer_op_mode);
+		dpu_hw_lm_setup_alpha_out(lm, mixer[i].mixer_op_mode);
 
 		mixer[i].flush_mask |= ctl->ops.get_bitmask_mixer(ctl,
 			mixer[i].hw_lm->idx);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 7d5b620f7f42..1e95d52180cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -59,7 +59,7 @@ static inline int _stage_offset(struct dpu_hw_mixer *ctx, enum dpu_stage stage)
 	return -EINVAL;
 }
 
-static void dpu_hw_lm_setup_out(struct dpu_hw_mixer *ctx,
+void dpu_hw_lm_setup_mixer_out(struct dpu_hw_mixer *ctx,
 		struct dpu_hw_mixer_cfg *mixer)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
@@ -79,7 +79,7 @@ static void dpu_hw_lm_setup_out(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
-static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
+void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
 		struct dpu_mdss_color *color,
 		u8 border_en)
 {
@@ -95,7 +95,7 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
 	}
 }
 
-static void dpu_hw_lm_setup_blend_config_sdm845(struct dpu_hw_mixer *ctx,
+void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
 	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
@@ -114,7 +114,7 @@ static void dpu_hw_lm_setup_blend_config_sdm845(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
-static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
+void dpu_hw_lm_setup_alpha_out(struct dpu_hw_mixer *ctx,
 	uint32_t mixer_op_mode)
 {
 	struct dpu_hw_blk_reg_map *c = &ctx->hw;
@@ -128,16 +128,6 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
-static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
-		struct dpu_hw_lm_ops *ops,
-		unsigned long features)
-{
-	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	ops->setup_blend_config = dpu_hw_lm_setup_blend_config_sdm845;
-	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
-	ops->setup_border_color = dpu_hw_lm_setup_border_color;
-}
-
 struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
 		void __iomem *addr,
 		const struct dpu_mdss_cfg *m,
@@ -159,7 +149,6 @@ struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
 	/* Assign ops */
 	c->idx = idx;
 	c->cap = cfg;
-	_setup_mixer_ops(m, &c->ops, c->cap->features);
 
 	if (cfg->dspp && cfg->dspp < DSPP_MAX)
 		c->dspp = dpu_hw_dspp_init(cfg->dspp, addr, m);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index 182740f2914b..a43c1931c5e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -22,38 +22,34 @@ struct dpu_hw_color3_cfg {
 	u8 keep_fg[DPU_STAGE_MAX];
 };
 
-/**
- *
- * struct dpu_hw_lm_ops : Interface to the mixer Hw driver functions
+/*
  *  Assumption is these functions will be called after clocks are enabled
  */
-struct dpu_hw_lm_ops {
-	/*
-	 * Sets up mixer output width and height
-	 * and border color if enabled
-	 */
-	void (*setup_mixer_out)(struct dpu_hw_mixer *ctx,
-		struct dpu_hw_mixer_cfg *cfg);
-
-	/*
-	 * Alpha blending configuration
-	 * for the specified stage
-	 */
-	void (*setup_blend_config)(struct dpu_hw_mixer *ctx, uint32_t stage,
-		uint32_t fg_alpha, uint32_t bg_alpha, uint32_t blend_op);
-
-	/*
-	 * Alpha color component selection from either fg or bg
-	 */
-	void (*setup_alpha_out)(struct dpu_hw_mixer *ctx, uint32_t mixer_op);
-
-	/**
-	 * setup_border_color : enable/disable border color
-	 */
-	void (*setup_border_color)(struct dpu_hw_mixer *ctx,
-		struct dpu_mdss_color *color,
-		u8 border_en);
-};
+/*
+ * Sets up mixer output width and height
+ * and border color if enabled
+ */
+void dpu_hw_lm_setup_mixer_out(struct dpu_hw_mixer *ctx,
+	struct dpu_hw_mixer_cfg *cfg);
+
+/*
+ * Alpha blending configuration
+ * for the specified stage
+ */
+void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx, uint32_t stage,
+	uint32_t fg_alpha, uint32_t bg_alpha, uint32_t blend_op);
+
+/*
+ * Alpha color component selection from either fg or bg
+ */
+void dpu_hw_lm_setup_alpha_out(struct dpu_hw_mixer *ctx, uint32_t mixer_op);
+
+/**
+ * setup_border_color : enable/disable border color
+ */
+void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
+	struct dpu_mdss_color *color,
+	u8 border_en);
 
 struct dpu_hw_mixer {
 	struct dpu_hw_blk base;
@@ -67,9 +63,6 @@ struct dpu_hw_mixer {
 	struct dpu_hw_pingpong *pingpong;
 	struct dpu_hw_dspp *dspp;
 
-	/* ops */
-	struct dpu_hw_lm_ops ops;
-
 	/* store mixer info specific to display */
 	struct dpu_hw_mixer_cfg cfg;
 };
-- 
2.30.2

