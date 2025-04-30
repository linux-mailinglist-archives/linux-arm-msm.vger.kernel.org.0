Return-Path: <linux-arm-msm+bounces-56288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E4DAA4CEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 15:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E6BD1B630EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BFC27E7C8;
	Wed, 30 Apr 2025 13:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkPxhHvp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9EF27A47C
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 13:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018119; cv=none; b=FQwAur/bWxpzbgRyY9iOnSqNoreYYzucX1nvMQkYkWIcPYw8boclQP1M76kyMQscEjHOv7LSR4YOeXnicqTzp/4bdzXHLR/gODNyG2mZDP2OyjEg3KFu2keyaKVPHYE5LaDoj5r1mU7s2otIPA3kY6tM4a0+0Y7gENmJ4vp6pkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018119; c=relaxed/simple;
	bh=WAS/ZY2rni16gfsJ0XrYK7pyDfoo4oQax4c9rkXIQ+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9sHbedu6O9vsFCTiG/EvWrYd+ANjioIUPbb5sa1C8ZkYGfpfQXrSLeSWYlsx+/uvNM4sfQ51mznMLeQo/8YNjHiz675OCiKJ/dTzYsbMW5BRu0vC++Ce15Dm7HdYgm/SfRw1ernogVU+sDEr363Hy2Jjnxkq2njwawTBRuDVyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NkPxhHvp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43f106a3591so8098545e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018114; x=1746622914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvMeErsxzspSIlGW/2qkBXNlhSczJES7Gq5aMBrNrd8=;
        b=NkPxhHvpNelZofqDS6lurqlTaJtoEBW/Qc1aU5H6X5RMPY2iiPCba7zOdob8Mxlw2u
         DzX8RVmwo+D/oZWLVs99Zg0gw2xld23xqIPGSjxP8E/XwyO7LaB8Sax4Yz4Fx6NZpnqN
         9mutiKhgSOW65j7xg3sEgGSikCl8pk2pXpaYACp8ZR4Zzo4XCObvFmA2uVWYiiknZQFM
         qrjeNA1zoyOLmCJexPveAxbvUN3+gJ4wQwmdhbNi8O82Y/T/q6cDaj0pJ1EcBlS1r5TD
         C4IA/EpZYPP3d5lDKvz1j9FZ9nFOaNUGnSD9QnxMsoO9+Yu4cWuRatlsk53IM2ahzOKW
         Ifpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018114; x=1746622914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvMeErsxzspSIlGW/2qkBXNlhSczJES7Gq5aMBrNrd8=;
        b=bd981fTbmM3K83gMYfu3Y13Idfky2+6qTSkxAdbPGs3X59A/rIbtdcf2LxJMsGgdn6
         NA6c19+H9NaTk8ybMa/WhHJ+EClrBubcozDPkKiniUUyE3C8mnuHSgQcBV04ZgDugJz7
         0quHwmLzeJdlbA/eDfCC2KtPYL9PGSR/5J4862jIzR6bLp6YwqEAH/NoB888+t8N9a81
         CVdEfsvQcOcwP9j2vBWx/tNncy+rLOqqluX2htE9oUDM2YnnqKResyrRv+W13k2fTg8c
         K56svnMpUJX4rKEI3n4GzbGGCbxsZ04ND7XZAV/eFFNVK5SWnGQnrGaL/Tron8ySVR8r
         U0wQ==
X-Gm-Message-State: AOJu0Yx1jGf6TbjavWNs31TTRXSgK7DQGZryLVkXrTQ20+/PzDOuDI+o
	HEKh+JcYfrYMJIqjLEGPWr/CXokBpml53vJe1rwAtFYcJ0x2dzEiL3rmwKA4Gbk=
X-Gm-Gg: ASbGncua9HsHcTeCdPcNqH7ALHSxPS9YDGe/cTzslX+zLZPA24PCr+Vi/VxgWaVjW+k
	Q7MOIW8jDuyeNvhfjXOXNFRBJWkGjMwpAgD4bftB5VrPqkEvhq21FkT9i7SpUOi+JayO5kh+R7R
	jVUea8dG0c7KWkI8cs6iLizxjdaXZinoOgrIUKeajkaZx3QjJ2FvbASYGj4yBQOUrt2M9aUs++n
	qILUyHyrz3R08VevV6xrJGRZoNYn2vsoaUcOFxVAXpjlkKcMRmA8VLK8F9RY4IBDc0TVl23uPlN
	Kb7HPsGtxgDmZ4c9RZUVWLPzmxSP1FLdLkOe3bVXLL6LIETLTlSGOMf4e4c=
