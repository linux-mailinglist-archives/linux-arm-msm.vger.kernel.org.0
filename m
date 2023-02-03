Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C05668A1B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 19:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233199AbjBCSWE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 13:22:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233557AbjBCSWB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 13:22:01 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B8F1ADB81
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 10:21:57 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id ud5so17714503ejc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 10:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqYHPJDghsVbwlXxG2KR32qIUjY2mVQ6OmS5U1Nl44o=;
        b=Q1t0gp7h0IVObPLglNhdEYxtNCjbpgNxvE3IzQ7n8hUgMHv/DogK4ixaijZ6St9O2k
         Oa8lSryWbtreh5Z9b1ODbhHyKi6kG8phrRCLtcWmnmJECtQW1GCf1OcpXEburLynIJsm
         CIF++/vtRJwnNp+BkQvI08PxndBC1svcIzbycNa18qcAyOhriSpj4LAy1O2nm1f0YA9s
         fH4NmBbYZBnwtXPjouHC8WipFIsLXYu6umCbbkkEFU+JvPinmJ5z8bMUTTPBneztJYWz
         tl8nj8W+/UXHmXNLz+5HxqszVT+owWVNVgYLz0YH2N8EEtN4ysEm10svn8Qf5pBmYYuk
         SxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqYHPJDghsVbwlXxG2KR32qIUjY2mVQ6OmS5U1Nl44o=;
        b=OiOsTeWuXob5PdYGI3XJ7OYKoV27d9rJRJFuABuk7bwJbhLBB4mc7qqmjdvZ9EPxSw
         LSq4H7oXdguKG56uK4NOjIHP2mNOrWF+wR3kMZ5RuDohwWz/n6hAjWWSQ0uqVhGX4pTD
         YuIcq0iDUsjLehDn5owH/a58XtKWMtVcmOiXKTL2RmriHXCKumzCLb8abBhX3CkpNHAT
         qX0sW2CM4uDo+QDXmJg234z7N+zU5T70Sbnwi545eAPr+RRGmQC2uglCe4nuoGDbH6/Z
         Gmm5bSm644Pl8MRV0RVYbjbs3eD+p2Kspt8dV4i7+rEBfUh21yIpat5rSWE9OC6qWu2k
         wsZQ==
X-Gm-Message-State: AO0yUKWDWDYcIewYd862AMnDtkvzk41gWtld3Nzy4zZVTRTNPTgnH4MH
        /OkbMwGEAr8Lyy1o77tas6SwHA==
X-Google-Smtp-Source: AK7set+kS4ffpdNLlZ/w1ldQjJDid7qaVuFl2iLWQ0V1NXnzEoIwMyPP2rLmXraYKDu39oI1jaPk9Q==
X-Received: by 2002:a17:906:81ca:b0:870:b950:18d4 with SMTP id e10-20020a17090681ca00b00870b95018d4mr11095701ejx.5.1675448516122;
        Fri, 03 Feb 2023 10:21:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 10:21:55 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 19/27] drm/msm/dpu: make _dpu_plane_calc_clk accept mode directly
Date:   Fri,  3 Feb 2023 20:21:24 +0200
Message-Id: <20230203182132.1307834-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
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

Rework bandwidth/clock calculation functions to use mode directly rather
than fetching it through the plane data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 39 ++++++++++-------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ee261a591d45..09a3fde1c910 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -127,20 +127,19 @@ static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
 
 /**
  * _dpu_plane_calc_bw - calculate bandwidth required for a plane
- * @plane: Pointer to drm plane.
+ * @catalog: Points to dpu catalog structure
  * @fmt: Pointer to source buffer format
+ * @mode: Pointer to drm display mode
  * @pipe_cfg: Pointer to pipe configuration
  * Result: Updates calculated bandwidth in the plane state.
  * BW Equation: src_w * src_h * bpp * fps * (v_total / v_dest)
  * Prefill BW Equation: line src bytes * line_time
  */
-static void _dpu_plane_calc_bw(struct drm_plane *plane,
+static u64 _dpu_plane_calc_bw(const struct dpu_mdss_cfg *catalog,
 	const struct dpu_format *fmt,
+	const struct drm_display_mode *mode,
 	struct dpu_hw_sspp_cfg *pipe_cfg)
 {
-	struct dpu_plane_state *pstate;
-	struct drm_display_mode *mode;
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	int src_width, src_height, dst_height, fps;
 	u64 plane_prefill_bw;
 	u64 plane_bw;
@@ -148,9 +147,6 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 	u64 scale_factor;
 	int vbp, vpw, vfp;
 
-	pstate = to_dpu_plane_state(plane->state);
-	mode = &plane->state->crtc->mode;
-
 	src_width = drm_rect_width(&pipe_cfg->src_rect);
 	src_height = drm_rect_height(&pipe_cfg->src_rect);
 	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
@@ -158,7 +154,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 	vbp = mode->vtotal - mode->vsync_end;
 	vpw = mode->vsync_end - mode->vsync_start;
 	vfp = mode->vsync_start - mode->vdisplay;
-	hw_latency_lines =  dpu_kms->catalog->perf->min_prefill_lines;
+	hw_latency_lines =  catalog->perf->min_prefill_lines;
 	scale_factor = src_height > dst_height ?
 		mult_frac(src_height, 1, dst_height) : 1;
 
@@ -178,37 +174,36 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 		do_div(plane_prefill_bw, hw_latency_lines);
 
 
-	pstate->plane_fetch_bw = max(plane_bw, plane_prefill_bw);
+	return max(plane_bw, plane_prefill_bw);
 }
 
 /**
  * _dpu_plane_calc_clk - calculate clock required for a plane
- * @plane: Pointer to drm plane.
+ * @mode: Pointer to drm display mode
  * @pipe_cfg: Pointer to pipe configuration
  * Result: Updates calculated clock in the plane state.
  * Clock equation: dst_w * v_total * fps * (src_h / dst_h)
  */
-static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_hw_sspp_cfg *pipe_cfg)
+static u64 _dpu_plane_calc_clk(const struct drm_display_mode *mode,
+		struct dpu_hw_sspp_cfg *pipe_cfg)
 {
-	struct dpu_plane_state *pstate;
-	struct drm_display_mode *mode;
 	int dst_width, src_height, dst_height, fps;
-
-	pstate = to_dpu_plane_state(plane->state);
-	mode = &plane->state->crtc->mode;
+	u64 plane_clk;
 
 	src_height = drm_rect_height(&pipe_cfg->src_rect);
 	dst_width = drm_rect_width(&pipe_cfg->dst_rect);
 	dst_height = drm_rect_height(&pipe_cfg->dst_rect);
 	fps = drm_mode_vrefresh(mode);
 
-	pstate->plane_clk =
+	plane_clk =
 		dst_width * mode->vtotal * fps;
 
 	if (src_height > dst_height) {
-		pstate->plane_clk *= src_height;
-		do_div(pstate->plane_clk, dst_height);
+		plane_clk *= src_height;
+		do_div(plane_clk, dst_height);
 	}
+
+	return plane_clk;
 }
 
 /**
@@ -1219,9 +1214,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		_dpu_plane_set_qos_remap(plane, pipe);
 	}
 
-	_dpu_plane_calc_bw(plane, fmt, &pipe_cfg);
+	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, &pipe_cfg);
 
-	_dpu_plane_calc_clk(plane, &pipe_cfg);
+	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, &pipe_cfg);
 }
 
 static void _dpu_plane_atomic_disable(struct drm_plane *plane)
-- 
2.39.1

