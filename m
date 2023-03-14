Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6036B99D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 16:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjCNPht (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 11:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231703AbjCNPh3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 11:37:29 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB01B329C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:30 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id z5so16423361ljc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678808160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHSszKzrQ1LK42Ehi6sO2Un2Gwa/0oELUzNlugFsZyE=;
        b=PICt0uQYquqW8tmQFiMqEv1atWu0to92lKqiUDVJNOCdk2Ryc6BQmlhzFQuzL1hNvL
         wG0GUP5meLGHhLkqdl+2Z5l58ZiLDVXkx6LbQFOsnApO6Nxaz26HOsqmWibdtALAKFSR
         EO4y/TQ3pKrAOBnJjSOWzLmR1YVXqdCGcKDhEeTqmCeDtwJ7umoLEUq8orJEvvHnpPw0
         rfCzz5pfcVzdBy11+zw9UOk8q6bErALqGqPDa4iUpldI/Rn7wepFPvdkSkE7GXQfdaMF
         iN19tPqW2Gd7+ZiNtNzWg2KpYbaQgghlwRSkgcWxHP3T4SJqMZtpaX01L3TvCpv2i/yS
         ox/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHSszKzrQ1LK42Ehi6sO2Un2Gwa/0oELUzNlugFsZyE=;
        b=rYCViVp8JSGzQr4BEPahCRck0ENPjcMd4LusI54DniKzR1nys0gkXcw66hVYfCTpYj
         d6nrUMV2IWmXW6T/noltD8qMy+HDfyuZPbze2b2jb/vbLtnJ0sGbHidhcL086BEgeDu5
         g45MrUAfwFXQvN4QDjDHv7ssWecACuwjmsbSW/0pvjo2inWdc7qA75udAqUjQV5Q7g6P
         3XEsgZX5Jcnvbui9zZUE4g64v1GiJ4YaQ2llij18peNtPvgYeBTgSntlQUdLVTJyQTSA
         +aoRMtAj32ZrxOB6JCHw0NrUPPW3wdx36NxQE1AsUxKrDnjWdpHkLN7YsU6G+KLfSCCE
         plOw==
X-Gm-Message-State: AO0yUKVwbFCh/4AqPaguL8s+Y8C8mMWTadPQVOy7G2569Mzz7r9j8RNc
        vyS3L4xinaZLoDZg/0MA9Yb6Uw==
X-Google-Smtp-Source: AK7set8jPd8q7rSu5bALug9eO8HoRSNLRx7lo4jN+QajXCMltU6Aw5b9Oo8sfrIp/SjmMGJ1lPa+PQ==
X-Received: by 2002:a2e:7c07:0:b0:294:69aa:a2e4 with SMTP id x7-20020a2e7c07000000b0029469aaa2e4mr3794938ljc.16.1678808159935;
        Tue, 14 Mar 2023 08:35:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:35:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 19/32] drm/msm/dpu: make _dpu_plane_calc_clk accept mode directly
Date:   Tue, 14 Mar 2023 18:35:32 +0300
Message-Id: <20230314153545.3442879-20-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
2.30.2

