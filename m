Return-Path: <linux-arm-msm+bounces-49593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75371A47311
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 03:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0581B168298
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 02:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069AC270033;
	Thu, 27 Feb 2025 02:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GYKMU42J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B753713A3F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 02:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740623517; cv=none; b=nykG16KBdGJwALZivUCw+WU5ivMzbFxzflnuBA0SFFiAqLxGhyVsyV1N4gtSrectHcd9ZUcfHFq4+o/B7INy0UWZbYhjo1k4bunFYx1kDICEAg0ir7oVf98iJNQ6jkMRgFmtYxI8JAY9UJYrjTg9IH/85uW3cFafWeJU08wJ170=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740623517; c=relaxed/simple;
	bh=luHG1Y5KsNSo/DhWFzwtutrMted5f6Dk0kFRk2t85Ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H2LulxXz7/p4/nTu+g9X1SWyuWZztRWT0uh1a2wQq45QgK72nfnYCuDtqyxZCOFWTqdd9Ml8L5U8YnqVUr/SboVzr7oG/wWtS6T0c/trgoJ5IQYfo61njgwzRVDxoc4BK9Dnug2gZwg/axz2xRlsnKPgtt5V6wl/SKo3DrfY4xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GYKMU42J; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-548878c6a5aso427040e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 18:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740623513; x=1741228313; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pe28A92x1GiXAYhXNOQnMWm/JVmD+9I9ysLZzus4GUg=;
        b=GYKMU42JmnyIzyz5K2yChRbPSqvpSGSbRE2QU6TPpi86PVYnqoP6Wqx+Clam0CexT8
         jVteud+imQSNqLykTa9hc+LOcNiUe+ZdzpRbdxUn6L2RCGMDU3w8u3kRX9/4xvGXN5ZX
         lGZU0zZFXxZX28BZLVHN9a8B1cYwVlhnOS4HSjvgeBCHBw1PlNwHDPyG8MHPNvvwCF6S
         rgyHcn10I/d3Q0Wg3UoZ5d1UWdS31RY2LEVjfnu850hCBBTt8YdTxVLwlRWvp3vpMwRX
         sMULrSPqBRigVaDt0EFKqgmSKrY/IPLDPbdl0rjyWLq9WT1kqfIAqbR41EhN5HyWjXSC
         jTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740623513; x=1741228313;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pe28A92x1GiXAYhXNOQnMWm/JVmD+9I9ysLZzus4GUg=;
        b=Cxr+oK4fRci2TnG+xlYyi0/0u8vTqOGXTNZ7pgbLhsiVxHDFzUZuNsEElq4YQFb9e5
         lP9abSOkBKVwQL2WcQE63sYKkTIiWBWxWWImdLS82dDmwhK15PJ4UM0kEGpmR4P4CXrP
         h53OHPriJbbIxDbv/h7HAYV9Xg1nFhDQG5IdfF4oowkVsBbUngXmiPjpbIZYlwwplGUm
         CNgQNs/luqTyGfoO4qjfjCYIwN+b9LaygOCYKcbxoQX7ip5aHXTp/udnQBUVZRiSbQA3
         hillkvvzqc/x+bV9V/YU+t8+IYqJyRi0p/jIe/NKSyBxpwN49Gprx6/CPIhvdIADQyvP
         2hxw==
X-Gm-Message-State: AOJu0Yx1eihT/toIRoSVxxTJWAW6ZGh5p0Fl0+KfHkKQGOg9+hfFwjBB
	30uTu5yn7II54/3WYthtMUNJJOHzxNb6LeE641aZ9zQeng0C/Hw0PTZGdt+/0h8ZtFwL05VkHni
	qWzqRGg==
X-Gm-Gg: ASbGnctxaYrdVDiRubKpfNTCzKTkYHwZitRcqrLBP/ul6eMkKtScv14L1hCGGejfA3r
	L/D4DQShaL9i3vYL6XBN9yFDm9l/qbyZcn6gtB2ZG8syZrUnXgXeScWcTYo4Ip02v5vbiiaRChL
	8+IBLaCGsLgk930q//yMkXU8QzpF4xct7IItUY4B21i2w2giqW6FVoZCgEENcuDG+HPpmuAnJBz
	vw+5Us26T+jf0hKAmVdEaF3BR+qKz3wZeY/wZbYq5G2I/e/ct7Cn+pnMpnl+yNNs457Zj3NsqpY
	wXBvTcVPCFl3FdJlwCoA1CYRZceXBEdTjQ==
X-Google-Smtp-Source: AGHT+IGsG9tTMBoFX+p4C5ZcgIDjAg5knIHTqwpKvZsGh7bP+qxxtuuQn/PArlbHj3skC9/mmGbWww==
X-Received: by 2002:a05:6512:3b2b:b0:545:a1a:5576 with SMTP id 2adb3069b0e04-5483914012cmr11505631e87.22.1740623513446;
        Wed, 26 Feb 2025 18:31:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443be377sm49269e87.167.2025.02.26.18.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 18:31:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Feb 2025 04:31:49 +0200
