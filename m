Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2193779F9CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Sep 2023 07:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233796AbjINFHW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 01:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234443AbjINFHU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 01:07:20 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5292D98
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 22:07:16 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so7948821fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 22:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694668034; x=1695272834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IiDL4z/liEdRe/srn6ADV3MIw22YyJwnXNsV+3eewQ=;
        b=pfyy1YgfOYvhbnsBjWJnq8Bxg98Vc/eeaW0sxCsQgYBc+y/xZl44aqb6s0J6JOSmNw
         S8I3kPA0O7rYYdoL9slHsV7JF5ICjS3aTU1eFIwuNnXk6jZoP6foQzZ0vS387OqsaxX4
         DuQd4TkyFtauLzafV/OmliCi3c45SX0KbSuXQ3KX4yUwjzcAt0HXtLOMgLQgZBYcr6v6
         V1b1cdQSJyIFprQifXBvTohqAQMWyhn+E3bJ0qqi4UJ+gu1obS0Qw+4rLvixBcU7r3h8
         w9Ay5is1FabFy1VckGZWHkByjwgbCuE5ZKRbQ2T+AbBng/Z2NquLfWz1pFQ7qPvAvs94
         d0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694668034; x=1695272834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IiDL4z/liEdRe/srn6ADV3MIw22YyJwnXNsV+3eewQ=;
        b=HJp5juf3CRiSrLGpK3tE4iLQACpRArzE3j+suMiIzQZN50Yst7OI4laJHc/YrMXF/g
         fmia6dcXzX2SdTAvQO/KoYJbXfhb9k01jW3wQ5FZJCGxmrRssrhNoFDkesfWuqtAKyx5
         3Sr/tFpBE5fMkemTw0+qYKY96obpmJ5uA/kHOUEC8V3XXQpFS6uPBb68+vgCYiaQNYzc
         PPRRqz1GRoEj9XcMhPAqIS6RsCzKy9xaBpHozwygGbsutO37jH4FqafvY5i3qw6vaw++
         LtFBkgGEO143zcHqhzri2DuM7d1vkq9oIx3FPDlqrzUTXyse7SYqTqp8stKnug+Cmhsv
         nb5Q==
X-Gm-Message-State: AOJu0YwNwjxA1rJ/uoHTDSyTWXMpC3ZvTXfK3V0oYjETp02zi2k7hYEx
        7dSqPed1UNF+XcGPbuyYqiBIpg==
X-Google-Smtp-Source: AGHT+IH1Pa4/NrG1Nn9ALzyzjc8STvJ6t234H4XAOWc3te6SBIR3DNAzp1XAG2lej49NmvFWejadRw==
X-Received: by 2002:a2e:86d1:0:b0:2b6:df71:cff1 with SMTP id n17-20020a2e86d1000000b002b6df71cff1mr3762294ljj.52.1694668034445;
        Wed, 13 Sep 2023 22:07:14 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 22:07:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 09/12] drm/msm/dpu: allow sharing SSPP between planes
Date:   Thu, 14 Sep 2023 08:07:03 +0300
Message-Id: <20230914050706.1058620-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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
index 9ffbcd91661a..61afd1cf033d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -867,10 +867,9 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
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
@@ -882,6 +881,13 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
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
@@ -889,6 +895,82 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
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
 					struct drm_atomic_state *state)
 {
@@ -1071,12 +1153,13 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 					      struct dpu_global_state *global_state,
 					      struct drm_atomic_state *state,
-					      struct drm_plane_state *plane_state)
+					      struct drm_plane_state *plane_state,
+					      struct drm_plane_state *prev_plane_state)
 {
 	struct drm_plane *plane = plane_state->plane;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
-	struct dpu_plane_state *pstate;
+	struct dpu_plane_state *pstate, *prev_pstate;
 	struct dpu_sw_pipe *pipe;
 	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
@@ -1085,6 +1168,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	uint32_t max_linewidth;
 
 	pstate = to_dpu_plane_state(plane_state);
+	prev_pstate = prev_plane_state ? to_dpu_plane_state(prev_plane_state) : NULL;
 	pipe = &pstate->pipe;
 	r_pipe = &pstate->r_pipe;
 	pipe_cfg = &pstate->pipe_cfg;
@@ -1105,19 +1189,27 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
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
@@ -1154,6 +1246,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 {
 	unsigned int i;
 	int ret;
+	struct drm_plane_state *prev_plane_state = NULL;
 
 	for (i = 0; i < num_planes; i++) {
 		struct drm_plane_state *plane_state = states[i];
@@ -1163,9 +1256,12 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
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

