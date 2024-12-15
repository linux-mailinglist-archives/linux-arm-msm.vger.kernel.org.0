Return-Path: <linux-arm-msm+bounces-42261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA749F23D5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 13:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16B86188539D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 12:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58CF18E03A;
	Sun, 15 Dec 2024 12:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="St7xrj4o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E8A189912
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734266431; cv=none; b=ubZHWFKTnpHHMuVp44ep5L+HXR+XB3O+Ur35SO6+82ji+O0sWcBlOQTxPOdNxPFecyPxxWRuGD7vLPqfiabY9sifJgIOmN0olyTq/RpGHbVdSvCwBbzW5HLyJt2djfUtDDtIh0mlyhrFigZ0q6r22JHx1Uqey2b8hfnIkt05/HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734266431; c=relaxed/simple;
	bh=tnabCVU1SaNGNfJfuPGtjX+5svo205A46mZ25LOgd7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lm4WhP4gqjCpcBcuRpXVRhhGWTzaWW54bYD58lMLPYAyVMeA/4yZsb/re+twNmdBKxpHjX6NJRljlEzX8ZxKQ00amPD87Cb3uBh/uadfwcB0Bte8PHzbHzTYdRUIwH2w2Ra2dVSj6RtYMnEBEowD0KuMREzGUQguKMZibtdPS0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=St7xrj4o; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-540218726d5so3352914e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 04:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734266427; x=1734871227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=261PimRoKlrpsFq5MeoCEW7BIk620Ollnqdg7IYILxM=;
        b=St7xrj4oqSlLqqqfTYxfbQHGg3qZkf8/fsNIQsIWWVCRxLIAe8zaI5br0/ChtJbveE
         z8/kxtqdXsj2BZ12vfsCrTVK2oMqjWry/LPW/GHDTCYVm0L8qKjezHnTRqLfNC9htH83
         JMcpkMxahfpqwWcDMu4sHD5MBQb5ZiXEV5JcfuMkdl9X00KxIR48Pe0APHeX0LxiBgLl
         ePo7ukIzjD48eXKHqFyiaJYJ+YuYsQGyly+CN5RL7jJP1d5XKfcanxwkbSjRIGKuGx5H
         FNbGXioAOgBDwW6cvM51vEBcXp5F69xZTTFJHm0EjZiQW28z4i+7sy0Mfxxi3M+660n8
         PzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734266427; x=1734871227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=261PimRoKlrpsFq5MeoCEW7BIk620Ollnqdg7IYILxM=;
        b=QSWz5y5Ssjadi+3NCwB3h8dw3lLmQOwoQuuS2IqzZVWGmGgHqVSl2OsIKpglCNJdzk
         UYoTI6+7HWVyiNu+QRi+/mL4U+v5SFH2nXZNLbZGMAjJxzZ03G7C5hdK4VxKyhdOujq6
         ZcN7gciGOVNX0MCCJjBR67d2XXOfxOcnzblhIrr6kof1hPM/7ZBcOl/89wydCJdJ7wRs
         jOYYWM20JrJ1RIRSLVwUWHpP9331ST8iLQ9UxfLyp6wAEfB/Q3k8KvI4FdRc2ZX1KKNB
         PiW/2e3Fw0zI0RqtyBq/qe2j2h4F68xucqUY7DxBlUgKiMu3px7DJLfBG0ar/GPuud2/
         T0AQ==
X-Gm-Message-State: AOJu0Yy+TBRHyn1rhssJoEO7jt4nj2j8cytQAjLcHAWYyS2Rrjm6hkdL
	0imARnb8gJNz0Rlza5ub4bCXfZBBCRCxlUswB+yAJzJjyyQCI8WcIchOMBaofHw=
X-Gm-Gg: ASbGncu0ITNZnMD6fJTeqAdJEzHz7/3j5hgPtOUTi4isD2ozKHWmwIHOYcl8dicC1BQ
	LZQHI9Vr/wbRjE8ZtvNklmiZ01yhXS9rG+4vTsTPaMS+ZdiZ2eaHk9WgKAzweXJPpOnCCTmAWmh
	aeKB44VOF6hSDE+D3e9TTXy6rYd37ZFrvZvlquFJlRfgHOip8isKIgCiNe88+UnQMFAht4Xf2+l
	JVXubjkMRkM7GTyxBNtbOabaQWC0Hb97+ZKOHSg77jeWJcNvQdW/s/Kd9JAVfuZ
