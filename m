Return-Path: <linux-arm-msm+bounces-50014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2BAA4C497
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 16:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A381173689
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 15:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A52C1D516A;
	Mon,  3 Mar 2025 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JU/x9IOu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFC921480A
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 15:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014897; cv=none; b=guMVkyBMBdGNZa+S16VHFbsRAWA2cS3pO3qcxngEU4Jldj2AITGCabIo4WqaFX9QsFgZHOGKxiCeDf1ySk3WL4zSUpENw6X3cF7QkwWzKNNVPYs9MVjzEkdJVPkpFkmIu38yvpKCHR1s0f9UTSfQTClDzppV0uWWxt7GVUug2m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014897; c=relaxed/simple;
	bh=f7vmxxj2aXQGnMGrEnTOGdqDh+9P0TeHrkYJRqajnDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tZiZJuweM3XPxgbC9OKJOoDVbkkfGcpDsyE5Lv4Tjl4Mt79P9rivsWN8XmAqvnfYTYShZIAzKIygGjzFWLKuFrqDx+ecE26TbT3n353QWpA2JDiFWfjZ+pVkC68AAtjQsqUxgxfQTeDE91Y6GypOpSyNMOqXSypEJjGrW2guwWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JU/x9IOu; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2237cf6a45dso36865905ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 07:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741014895; x=1741619695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23d26b6/rNMhE2TK5FNAdZfYGc+bxo+2P+WD0NWcJF8=;
        b=JU/x9IOupq9DrXuGxWWQq11Ldg3m9joCu3GsVF3Cdz5twtya4jMbPI3Wy7Nmxt1kzb
         raju7FAqgcWu/M7GGYUHTw5Xan6r6PhGnqHeJzSif0YGo1K6Imo0NPJB8qF6hLAwv3vg
         mTBt7ihciLffHnn6kh3L4IS7GsGP+HhIrThRAlBru3cmUdD2hdIzgaftMAGNAihvkO7n
         gUa0On1D8kypaY2hTMnaW8x+vNH22WkjkR8veHZdGOxJpcEH2kCf3yF8n4Smk6NjrQzP
         oK9v8YOpV5P9XSWTbZlhsHrGIyETJhM6Me4bTGvb6JAcldfKFWnzVaH7BFm5rLH/D8oz
         xxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741014895; x=1741619695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23d26b6/rNMhE2TK5FNAdZfYGc+bxo+2P+WD0NWcJF8=;
        b=JN6+u/602J3G1GOKD4aNkgfqE6yLuzFkJvIzPDmYnJJryxHlqu3w1edp36ws+THvoy
         r/sfNQolFyQHaznWuYmWyBO1lKDneLr4G7OLahY33XGq0HdztZlHx9eCodZGQSwUWnQv
         3lgqYA1NaOBl+HiHhBJS2ioGivaCpLLP3lKFebHMQBAeaMHuAcj3cK88rbXfCOjeooZL
         KGpQRPgZO8qGaGtGy9JQ5FmZL+rLg6ERFXkC3kGJawp4dZPJ2Nc4d3DER4cnX0JsB0XC
         GJLINnmsjmihKwAUv7CSEzN90jeGCHsvdZUEbwWclNzib5p9t5k5XmRCLz0enrCXX5R9
         2T7A==
X-Gm-Message-State: AOJu0YyAsT6eTU12txSLpXBi4mEseTNFZVo+VsLs07DVzvEghsQofGPE
	L1at7gCqRXXLpZrsegeZCSDrwQ4jYQSTpDkbsnTqtI5mzVXu3j4+asIhnXymP7t1g8EQOhP9lnO
	GaJYjBg==
X-Gm-Gg: ASbGncv81eSQgaPM7/vMybvRFX3SV88xsc4JfyAZOuII1vRTmRYZ1maNZLnl3CvPdD5
	1kwrrb7u5V1myyWS8OB+FsG+sIYtWfisuTMtsv9m0Dd+t3C6bXy+DC/lLke0JQWHuup2MCm0D5D
	qaktgkX0u6Q6HFSMRf+NLeVjpxX1dIHVywodek5ZU3oSrfap1aJO+H8QZ3hstiB58/yUQ4LXroS
	Ne3uBd4BnV253Kgto+hprytAxdzzW/eKZ2AB55VcWgbDQrcekxr00t8iLf2jii7JDriG5q2VFIB
	inAew55IcUNv+wfk1jQlYgWaN1EMkz//kJHSSimAEQ==