Subject: [PATCH v6] drm/msm/dpu: allow sharing SSPP between planes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-dpu-share-sspp-v6-1-4d469910f399@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJTOv2cC/3XMQQrCQAyF4auUrI04oxOrK+8hXQxt2gakMyRal
 NK7O3bv8n/wvgWMVdjgWi2gPItJmkrQroJ2jNPAKF1p8Ad/ct4F7PILbYzKaJYznkMMRMytqwO
 UU1bu5b2B96b0KPZM+tn8OfzWv9Qc0CFR6DyRq4/95faQKWraJx2gWdf1C20uMr+tAAAA
X-Change-ID: 20241215-dpu-share-sspp-75a566eec185
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10508;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=luHG1Y5KsNSo/DhWFzwtutrMted5f6Dk0kFRk2t85Ng=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnv86W44TO3Fj2x1ye0TDqmCpBPagsJ4F3ft1JR
 M/feYMd/SKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7/OlgAKCRCLPIo+Aiko
 1ZTxB/9s+6yAAjS+vBIq/IS7czbaoyjphlANfKv5w/YKkG+fIrAk/OL+eqNN1gI5AHMZEwOmSyE
 p/DFI9mKilYWMkWlPrW9RLEzUoNZGu3taB3ldKhhw8ZWhYcpQb+6pYYEPqHpsDQFUR2TOlimoBc
 g+ZHeV82UGtHCAzSjSvVVesQo59vejgFTXXdu6OB+FjqJ3dyfDp3NMkWrF5Vw+6idkFlQ8UY4us
 bGr3kamsz7KljeTtmCFQMCdrZA7s/4HE8B7WrxQNavmtLJNMNFTuF3Xgt3X441E95COMGYcxKtl
 V5oqG5sSYwwEicrNtqhc6EyYPEpK7ZYz6O3bvTZi1oWfzK3L
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Since SmartDMA planes provide two rectangles, it is possible to use them
to drive two different DRM planes, first plane getting the rect_0,
another one using rect_1 of the same SSPP. The sharing algorithm is
pretty simple, it requires that each of the planes can be driven by the
single rectangle and only consecutive planes are considered.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
This patch has been deferred from v4 of virtual wide patchset to
simplify the merging path. Now as the wide planes have been merged, pick
up the patch that allows sharing of the SSPPs between two planes.
---
Changes in v6:
- Fixed typo (consecutive) in the commit message (Abhinav)
- Renamed prev_plane_state to prev_adjancent_plane_state (Abhinav)
- Renamed prev_pstate to prev_adjancent_pstate as a followup to the
  previous change
- Link to v5: https://lore.kernel.org/r/20241215-dpu-share-sspp-v5-1-665d266183f9@linaro.org

Changes in v5:
- Rebased on top of the current msm-next-lumag
- Renamed dpu_plane_try_multirect() to dpu_plane_try_multirect_shared()
  (Abhinav)
- Link to v4: https://lore.kernel.org/dri-devel/20240314000216.392549-11-dmitry.baryshkov@linaro.org/
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 156 +++++++++++++++++++++++++-----
 1 file changed, 130 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index af3e541f60c303eb5212524e877129359b5ca98c..11c4d5dfd9703b27b7ffde34e9b4f92ec956c3c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -887,10 +887,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 	return 0;
 }
 
-static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
-						   struct dpu_sw_pipe_cfg *pipe_cfg,
-						   const struct msm_format *fmt,
-						   uint32_t max_linewidth)
+static int dpu_plane_is_multirect_capable(struct dpu_hw_sspp *sspp,
+					  struct dpu_sw_pipe_cfg *pipe_cfg,
+					  const struct msm_format *fmt)
 {
 	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
 	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
@@ -902,10 +901,6 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
 	if (MSM_FORMAT_IS_YUV(fmt))
 		return false;
 
-	if (MSM_FORMAT_IS_UBWC(fmt) &&
-	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
-		return false;
-
 	if (!test_bit(DPU_SSPP_SMART_DMA_V1, &sspp->cap->features) &&
 	    !test_bit(DPU_SSPP_SMART_DMA_V2, &sspp->cap->features))
 		return false;
@@ -913,6 +908,27 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
 	return true;
 }
 
+static int dpu_plane_is_parallel_capable(struct dpu_sw_pipe_cfg *pipe_cfg,
+					 const struct msm_format *fmt,
+					 uint32_t max_linewidth)
+{
+	if (MSM_FORMAT_IS_UBWC(fmt) &&
+	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
+		return false;
+
+	return true;
+}
+
+static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
+						   struct dpu_sw_pipe_cfg *pipe_cfg,
+						   const struct msm_format *fmt,
+						   uint32_t max_linewidth)
+{
+	return dpu_plane_is_multirect_capable(sspp, pipe_cfg, fmt) &&
+		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
+}
+
+
 static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 				       struct drm_atomic_state *state,
 				       const struct drm_crtc_state *crtc_state)
