Return-Path: <linux-arm-msm+bounces-48920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AF8A3F8C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAF554245FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE82121E0BC;
	Fri, 21 Feb 2025 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v886pgj1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68A321D3D3
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151529; cv=none; b=g2MHNSbBht/9xkUDp/zZVH/JC/hJd/0zkFC9VSrwqDSHIXaSghV9XGQ22QgPAoHxy0c6wCpMIlKVnhngpQpTwkVj0/50Pmil09DWUpQTTiee5wvxoR0SL7tn4+Ai/e1X25cMjYd5NsNwyEroJR39zkusNE3k2LHRKGex9hR6nK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151529; c=relaxed/simple;
	bh=i/FODMQhwxbBlhCIaZyHIeOVaGHwHSyiYROFPJEEFYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZXI42nqmJQ4G2wxt9DsGlGYe0qd7CGwepZvpte29Vsg+Cj+nMhCg6y0C1ko0RVfabStuaIYtdrmoYOxD9NiKDcMNiduPoTB1zZWMkIgxvD0GIf7bSYw3uIi8duJydnoYAHVGn+4xeWrJnt7k4Qw7mRbHAAPPb5vwiLs87xqGxSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v886pgj1; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abb9c8c4e59so36365866b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 07:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740151525; x=1740756325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q69oZPCB6rbOMMMtdAc8AoYHq6LgBDpmSS+tha9+ZHM=;
        b=v886pgj1MuuKpc5Ti1JGRnxPS1Kr61Jgrdsy1VPGtcgM/pXI3+Lg9PFWCVpGxBbugg
         vNJ+izbzjD6pZY5GQjw6qsVuR7Q3/n+4TZ5Th69ltKZV8fsBPEik7bWywmcXvha6QSD/
         7c5GY3QJfV4wRtwxAm9K+7unQyHu/neDAV7M/hUlSOeMBrf7ZI7yJoAcs8HDNZj/HwHn
         17BREmAGupyPxl4Us9Z/U9rd380qUK3ev+gHJ2MlepSaBLmmQE/8FHahKHVrBNe+C/82
         0mYUYEP0+3DxoiwMuL82lQnl8E7TPc5yJJm4DStxyTgKDZlhpZemv+vrZG5zTgDl0SdY
         GAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740151525; x=1740756325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q69oZPCB6rbOMMMtdAc8AoYHq6LgBDpmSS+tha9+ZHM=;
        b=PDsuvBjrdqa9HGTT2czb5dgEdSzfalsXa9KFftKhltlvGsdrhKF0rckqfS45ZNp3Hs
         gbG5xwqKthvKBWXtSo9U6lFzwhlQ5q+GcgA2xRLlCb1GfSF+rvTST+YiwXA+tbWR0CoJ
         oY6zMxOVjfiQlAo0Q9rgxvUjnSOFda0vgBOvwGKwBhQpXFvIfibSmK4VcZHiJRl9JiAk
         HVzquiqjN5mzgJXfRHZt86avBj0oHAuZ7/j8DDiIdqgqHfErAxO6ZwVeDDCPY8U021up
         YAyShtSqbOKPI7CP/YLVmx8BGnAgG4HLy17O1ny4HGO8PKXYpzQ7SRLnbpUadRSWFYy9
         ULBA==
X-Gm-Message-State: AOJu0YwjFxxbl75FY8sT/39gBi2o3DY8bVLle3iQXqpG9zQCnrLiHfxk
	mE7IxTixMpu98V6rP7SwaNYAgGzCf9j6Ug90n4OkJhzxwhgyedPoJ0B2DbtDpVs=
X-Gm-Gg: ASbGncsIm2yfvjOKu/fWYXbbCYQyu8KuD7q7jPq4T3yqKcrJXh0ix17ZCHgMHg5rNRK
	BF/JFJfHDLVb8mv1p3HyTQbJ9+FooEDGKyAYOotzVtHNkbYpsXar/8HSpDMJOmE6ydMXBlSjvHq
	iRgMVpG/fjDNaPF+yErbXPJwdZHvGdrP9NKV1q8+Al80C1HWJEpx4+K6mlZhVznv2zk49+GC9OE
	FByBmAmdobPb/TSzUlD2nnszuYfvQLF01v0anI0Xatb0p5p/R/iIQA4MUSgtHBKJutGTmE66r+9
	qVJC4afbiQNng5cmsnWTqI52T06ghZEZ5cc2a5M3yogNUT/w992MrxFrCH55Nn7JrvyNnL+IByL
	9
