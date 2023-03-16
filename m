Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC7956BD559
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 17:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjCPQSG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 12:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbjCPQRv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 12:17:51 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DFB5E2521
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:17:26 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id h9so2277534ljq.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678983444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H58nSt4BFYiRlxyFggmxueaHdrJS7Rv3eofQcVYy9p8=;
        b=qPRi50YBS/Q5D52U103P+0HNtDPa2XSO7ZN+euHclRBx/YYoGaXZ8RU9o4qMyI+vXN
         x9yG8dRaARyf7CvHEAbcjdrR/asxB8/uQ75BWHoL34X7Bv7ob5HTbh6+yat2uvuEjwMj
         k7ztFqc8/vGSwG8og5kAqC4HO3JVpI+sqZZovP18LBcSb8eZeEJMHv8Hsht/+jCgPa5p
         DggRR65w+78Yfwhrfqe3XLjEWPfkdfGu7ooUIMcoikNGEdgnbH3rtlnGAZmyIJtbpsOt
         aARCbHk1KJBMSurulTS3FQI+suPPbtaxnD5LaUx1V+DZXqfbivemLStY1X3PWC6beWlH
         56Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678983444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H58nSt4BFYiRlxyFggmxueaHdrJS7Rv3eofQcVYy9p8=;
        b=p2IEnmbJuKTs/514jIB/8MI1OoT+UBJz/ZMylA2uLT2ehvqxr+y4FuHa7XaX2vZmUW
         iug4wxvoXxfBqzjf5oBNLcDdtP2e8VSUjOj+FRDBqVs/Mvy41j7kvEnCm0kqXjTTBKpr
         GwpAJ0lzSTuZemh8CWKqUDuz/CTTMByEkTSpE3ky4YHOJeEfxBejIF20psEfMYXg+M69
         hCrQUvKRk5OLUJZ5AgwoFkl3yEoYsj6Lb3y1wX1lCFs37fRKna6ZLaWc37DUGg6XXwb5
         KwWyP3BikX90BZECpkpMgX1VgStOZbo1LebuZpL91kU180Ub0aIU02wx3stfhK/MQzY2
         PYVg==
X-Gm-Message-State: AO0yUKXArAeWn2eURvH1GAmAk7a2zU+bO8okJrvHij6EJuDsQckxRju4
        Ttb7tfb/wNvJJFHwwNGDrJ7uvQ==
X-Google-Smtp-Source: AK7set+LcBLtUI79kfVcgZ14VOjXZF2so0YN+Fe6sZopdDpuwfUD/qbifZcfC8PW2EpzSsZnmFFOxg==
X-Received: by 2002:a2e:8e70:0:b0:293:2d80:dfe with SMTP id t16-20020a2e8e70000000b002932d800dfemr2437180ljk.12.1678983443802;
        Thu, 16 Mar 2023 09:17:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 09:17:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v7 32/32] drm/msm/dpu: remove unused dpu_plane_validate_multirect_v2 function
Date:   Thu, 16 Mar 2023 19:16:53 +0300
Message-Id: <20230316161653.4106395-33-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

After cleaning up the older multirect support the function
dpu_plane_validate_multirect_v2() is unused. Lets remove it.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
[DB: also drop struct dpu_multirect_plane_states and R0/R1/R_MAX]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 118 ----------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  17 ----
 2 files changed, 135 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 73db15d76059..2e63eb0a2f3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -47,13 +47,6 @@
 #define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
 #define DPU_ZPOS_MAX 255
 
-/* multirect rect index */
-enum {
-	R0,
-	R1,
-	R_MAX
-};
-
 /*
  * Default Preload Values
  */
@@ -707,117 +700,6 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
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

