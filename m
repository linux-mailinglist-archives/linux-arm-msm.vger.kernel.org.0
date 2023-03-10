Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0A9A6B3334
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 01:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjCJA5x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 19:57:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjCJA5h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 19:57:37 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF7FFC7D9
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 16:57:36 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id g17so4630302lfv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 16:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678409854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6BY9HsPY8/kGeF9ZLFAFWkTdVEP4yW0Z/JovlQqkQ8=;
        b=ZgLJP61Fr0rOXd9KsnAHRXL+4vIgTKSJ11FZ5xuksw6eUXVIxJHO0Y4YzAR1GDn2oB
         /qhx7twkU5POEXobhuW4WfflkoxSeRu2KU7sHh3eKu4ZcMTflefKZ65x0SgVH+E4o1/F
         Hte6Q0A8VzLzcUo9nqXNM6B3gkSYB87wEJYZADytknxyPOZLnNP42dySrdYxsOgO4Ixv
         WbpFBV2aQmUVzbJ56fVacQd+cAoE/S8NTgLbvryUlswpjQK7km2xuECgZuMh/jMzerbA
         bpwkMXqtmxerxvVF4q3RI+0GvjO96bndPOSKHmVgIuP44spM/TgOL5nQHqfAOsjSTrkb
         hkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678409854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6BY9HsPY8/kGeF9ZLFAFWkTdVEP4yW0Z/JovlQqkQ8=;
        b=tl6IOROlVRAxNjpOv4a9zw2TpofWEkdVFYs0vV4LrycCydJglKpYWRslD5ijrkoPCu
         kFIEWtZixVIt8Z3DfaRwQB3eRFDy9g92RyiprsAFK1BuQetXvKmLhY4bNKkaiqbyT3RQ
         9q6tB2wGR+9/nF2rSG+Eu/iCzPT0idobPFAxim5dGpUbB1nr8ngvi4RoMrNaZWbZWlnI
         8yaBIA+yj5ek5UzYKYVfe1+lENGgIREdhdel4eQHUl1/NCcQJ2d1ovSQoEXFcG4xtnN7
         BR9Kx6mWG5i0O791RoTvDscRBQ/GKHZSaELUvL9r0+HcqE/YJrch6UadL1c0kjtM/38n
         890g==
X-Gm-Message-State: AO0yUKUs1dpFdu+sBV22QSTwQNjso73YqaN7P8pjYqEEXI5mdsb2Gun1
        k3K+whwgDtR9lHs6V6MdR5uP/Q==
X-Google-Smtp-Source: AK7set/yKy1s9sdVuOeHfgS12ixjzKTsk+ZZzMsqbe5Z/yliiqiXVrjsnsSf3DxWFPsQ4gItJrvhow==
X-Received: by 2002:ac2:5e99:0:b0:4d8:5de4:e3b4 with SMTP id b25-20020ac25e99000000b004d85de4e3b4mr186481lfq.1.1678409854514;
        Thu, 09 Mar 2023 16:57:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 16:57:33 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 32/32] drm/msm/dpu: remove unused dpu_plane_validate_multirect_v2 function
Date:   Fri, 10 Mar 2023 02:57:04 +0200
Message-Id: <20230310005704.1332368-33-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

After cleaning up the older multirect support the function
dpu_plane_validate_multirect_v2() is unused. Lets remove it.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 111 ----------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   7 --
 2 files changed, 118 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9a03d1cad0ee..bafa1dd1748b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -707,117 +707,6 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 					   fill_color, fmt);
 }
 