X-Google-Smtp-Source: AGHT+IEfgEUVk5AeL0cR2Kqij5eFm2NE18pv20pVQC7obdk/IDwmD6Jpynuzb8dHNUOgSTskJgW0kw==
X-Received: by 2002:a17:907:9496:b0:a99:a6e0:fa0b with SMTP id a640c23a62f3a-abc09a2c929mr151154266b.5.1740151525147;
        Fri, 21 Feb 2025 07:25:25 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:25:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:28 +0100
Subject: [PATCH v3 18/21] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-18-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7483;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=i/FODMQhwxbBlhCIaZyHIeOVaGHwHSyiYROFPJEEFYE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJq8Cvym97PKIU6g/ay2kUeu659IUl/1AsRQw
 F4MR/4YI/qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iavAAKCRDBN2bmhouD
 1zbBD/45+OGbzBG4sDY+nY8bmg0B9dd0wjyyK96MI3PhkMR1yJcLUiI/ukf0E7ZjNgEOnUFbpLG
 +KgL3R/dO9hg7Hnh+A+7l2i2mWBw5LqH0K1pJbVbxHWGZZJCuKu5XcVfZ2xaNyjQqKUYaIWPCK2
 vsBvNcYopWRzdftWOLE9mycZmydWU3EH+JkryBVs+0qD0zULKxdKbQoxZ8xlXKEN7g4hiGx/WvP
 fVhPlWuwnrZDSydlQZko3p4Wm6IVqSlPibL6b2joEYePsWL1ddLjVj3zmrr21FRTHjmSHD9cGE+
 BUcuDafusJPdm4LKb+oc7A+mf6zsy0H9U360M+xaxleglQ3VupH94J1CYFurQq9Ufmt2VL7G2/7
 7bU9IVgcMBfpJWDUU+R0MNe6nZIQmDaxfPcCCKwbFhEgKlnXt8V/s5c3bgu81qXexAYpjEPijc0
 ybkVbfnYP2pVOW+05uCeGRmPqFZUY+KmuCmZIb7PZeLyv4oUmv8a5xu0G6S4kq2vnH2Guh437XE
 nvZ4fCdTyHV9lLBwbnIHQeuctoOi0qi5FudpuIz21N5XZn2keJMvS795gCaQHk3kWgLjFrjNgXR
 LVwz40rEre96opVxxLacSIucHnr5GA53R6VBi676iXinN21vZF+bY7Uy643dP2kd1vegiyeIMIN
 2UAsIEvJ12DUbpg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
differences and new implementations of setup_alpha_out,
setup_border_color and so one for this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 20 +++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
 2 files changed, 94 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b9fe3a7343d54f6f8b5aad7982928d5fc728bd61..7a35939ece180c15898b2eaa2f1f451767c741ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -319,15 +319,21 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 	return true;
 }
 
