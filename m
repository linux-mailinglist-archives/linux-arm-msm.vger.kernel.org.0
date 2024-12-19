Return-Path: <linux-arm-msm+bounces-42758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 618389F7657
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA4091616D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 07:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310F821858A;
	Thu, 19 Dec 2024 07:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fyDR2iOr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8675121A42B
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594659; cv=none; b=eHTeZbCjnpCSJnv7CRC/9rr1BpKJPJ+FHFdAFE1VsqhP91ocfalEkkYLjSFTfJlsDiP/5+VcaXVNzaYogLT8kg6+TEesrxuHURIBiqrXWlgI9nmg8qRBeG5ARixPtS2UWeJNsTShWgT34bq1KnX9ABbIEzUKmfEpKF+Yr0NkSoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594659; c=relaxed/simple;
	bh=F5vdJwFxIcC21jVkfwNGwrZjNxJ2H5r+EMS30BWgqAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SaKt5rauTSFHiJKOE4fexBbHqiqzVFvBhn36j78INRbJGMinMO0c1aZHKIGdTSClygbA93E/A+td8l1bPWx3l/AV+DuX/1C3Tvpb1T8zvorEsdds/qAaDBs5hPMeA8qKVwKRj/1wA0kqIWmRMJsQh0Hjw35djvR54ByTE6rz+1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fyDR2iOr; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-218c8aca5f1so5681645ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 23:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734594656; x=1735199456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJmsZZpuwbe+vGhIhYkh/sA+lzfRDGmnljR17dLmKnE=;
        b=fyDR2iOrXj28aXD2GYYYH/Lo09BiLVa53luztYeMhuM0QSthJYjKS/Qh18tioWHABg
         SIsWJaMrFFUVLgxoRexmruIqobDoq5FZiXuIJl5XjjNDTY1kGDNzrZqGbAHxJaVxsyQG
         jPB6Tufczfszomh/8pchMFiJz/MUGwlibqG11y9MyJEm9hubH59S54upuUB+eJFkd6Bl
         2K0sQr4qrIgDs+V9Cp6xgLIPhzKJ37XWom90OzIHrKOkHRNMJ4wZxH0EpJC11h6X2J9e
         W/1WduETStS2EiCsjKiL56n87uaKZ+Sd3qxLA6O3Qaq0bgJJM99kpT3G7VOICnwMU+4c
         w4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594657; x=1735199457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJmsZZpuwbe+vGhIhYkh/sA+lzfRDGmnljR17dLmKnE=;
        b=uvsZfPEFkBr9e1ZiawqSA5FV7mTfowX5VcH3evSkwi8H1VWINTuKF212NHKW+a7qQ1
         PkYa3jGGWEfkmzCNBi8Hdn969KiVUYyAPnc0rkZoq5+d+ZikKQ8OUwtElpaNfAwI/CdF
         rFipbd9PgF8GHahv8Jfj5ewSpDkkuHDfa74GV4xuStzggAjoqwepWr/dOnmBXxkVVaqg
         Wq82rnlutvcqBbHmlIhzb10JfwxTWes7/V6Gs3uvCx1d4TnNHXXx52skXsqzoLMHwvrf
         OOwmYV8xWa78PU9gg+RenIcVAvpCnbmapg6knqNTDzgt+BBBpLAqjpacBIMHqSq48l8c
         7EMA==
X-Gm-Message-State: AOJu0Yy7ZR6/tn7kzZpfpDBPa8wfgqxrV6qaSgRd+8NHbH9vTu0zXlNn
	eQazabyp+emTEmsiNNMhl37uoPoB25mSZ5v8X7uqUwKtffIUPZvczDeEOcdYJh3Eacs4uNXromw
	9dtNGsg==
X-Gm-Gg: ASbGncuel8RaLq8pE/ulKKoP5QkqvYzHmBpF86WCQ7Q3rUad4sBy+VZtU55P890ZAKI
	yz+EiDLYhxTn9gsyQGAZ7Wq/o0s36D26G1hJ8bH0q/ycoFyCGJhEEz5uJU32JE6jpEkGkuZhvFS
	ifZ8J1S0xE7/OciYLblOfHWmYL8HRY5jUQdqHlqJIxcOHCM+YnjrCag9wD6RW1zHGn/HLiR/VaU
	j8X9RYn+HcLgST2ceHUwzDBkNgJPa7x6FT+j9IYvJCDY4j4hDOD5w==
X-Google-Smtp-Source: AGHT+IEOqA1vJf2uFvBqIESm9Tov34I/A0aYwu0QNTS1g6acpaxijvfrMk0duLvIL4x6NLUt1a8Z1g==
X-Received: by 2002:a17:902:d510:b0:216:59ed:1a9c with SMTP id d9443c01a7336-218d726d7f9mr74054205ad.55.1734594656721;
        Wed, 18 Dec 2024 23:50:56 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:50:56 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:31 +0800
Subject: [PATCH v3 13/15] drm/msm/dpu: Support quad-pipe in SSPP checking
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-13-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=4472;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=F5vdJwFxIcC21jVkfwNGwrZjNxJ2H5r+EMS30BWgqAo=;
 b=lePD4rWXUf7a8kUW35TLtTYSAqcnRIc9x4Bkc604Bb7xiZ+vYvR8cP6h183sxiT1ncmdFxY/t
 fFjQ27KJyaPDj1t+3m1gCliw0IrjT/HtGtorJSxK5JVCfiSmRv2JhZM
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Move requreiment check to routine of every pipe check. There will be
multiple SSPPs for quad-pipe case in future. Only check valid pipe
as some pipes are for multi-rect or right half of screen that may
not be used.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 86 +++++++++++++++----------------
 1 file changed, 42 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index fca6e609898a6..1cd98892898a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -730,12 +730,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
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
 
@@ -981,49 +1009,19 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 		drm_atomic_get_new_plane_state(state, plane);
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	const struct msm_format *fmt;
-	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
-	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
-	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
-	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps;
-	const struct dpu_sspp_sub_blks *sblk;
-	int ret = 0;
-
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
-	if (ret)
-		return ret;
+	struct dpu_sw_pipe *pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	int ret = 0, i;
 
-	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
-		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
-						  &crtc_state->adjusted_mode);
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
+		pipe = &pstate->pipe[i];
+		pipe_cfg = &pstate->pipe_cfg[i];
+		if (!pipe_cfg->valid || !pipe->sspp)
+			continue;
+		DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
+		ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
+						  &crtc_state->adjusted_mode,
+						  new_plane_state);
 		if (ret)
 			return ret;
 	}

-- 
2.34.1


