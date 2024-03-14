Return-Path: <linux-arm-msm+bounces-14059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C2887B5A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC9D4B22D61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACCA46A0;
	Thu, 14 Mar 2024 00:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yloCWQay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA552C9E
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374550; cv=none; b=AkzZ1BbgzCEmcNBtiLk5VWnLOc9LYDP+rzkJHFJceGJMbzIoTv5LBfM6lM3ZNaD5cSEHsiJDK6bqlzNAkkIn6ZjmVWU3dTHJxbDs/7EDV/oqsIzJ25iGVEG9VoS0vAeeWGcvhBg80+kgVo+SgINUk3ra7W5QTpBdZyJQCddSE3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374550; c=relaxed/simple;
	bh=z3LLg/VK4BmRUmO+6IS3pr7tlicD+N6PzqCBonXL4rw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R8mAsVbe06QKFbCvCwGxJXJSVajzmZhCiYovLqPOg59S1pa0MzEB974D/Rk52nsMoAm0T6NomItF1ju76XJHmxQ3pEzIuIVRDu/+AZMeRfn3bCVRnhBH7Q4xjUrMUpVay5JPnYasCb5pNoP/ZzKJPj/dCEirs1UOH1HHRh7H21s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yloCWQay; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-513382f40e9so485602e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 17:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710374547; x=1710979347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkVn674vUD7EPt+lgPohg2m9UJkSbMPId/q0P1tsdBY=;
        b=yloCWQayQ6smHcIIHbUbh+LRBnTDiMHU7qTMCtKQz/AGdqEidPcwRtNbLAm8JiCAKG
         AG8ik1+vbJFdaY5X0cTouaxwP7bbF9r8hvDSImjJIMmh1TPToAkUwSGjZ93HN5ZVX5JJ
         //Qq9UNwGvG2CtsCdTIuGPnTs2T8w77Io8B2Hgex5wLjsk/hRCkuUQroltFnTtuPThTB
         6h1vHiOC/6y3g3xGxP7h3gdLi/g6Gtb5UJOUrGP1LKn809oOZBm6nWRWqvOFSq+HAWWB
         SaqqdbF2ONh1jTpzHJTx5YdngAyG1fhLpIzK1HJ6IQSq5lIWrmLAtAiZFQtcrO0qt2dx
         duuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710374547; x=1710979347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkVn674vUD7EPt+lgPohg2m9UJkSbMPId/q0P1tsdBY=;
        b=DGqfNbBUji4vS3FEvzvuhIbmhRcD9Wc6PUhgmIRxPVl7v1X7kmNkv6l/Km/pTfSxsO
         OaUBUlsaHeAzZX7QBhhfDH2SmUEpY7s0eKx7X3RexGjWACGaorvxNWYWyVZgjfdC3fzd
         vMsVtRaKZ6KaYLzkwkJjUp/ULmNUwEs6cvnlmqA7/z6AwyukWI+XVkFGt9Ah6L7e2w11
         831YJbwwRZdlhlPAwZ2swtNRK7CIn8+MRNthNU7yiGiFVoocbjfS1PKh27OaKYeh0lJO
         /WjZs6dfObWD4nh84XalODE+RwaP3ylsm3407bb6fxL8TQo6BMcS4RP4NtPeJvM0kSaB
         Tcdg==
X-Forwarded-Encrypted: i=1; AJvYcCXjU29wRPZskQPaqOU/w4pCIqrH7ERqgIAGhJDgtUzQpyLS9oAOoK+LwvULHWH0tyPy+sGEwGfpzI87T3XKzalxxM9t8xiaqaC3tqS/ww==
X-Gm-Message-State: AOJu0YxiCa8GZ9tpCmT6Ki48gEKowfpBODBxU3p95IjmKf3ZGPhFc/7B
	7U4Yc0rUfGdpr42Kb6fQ5MXgoLdyLk19WA3l6PnZIRyPaSZq1CaB00w8YC1fEpg=
X-Google-Smtp-Source: AGHT+IGjyhST2MEHmYm8qVlyj0FWIeE/08ge6huKoEyo0olLDE/jvx+pxdZ6fNV30wgDZS8F53SIJQ==
X-Received: by 2002:a05:6512:3095:b0:513:c174:c3f6 with SMTP id z21-20020a056512309500b00513c174c3f6mr41441lfd.40.1710374546958;
        Wed, 13 Mar 2024 17:02:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 17:02:26 -0700 (PDT)
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
Subject: [PATCH v4 10/13] drm/msm/dpu: allow sharing SSPP between planes
Date: Thu, 14 Mar 2024 02:02:13 +0200
Message-Id: <20240314000216.392549-11-dmitry.baryshkov@linaro.org>
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

Since SmartDMA planes provide two rectangles, it is possible to use them
to drive two different DRM planes, first plane getting the rect_0,
another one using rect_1 of the same SSPP. The sharing algorithm is
pretty simple, it requires that each of the planes can be driven by the
single rectangle and only consequetive planes are considered.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 128 +++++++++++++++++++---
 1 file changed, 112 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index cde20c1fa90d..2e1c544efc4a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -886,10 +886,9 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
 	return 0;
 }
 