X-Google-Smtp-Source: AGHT+IFZv8o6KCEUY51F0cTyK0BLkydSFJXpEBfGxpot5cmVITUa2IgtAcHUXD94u3/lt2/wBfJ90g==
X-Received: by 2002:a05:6000:2c9:b0:39f:728:4324 with SMTP id ffacd0b85a97d-3a08ff74043mr751533f8f.9.1746018113975;
        Wed, 30 Apr 2025 06:01:53 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:51 +0200
Subject: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7657;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WAS/ZY2rni16gfsJ0XrYK7pyDfoo4oQax4c9rkXIQ+0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh8LMB1KhVzmri4QYY2D8mI+TfDoRqwLLpEHe
 Z7SKGbTFp6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIfCwAKCRDBN2bmhouD
 1/+vD/9MiF/yQLp6Tzs6qeDRij9nAuU0zRnUYb0wGTH5medZzHhV0IdpwNsPK7gzkSARgLEvP7w
 sMa8/GNCrfXsr3Th+U5Q0+kFqeEw4Y1LrBXpALG/K/1mMymnGLQPAlRBY8iwAkNkmJbo5na8UKs
 BxvVj6C1H1ZgQOIMNVIa375f0dwM8H7C1sIIwXIYezaBGLIRc+jEzM6Pf4HOqVD8MTEH/RHhc4p
 M8VbtJYE8T+mAGmaz/TST9X2ztwlJJ7u+KQ5hvUskHYSEy+dpK4auK3ZljjGLwci1yYSHjtrNEu
 pofevITflRA35uiNHc5vUeZbdWK1EmMcp2nVlMSf9IY6GSDF9J0VmhuSwxxGZ9BiWVBqdZEWn1Y
 KtDM7ICCrYJC8qk9Jz7lXEliCWftcPG0+cGmWG2bapvwfnRa9SNKjfCSjthIftU4xvpkUT+S+U6
 O+3xWcBS2VJK/NRpPH7hlUpR+kpi7UcVru/7B9repvCmq+FLDSyldBNeCVeXreUoWLHiYDcBuMm
 RbLHfSCH9Zmq0dmbjqFJxYIXVw9qAlvRpQZrQAEuOZylnwaCRl6dxk9QRxTSZHm/ohohxz52Tq/
 OWQ+zaBORrzjuLVYYkQ9rzbGIn6XLZZ2WCwPJRj76swUBtBCi86Gm1hK3bbfecTVGG9GsrIwiaT
 oajDrysqk8vOSGQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
differences and new implementations of setup_alpha_out(),
setup_border_color() and setup_blend_config().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v4:
1. Lowercase hex, use spaces for define indentation
2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
 2 files changed, 94 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..90f47fc15ee5708795701d78a1380f4ab01c1427 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -320,14 +320,20 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 }
 
 static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
-		struct dpu_plane_state *pstate, const struct msm_format *format)
+				      struct dpu_plane_state *pstate,
+				      const struct msm_format *format,
+				      const struct dpu_mdss_version *mdss_ver)
 {
 	struct dpu_hw_mixer *lm = mixer->hw_lm;
 	uint32_t blend_op;
-	uint32_t fg_alpha, bg_alpha;
+	uint32_t fg_alpha, bg_alpha, max_alpha;
 
 	fg_alpha = pstate->base.alpha >> 8;
-	bg_alpha = 0xff - fg_alpha;
+	if (mdss_ver->core_major_ver < 12)
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
@@ -482,7 +488,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		/* blend config update */
 		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
-			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
+			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format,
+						  ctl->mdss_ver);
 
 			if (bg_alpha_enable && !format->alpha_enable)
 				mixer[lm_idx].mixer_op_mode = 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 3bfb61cb83672dca4236bdbbbfb1e442223576d2..f220a68e138cb9e7c88194e53e47391de7ed04f7 100644
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
+#define LM_BORDER_COLOR_0_V12            0x1c
+#define LM_BORDER_COLOR_1_V12            0x20
+
+/* >= v12 DPU with offset to mixer base + stage base */
+#define LM_BLEND0_CONST_ALPHA_V12        0x08
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
2.45.2