X-Google-Smtp-Source: AGHT+IGNuDcyPEpgfR+v7rxL+uBzWr/sb+eX++uhl1MuIRCA92kh7ECZHa72TGHrp10PwhQ7m6gQSg==
X-Received: by 2002:a05:6512:3d8a:b0:540:2ef4:9cf0 with SMTP id 2adb3069b0e04-54090553e1cmr3127052e87.18.1734266427326;
        Sun, 15 Dec 2024 04:40:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c13be2sm491481e87.195.2024.12.15.04.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 04:40:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 15 Dec 2024 14:40:17 +0200
Subject: [PATCH v8 2/3] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241215-dpu-virtual-wide-v8-2-65221f213ce1@linaro.org>
References: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
In-Reply-To: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10016;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tnabCVU1SaNGNfJfuPGtjX+5svo205A46mZ25LOgd7c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXs4zgw0g1NMuBXHYSn79U0Pb6MCr7KeRUAq19
 sFxzofeqIaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ17OMwAKCRCLPIo+Aiko
 1V72B/9SRkn6NQGBX5zLK1GMEqnx7DjFvFPoNmm290cRH3MaEvHQGhy/cwhii9zXrTp9cxoGZaS
 wPrS4M1nEyKCuxAAM+LhIcTwyCQ2MTt4iJGEKaNtF8MOt0K0MemZS7fgt8TGPCSvllhylYTXkqq
 iHxRbvN+tAAaD2WLymXbjV1VGrAyUH2zseRWmRmvXoMHec3l8kQEVX0B/VEqIY6SYgnlhiyWvUt
 RO2m+hAL3lk75f0cjHLnDQEmGEAupx2zkf1Tm/F1QQpe1aRfHZU97RRvwf8M5UepxuU7TbljLZd
 LjCfUJOARySPGUM6YCi2NiUCvioWuS855gCtpAEjiSCvAahK
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Virtual wide planes give high amount of flexibility, but it is not
always enough:

In parallel multirect case only the half of the usual width is supported
for tiled formats. Thus the whole width of two tiled multirect
rectangles can not be greater than max_linewidth, which is not enough
for some platforms/compositors.

Another example is as simple as wide YUV plane. YUV planes can not use
multirect, so currently they are limited to max_linewidth too.

Now that the planes are fully virtualized, add support for allocating
two SSPP blocks to drive a single DRM plane. This fixes both mentioned
cases and allows all planes to go up to 2*max_linewidth (at the cost of
making some of the planes unavailable to the user).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 144 ++++++++++++++++++++----------
 1 file changed, 98 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 309a8cdaafcf3dacd1c7ba4e0cddb7f3f56423c0..098abc2c0003cde90ce6219c97ee18fa055a92a5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -20,7 +20,6 @@
 #include "msm_drv.h"
 #include "msm_mdss.h"
 #include "dpu_kms.h"
-#include "dpu_formats.h"
 #include "dpu_hw_sspp.h"
 #include "dpu_hw_util.h"
 #include "dpu_trace.h"
@@ -888,6 +887,32 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 	return 0;
 }
 
+static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
+						   struct dpu_sw_pipe_cfg *pipe_cfg,
+						   const struct msm_format *fmt,
+						   uint32_t max_linewidth)
+{
+	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
+	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
+		return false;
+
+	if (pipe_cfg->rotation & DRM_MODE_ROTATE_90)
+		return false;
+
+	if (MSM_FORMAT_IS_YUV(fmt))
+		return false;
+
+	if (MSM_FORMAT_IS_UBWC(fmt) &&
+	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
+		return false;
+
+	if (!test_bit(DPU_SSPP_SMART_DMA_V1, &sspp->cap->features) &&
+	    !test_bit(DPU_SSPP_SMART_DMA_V2, &sspp->cap->features))
+		return false;
+
+	return true;
+}
+
 static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 				       struct drm_atomic_state *state,
 				       const struct drm_crtc_state *crtc_state)
@@ -901,7 +926,6 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 	const struct msm_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	uint32_t max_linewidth;
 	uint32_t supported_rotations;
 	const struct dpu_sspp_cfg *pipe_hw_caps;
 	const struct dpu_sspp_sub_blks *sblk;
@@ -923,8 +947,6 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 
 	fmt = msm_framebuffer_format(new_plane_state->fb);
 
-	max_linewidth = pdpu->catalog->caps->max_linewidth;
-
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
 
 	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
@@ -940,48 +962,43 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 		return ret;
 
 	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
