Return-Path: <linux-arm-msm+bounces-14056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 383FF87B59B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AA14B23217
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79882579;
	Thu, 14 Mar 2024 00:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CsfFtr6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE69624
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374547; cv=none; b=a7i+7/d31W6xjVzEj35H6sGN2mJOwN3lDZGP7q8kIwkeeFWbiF/k/3y/rXf/6+T2iz+dck6mKtd5KSbIjdTRDsnBJAVlcZjWNp4di3JE4j6hUnlxvJMTDvzCasj5fPq0GTSZc5dKYPWVRve4v+FHLmCsayuhpAEa1S3Rtf4ic/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374547; c=relaxed/simple;
	bh=EJP+betVeTZVy5V+QQRPkJ8awZnAUMBYKjPBAF4j0Zg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tVydNKIUFeeZBMVz654IqkY71L48jFv4KWNKCf3Ax5RVRD0UJdOTgTxAZ6VVjUEcxfxAF7EGStUsh6J7YNDT9ZKIz53mrYuMXXxPqeR2mhilBpqjQsDHlqGib6m1l0Rw5lPX40kFHDotGqlyE1nYanrLKPxoKT5lJTwu4iBaKYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CsfFtr6R; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-512b3b04995so453338e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 17:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710374544; x=1710979344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMjERx5gJlPYsm3RKep9YqViik8n/JwZ5+oV+Ch5MHY=;
        b=CsfFtr6Re+jazbcm11URx8+4BsDlqrHP/7e1wpkceqDZJSLwXtxhboD71Zjq56inQz
         y6RH3GFVn7ydPmNY2jREtDGm6leaaFfQvlH757EBVfkSidYzht41Zfm0FkSk4HehZYOy
         XYJNKDQ8bTlotDa6edueZRepk9i8Vu03TUTpRVhRCwe9cVQOgy2XnBZUkFi3ecZeL6Y4
         YJm5UhpX4C/shYdfZjX1N2jCB+aQmlyo+wnv5zj78ETVEq5d/JLIsrgU+5z6SIhN4bMH
         caH6xadS4cQPj1t6zbg9d9nIVCYGq1FMHvLeOHJd/0BRqrj1r7LyhHMZSvWcbd8gn8r1
         dQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710374544; x=1710979344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMjERx5gJlPYsm3RKep9YqViik8n/JwZ5+oV+Ch5MHY=;
        b=TXT39UwraFcuRFxL+66s9zAQgDtYjY+p6Yj9Gk7BGPat+UeTh2VyZPkMLbZzFUhSyn
         eU0odfvx8qyJK2yARkhHuAgjz6WvvBgCoIMMORcYuT29LXFj7zr1tDlz8Q9fpII1Xxlc
         qSnjIi/gYWYkLlFnaOepNDWzlT1WVKV/ZdeP7ZUxFl7OExeaVvZfT3GVzjsp6ueGlw/5
         8iqKEPuIyQmA0cmbx94gqn9z0uYfktUyPgpBX7+ic/YCAy7ZqQToM6iS+EgLZPOA/zji
         AvjAS04650PD+FM6kWrg944DD/kmRLUnIxQr3vokyfRD5Fr4ir1cuMXoXTVlXJZ3Hk5v
         FFig==
X-Forwarded-Encrypted: i=1; AJvYcCVH41FKq3HdsVk+dr8LbPXMyzLFRzub6zaSUCSjQmWkIhoJOhbInP0J178hFp89gfzndzSX7KQABbqA+3W7jKKD8BTNr8j2JHjqWW975A==
X-Gm-Message-State: AOJu0YxYN8q192WUsXVnFJbYLzkk1nFCNo5Ul7Er8AekBKmkUqpHD2tj
	A1W/u/6EWrhusb5GFdUOFkbEnKcb3+TUZSxcGzKraRMR6TMAzXB1NcZD9KgkHBU=
