Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9DD4AF836
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234876AbiBIRZx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbiBIRZm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:42 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB0EC05CB86
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:45 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id t14so4416990ljh.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PEqJegOZve/rFBiuAFRH78CRQiT81dVXTl201sF0/D8=;
        b=oeyySZ3tbCoJUKu+CAHAtBFBl9K5o0b69JJRTR+vclxoImhV5x7xNy4/21Rg35bKnv
         8JyJsU0Z5yATQN2aWS3nYLP6MAk76U1LXvhYo4Ylrlt1siy8NLl0HkDNcm46uyMHm+As
         W/6V9s6xO+J0fItVjJDgflOgIYmUy+RJE14hOLf4TR29qqhZ+8yEO/UAyucx8MkaGWi3
         dBM6z3Z64pRrEaP7cZaa25BNY2Fss8WWeGiWxGKIfmtpX7+mwTJXRupaLHdYTQWf2AGR
         ODi1S1Un8v2OyeW3YUhojqOhlPaofKKv7JSKWjK1KRl3jjRilTU1i1drRngn9hSBq/bm
         Y0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PEqJegOZve/rFBiuAFRH78CRQiT81dVXTl201sF0/D8=;
        b=zj7j6jG3flil9axTmHWbe/Kyea4iP5PRCVjh4CbE7Y0DvFcF+DSX9UTHOGGVDQBT1J
         HubUlBome5J4bdFc0h0nUhUMYZCh/dlSnrL8tTScWczyG4P8MiS9pd09wXNhUdZWkzSB
         qB56mghuaLfguN/fKWWGdIFZc/IGdMp5AvuxvMQXBUDAQmyGaZhj6x0QaRssb/cq2HAh
         amT5RXed+MJznGHR/2/pLHmnn84H4wKLv6kcVgzykkX06SgA03Q/hFa+vPJsvqAhcWJw
         bfOD0iaKLk4TKs77z3dOvBPhSzbceIHNVg2IDOT0VjSjeOHCifpofh5u+L2rsmwqUil6
         QWHg==
X-Gm-Message-State: AOAM533TjTbUHo/uM6/Lh9uJbw9WcQivG3b1ex12FINPBF2OLu16DnHe
        /Kf3Jqrbl0XUDgrmHNWhdT4iPQ==
X-Google-Smtp-Source: ABdhPJy6LV8Rg1pvk+ijuzqbfE1vbTCus8/P/U44vwy9AXErh7BnOH12I61Ekp4HlWWILPl/6q0AMg==
X-Received: by 2002:a2e:8790:: with SMTP id n16mr2122397lji.273.1644427543359;
        Wed, 09 Feb 2022 09:25:43 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:42 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 20/25] drm/msm/dpu: add dpu_hw_pipe_cfg to dpu_plane_state
Date:   Wed,  9 Feb 2022 20:25:15 +0300
Message-Id: <20220209172520.3719906-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now as all accesses to pipe_cfg and pstate have been cleaned, re-add
struct dpu_hw_pipe_cfg back to dpu_plane_state, so that
dpu_plane_atomic_check() and dpu_plane_atomic_update() do not have a
chance to disagree about src/dst rectangles (currently
dpu_plane_atomic_check() uses unclipped rectangles, while
dpu_plane_atomic_update() uses clipped rectangles calculated by
drm_atomic_helper_check_plane_state()).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 62 ++++++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  1 +
 2 files changed, 28 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 952ff11162c0..863aedcda66e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -904,7 +904,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	const struct drm_crtc_state *crtc_state = NULL;
 	const struct dpu_format *fmt;
-	struct drm_rect src, dst, fb_rect = { 0 };
+	struct dpu_hw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct drm_rect fb_rect = { 0 };
 	uint32_t min_src_size, max_linewidth;
 
 	if (new_plane_state->crtc)
@@ -933,12 +934,15 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	src.x1 = new_plane_state->src_x >> 16;
-	src.y1 = new_plane_state->src_y >> 16;
-	src.x2 = src.x1 + (new_plane_state->src_w >> 16);
-	src.y2 = src.y1 + (new_plane_state->src_h >> 16);
+	pipe_cfg->src_rect = new_plane_state->src;
 
