Return-Path: <linux-arm-msm+bounces-29979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 995739641BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D132AB278AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1260B1B3759;
	Thu, 29 Aug 2024 10:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ixkt08Vs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D09197A6B
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926884; cv=none; b=jrIjrsbLWKTAxeifRrXoxvwiLBS+UR9/GBiW6Jhpwtt+hcotgvTJzUTAstJ0QpDsFujy4X53GxuWEakXPfSjl47YaYMy36la4MU/r1KWEH23ugzPdI620Z2FyX/5cAfL+viSPV0NaD03VbE2Q7KLai2Iv4zyMHEm9oyR0TVp9kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926884; c=relaxed/simple;
	bh=soj6PrVXT/xCUVwdiUUUMK0OTfrgaoP64MOuikj4L9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jGYl8IzKyB+nHUxvGCYAu7NTlx+qhjVf2dbnrZ2NwtbQktobIkvvtVndZUEIERKS30cfbV2PoKl9Ew/nW+sZl2JL5IK+nhu2/tBxIgNZ+aahzJBWZfpw6yKeIdvCxioPGnlWUIfVnyFwnwJlVApz7r5/tFR6tODbOJ61t4Zg88o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ixkt08Vs; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-39d4161c398so1479915ab.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926882; x=1725531682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TuzTTnjlGvCSyzM33NKhNHvWlu8NZzgY6f6ECH0+Rc=;
        b=Ixkt08Vs05x1r+7SITNsyoOFAM3XaiEayb4QgD3fJEHPCMlD6zBdTjNgEeZofA4cYb
         7tFey5pvOUgzGifA4lxUg7CCfmN/fonCteQpoD/bJbMD+CudNZQcxCi5bFSqSn4UNNHz
         O7gt/uWODsGTrz3wwLNTZd1RE39gN6BY8MQr503rcaIqlUdVo35sTjJz72rg4naSLnwj
         qIbYb8XHxoWttg70EWiQbh1KsESmwMo98qAGcz7Mv8JpzyeFuKeGm9qXXVhagSHSq77v
         xgJ5EZR8DenIUeSxP3hzL2Xy9tvhaAAfdtzutY1jxJJvr5dJOhe0UWwsjSePKOkViuNJ
         zt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926882; x=1725531682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TuzTTnjlGvCSyzM33NKhNHvWlu8NZzgY6f6ECH0+Rc=;
        b=G20Y+urqvc53TlUrx+DZXe2mnyhJ2bCihWLCpk8RUAg/WLy4gt29Xq6SI4Fwa0SRih
         +ssra0s8mGWoRAkrzrdQIm9dnDYeFI1BcEvNOYUwqvMeY955u0sZAXYgRuLpHFvJIen9
         aMMM0s+woYE0QPk8m1htVh8oStBMSB1VcKgPJTF1SuE/PyVG7guABcs69IBOxjjzB4VY
         AZP+lh1av7fLWDlw75799DukCQqqDSiwqYVTnTPmLt6YqD8QzhwdzwWLd7DZ/s0LJXat
         1mHl4pwPNMoXQ5VlY7dQPCFA7Cj1HJkdS191VJ7SiTY/+DlVa5cuVhEMeZ1/wekFcdqq
         yi7A==
X-Gm-Message-State: AOJu0YxTgglbFLxn8fogTpVCPYGGiPeDnBBoaUXAMkItcuE6MVOs0eWT
	34Emam43KBbL9Nuzecr+eTvrSOEPsA2mNDyxCrMSBzoisLWiSy9RWrgyo/Ee7hgB1sptx+qzcS3
	iZIdT/w==
X-Google-Smtp-Source: AGHT+IHbVA0l+bX4JgXKuASc3OPCYhauqftt6K8Nr65uhYlEQYmVnADnoCU0mTUGLIgVyC3FpdBLfA==
X-Received: by 2002:a05:6e02:52a:b0:39b:640e:c5e6 with SMTP id e9e14a558f8ab-39f37983ff7mr21822505ab.17.1724926882300;
        Thu, 29 Aug 2024 03:21:22 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 03:21:21 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:45 +0800
Subject: [PATCH 16/21] drm/msm/dpu: support SSPP assignment for quad-pipe
 case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-16-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=4022;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=soj6PrVXT/xCUVwdiUUUMK0OTfrgaoP64MOuikj4L9c=;
 b=KPu/3YF8ZFbVS+RlbMDouNax60UXe9S/ZE+/72QOcOcl41DYXZyq3aJHCdKzR5U2a3JGsuALS
 1HRk4X+9u9oBjgzC1oS0mox54LeBYnMgRsEHQ+1zkwH6/vztr/eXti3
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Support SSPP assignment for quad-pipe case with unified method

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 58 +++++++++++++------------------
 1 file changed, 25 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 95cb2575c63b4..c38c1bedd40fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1143,25 +1143,18 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
 	struct dpu_plane_state *pstate;
-	struct dpu_sw_pipe *pipe;
-	struct dpu_sw_pipe *r_pipe;
-	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct msm_format *fmt;
 	uint32_t max_linewidth;
+	u32 i;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   plane_state->crtc);
 
 	pstate = to_dpu_plane_state(plane_state);
-	pipe = &pstate->pipe;
-	r_pipe = &pstate->r_pipe;
-	pipe_cfg = &pstate->pipe_cfg;
-	r_pipe_cfg = &pstate->r_pipe_cfg;
-
-	pipe->sspp = NULL;
-	r_pipe->sspp = NULL;
+	for (i = 0; i < PIPES_PER_STAGE; i++)
+		pstate->pipe[i].sspp = NULL;
 
 	if (!plane_state->fb)
 		return -EINVAL;
@@ -1175,41 +1168,40 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
+	for (i = 0; i < PIPES_PER_STAGE; i++) {
+		struct dpu_sw_pipe *r_pipe = &pstate->pipe[i + 1];
+		struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[i + 1];
+		struct dpu_sw_pipe *pipe = &pstate->pipe[i];
+		struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[i];
 
-	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		if (!pipe_cfg->visible)
+			break;
 
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+		if (!pipe->sspp)
+			return -ENODEV;
 
-		r_pipe->sspp = NULL;
-	} else {
-		if (dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) &&
-		    dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) &&
+		if (r_pipe_cfg->visible &&
+		    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
+		    dpu_plane_is_multirect_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
+		    dpu_plane_is_multirect_parallel_capable(r_pipe_cfg, fmt, max_linewidth) &&
+		    pipe_cfg->mxcfg_id == r_pipe_cfg->mxcfg_id &&
 		    (test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
 		     test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features))) {
-			r_pipe->sspp = pipe->sspp;
-
 			pipe->multirect_index = DPU_SSPP_RECT_0;
 			pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
 
+			DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d and set pipe %d as multi-rect\n",
+					pipe->sspp->idx, i, i+1);
+			r_pipe->sspp = pipe->sspp;
 			r_pipe->multirect_index = DPU_SSPP_RECT_1;
 			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
+			i++;
 		} else {
-			/* multirect is not possible, use two SSPP blocks */
-			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-			if (!r_pipe->sspp)
-				return -ENODEV;
-
 			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
 			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
+					pipe->sspp->idx, i);
 		}
 	}
 

-- 
2.34.1