-		/*
-		 * In parallel multirect case only the half of the usual width
-		 * is supported for tiled formats. If we are here, we know that
-		 * full width is more than max_linewidth, thus each rect is
-		 * wider than allowed.
-		 */
-		if (MSM_FORMAT_IS_UBWC(fmt) &&
-		    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, tiled format\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
-		}
+		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
+						  &crtc_state->adjusted_mode);
+		if (ret)
+			return ret;
+	}
 
-		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
-		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
-		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
-		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
-		    pipe_cfg->rotation & DRM_MODE_ROTATE_90 ||
-		    MSM_FORMAT_IS_YUV(fmt)) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
-		}
+	return 0;
+}
+
+static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dpu_sw_pipe_cfg *pipe_cfg,
+					     struct dpu_sw_pipe *r_pipe, struct dpu_sw_pipe_cfg *r_pipe_cfg,
+					     struct dpu_hw_sspp *sspp, const struct msm_format *fmt,
+					     uint32_t max_linewidth)
+{
+	r_pipe->sspp = NULL;
+
+	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
+		if (!dpu_plane_is_multirect_parallel_capable(pipe->sspp, pipe_cfg, fmt, max_linewidth) ||
+		    !dpu_plane_is_multirect_parallel_capable(pipe->sspp, r_pipe_cfg, fmt, max_linewidth))
+			return false;
+
+		r_pipe->sspp = pipe->sspp;
 
-		/*
-		 * Use multirect for wide plane. We do not support dynamic
-		 * assignment of SSPPs, so we know the configuration.
-		 */
 		pipe->multirect_index = DPU_SSPP_RECT_0;
 		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 
-		r_pipe->sspp = pipe->sspp;
 		r_pipe->multirect_index = DPU_SSPP_RECT_1;
 		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
-
-		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
-						  &crtc_state->adjusted_mode);
-		if (ret)
-			return ret;
 	}
 
-	return 0;
+	return true;
 }
 
 static int dpu_plane_atomic_check(struct drm_plane *plane,
@@ -995,16 +1012,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
 	const struct drm_crtc_state *crtc_state = NULL;
+	uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
-	if (pdpu->pipe != SSPP_NONE) {
-		pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-		r_pipe->sspp = NULL;
-	}
+	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
 
 	if (!pipe->sspp)
 		return -EINVAL;
@@ -1016,10 +1033,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->visible)
 		return 0;
 
-	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+					      pipe->sspp,
+					      msm_framebuffer_format(new_plane_state->fb),
+					      max_linewidth)) {
+		DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RECT_FMT
+				" max_line:%u, can't use split source\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect),
+				DRM_RECT_ARG(&r_pipe_cfg->src_rect),
+				max_linewidth);
+		return -E2BIG;
+	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
 }
@@ -1054,8 +1078,16 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		return 0;
 	}
 
-	/* force resource reallocation if the format of FB has changed */
+	/*
+	 * Force resource reallocation if the format of FB or src/dst have
+	 * changed. We might need to allocate different SSPP or SSPPs for this
+	 * plane than the one used previously.
+	 */
 	if (!old_plane_state || !old_plane_state->fb ||
+	    old_plane_state->src_w != plane_state->src_w ||
+	    old_plane_state->src_h != plane_state->src_h ||
+	    old_plane_state->src_w != plane_state->src_w ||
+	    old_plane_state->crtc_h != plane_state->crtc_h ||
 	    msm_framebuffer_format(old_plane_state->fb) !=
 	    msm_framebuffer_format(plane_state->fb))
 		crtc_state->planes_changed = true;
@@ -1075,6 +1107,8 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate;
 	struct dpu_sw_pipe *pipe;
 	struct dpu_sw_pipe *r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	const struct msm_format *fmt;
 
 	if (plane_state->crtc)
@@ -1084,6 +1118,8 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	pstate = to_dpu_plane_state(plane_state);
 	pipe = &pstate->pipe;
 	r_pipe = &pstate->r_pipe;
+	pipe_cfg = &pstate->pipe_cfg;
+	r_pipe_cfg = &pstate->r_pipe_cfg;
 
 	pipe->sspp = NULL;
 	r_pipe->sspp = NULL;
@@ -1102,6 +1138,22 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	if (!pipe->sspp)
 		return -ENODEV;
 
+	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+					      pipe->sspp,
+					      msm_framebuffer_format(plane_state->fb),
+					      dpu_kms->catalog->caps->max_linewidth)) {
+		/* multirect is not possible, use two SSPP blocks */
+		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+		if (!r_pipe->sspp)
+			return -ENODEV;
+
+		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	}
+
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
 }
 

-- 
2.39.5