-	dst = drm_plane_state_dest(new_plane_state);
+	/* state->src is 16.16, src_rect is not */
+	pipe_cfg->src_rect.x1 >>= 16;
+	pipe_cfg->src_rect.x2 >>= 16;
+	pipe_cfg->src_rect.y1 >>= 16;
+	pipe_cfg->src_rect.y2 >>= 16;
+
+	pipe_cfg->dst_rect = new_plane_state->dst;
 
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
@@ -957,30 +961,30 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	/* check src bounds */
-	} else if (!dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
+	} else if (!dpu_plane_validate_src(&pipe_cfg->src_rect, &fb_rect, min_src_size)) {
 		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&src));
+				DRM_RECT_ARG(&pipe_cfg->src_rect));
 		return -E2BIG;
 
 	/* valid yuv image */
 	} else if (DPU_FORMAT_IS_YUV(fmt) &&
-		   (src.x1 & 0x1 || src.y1 & 0x1 ||
-		    drm_rect_width(&src) & 0x1 ||
-		    drm_rect_height(&src) & 0x1)) {
+		   (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 0x1 ||
+		    drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
+		    drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
 		DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&src));
+				DRM_RECT_ARG(&pipe_cfg->src_rect));
 		return -EINVAL;
 
 	/* min dst support */
-	} else if (drm_rect_width(&dst) < 0x1 || drm_rect_height(&dst) < 0x1) {
+	} else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
 		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&dst));
+				DRM_RECT_ARG(&pipe_cfg->dst_rect));
 		return -EINVAL;
 
 	/* check decimated source width */
-	} else if (drm_rect_width(&src) > max_linewidth) {
+	} else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
 		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-				DRM_RECT_ARG(&src), max_linewidth);
+				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
 		return -E2BIG;
 	}
 
@@ -1053,15 +1057,13 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	bool is_rt_pipe, update_qos_remap;
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
-	struct dpu_hw_pipe_cfg pipe_cfg;
+	struct dpu_hw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_hw_fmt_layout layout;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	struct msm_gem_address_space *aspace = kms->base.aspace;
 	bool update_src_addr = true;
 	int ret;
 
-	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
-
 	ret = dpu_format_populate_layout(aspace, fb, &layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
@@ -1084,16 +1086,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
 			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
 
-	pipe_cfg.src_rect = state->src;
-
-	/* state->src is 16.16, src_rect is not */
-	pipe_cfg.src_rect.x1 >>= 16;
-	pipe_cfg.src_rect.x2 >>= 16;
-	pipe_cfg.src_rect.y1 >>= 16;
-	pipe_cfg.src_rect.y2 >>= 16;
-
-	pipe_cfg.dst_rect = state->dst;
-
 	/* override for color fill */
 	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
 		/* skip remaining processing on color fill */
@@ -1102,10 +1094,10 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	if (pipe->sspp->ops.setup_rects) {
 		pipe->sspp->ops.setup_rects(pipe,
-				&pipe_cfg);
+				pipe_cfg);
 	}
 
-	_dpu_plane_setup_scaler(pipe, fmt, false, &pipe_cfg);
+	_dpu_plane_setup_scaler(pipe, fmt, false, pipe_cfg);
 
 	if (pipe->sspp->ops.setup_multirect)
 		pipe->sspp->ops.setup_multirect(
@@ -1148,12 +1140,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		}
 	}
 
-	_dpu_plane_set_qos_lut(plane, fb, &pipe_cfg);
+	_dpu_plane_set_qos_lut(plane, fb, &pstate->pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, fb);
 
 	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
 		_dpu_plane_set_qos_ctrl(plane, true, DPU_PLANE_QOS_PANIC_CTRL);
-		_dpu_plane_set_ot_limit(plane, crtc, &pipe_cfg);
+		_dpu_plane_set_ot_limit(plane, crtc, &pstate->pipe_cfg);
 	}
 
 	update_qos_remap = (is_rt_pipe != pdpu->is_rt_pipe) ||
@@ -1167,9 +1159,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		_dpu_plane_set_qos_remap(plane);
 	}
 
-	_dpu_plane_calc_bw(plane, fb, &pipe_cfg);
+	_dpu_plane_calc_bw(plane, fb, &pstate->pipe_cfg);
 
-	_dpu_plane_calc_clk(plane, &pipe_cfg);
+	_dpu_plane_calc_clk(plane, &pstate->pipe_cfg);
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index e61c57b045ea..69920c32cb9a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -34,6 +34,7 @@ struct dpu_plane_state {
 	bool pending;
 
 	struct dpu_sw_pipe pipe;
+	struct dpu_hw_pipe_cfg pipe_cfg;
 
 	u64 plane_fetch_bw;
 	u64 plane_clk;
-- 
2.34.1

