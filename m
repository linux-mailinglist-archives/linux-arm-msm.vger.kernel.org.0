Return-Path: <linux-arm-msm+bounces-45195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87791A133B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8A591886FC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8E6192D6B;
	Thu, 16 Jan 2025 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nl6jLYGG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835EE192B96
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012372; cv=none; b=bLZdpnHjoy9XIgmlA8vkj9P7BWRJ8HSU0Pn1tC7XcXPepjNHE9QcyNC0S/jdTfnBnh9DYcnI5ZANf6rYEt+PQIc7FvUpj8XjAD5MfoOUmm0ao0N5NkaVPGycbwspMGi2/6dyMDoANzg/isLcONsH5ZQqDLVieoGQ1uip9HHOpEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012372; c=relaxed/simple;
	bh=18JYtAh4XZQo9zQ93uGi+iBL3/LQO++N155uICtQ/e0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NxQiUcyjIfnCxOK21Bvnds5uUw/CL2c7LDknZMTFPzouliXAAztgum8soz6fXdjMvT+duT9LHlypareJKjODpSe1zT1dBQ+2GfaEhNixdItvQ72m47DTkf5mZnPn2UsEiz7YIwlVDDatLG6lsuHoj4SyI+R9j6YMAH49YDp8XY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nl6jLYGG; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2162c0f6a39so33809505ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737012370; x=1737617170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BXi7N+vMIkonc71U358hLDD7SFRaPRCclNtpuXJuSM=;
        b=nl6jLYGGijtPFisbeqwGSIoy+Vbzf1lKu3f4IpeJEC3OPkEpdDJLVzlhfd2lVBlqUs
         nWnUMeK7aPKPhJ88Cdag5KGJKW/tc4O3ETcJRywBveXyjGsx5E1eHdHHTkTDTcbXmCS+
         qZfLU7xA69diPj3xFz302UYuMwxVeTgnHcj3fNagkJUR5cOL+LiqvauVNfJ+zPRBaef9
         FNgEsK+Emr+Mai/+gzSyUOu2K9MtGAaGmL+q5ksfvDFogLwmhVI+vyp65WiCj19yQ+fV
         caekd5ePZ30/Vi6LPxiPg92V43QrRrvvXcxnS5wpEkuufr/5lrSWtn8Vmulwq2x65d6F
         KKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012370; x=1737617170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BXi7N+vMIkonc71U358hLDD7SFRaPRCclNtpuXJuSM=;
        b=A7Xuf5X42LEgoRitsRDRNa0/a7huj7gDJR4umTgCg17Oa0fIdS0wYlvqzYhGEztKSV
         QqWG/6PYBRK1NrDsHHaSRDNHEisE+nXfHg+ocgykDaiokPHr6rEeLekpYrilSYUM7bJb
         ofQcU9u/kUe5UKIXt9lvUcGLKdY10ihRX4lGY2kSA2dMiG2fB0TWnW8K7wLr8hmMZl2k
         alQBU02hc5U3TvgehBcAfI4b5fMeLTi5wQjNLaEyM0JooD7ZYTdj4NCWVGVp155ezXic
         LwTbk85jKNtxoxwQzGo08ex7ObnseBZ+1kzYEQylmknV5tg5QCEKtHDzgw1kbK3HU0LX
         nV3w==
X-Gm-Message-State: AOJu0Yz4aOc1iz7YWW3bttmliFXGP36enMA/h9XiyJPVwHg5pSxH0oTn
	Y7WX45e1rgZbTCVxSrQIO5tZBH5DEXDHdKD+C5WVvPagnJOGRH9Av4GCC6MbIZA=
X-Gm-Gg: ASbGncul3msXYi9bUZ93pCP+LZ6QafVLARAnPKLmd5dvGiS9JHzHvwhZNDcB22ojMTc
	bVU2+HezWX+JMypSmac+rW+mqxmksSoWGRW7Qy52WBh0ILgd3Dh2/KEIQrHlJyKvcvcXlS6VQAj
	z4GjjE4j875o5q7SIsKXep3rfBEhhjX+T+aOF4655IvfHxS9GN2BVre8FN9dVOwGbEWnCdvKaN7
	BfEQQDK3NxfjaX+tZDFdg8uIsTwG8nnK3dfQqDXx0Ii0liF50+KrQ==
X-Google-Smtp-Source: AGHT+IF3GXPDE0ThDrRX628rZOppw6yvpE9Mk74Kz3O+pptthcpM7h+xn71VrIrZ8qqws/76aQC2XA==
X-Received: by 2002:a05:6a00:6ca5:b0:729:1c0f:b94e with SMTP id d2e1a72fcca58-72d8c6a31abmr8853578b3a.6.1737012368255;
        Wed, 15 Jan 2025 23:26:08 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:26:07 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:50 +0800
Subject: [PATCH v4 01/16] drm/msm/dpu: check every pipe per capability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-1-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=4161;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=18JYtAh4XZQo9zQ93uGi+iBL3/LQO++N155uICtQ/e0=;
 b=Kyhq3uRgt+rR0Lo4QrmmptcAJqLk7J0hWrGDDhyt54H1GdYK9f9MOFhi86u5J1lRJOkAEsDTy
 ewEJJ+YkCTRDkzjzoQF5waZEKnrqvdRZS1QEb4MnjBlETP/zZX7c1dE
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Move requreiment check to routine of every pipe check. As sblk
and pipe_hw_caps of r_pipe are not checked in current implementation.

Fixes: ("dbbf57dfd04e6 drm/msm/dpu: split dpu_plane_atomic_check()")
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++---------------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index cf923287dcd05..2b75a6cf4e670 100644
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