@@ -1001,6 +1017,69 @@ static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dp
 	return true;
 }
 
+static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
+					  struct dpu_plane_state *prev_adjancent_pstate,
+					  const struct msm_format *fmt,
+					  uint32_t max_linewidth)
+{
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe *prev_pipe = &prev_adjancent_pstate->pipe;
+	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjancent_pstate->pipe_cfg;
+	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjancent_pstate->base.fb);
+	u16 max_tile_height = 1;
+
+	if (prev_adjancent_pstate->r_pipe.sspp != NULL ||
+	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
+		return false;
+
+	if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
+	    !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt))
+		return false;
+
+	if (MSM_FORMAT_IS_UBWC(fmt))
+		max_tile_height = max(max_tile_height, fmt->tile_height);
+
+	if (MSM_FORMAT_IS_UBWC(prev_fmt))
+		max_tile_height = max(max_tile_height, prev_fmt->tile_height);
+
+	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+	r_pipe->sspp = NULL;
+
+	if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
+	    dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
+	    (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
+	     prev_pipe_cfg->dst_rect.x1 >= pipe_cfg->dst_rect.x2)) {
+		pipe->sspp = prev_pipe->sspp;
+
+		pipe->multirect_index = DPU_SSPP_RECT_1;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
+		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+
+		return true;
+	}
+
+	if (pipe_cfg->dst_rect.y1 >= prev_pipe_cfg->dst_rect.y2 + 2 * max_tile_height ||
+	    prev_pipe_cfg->dst_rect.y1 >= pipe_cfg->dst_rect.y2 + 2 * max_tile_height) {
+		pipe->sspp = prev_pipe->sspp;
+
+		pipe->multirect_index = DPU_SSPP_RECT_1;
+		pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
+
+		prev_pipe->multirect_index = DPU_SSPP_RECT_0;
+		prev_pipe->multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
+
+		return true;
+	}
+
+	return false;
+}
+
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
@@ -1098,13 +1177,14 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 					      struct dpu_global_state *global_state,
 					      struct drm_atomic_state *state,
-					      struct drm_plane_state *plane_state)
+					      struct drm_plane_state *plane_state,
+					      struct drm_plane_state *prev_adjancent_plane_state)
 {
 	const struct drm_crtc_state *crtc_state = NULL;
 	struct drm_plane *plane = plane_state->plane;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
-	struct dpu_plane_state *pstate;
+	struct dpu_plane_state *pstate, *prev_adjancent_pstate;
 	struct dpu_sw_pipe *pipe;
 	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
@@ -1116,6 +1196,8 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 							   plane_state->crtc);
 
 	pstate = to_dpu_plane_state(plane_state);
+	prev_adjancent_pstate = prev_adjancent_plane_state ?
+		to_dpu_plane_state(prev_adjancent_plane_state) : NULL;
 	pipe = &pstate->pipe;
 	r_pipe = &pstate->r_pipe;
 	pipe_cfg = &pstate->pipe_cfg;
@@ -1134,24 +1216,42 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
+	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
+		if (!prev_adjancent_pstate ||
+		    !dpu_plane_try_multirect_shared(pstate, prev_adjancent_pstate, fmt,
+						    dpu_kms->catalog->caps->max_linewidth)) {
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
 
-	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-					      pipe->sspp,
-					      msm_framebuffer_format(plane_state->fb),
-					      dpu_kms->catalog->caps->max_linewidth)) {
-		/* multirect is not possible, use two SSPP blocks */
-		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!r_pipe->sspp)
+			r_pipe->sspp = NULL;
+
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		}
+	} else {
+		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+		if (!pipe->sspp)
 			return -ENODEV;
 
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+						      pipe->sspp,
+						      msm_framebuffer_format(plane_state->fb),
+						      dpu_kms->catalog->caps->max_linewidth)) {
+			/* multirect is not possible, use two SSPP blocks */
+			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!r_pipe->sspp)
+				return -ENODEV;
 
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		}
 	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
@@ -1164,6 +1264,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			       unsigned int num_planes)
 {
 	unsigned int i;
+	struct drm_plane_state *prev_adjancent_plane_state = NULL;
 
 	for (i = 0; i < num_planes; i++) {
 		struct drm_plane_state *plane_state = states[i];
@@ -1173,9 +1274,12 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			continue;
 
 		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
-							 state, plane_state);
+							     state, plane_state,
+							     prev_adjancent_plane_state);
 		if (ret)
-			return ret;
+			break;
+
+		prev_adjancent_plane_state = plane_state;
 	}
 
 	return 0;

---
base-commit: 89839e69f6154feecd79bd01171375225b0296e9
change-id: 20241215-dpu-share-sspp-75a566eec185

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


