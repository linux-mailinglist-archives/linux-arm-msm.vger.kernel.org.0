Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9B836A97CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 13:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbjCCM5r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 07:57:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjCCM5n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 07:57:43 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30A75D75C
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 04:57:41 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id z5so2212690ljc.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 04:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkRDIK8ume27O2eNp/2vFx54xBZXr96ITOU7VC+DkN8=;
        b=pLgAskMwSLOHvbGlkp3920Rvp6k7PQwShQp8X6sV+sMpWd0aXMpZiaTrancIpnZakH
         mjxsqd4tZ7rDgeHpbUmbqiUQFsCe8aJ+vTO5WCiYKVEaxiYd+Bia9gL08GDJw/X3T5WK
         /Tk5qvsHHzmQGAdkdhlswV3oUfm7416f2/hKDbcnOTjBw9q+6UNIhofls36ENSSKSSIf
         4SlIIyKsS1VjcnbYy9O8XlZ/DOwKJ0iicOMIy8z8tvXKo+Cb/+1N6+O+2Aewhgz4JOLm
         MEGyhNDs/gNP7XvvYITJm1PV1lChWcV0uUjlRODevTqe9+RChKm8wLgITNp+LUyuQWsN
         uKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkRDIK8ume27O2eNp/2vFx54xBZXr96ITOU7VC+DkN8=;
        b=sQUZH7MJLMhFLw3wnytnHkjIfXcSf1AEhvNW12DdCivLyPfnGWMdN7l2p8v70IzddQ
         SP98fmypgYy/X8Shp6fkN1bXxhmb6EqfWTU2ST3fdh/fKj1hxtXMsP3J/vaRL3LiKSI4
         tbQpab6S3+mNTU2raRtjI+ug+p8Bfii2kHqUIboPIwuo+SnQaW5ei+8HQm9t2IZgES1E
         ifO7gSPcpf5+YDhWln+YHRikv/wNbjqNPLUUptN9Z5RxPXHbLiGNIPMSM2uG9P2kIGVU
         vRlxMQLOK02SPGIXx4R8blkptLEA7Ej/hvXqgX8tTEJNm+I/UqzJ95LMBeRE0/dsTN/x
         JFCw==
X-Gm-Message-State: AO0yUKXrgjfuM/XZjO+dVrjFQkUYa165FYoMekF1t1R28evHnmbCM1Ca
        7t3E4sdiISR2TxoOoGo4lvhQwA==
X-Google-Smtp-Source: AK7set8ptLHioRKHlPEWMaeEZcNgJ9Pf97xTuWkvRShgA9+ob23HQPwp6+yWmS8mGU//lpyn2QxDGw==
X-Received: by 2002:a2e:b8d2:0:b0:293:5c72:b289 with SMTP id s18-20020a2eb8d2000000b002935c72b289mr688640ljp.4.1677848260307;
        Fri, 03 Mar 2023 04:57:40 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 04:57:40 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 21/30] drm/msm/dpu: simplify dpu_plane_validate_src()
Date:   Fri,  3 Mar 2023 14:57:16 +0200
Message-Id: <20230303125725.3695011-22-dmitry.baryshkov@linaro.org>
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

The plane's clipped coordinates has already been validated against FB
size in the drm_atomic_plane_check(). There is no need to check them
again. Remove corresponding checks and inline dpu_plane_validate_src().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 30 ++++++++---------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ba850e9feb9b..9c556ba9cb7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -894,25 +894,6 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 				old_pstate->needs_dirtyfb);
 }
 
-static bool dpu_plane_validate_src(struct drm_rect *src,
-				   struct drm_rect *fb_rect,
-				   uint32_t min_src_size)
-{
-	/* Ensure fb size is supported */
-	if (drm_rect_width(fb_rect) > MAX_IMG_WIDTH ||
-	    drm_rect_height(fb_rect) > MAX_IMG_HEIGHT)
-		return false;
-
-	/* Ensure src rect is above the minimum size */
-	if (drm_rect_width(src) < min_src_size ||
-	    drm_rect_height(src) < min_src_size)
-		return false;
-
-	/* Ensure src is fully encapsulated in fb */
-	return drm_rect_intersect(fb_rect, src) &&
-		drm_rect_equals(fb_rect, src);
-}
-
 static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
 						const struct dpu_sspp_sub_blks *sblk,
 						struct drm_rect src, const struct dpu_format *fmt)
@@ -998,6 +979,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
 
+	/* Ensure fb size is supported */
+	if (drm_rect_width(&fb_rect) > MAX_IMG_WIDTH ||
+	    drm_rect_height(&fb_rect) > MAX_IMG_HEIGHT) {
+		DPU_DEBUG_PLANE(pdpu, "invalid framebuffer " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&fb_rect));
+		return -E2BIG;
+	}
+
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
 	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
@@ -1012,7 +1001,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	/* check src bounds */
-	} else if (!dpu_plane_validate_src(&pipe_cfg->src_rect, &fb_rect, min_src_size)) {
+	} else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
+		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
 		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&pipe_cfg->src_rect));
 		return -E2BIG;
-- 
2.39.2

