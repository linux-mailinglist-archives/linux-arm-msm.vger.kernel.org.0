Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2C466590ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 20:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbiL2TTU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 14:19:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234011AbiL2TTS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 14:19:18 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F011714D14
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:16 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id f34so28715489lfv.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yng4/qDdOXR9ZdYxFLO2DrUrUOAEL3rzpkA+qGDltdo=;
        b=WGcRDsIEiA11gl1iE7EWUSMQZiANCbtkDKgbAwpSXcvbeNISVlYVJd+ZBH7HZPEi0K
         zNY9c+rdf6+KUwsI8ns2SWJGM0MJ960cyVLu9U3m2BwhTx+h5G5JpQ1ybszxbp5lL0c2
         jBF5YIVq/ZWUUjkwR0qlTLmccYKFBBL3tJP99YfCtqAMSikiXzJvtIBxB/W2/HrrSkoH
         RhKp5WNIA8/RnSElYhZCsn5NfksqM14gaS56pCiGD8KtrV+4uw5ipTcnTixsZap8GTr5
         1n7l/wSS/KIakIv2ifHraZW1gs3yu+b5MejTaw98bwOkc1lKCh7VqTvUaw6HCXq34DIS
         YR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yng4/qDdOXR9ZdYxFLO2DrUrUOAEL3rzpkA+qGDltdo=;
        b=tjuIC7lcxtPOUpvYdI6qDuj6ykGbaPxdqoZWYMe75rQeDwn19MWh7L6014zh5vX1Xk
         O4SlhpqixgMt8uivBlWNEHWnByHuF5WAKK9dYW8SRMTahFyfFBzkKJKYFvnTKIHTsruJ
         Y8qS/2m2s88CnfHh8YpLwV6pVwAJl7P/KcAiV55GZCkF23hm5EfJiKFZhwTZhMDUm2TC
         YwNFWtq9wQcPrI/APrIIJqCBIwBRtLkDpv9hzH/HuYa3kJxwMMhOlb2bPmZ0F6iLpult
         UB9Adyi+BLc9mze04c7suoZ3x8K7n06YFgXqsFFzAPdR4g6QftWTVWl1AhiXw6McmAKz
         wxsQ==
X-Gm-Message-State: AFqh2ko+yu9XZRHlEauNYXjtvcyTn6T4viy0DMo3IT6ZHBCswxrYEe0y
        y3pN03SIyhfW71SZA+fTdADQ1Q==
X-Google-Smtp-Source: AMrXdXuf8BdU1NAk5ifa/8sHmSAnLfgcpJ8jMCJ6ORs+FEFoUzaDinNXAOeUJ8DnMzJdTHrL9Mvtqg==
X-Received: by 2002:ac2:5d4e:0:b0:4b3:f50c:69a8 with SMTP id w14-20020ac25d4e000000b004b3f50c69a8mr8992832lfd.47.1672341555385;
        Thu, 29 Dec 2022 11:19:15 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 11:19:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 17/27] drm/msm/dpu: add dpu_hw_pipe_cfg to dpu_plane_state
Date:   Thu, 29 Dec 2022 21:18:46 +0200
Message-Id: <20221229191856.3508092-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 64 ++++++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  1 +
 2 files changed, 29 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 50ce4653bbba..ff32c28ee16a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -963,7 +963,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
 	const struct drm_crtc_state *crtc_state = NULL;
 	const struct dpu_format *fmt;
-	struct drm_rect src, dst, fb_rect = { 0 };
+	struct dpu_hw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
+	struct drm_rect fb_rect = { 0 };
 	uint32_t min_src_size, max_linewidth;
 	unsigned int rotation;
 	uint32_t supported_rotations;
@@ -996,12 +997,15 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
@@ -1020,30 +1024,30 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
 
@@ -1057,7 +1061,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	if ((pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION)) &&
 		(rotation & DRM_MODE_ROTATE_90)) {
-		ret = dpu_plane_check_inline_rotation(pdpu, sblk, src, fmt);
+		ret = dpu_plane_check_inline_rotation(pdpu, sblk, pipe_cfg->src_rect, fmt);
 		if (ret)
 			return ret;
 	}
@@ -1132,9 +1136,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	bool is_rt_pipe;
 	const struct dpu_format *fmt =
 		to_dpu_format(msm_framebuffer_format(fb));
-	struct dpu_hw_pipe_cfg pipe_cfg;
-
-	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
+	struct dpu_hw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 
 	_dpu_plane_set_scanout(plane, pstate, fb);
 
@@ -1151,16 +1153,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
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
@@ -1169,10 +1161,10 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	if (pipe->sspp->ops.setup_rects) {
 		pipe->sspp->ops.setup_rects(pipe,
-				&pipe_cfg);
+				pipe_cfg);
 	}
 
-	_dpu_plane_setup_scaler(pipe, fmt, false, &pipe_cfg, pstate->rotation);
+	_dpu_plane_setup_scaler(pipe, fmt, false, pipe_cfg, pstate->rotation);
 
 	if (pipe->sspp->ops.setup_multirect)
 		pipe->sspp->ops.setup_multirect(
@@ -1213,12 +1205,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
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
 
 	if (pstate->needs_qos_remap) {
@@ -1226,9 +1218,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		_dpu_plane_set_qos_remap(plane);
 	}
 
-	_dpu_plane_calc_bw(plane, fb, &pipe_cfg);
+	_dpu_plane_calc_bw(plane, fb, &pstate->pipe_cfg);
 
-	_dpu_plane_calc_clk(plane, &pipe_cfg);
+	_dpu_plane_calc_clk(plane, &pstate->pipe_cfg);
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 36a82c06ab7a..95031e8b00f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -36,6 +36,7 @@ struct dpu_plane_state {
 	bool pending;
 
 	struct dpu_sw_pipe pipe;
+	struct dpu_hw_pipe_cfg pipe_cfg;
 
 	u64 plane_fetch_bw;
 	u64 plane_clk;
-- 
2.39.0

