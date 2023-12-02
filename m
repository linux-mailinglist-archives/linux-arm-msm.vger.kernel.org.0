Return-Path: <linux-arm-msm+bounces-3044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E883801EBF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91E801C20902
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 21:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882E1224CA;
	Sat,  2 Dec 2023 21:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AjfvdW3F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EAFB125
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 13:40:28 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50be6c65112so770568e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 13:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701553226; x=1702158026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaMpbzZxc+EnLx8JXRcnVmGqp4kOvrE+EuHMsxmar1c=;
        b=AjfvdW3F3AmL29BmHkdI8rf/7Z8qmM4ILzqQN9n8onFp6u8SPe7qIf9q9G/snnTpdq
         Dg1s+tSSC1SsCiorzXPVqYWihI9LZlH1Vk0tVxio7PDeSmDBTzDjRoRP+o1irRFHOluE
         JRlHmVS037qhVbr5AU0/r5jZBLpOyFWs6V1Cvgb3Al7q2JJCwzcp8W1Wl3IzLsv+yX1G
         zzgetpz6Epfc4nZRqGrDoNUYxdmxC7Tl7KaUvCSzblG/rnN1eTIP8eQlIelMr+tDszI4
         GHfOVsuJCHXTfUgNmNwRip6jyhS1P07Vn3pLqoVxGpqM1Su1iD7ELsryZM1ixCnU80dM
         Mvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701553226; x=1702158026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaMpbzZxc+EnLx8JXRcnVmGqp4kOvrE+EuHMsxmar1c=;
        b=e2I71Kvd1bXSrPIIBq2T8XSnmMcEKnluxRsxAM0DeHx3TYdeVIf2Qzo2zqG9VBm1/m
         HqcSk7Luqr11aRA787z+uX2drVV/U3TzDfQqpcCUla/IXo6QKdDYkHUB+g/Ug8Ie6Pk3
         KCpKYb0W1g6i9kNf62mw88Ek1dIIitNMu/X7Lt129AmZL5TMs94Wk+PBzXIDDj9o6JfN
         p6AICia/Z6ACwSQSfYrAuvIG5Moju13IHZ5DTMJLZcqqhpCsj8F/B+sqVqh78GjjCTmX
         3tijUL3wQOutEXSJP7lY7VUdsv/8j8g4HaqtBAUFGvdpnYRIzrbncb9KN2CAjPi/5+bw
         Ahzw==
X-Gm-Message-State: AOJu0YwhL3uQf/SkFfPkzASd2aygZsCN91N7ty//ogvobs/xmCbhy/rk
	JXx+kh6BmEV6pvuu7XPU+PGaCA==
X-Google-Smtp-Source: AGHT+IEEuiejQvlsxwA3gvKYXcN1JHS488dGugnCJnvL88LuTaQU/tpwA6b9Efsm6M5DUYzgGDPY4w==
X-Received: by 2002:a19:4f01:0:b0:50b:d944:c022 with SMTP id d1-20020a194f01000000b0050bd944c022mr435228lfb.228.1701553225768;
        Sat, 02 Dec 2023 13:40:25 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 13:40:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 10/12] drm/msm: convert msm_format::alpha_enable to the flag
Date: Sun,  3 Dec 2023 00:40:14 +0300
Message-Id: <20231202214016.1257621-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having a bool field alpha_enable, convert it to the
flag, this save space in the tables and allows us to handle all booleans
in the same way.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 12 ++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 24 ++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  7 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   |  4 ++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c   |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c  |  3 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c   |  9 ++++----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  |  3 ++-
 drivers/gpu/drm/msm/disp/mdp_format.c       |  2 +-
 drivers/gpu/drm/msm/msm_drv.h               |  4 ++--
 11 files changed, 40 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9041b0d71b25..201010038660 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -342,7 +342,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 
 	/* default to opaque blending */
 	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
-	    !format->alpha_enable) {
+	    !(format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE)) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_BG_CONST;
 	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
@@ -373,8 +373,8 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 	lm->ops.setup_blend_config(lm, pstate->stage,
 				fg_alpha, bg_alpha, blend_op);
 
