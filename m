Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B96DD6A97CB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 13:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbjCCM5p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 07:57:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbjCCM5l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 07:57:41 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2975FE96
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 04:57:40 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id s22so3435340lfi.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 04:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oaq3ZKg3ryJnLsRAC7eeTDAU5hoTHHLI4SkMXtIxqZ0=;
        b=I85cJbf+WnDLA0KflLX0RlvpGlF+391iTn6wYgtPfMil6+WE1Bewz+WNV7CKg0dx+N
         C3K4GSCr+xqf0y+UWt6D7lPhOPqztoelXSZheqVIvTw4UbQlQ/9cT5eW2TpU1WDNpjI6
         dCdcO+t/bJSf/CYxC2Rf1mye7QN3H8cnprt8xK+XPSt1Jws3rGeuIcKbCLA7eg8wuNxN
         uZqB/UzIO1NK/6gIrAZ9Zsf8uEve2IqZ8cVZiOSQJs0gRR8sRD7RtclPySBeHJG7/Nus
         Va7yJveSx+57dBZjx/6o1/xO3txVivjT7p7hA6YTKyHjBQHB9uIqOZRPmi+Qge3CSafB
         bxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oaq3ZKg3ryJnLsRAC7eeTDAU5hoTHHLI4SkMXtIxqZ0=;
        b=zFN0QWSmB261eWpqTG+2bLPQwYhlu+FBC1y9hOXyUuxFgww9UBon/q43A1IfHivgHc
         jGVSJsed2z5tXnnOh3U0sGGiMpeTqpro+Ft9ylPmmlZ5QOpLX9i+N3y2FP08+qlDxgOw
         DoOOYZvTsvz2k7pQM76fELzFU1NP7PaWSvYUKcsLjM1LnQZPCFqsmOX+PTVeK60jcnGo
         5RVn/LBqvezF/M4CZkcQrFA2/Vih67Y7BYePhd6eIgwvqKO8a4xPug6O9Wo0zeiPO0C3
         78R3AWxs8x+14ovtqsGUfOZknB7LuBb4InMVrDDOrIaOnmlbUiZqAMPfMryiLRbeCrxp
         y/TQ==
X-Gm-Message-State: AO0yUKUy9I6qXnZkF+k+OWQIFnNMhr4H7l3sjiIAMRtd5yA30qOGiusZ
        QGMW5iT0uuH0MQOPKNBU9d0gVw==
X-Google-Smtp-Source: AK7set/9gKtESymv4H7RUEPE72TLfsy8BNdLPeFp9HE1O23rPqQkpC+cGo0Wch3+dJi8+jGSIa/z5w==
X-Received: by 2002:ac2:5df1:0:b0:4db:2cdf:4c11 with SMTP id z17-20020ac25df1000000b004db2cdf4c11mr564308lfq.62.1677848258809;
        Fri, 03 Mar 2023 04:57:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 04:57:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 19/30] drm/msm/dpu: make _dpu_plane_calc_clk accept mode directly
Date:   Fri,  3 Mar 2023 14:57:14 +0200
Message-Id: <20230303125725.3695011-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 39 ++++++++++-------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index aaea7c63d944..6cd787e85be8 100644
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
 	struct dpu_sw_pipe_cfg *pipe_cfg)
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
-static void _dpu_plane_calc_clk(struct drm_plane *plane, struct dpu_sw_pipe_cfg *pipe_cfg)
+static u64 _dpu_plane_calc_clk(const struct drm_display_mode *mode,
+		struct dpu_sw_pipe_cfg *pipe_cfg)
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
2.39.2