-static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
-						   struct dpu_sw_pipe_cfg *pipe_cfg,
-						   const struct dpu_format *fmt,
-						   uint32_t max_linewidth)
+static int dpu_plane_is_multirect_capable(struct dpu_sw_pipe *pipe,
+					  struct dpu_sw_pipe_cfg *pipe_cfg,
+					  const struct dpu_format *fmt)
 {
 	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
 	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
@@ -901,6 +900,13 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
 	if (DPU_FORMAT_IS_YUV(fmt))
 		return false;
 
+	return true;
+}
+
+static int dpu_plane_is_parallel_capable(struct dpu_sw_pipe_cfg *pipe_cfg,
+					 const struct dpu_format *fmt,
+					 uint32_t max_linewidth)
+{
 	if (DPU_FORMAT_IS_UBWC(fmt) &&
 	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
 		return false;
@@ -908,6 +914,82 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
 	return true;
 }
 
+static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
+						   struct dpu_sw_pipe_cfg *pipe_cfg,
+						   const struct dpu_format *fmt,
+						   uint32_t max_linewidth)
+{
+	return dpu_plane_is_multirect_capable(pipe, pipe_cfg, fmt) &&
+		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
+}
+
+
+static int dpu_plane_try_multirect(struct dpu_plane_state *pstate,
+				   struct dpu_plane_state *prev_pstate,
+				   const struct dpu_format *fmt,
+				   uint32_t max_linewidth)
+{
+	struct dpu_sw_pipe *pipe = &pstate->pipe;
+	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct dpu_sw_pipe *prev_pipe = &prev_pstate->pipe;
+	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_pstate->pipe_cfg;
+	const struct dpu_format *prev_fmt =
+		to_dpu_format(msm_framebuffer_format(prev_pstate->base.fb));
+	u16 max_tile_height = 1;
+
+	if (prev_pstate->r_pipe.sspp != NULL ||
+	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
+		return false;
+
+	if (!dpu_plane_is_multirect_capable(pipe, pipe_cfg, fmt) ||
+	    !dpu_plane_is_multirect_capable(prev_pipe, prev_pipe_cfg, prev_fmt) ||
+	    !(test_bit(DPU_SSPP_SMART_DMA_V1, &prev_pipe->sspp->cap->features) ||
+	      test_bit(DPU_SSPP_SMART_DMA_V2, &prev_pipe->sspp->cap->features)))
+		return false;
+
+	if (DPU_FORMAT_IS_UBWC(fmt))
+		max_tile_height = max(max_tile_height, fmt->tile_height);
+
+	if (DPU_FORMAT_IS_UBWC(prev_fmt))
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
 static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
 					struct drm_atomic_state *state,
 					const struct drm_crtc_state *crtc_state)
@@ -1098,13 +1180,14 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 					      struct dpu_global_state *global_state,
 					      struct drm_atomic_state *state,
-					      struct drm_plane_state *plane_state)
+					      struct drm_plane_state *plane_state,
+					      struct drm_plane_state *prev_plane_state)
 {
 	const struct drm_crtc_state *crtc_state = NULL;
 	struct drm_plane *plane = plane_state->plane;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
-	struct dpu_plane_state *pstate;
+	struct dpu_plane_state *pstate, *prev_pstate;
 	struct dpu_sw_pipe *pipe;
 	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
@@ -1117,6 +1200,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 							   plane_state->crtc);
 
 	pstate = to_dpu_plane_state(plane_state);
+	prev_pstate = prev_plane_state ? to_dpu_plane_state(prev_plane_state) : NULL;
 	pipe = &pstate->pipe;
 	r_pipe = &pstate->r_pipe;
 	pipe_cfg = &pstate->pipe_cfg;
@@ -1137,19 +1221,27 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
-
 	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		if (!prev_pstate ||
+		    !dpu_plane_try_multirect(pstate, prev_pstate, fmt, max_linewidth)) {
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
 
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			r_pipe->sspp = NULL;
+
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+
+			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		}
 
-		r_pipe->sspp = NULL;
 	} else {
+		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+		if (!pipe->sspp)
+			return -ENODEV;
+
 		if (dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) &&
 		    dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) &&
 		    (test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
@@ -1186,6 +1278,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 {
 	unsigned int i;
 	int ret;
+	struct drm_plane_state *prev_plane_state = NULL;
 
 	for (i = 0; i < num_planes; i++) {
 		struct drm_plane_state *plane_state = states[i];
@@ -1195,9 +1288,12 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			continue;
 
 		ret = dpu_plane_virtual_assign_resources(crtc, global_state,
-							 state, plane_state);
+							 state, plane_state,
+							 prev_plane_state);
 		if (ret)
 			break;
+
+		prev_plane_state = plane_state;
 	}
 
 	return ret;
-- 
2.39.2