-	DRM_DEBUG_ATOMIC("format:%p4cc, alpha_en:%u blend_op:0x%x\n",
-		  &format->pixel_format, format->alpha_enable, blend_op);
+	DRM_DEBUG_ATOMIC("format:%p4cc, alpha_en:%lu blend_op:0x%x\n",
+		  &format->pixel_format, format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE, blend_op);
 }
 
 static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
@@ -472,7 +472,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		format = msm_framebuffer_format(pstate->base.fb);
 
-		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
+		if (pstate->stage == DPU_STAGE_BASE &&
+		    format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE)
 			bg_alpha_enable = true;
 
 		set_bit(pstate->pipe.sspp->idx, fetch_active);
@@ -495,7 +496,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
 			_dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
 
-			if (bg_alpha_enable && !format->alpha_enable)
+			if (bg_alpha_enable &&
+			    !(format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE))
 				mixer[lm_idx].mixer_op_mode = 0;
 			else
 				mixer[lm_idx].mixer_op_mode |=
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index baf0fd67bf42..de9e93cb42c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -36,7 +36,6 @@ bp, flg, fm, np)                                                          \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
 	.element = { (e0), (e1), (e2), (e3) },                            \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
@@ -46,7 +45,9 @@ bp, flg, fm, np)                                                          \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		(alpha ? MSM_FORMAT_FLAG_ALPHA_ENABLE : 0) |              \
+		flg,                                                      \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -56,7 +57,6 @@ alpha, bp, flg, fm, np, th)                                               \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
 	.element = { (e0), (e1), (e2), (e3) },                            \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
@@ -66,7 +66,9 @@ alpha, bp, flg, fm, np, th)                                               \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		(alpha ? MSM_FORMAT_FLAG_ALPHA_ENABLE : 0) |              \
+		flg,                                                      \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -77,7 +79,6 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
 	.element = { (e0), (e1), (e2), (e3)},                             \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
@@ -87,7 +88,9 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.unpack_count = count,                                            \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		(alpha ? MSM_FORMAT_FLAG_ALPHA_ENABLE : 0) |              \
+		flg,                                                      \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -96,7 +99,6 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
 	.element = { (e0), (e1), 0, 0 },                                  \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
@@ -116,7 +118,6 @@ flg, fm, np, th)                                                          \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
 	.element = { (e0), (e1), 0, 0 },                                  \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
@@ -135,7 +136,6 @@ flg, fm, np, th)                                                          \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
 	.element = { (e0), (e1), 0, 0 },                                  \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
@@ -155,7 +155,6 @@ flg, fm, np, th)                                                          \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
 	.element = { (e0), (e1), 0, 0 },                                  \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
@@ -176,7 +175,6 @@ flg, fm, np)                                                      \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PLANAR,                                   \
-	.alpha_enable = alpha,                                            \
 	.element = { (e0), (e1), (e2), 0 },                               \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
@@ -186,7 +184,9 @@ flg, fm, np)                                                      \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		(alpha ? MSM_FORMAT_FLAG_ALPHA_ENABLE : 0) |              \
+		flg,                                                      \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index c1ff70d80bdb..4903dd8d6f36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -253,7 +253,8 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 	if (flags & DPU_SSPP_ROT_90)
 		src_format |= BIT(11); /* ROT90 */
 
-	if (fmt->alpha_enable && fmt->fetch_type == MDP_PLANE_INTERLEAVED)
+	if (fmt->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE &&
+	    fmt->fetch_type == MDP_PLANE_INTERLEAVED)
 		src_format |= BIT(8); /* SRCC3_EN */
 
 	if (flags & DPU_SSPP_SOLID_FILL)
@@ -275,14 +276,14 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 			ctx->ubwc->highest_bank_bit << 18);
 		switch (ctx->ubwc->ubwc_enc_version) {
 		case UBWC_1_0:
-			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
+			fast_clear = fmt->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
 					(ctx->ubwc->highest_bank_bit << 4));
 			break;
 		case UBWC_2_0:
