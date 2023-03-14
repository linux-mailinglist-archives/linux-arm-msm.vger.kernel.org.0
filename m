Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB30F6B99E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 16:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbjCNPiR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 11:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbjCNPh4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 11:37:56 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701AEABB0A
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:37:03 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id y14so16443667ljq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678808169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCPzZ1cychu0OUgOZNR9WWIZNNnjC8fiTwJ8RQSNivs=;
        b=M1A/D0rqTPJyCssFt0ZFFcuBHdGQmfTIR8c05au1F0o/EKL4eHv/47wxMyh2LWQk0y
         Mxx70YKbzFEkVkRGoihHbY2/TPUzOwx+H5AljaViphMsXoEg0HwYG9RZtrNzJPq4iS/X
         k2AaBsOFHMImMNlPQH/ds8ZXWlJDp2EKpWBu3CECWq0G65/T7BkxyEYhMHznIbiyzLmq
         Pp78Ov7bucB1ol2U9+DTEJCm98v10NCsPJVI+6uHHpyD/cy6LY9ltFOlPZLw+eoBcZGq
         x9qvjw6AgJ6Rf1occPUnpb4ZVsEYxkxM9V6SgI+ivCNgw8jpe3Bg+WKoWBJJzYBbnqGd
         QfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCPzZ1cychu0OUgOZNR9WWIZNNnjC8fiTwJ8RQSNivs=;
        b=j1Eaj81ZyaAKArGkrIJeWRCRxcMmR4O0RHFMDSeGyZQyWyRLBcNO3IZxxOqqc+XUoW
         baOnsTEOEkwYtv/4+KP+8DXnP8pi1YwDwUgLlRqs7Z6LEZMhXwhxkbvfJ3ojV9kFFLeE
         Oq3ys53CLu1wQiSqpwC1V/pmQjShTZ5tGn82lHE5O9PIuVJhTTEA0xvh/Mf9/PEUsh7U
         FuWvG7ExGt6nPAHpAJ7n5JUJTYRvQXqj8d3Ts3i2WQqrzX6IOacCRaIHBdQdR3RVCzHX
         Zb11DAzakFx6hxPDOdIOR7xe2mjqfi4/9oMga/WGKLoJI1sv+1txLdkq+Y0lT03yCCE7
         iPRg==
X-Gm-Message-State: AO0yUKWcqIyxP/wuKL03PjFqqjgVsVt05zt2ZF6Z8eOZapxgVXR10ipE
        BnkM8bbUaKZLTMu7vW7F1/o09Q==
X-Google-Smtp-Source: AK7set+2euD9jIKStIIJvyzs8z0deAMdjOS4IMkSX6MuZJqFhgpFOnp4UpCxBi2L1FEzxxSMbMEJQw==
X-Received: by 2002:a2e:ba15:0:b0:295:a2a6:672 with SMTP id p21-20020a2eba15000000b00295a2a60672mr13646309lja.10.1678808169134;
        Tue, 14 Mar 2023 08:36:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:36:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 32/32] drm/msm/dpu: remove unused dpu_plane_validate_multirect_v2 function
Date:   Tue, 14 Mar 2023 18:35:45 +0300
Message-Id: <20230314153545.3442879-33-dmitry.baryshkov@linaro.org>
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

After cleaning up the older multirect support the function
dpu_plane_validate_multirect_v2() is unused. Lets remove it.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
[DB: also drop struct dpu_multirect_plane_states]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 111 ----------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  17 ----
 2 files changed, 128 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 494c1144075a..177338603ef3 100644
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
index 7490ffd94d03..abd6b21a049b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -50,16 +50,6 @@ struct dpu_plane_state {
 	unsigned int rotation;
 };
 
-/**
- * struct dpu_multirect_plane_states: Defines multirect pair of drm plane states
- * @r0: drm plane configured on rect 0
- * @r1: drm plane configured on rect 1
- */
-struct dpu_multirect_plane_states {
-	const struct drm_plane_state *r0;
-	const struct drm_plane_state *r1;
-};
-
 #define to_dpu_plane_state(x) \
 	container_of(x, struct dpu_plane_state, base)
 
@@ -87,13 +77,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
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
2.30.2