-static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
-		struct dpu_plane_state *pstate, const struct msm_format *format)
+static void _dpu_crtc_setup_blend_cfg(const struct dpu_hw_ctl *ctl,
+				      struct dpu_crtc_mixer *mixer,
+				      struct dpu_plane_state *pstate,
+				      const struct msm_format *format)
 {
 	struct dpu_hw_mixer *lm = mixer->hw_lm;
 	uint32_t blend_op;
-	uint32_t fg_alpha, bg_alpha;
+	uint32_t fg_alpha, bg_alpha, max_alpha;
 
 	fg_alpha = pstate->base.alpha >> 8;
-	bg_alpha = 0xff - fg_alpha;
+	if (ctl->mdss_ver->core_major_ver < 12)
+		max_alpha = 0xff;
+	else
+		max_alpha = 0x3ff;
+	bg_alpha = max_alpha - fg_alpha;
 
 	/* default to opaque blending */
 	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
@@ -337,7 +343,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
-		if (fg_alpha != 0xff) {
+		if (fg_alpha != max_alpha) {
 			bg_alpha = fg_alpha;
 			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
@@ -348,7 +354,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		/* coverage blending */
 		blend_op = DPU_BLEND_FG_ALPHA_FG_PIXEL |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
-		if (fg_alpha != 0xff) {
+		if (fg_alpha != max_alpha) {
 			bg_alpha = fg_alpha;
 			blend_op |= DPU_BLEND_FG_MOD_ALPHA |
 				    DPU_BLEND_FG_INV_MOD_ALPHA |
@@ -482,7 +488,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		/* blend config update */
 		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
-			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
+			_dpu_crtc_setup_blend_cfg(ctl, mixer + lm_idx, pstate, format);
 
 			if (bg_alpha_enable && !format->alpha_enable)
 				mixer[lm_idx].mixer_op_mode = 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 3bfb61cb83672dca4236bdbbbfb1e442223576d2..75bf3521b03c8e243ccfe1fc226aa71f23b296df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -19,12 +19,20 @@
 
 /* These register are offset to mixer base + stage base */
 #define LM_BLEND0_OP                     0x00
+
+/* <v12 DPU with offset to mixer base + stage base */
 #define LM_BLEND0_CONST_ALPHA            0x04
 #define LM_FG_COLOR_FILL_COLOR_0         0x08
 #define LM_FG_COLOR_FILL_COLOR_1         0x0C
 #define LM_FG_COLOR_FILL_SIZE            0x10
 #define LM_FG_COLOR_FILL_XY              0x14
 
+/* >= v12 DPU */
+#define LM_BORDER_COLOR_0_V12		0x1C
+#define LM_BORDER_COLOR_1_V12		0x20
+
+/* >= v12 DPU with offset to mixer base + stage base */
+#define LM_BLEND0_CONST_ALPHA_V12	0x08
 #define LM_BLEND0_FG_ALPHA               0x04
 #define LM_BLEND0_BG_ALPHA               0x08
 
@@ -83,6 +91,22 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
 	}
 }
 
+static void dpu_hw_lm_setup_border_color_v12(struct dpu_hw_mixer *ctx,
+					     struct dpu_mdss_color *color,
+					     u8 border_en)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+
+	if (border_en) {
+		DPU_REG_WRITE(c, LM_BORDER_COLOR_0_V12,
+			      (color->color_0 & 0x3ff) |
+			      ((color->color_1 & 0x3ff) << 16));
+		DPU_REG_WRITE(c, LM_BORDER_COLOR_1_V12,
+			      (color->color_2 & 0x3ff) |
+			      ((color->color_3 & 0x3ff) << 16));
+	}
+}
+
 static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx)
 {
 	dpu_hw_setup_misr(&ctx->hw, LM_MISR_CTRL, 0x0);
@@ -112,6 +136,27 @@ static void dpu_hw_lm_setup_blend_config_combined_alpha(struct dpu_hw_mixer *ctx
 	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
 }
 
+static void
+dpu_hw_lm_setup_blend_config_combined_alpha_v12(struct dpu_hw_mixer *ctx,
+						u32 stage, u32 fg_alpha,
+						u32 bg_alpha, u32 blend_op)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	int stage_off;
+	u32 const_alpha;
+
+	if (stage == DPU_STAGE_BASE)
+		return;
+
+	stage_off = _stage_offset(ctx, stage);
+	if (WARN_ON(stage_off < 0))
+		return;
+
+	const_alpha = (bg_alpha & 0x3ff) | ((fg_alpha & 0x3ff) << 16);
+	DPU_REG_WRITE(c, LM_BLEND0_CONST_ALPHA_V12 + stage_off, const_alpha);
+	DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, blend_op);
+}
+
 static void dpu_hw_lm_setup_blend_config(struct dpu_hw_mixer *ctx,
 	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
 {
@@ -144,6 +189,32 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
+static void dpu_hw_lm_setup_color3_v12(struct dpu_hw_mixer *ctx,
+				       uint32_t mixer_op_mode)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	int op_mode, stages, stage_off, i;
+
+	stages = ctx->cap->sblk->maxblendstages;
+	if (stages <= 0)
+		return;
+
+	for (i = DPU_STAGE_0; i <= stages; i++) {
+		stage_off = _stage_offset(ctx, i);
+		if (WARN_ON(stage_off < 0))
+			return;
+
+		/* set color_out3 bit in blend0_op when enabled in mixer_op_mode */
+		op_mode = DPU_REG_READ(c, LM_BLEND0_OP + stage_off);
+		if (mixer_op_mode & BIT(i))
+			op_mode |= BIT(30);
+		else
+			op_mode &= ~BIT(30);
+
+		DPU_REG_WRITE(c, LM_BLEND0_OP + stage_off, op_mode);
+	}
+}
+
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -175,12 +246,19 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	c->idx = cfg->id;
 	c->cap = cfg;
 	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
-	if (mdss_ver->core_major_ver >= 4)
+	if (mdss_ver->core_major_ver >= 12)
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha_v12;
+	else if (mdss_ver->core_major_ver >= 4)
 		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
 	else
 		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
-	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
-	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	if (mdss_ver->core_major_ver < 12) {
+		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
+		c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	} else {
+		c->ops.setup_alpha_out = dpu_hw_lm_setup_color3_v12;
+		c->ops.setup_border_color = dpu_hw_lm_setup_border_color_v12;
+	}
 	c->ops.setup_misr = dpu_hw_lm_setup_misr;
 	c->ops.collect_misr = dpu_hw_lm_collect_misr;
 

-- 
2.43.0