-			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
+			fast_clear = fmt->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
 					(ctx->ubwc->highest_bank_bit << 4));
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
index 602fc5345573..08c530f9b1cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c
@@ -370,7 +370,8 @@ void dpu_hw_setup_scaler3(struct dpu_hw_blk_reg_map *c,
 	if (format && !MSM_FORMAT_IS_DX(format))
 		op_mode |= BIT(14);
 
-	if (format && format->alpha_enable) {
+	if (format &&
+	    format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE) {
 		op_mode |= BIT(10);
 		if (scaler_version == 0x1002)
 			op_mode |= (scaler3_cfg->alpha_filter_cfg & 0x1) << 30;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 1eadaabc8b25..97967fc623fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -80,9 +80,9 @@ static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
 		(fmt->bpc_b_cb << 2) |
 		(fmt->bpc_g_y << 0);
 
-	if (fmt->bpc_a || fmt->alpha_enable) {
+	if (fmt->bpc_a || fmt->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE) {
 		dst_format |= BIT(8); /* DSTC3_EN */
-		if (!fmt->alpha_enable ||
+		if (!(fmt->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE) ||
 			!(ctx->caps->features & BIT(DPU_WB_PIPE_ALPHA)))
 			dst_format |= BIT(14); /* DST_ALPHA_X */
 	}
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index f7bec46c386d..2663c8793ec0 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -184,7 +184,7 @@ static void blend_setup(struct drm_crtc *crtc)
 		if (idx > 0) {
 			const struct msm_format *format =
 					msm_framebuffer_format(plane->state->fb);
-			alpha[idx-1] = format->alpha_enable;
+			alpha[idx-1] = format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE;
 		}
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index ef7e525c3bd2..67c22e02f402 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -319,7 +319,8 @@ static int mdp4_plane_mode_set(struct drm_plane *plane,
 			MDP4_PIPE_SRC_FORMAT_R_BPC(format->bpc_r_cr) |
 			MDP4_PIPE_SRC_FORMAT_G_BPC(format->bpc_g_y) |
 			MDP4_PIPE_SRC_FORMAT_B_BPC(format->bpc_b_cb) |
-			COND(format->alpha_enable, MDP4_PIPE_SRC_FORMAT_ALPHA_ENABLE) |
+			COND(format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE,
+			     MDP4_PIPE_SRC_FORMAT_ALPHA_ENABLE) |
 			MDP4_PIPE_SRC_FORMAT_CPP(format->bpp - 1) |
 			MDP4_PIPE_SRC_FORMAT_UNPACK_COUNT(format->unpack_count - 1) |
 			MDP4_PIPE_SRC_FORMAT_FETCH_PLANES(format->fetch_type) |
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 0f653e62b4a0..0332e66ed3cf 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -276,7 +276,7 @@ static void blend_setup(struct drm_crtc *crtc)
 	} else if (plane_cnt) {
 		format = msm_framebuffer_format(pstates[STAGE_BASE]->base.fb);
 
-		if (format->alpha_enable)
+		if (format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE)
 			bg_alpha_enabled = true;
 	}
 
@@ -292,14 +292,15 @@ static void blend_setup(struct drm_crtc *crtc)
 		fg_alpha = pstates[i]->base.alpha >> 8;
 		bg_alpha = 0xFF - fg_alpha;
 
-		if (!format->alpha_enable && bg_alpha_enabled)
+		if (!(format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE) &&
+		    bg_alpha_enabled)
 			mixer_op_mode = 0;
 		else
 			mixer_op_mode |= mdp5_lm_use_fg_alpha_mask(i);
 
 		DBG("Stage %d fg_alpha %x bg_alpha %x", i, fg_alpha, bg_alpha);
 
-		if (format->alpha_enable &&
+		if (format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE &&
 		    pstates[i]->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 			blend_op = MDP5_LM_BLEND_OP_MODE_FG_ALPHA(FG_CONST) |
 				MDP5_LM_BLEND_OP_MODE_BG_ALPHA(FG_PIXEL);
@@ -311,7 +312,7 @@ static void blend_setup(struct drm_crtc *crtc)
 			} else {
 				blend_op |= MDP5_LM_BLEND_OP_MODE_BG_INV_ALPHA;
 			}
-		} else if (format->alpha_enable &&
+		} else if (format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE &&
 			   pstates[i]->base.pixel_blend_mode == DRM_MODE_BLEND_COVERAGE) {
 			blend_op = MDP5_LM_BLEND_OP_MODE_FG_ALPHA(FG_PIXEL) |
 				MDP5_LM_BLEND_OP_MODE_BG_ALPHA(FG_PIXEL);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index cc0dc451dc2e..01797f3e6d8f 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -798,7 +798,8 @@ static void mdp5_hwpipe_mode_set(struct mdp5_kms *mdp5_kms,
 			MDP5_PIPE_SRC_FORMAT_R_BPC(format->bpc_r_cr) |
 			MDP5_PIPE_SRC_FORMAT_G_BPC(format->bpc_g_y) |
 			MDP5_PIPE_SRC_FORMAT_B_BPC(format->bpc_b_cb) |
-			COND(format->alpha_enable, MDP5_PIPE_SRC_FORMAT_ALPHA_ENABLE) |
+			COND(format->flags & MSM_FORMAT_FLAG_ALPHA_ENABLE,
+			     MDP5_PIPE_SRC_FORMAT_ALPHA_ENABLE) |
 			MDP5_PIPE_SRC_FORMAT_CPP(format->bpp - 1) |
 			MDP5_PIPE_SRC_FORMAT_UNPACK_COUNT(format->unpack_count - 1) |
 			COND(format->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT,
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index b9f0b13d25d5..fa2a76a35106 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -71,10 +71,10 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 		.element = { e0, e1, e2, e3 },                   \
 		.fetch_type = fp,                                \
 		.chroma_sample = cs,                             \
-		.alpha_enable = alpha,                           \
 		.unpack_count = cnt,                             \
 		.bpp = c,                                        \
 		.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |          \
+			(alpha ? MSM_FORMAT_FLAG_ALPHA_ENABLE : 0), \
 			(yuv ? MSM_FORMAT_FLAG_YUV : 0),         \
 }
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 7ea24d776a50..dea6d47854fe 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -257,6 +257,7 @@ enum msm_format_flags {
 	MSM_FORMAT_FLAG_COMPRESSED_BIT,
 	MSM_FORMAT_FLAG_UNPACK_TIGHT_BIT,
 	MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB_BIT,
+	MSM_FORMAT_FLAG_ALPHA_ENABLE_BIT
 };
 
 #define MSM_FORMAT_FLAG_YUV		BIT(MSM_FORMAT_FLAG_YUV_BIT)
@@ -264,6 +265,7 @@ enum msm_format_flags {
 #define MSM_FORMAT_FLAG_COMPRESSED	BIT(MSM_FORMAT_FLAG_COMPRESSED_BIT)
 #define MSM_FORMAT_FLAG_UNPACK_TIGHT	BIT(MSM_FORMAT_FLAG_UNPACK_TIGHT_BIT)
 #define MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB BIT(MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB_BIT)
+#define MSM_FORMAT_FLAG_ALPHA_ENABLE	BIT(MSM_FORMAT_FLAG_ALPHA_ENABLE_BIT)
 
 /**
  * struct msm_format: defines the format configuration
@@ -271,7 +273,6 @@ enum msm_format_flags {
  * @element: element color ordering
  * @fetch_type: how the color components are packed in pixel format
  * @chroma_sample: chroma sub-samplng type
- * @alpha_enable: whether the format has an alpha channel
  * @unpack_count: number of the components to unpack
  * @bpp: bytes per pixel
  * @flags: usage bit flags
@@ -286,7 +287,6 @@ struct msm_format {
 	u8 element[4];
 	enum mdp_fetch_type fetch_type;
 	enum mdp_chroma_samp_type chroma_sample;
-	bool alpha_enable;
 	u8 unpack_count;
 	u8 bpp;
 	unsigned long flags;
-- 
2.39.2