X-Google-Smtp-Source: AGHT+IEZXOVfk9vvs9ueKjdtqfIHne0Pi+FC3U3JHpeDAvVS+sDngfbGOm6cZOFiQeTD6fyidSq0Ig==
X-Received: by 2002:a05:6a00:1805:b0:736:53ce:a32c with SMTP id d2e1a72fcca58-73653cea459mr5730851b3a.17.1741014894939;
        Mon, 03 Mar 2025 07:14:54 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:14:54 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:30 +0800
Subject: [PATCH v8 01/15] drm/msm/dpu: check every pipe per capability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-1-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=4444;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=f7vmxxj2aXQGnMGrEnTOGdqDh+9P0TeHrkYJRqajnDk=;
 b=fDRF2/MiyODTU8Shp8yUwEv89OJ+oBNUEwpo9nXt5OzwqN3ekY205895pFmkZWEonFNGHm2Hj
 Lqws3+XVAlcBBJLFb7btswep0HbOCIrLp9avhWCkS3xLdINzRUYD8we
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

The capability stored in sblk and pipe_hw_caps is checked only for
SSPP of the first pipe in the pair with current implementation. That
of the 2nd pipe, r_pipe, is not checked and may violate hardware
capability. Move requirement check to dpu_plane_atomic_check_pipe()
for the check of every pipe.

Fixes: ("dbbf57dfd04e6 drm/msm/dpu: split dpu_plane_atomic_check()")
Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++---------------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 098abc2c0003cde90ce6219c97ee18fa055a92a5..feb90c42fef58f3385625f6d8165bfcdabf46d2d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -729,12 +729,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
 static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 		struct dpu_sw_pipe *pipe,
 		struct dpu_sw_pipe_cfg *pipe_cfg,
-		const struct msm_format *fmt,
-		const struct drm_display_mode *mode)
+		const struct drm_display_mode *mode,
+		struct drm_plane_state *new_plane_state)
 {
 	uint32_t min_src_size;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
+	const struct msm_format *fmt;
+	uint32_t supported_rotations;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
+
+	pipe_hw_caps = pipe->sspp->cap;
+	sblk = pipe->sspp->cap->sblk;
+
+	/*
+	 * We already have verified scaling against platform limitations.
+	 * Now check if the SSPP supports scaling at all.
+	 */
+	if (!sblk->scaler_blk.len &&
+	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
+	      drm_rect_width(&new_plane_state->dst)) ||
+	     (drm_rect_height(&new_plane_state->src) >> 16 !=
+	      drm_rect_height(&new_plane_state->dst))))
+		return -ERANGE;
+
+	fmt = msm_framebuffer_format(new_plane_state->fb);
+
+	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
+
+	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
+		supported_rotations |= DRM_MODE_ROTATE_90;
+
+	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
+						   supported_rotations);
 
 	min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
@@ -923,47 +951,20 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
-	const struct msm_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps;
-	const struct dpu_sspp_sub_blks *sblk;
 	int ret = 0;
 
-	pipe_hw_caps = pipe->sspp->cap;
-	sblk = pipe->sspp->cap->sblk;
-
-	/*
-	 * We already have verified scaling against platform limitations.
-	 * Now check if the SSPP supports scaling at all.
-	 */
-	if (!sblk->scaler_blk.len &&
-	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
-	      drm_rect_width(&new_plane_state->dst)) ||
-	     (drm_rect_height(&new_plane_state->src) >> 16 !=
-	      drm_rect_height(&new_plane_state->dst))))
-		return -ERANGE;
-
-	fmt = msm_framebuffer_format(new_plane_state->fb);
-
-	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
-
-	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
-		supported_rotations |= DRM_MODE_ROTATE_90;
-
-	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
-						   supported_rotations);
-	r_pipe_cfg->rotation = pipe_cfg->rotation;
-
-	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
-					  &crtc_state->adjusted_mode);
+	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
+					  &crtc_state->adjusted_mode,
+					  new_plane_state);
 	if (ret)
 		return ret;
 
 	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
-		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
-						  &crtc_state->adjusted_mode);
+		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg,
+						  &crtc_state->adjusted_mode,
+						  new_plane_state);
 		if (ret)
 			return ret;
 	}

-- 
2.34.1


