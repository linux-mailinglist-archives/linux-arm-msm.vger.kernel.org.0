Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA4106590F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 20:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234011AbiL2TTZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 14:19:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234012AbiL2TTV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 14:19:21 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDAD714D14
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:20 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id y25so28751551lfa.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EanTkNYkXoezMbWbebubDgyE19FVW667E9iSlrU1b8=;
        b=dxb7Liif2AYBkqqeE+UU7DqeVKTdy5WjhaCjoHresQAzvLPYF4lJH8ma2QevoCGYQL
         O+VMXqWR5LdKNjMsZ/L0u75JYJweKIM74D/pZz5whL55MR+zreNVA5HO0tMA9OerXN+b
         4OBizhHji6oR/0FOoVuIwpFJ2geE9t4KCXcag6z3ewHd1qugrz2nLOKjrKdlS8RBKZPJ
         rpAOXPN6TWy/3xY7Wf1EyLCWcwRAGwG4pmjqnU0nLALIN4yEmg0bkp8gAJjE9Ljefn6l
         eBHoF+zIfiYcJ/Ai1WYWybpEvSEenJHeeV/wsASeJNjV7XPcZ4+CME4yZaI4fMtpnC50
         8gVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EanTkNYkXoezMbWbebubDgyE19FVW667E9iSlrU1b8=;
        b=7WmWgnPumRAbiKjEoec5dTldN8KzN4t7LAkTEEYmW2Atw9DE+0hdUyj7rOgJCR3/97
         fbJcQhfty+HEC+XQ1R1ZGuECvP7XkmFntEQcJp93Tb+XaPrzszfDqGsFaodMWpsAsnoo
         FFiBj6R3hFOrFeu6AQeqsKn2TRHqIdpxmWhIhMvFK9ZJl9LhcScfTCd1FVe5y94iUj1C
         e3kpVhYnpYXZaozOZbhheEieucsCkrqnoD1NPSQ2q3UZ5XMnUs3aw3J3UOIDbnBrcdDq
         n0SI1uDSv7/J57lBykLav76wDdgp1c/KB25eO3Yy+D8jmr4btj5AHsdslVwdt9yrcDIq
         542Q==
X-Gm-Message-State: AFqh2kpbItSwB+6q1QZrCQeLQltQ1+7tRD8rQTmkERuh0gKkJueb84ZK
        bA4SsB1PW0nu6E+keNURhEmBHw==
X-Google-Smtp-Source: AMrXdXvF2Hi1So1MmL93Gc7wqXam+VhpJwPgv24G0V2NOT4Sxiw/nUavCvLxafHQ6aj50mEcvHKLFw==
X-Received: by 2002:a05:6512:3d93:b0:4b5:a207:8d70 with SMTP id k19-20020a0565123d9300b004b5a2078d70mr9830390lfv.5.1672341560469;
        Thu, 29 Dec 2022 11:19:20 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 11:19:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 23/27] drm/msm/dpu: rework dpu_plane_atomic_check()
Date:   Thu, 29 Dec 2022 21:18:52 +0200
Message-Id: <20221229191856.3508092-24-dmitry.baryshkov@linaro.org>
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

Split pipe-dependent code from dpu_plane_atomic_check() into the
separate function dpu_plane_atomic_check_pipe(). This is one of
preparational steps to add r_pipe support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 91 +++++++++++++----------
 1 file changed, 53 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index b80c5adf91d2..c20e0d9fe0ca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -903,6 +903,55 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
 	return 0;
 }
 
+static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
+		struct dpu_sw_pipe *pipe,
+		struct dpu_hw_pipe_cfg *pipe_cfg,
+		uint32_t max_linewidth,
+		const struct dpu_format *fmt)
+{
+	uint32_t min_src_size;
+
+	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
+
+	if (DPU_FORMAT_IS_YUV(fmt) &&
+		(!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
+		 !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
+		DPU_DEBUG_PLANE(pdpu,
+				"plane doesn't have scaler/csc for yuv\n");
+		return -EINVAL;
+
+	/* check src bounds */
+	} else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
+		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
+		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect));
+		return -E2BIG;
+
+	/* valid yuv image */
+	} else if (DPU_FORMAT_IS_YUV(fmt) &&
+		   (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 0x1 ||
+		    drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
+		    drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
+		DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect));
+		return -EINVAL;
+
+	/* min dst support */
+	} else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
+		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->dst_rect));
+		return -EINVAL;
+
+	/* check decimated source width */
+	} else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
+		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+		return -E2BIG;
+	}
+
+	return 0;
+}
+
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
@@ -915,7 +964,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	const struct dpu_format *fmt;
 	struct dpu_hw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
-	uint32_t min_src_size, max_linewidth;
+	uint32_t max_linewidth;
 	unsigned int rotation;
 	uint32_t supported_rotations;
 	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
@@ -972,43 +1021,9 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
 
-	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
-
-	if (DPU_FORMAT_IS_YUV(fmt) &&
-		(!(pipe_hw_caps->features & DPU_SSPP_SCALER) ||
-		 !(pipe_hw_caps->features & DPU_SSPP_CSC_ANY))) {
-		DPU_DEBUG_PLANE(pdpu,
-				"plane doesn't have scaler/csc for yuv\n");
-		return -EINVAL;
-
-	/* check src bounds */
-	} else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
-		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
-		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect));
-		return -E2BIG;
-
-	/* valid yuv image */
-	} else if (DPU_FORMAT_IS_YUV(fmt) &&
-		   (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 0x1 ||
-		    drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
-		    drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
-		DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect));
-		return -EINVAL;
-
-	/* min dst support */
-	} else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
-		DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
-				DRM_RECT_ARG(&pipe_cfg->dst_rect));
-		return -EINVAL;
-
-	/* check decimated source width */
-	} else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
-		DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-		return -E2BIG;
-	}
+	ret = dpu_plane_atomic_check_pipe(pdpu, &pstate->pipe, pipe_cfg, max_linewidth, fmt);
+	if (ret)
+		return ret;
 
 	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
 
-- 
2.39.0