X-Google-Smtp-Source: AGHT+IH2VqAAWgzBXiDTrFuh8IYTuEEuZV+tSPCwKo5+NizDb/JgmhRwMXMnY/s7YH+fjsSPMFhe5w==
X-Received: by 2002:a19:ae0a:0:b0:513:572f:88f0 with SMTP id f10-20020a19ae0a000000b00513572f88f0mr45961lfc.41.1710374544250;
        Wed, 13 Mar 2024 17:02:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 17:02:23 -0700 (PDT)
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
Subject: [PATCH v4 07/13] drm/msm/dpu: move rot90 checking to dpu_plane_atomic_check_pipe()
Date: Thu, 14 Mar 2024 02:02:10 +0200
Message-Id: <20240314000216.392549-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move a call to dpu_plane_check_inline_rotation() to the
dpu_plane_atomic_check_pipe() function, so that the rot90 constraints
are checked for both pipes. Also move rotation field from struct
dpu_plane_state to struct dpu_sw_pipe_cfg.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 55 +++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  2 -
 3 files changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index b7dc52312c39..a774404b42b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -142,10 +142,12 @@ struct dpu_hw_pixel_ext {
  * @src_rect:  src ROI, caller takes into account the different operations
  *             such as decimation, flip etc to program this field
  * @dest_rect: destination ROI.
+ * @rotation: simplified drm rotation hint
  */
 struct dpu_sw_pipe_cfg {
 	struct drm_rect src_rect;
 	struct drm_rect dst_rect;
+	unsigned int rotation;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 187ac2767a2b..a41ffa2d774b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -527,8 +527,7 @@ static const struct dpu_csc_cfg *_dpu_plane_get_csc(struct dpu_sw_pipe *pipe,
 
 static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 		const struct dpu_format *fmt, bool color_fill,
-		struct dpu_sw_pipe_cfg *pipe_cfg,
-		unsigned int rotation)
+		struct dpu_sw_pipe_cfg *pipe_cfg)
 {
 	struct dpu_hw_sspp *pipe_hw = pipe->sspp;
 	const struct drm_format_info *info = drm_format_info(fmt->base.pixel_format);
@@ -551,7 +550,7 @@ static void _dpu_plane_setup_scaler(struct dpu_sw_pipe *pipe,
 			dst_height,
 			&scaler3_cfg, fmt,
 			info->hsub, info->vsub,
-			rotation);
+			pipe_cfg->rotation);
 
 	/* configure pixel extension based on scalar config */
 	_dpu_plane_setup_pixel_ext(&scaler3_cfg, &pixel_ext,
@@ -603,7 +602,7 @@ static void _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
 	if (pipe->sspp->ops.setup_rects)
 		pipe->sspp->ops.setup_rects(pipe, &pipe_cfg);
 
-	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, pstate->rotation);
+	_dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg);
 }
 
 /**
@@ -703,12 +702,17 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 }
 
 static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
-						const struct dpu_sspp_sub_blks *sblk,
-						struct drm_rect src, const struct dpu_format *fmt)
+					   struct dpu_sw_pipe *pipe,
+					   struct drm_rect src,
+					   const struct dpu_format *fmt)
 {
+	const struct dpu_sspp_sub_blks *sblk = pipe->sspp->cap->sblk;
 	size_t num_formats;
 	const u32 *supported_formats;
 
+	if (!test_bit(DPU_SSPP_INLINE_ROTATION, &pipe->sspp->cap->features))
+		return -EINVAL;
+
 	if (!sblk->rotation_cfg) {
 		DPU_ERROR("invalid rotation cfg\n");
 		return -EINVAL;
@@ -738,6 +742,7 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 {
 	uint32_t min_src_size;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
+	int ret;
 
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
@@ -776,6 +781,12 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 		return -EINVAL;
 	}
 
+	if (pipe_cfg->rotation & DRM_MODE_ROTATE_90) {
+		ret = dpu_plane_check_inline_rotation(pdpu, pipe, pipe_cfg->src_rect, fmt);
+		if (ret)
+			return ret;
+	}
+
 	/* max clk check */
 	if (_dpu_plane_calc_clk(mode, pipe_cfg) > kms->perf.max_core_clk_rate) {
 		DPU_DEBUG_PLANE(pdpu, "plane exceeds max mdp core clk limits\n");
@@ -889,7 +900,6 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	uint32_t max_linewidth;
-	unsigned int rotation;
 	uint32_t supported_rotations;
 	const struct dpu_sspp_cfg *pipe_hw_caps;
 	const struct dpu_sspp_sub_blks *sblk;
@@ -918,6 +928,15 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
+	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
+
+	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
+		supported_rotations |= DRM_MODE_ROTATE_90;
+
+	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
+						   supported_rotations);
+	r_pipe_cfg->rotation = pipe_cfg->rotation;
+
 	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
 					  &crtc_state->adjusted_mode);
 	if (ret)
@@ -941,6 +960,7 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
 		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
 		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
+		    pipe_cfg->rotation & DRM_MODE_ROTATE_90 ||
 		    DPU_FORMAT_IS_YUV(fmt)) {
 			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
 					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
@@ -964,23 +984,6 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 			return ret;
 	}
 
-	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
-
-	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
-		supported_rotations |= DRM_MODE_ROTATE_90;
-
-	rotation = drm_rotation_simplify(new_plane_state->rotation,
-					supported_rotations);
-
-	if ((pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION)) &&
-		(rotation & DRM_MODE_ROTATE_90)) {
-		ret = dpu_plane_check_inline_rotation(pdpu, sblk, pipe_cfg->src_rect, fmt);
-		if (ret)
-			return ret;
-	}
-
-	pstate->rotation = rotation;
-
 	return 0;
 }
 
@@ -1120,14 +1123,14 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 				pipe_cfg);
 	}
 
-	_dpu_plane_setup_scaler(pipe, fmt, false, pipe_cfg, pstate->rotation);
+	_dpu_plane_setup_scaler(pipe, fmt, false, pipe_cfg);
 
 	if (pipe->sspp->ops.setup_multirect)
 		pipe->sspp->ops.setup_multirect(
 				pipe);
 
 	if (pipe->sspp->ops.setup_format) {
-		unsigned int rotation = pstate->rotation;
+		unsigned int rotation = pipe_cfg->rotation;
 
 		src_flags = 0x0;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index abd6b21a049b..a3ae45dc95d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -30,7 +30,6 @@
  * @plane_fetch_bw: calculated BW per plane
  * @plane_clk: calculated clk per plane
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
- * @rotation: simplified drm rotation hint
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -47,7 +46,6 @@ struct dpu_plane_state {
 	u64 plane_clk;
 
 	bool needs_dirtyfb;
-	unsigned int rotation;
 };
 
 #define to_dpu_plane_state(x) \
-- 
2.39.2