-int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
-{
-	struct dpu_plane_state *pstate[R_MAX];
-	const struct drm_plane_state *drm_state[R_MAX];
-	struct drm_rect src[R_MAX], dst[R_MAX];
-	struct dpu_plane *dpu_plane[R_MAX];
-	const struct dpu_format *fmt[R_MAX];
-	int i, buffer_lines;
-	unsigned int max_tile_height = 1;
-	bool parallel_fetch_qualified = true;
-	bool has_tiled_rect = false;
-
-	for (i = 0; i < R_MAX; i++) {
-		const struct msm_format *msm_fmt;
-
-		drm_state[i] = i ? plane->r1 : plane->r0;
-		msm_fmt = msm_framebuffer_format(drm_state[i]->fb);
-		fmt[i] = to_dpu_format(msm_fmt);
-
-		if (DPU_FORMAT_IS_UBWC(fmt[i])) {
-			has_tiled_rect = true;
-			if (fmt[i]->tile_height > max_tile_height)
-				max_tile_height = fmt[i]->tile_height;
-		}
-	}
-
-	for (i = 0; i < R_MAX; i++) {
-		int width_threshold;
-
-		pstate[i] = to_dpu_plane_state(drm_state[i]);
-		dpu_plane[i] = to_dpu_plane(drm_state[i]->plane);
-
-		if (pstate[i] == NULL) {
-			DPU_ERROR("DPU plane state of plane id %d is NULL\n",
-				drm_state[i]->plane->base.id);
-			return -EINVAL;
-		}
-
-		src[i].x1 = drm_state[i]->src_x >> 16;
-		src[i].y1 = drm_state[i]->src_y >> 16;
-		src[i].x2 = src[i].x1 + (drm_state[i]->src_w >> 16);
-		src[i].y2 = src[i].y1 + (drm_state[i]->src_h >> 16);
-
-		dst[i] = drm_plane_state_dest(drm_state[i]);
-
-		if (drm_rect_calc_hscale(&src[i], &dst[i], 1, 1) != 1 ||
-		    drm_rect_calc_vscale(&src[i], &dst[i], 1, 1) != 1) {
-			DPU_ERROR_PLANE(dpu_plane[i],
-				"scaling is not supported in multirect mode\n");
-			return -EINVAL;
-		}
-
-		if (DPU_FORMAT_IS_YUV(fmt[i])) {
-			DPU_ERROR_PLANE(dpu_plane[i],
-				"Unsupported format for multirect mode\n");
-			return -EINVAL;
-		}
-
-		/**
-		 * SSPP PD_MEM is split half - one for each RECT.
-		 * Tiled formats need 5 lines of buffering while fetching
-		 * whereas linear formats need only 2 lines.
-		 * So we cannot support more than half of the supported SSPP
-		 * width for tiled formats.
-		 */
-		width_threshold = dpu_plane[i]->catalog->caps->max_linewidth;
-		if (has_tiled_rect)
-			width_threshold /= 2;
-
-		if (parallel_fetch_qualified &&
-		    drm_rect_width(&src[i]) > width_threshold)
-			parallel_fetch_qualified = false;
-
-	}
-
-	/* Validate RECT's and set the mode */
-
-	/* Prefer PARALLEL FETCH Mode over TIME_MX Mode */
-	if (parallel_fetch_qualified) {
-		pstate[R0]->pipe.multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
-		pstate[R1]->pipe.multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
-
-		goto done;
-	}
-
-	/* TIME_MX Mode */
-	buffer_lines = 2 * max_tile_height;
-
-	if (dst[R1].y1 >= dst[R0].y2 + buffer_lines ||
-	    dst[R0].y1 >= dst[R1].y2 + buffer_lines) {
-		pstate[R0]->pipe.multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
-		pstate[R1]->pipe.multirect_mode = DPU_SSPP_MULTIRECT_TIME_MX;
-	} else {
-		DPU_ERROR(
-			"No multirect mode possible for the planes (%d - %d)\n",
-			drm_state[R0]->plane->base.id,
-			drm_state[R1]->plane->base.id);
-		return -EINVAL;
-	}
-
-done:
-	pstate[R0]->pipe.multirect_index = DPU_SSPP_RECT_0;
-	pstate[R1]->pipe.multirect_index = DPU_SSPP_RECT_1;
-
-	DPU_DEBUG_PLANE(dpu_plane[R0], "R0: %d - %d\n",
-		pstate[R0]->pipe.multirect_mode, pstate[R0]->pipe.multirect_index);
-	DPU_DEBUG_PLANE(dpu_plane[R1], "R1: %d - %d\n",
-		pstate[R1]->pipe.multirect_mode, pstate[R1]->pipe.multirect_index);
-	return 0;
-}
-
 static int dpu_plane_prepare_fb(struct drm_plane *plane,
 		struct drm_plane_state *new_state)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 7490ffd94d03..2784f8841260 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -87,13 +87,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		uint32_t pipe, enum drm_plane_type type,
 		unsigned long possible_crtcs);
 
-/**
- * dpu_plane_validate_multirecti_v2 - validate the multirect planes
- *				      against hw limitations
- * @plane: drm plate states of the multirect pair
- */
-int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane);
-
 /**
  * dpu_plane_color_fill - enables color fill on plane
  * @plane:  Pointer to DRM plane object
-- 
2.39.2

