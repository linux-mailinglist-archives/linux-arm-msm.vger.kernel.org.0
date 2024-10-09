Return-Path: <linux-arm-msm+bounces-33648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D461996404
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80E931C23394
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA165191F7C;
	Wed,  9 Oct 2024 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FCUKIiU+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E46E191F69
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463880; cv=none; b=n8IA63/MyzP2a9dUpeabLE3j5Bt+rHBLWfl+6fXaPBt07tDij9WQKlZ5TigRTGwO/wS3fOX2SM24giVKZqSAURzUb/8HwA2Pl8BMB/tXB41pGwXwK18UFIPSjMaVC4hCBMnrZ98A8ZKxYooxO6QC3Ow4QQauptFB5l+EZK7tvJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463880; c=relaxed/simple;
	bh=d6FA+M/FjBX/3MEHc7VsbcrNZioGkbL6iFmPiKpmDOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P0p+crzyCKClHYOQuXFjvAiqdGKUTnJ1btswdNDcPT+sAPX4gc9vBRpD8OszfoGekfT3QPk94JrWFilc4cgcd25LxTTLYBYs8e/GiBzod5CwW3E2MQ0h90qrU+ljRVfox6AEP7vEe/xoylObvkZPrzabVP9V80TB3kitm9b8Uz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FCUKIiU+; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e18293a5efso4530571a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 01:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728463879; x=1729068679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpK0k4xFfIit4zaSmhmserorxSb9ry7uxeuhNDC7oJA=;
        b=FCUKIiU+X0+N3J2daT41tpgormrLGPJzJp1d0UiJldjZA496wwfShpkbiL9Od+gG1g
         lMoZ2xvokMjFLyQCd9CXeI+9Q75te/okcEehvnSLlGfY4CBQf0OxVaMIEvwcnJdvEF8a
         0p/Fq+sYOMWIsJeBKQQs8FTNm7x5YF71hXmKx4zB5eKXghZs4Fwv3Q+PVF4W3IxlH4tP
         /z9DT6hHHKpI1qhH+KcyP1CVxE8TFC3U+tSW/gcvUcsvfJBeidTvUehLToFm6xSKXJTq
         7un9NgsXC61417VUjVihukKqjJN1HmOfspbVbhCiclFp3cqCERmAxyyvmD5pfBHmXQlX
         BMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463879; x=1729068679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vpK0k4xFfIit4zaSmhmserorxSb9ry7uxeuhNDC7oJA=;
        b=jwPqm2oow6kdMv0vdnjAqE/5qSFSiShH/XTdMJigKvWmABO7/AlCBMubMwduB+mgZF
         XsNNL1u/c4J7oHQx1k5MWU0ueERb5qMZbjgvpcSmZLWFa6hna/1kKEDXV6Pwlh1vR/yM
         G37CTcGe412hwGM6f4BXPok2QvLaCFfQfxkgists99OAHY3ubydh/ni3Gm51TTXWn71Z
         GjAjOMPg3pw28I+WZfWh6EI3M37edKD2jnpfszaQI2H8Ecxg2NIsHZYwdf6+l2gwBHfL
         Ka57Wzcr4YkKQlIhNinjy3ctAoVFsyQCzLbXktl+R+SAh38Av7x4CY2QPf/zfTBwGjIw
         qWPw==
X-Gm-Message-State: AOJu0Yzqj6O3tknXAEY6vVy+zaIUitMl2iIVr2ruA6UXNOJ8okhxIdP5
	gAugjFif1ujMkd1Y7jSL+6t7XZdDNQM+r84pVxiI3aCcTsAR08cZ1eg1CG2QXPg=
X-Google-Smtp-Source: AGHT+IHe9FbYiCWGUad9G8MFOgochWsO+40bvV7MWi4goN1+2gyN6VXnBwTao4ak546a2TWM8Yprwg==
X-Received: by 2002:a17:90b:f8d:b0:2e2:af88:2b9f with SMTP id 98e67ed59e1d1-2e2af8834fdmr967039a91.16.1728463878553;
        Wed, 09 Oct 2024 01:51:18 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 01:51:18 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:23 +0800
Subject: [PATCH v2 10/14] drm/msm/dpu: Support quad-pipe in SSPP checking
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-10-76d4f5d413bf@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=5070;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=d6FA+M/FjBX/3MEHc7VsbcrNZioGkbL6iFmPiKpmDOA=;
 b=GNVGnJbpfVw6aGjlDgu20HadTv0FDiH386iH87aVQ269ay9VWGIcPUPm7SHKJB4uiQ11KNiLF
 T7UOMZoHl8eAHZEJA4fx/XjzPS7+1GXtF2sHMd/brCB8LNDdM/tLjds
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Move requreiment check to routine of every pipe check. Because there is
multiple SSPPs for quad-pipe case in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 86 ++++++++++++++---------------
 2 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index fc54625ae5d4f..05b92ff7eb529 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -143,11 +143,13 @@ struct dpu_hw_pixel_ext {
  *             such as decimation, flip etc to program this field
  * @dest_rect: destination ROI.
  * @rotation: simplified drm rotation hint
+ * @valid: notify that this pipe and config is in use
  */
 struct dpu_sw_pipe_cfg {
 	struct drm_rect src_rect;
 	struct drm_rect dst_rect;
 	unsigned int rotation;
+	bool valid;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9a8fbeec2e1e8..904ebec1c8a18 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -739,12 +739,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
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
 
@@ -920,49 +948,19 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
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
+			break;
+		DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
+		ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
+						  &crtc_state->adjusted_mode,
+						  new_plane_state);
 		if (ret)
 			return ret;
 	}

-- 
2.34.1


