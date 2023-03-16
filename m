Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA406BD54D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 17:18:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjCPQSB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 12:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbjCPQRs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 12:17:48 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAFA1E20E4
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:17:20 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id a32so2275621ljq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678983434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgpIshPLIz26q5GYwffD04oC8/71LMw16x5ByNtXinI=;
        b=il0FyRCbgaQoVXw9W/fHDujo7xBXvLuL1Cn6H/GFCBcGrAzqBpA7ql6GoFqD2YQvS+
         Ggh1GkWvB5l61zGqIS8aaht+Z4VuWi1uup+R6c8ZvLOYNHfrx2349+tr+ddeqms7CyX1
         AmWjxGfgPsUgnSG1gXyEOjBe48cvOmKCbE2ZPiEBs0N5eL29xE1sHVEZwJeEmVk3GvzA
         TdHzkvoDom580ORXmVbWExlHkPihl/1lIo9tyvjNjvhtaIKvkJ/FubriD0kHukTZxbXg
         xvHyqq6m8NaT3fa/a620zzPwJo2sTrEyH1fnP3SYNIC77fDBtJV1xnE9Z+2cio4hDNQS
         LE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678983434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgpIshPLIz26q5GYwffD04oC8/71LMw16x5ByNtXinI=;
        b=02BLw1+fCR2DJJB5E+eitMQmdhI2/2Nauxj/fMuBki5RLuSQxtJvoOoRfg3kCt1RMQ
         Bnaa10Jej6LYkxcESJsMhuTnIj9PHUoKUJR3k2+j/HP9DZTx7oyP5xTpHSqX0hUlyYXc
         Y2NY8wBtstuEHXJ6qMOUCtAd+DgZJCZm2jzWVRWk/lH/bn2MlzhQsVDh0k0S6dSHsxBq
         VXWOyMuuovp7n3pErHTdADP71U2WwalUId/URVZMSM05YM/XArQoyS2RruRQaDlqUQvq
         kv/JaZT9Z2wa8PY0fJJx5YZStvoKgAmZ/AIOBwiSdDep+KxOAKpOyP3hM4lxFzReyj29
         lgWw==
X-Gm-Message-State: AO0yUKWd46bwD1PwaHNBG7RAWrC6SMtZGteUFmlV1SV/xPX5ePGvi/d2
        4VrBSl+hAKI40vaNuzcp1LFhYA==
X-Google-Smtp-Source: AK7set/SXoS0H8F7m6vK0yMfSaFP0nwaMHPiFOjXlH8Zw7guKhC6Xsv4v1pLFMAe3VcAzH8TPL+CHQ==
X-Received: by 2002:a05:651c:502:b0:298:a79d:c721 with SMTP id o2-20020a05651c050200b00298a79dc721mr2763569ljp.3.1678983433967;
        Thu, 16 Mar 2023 09:17:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 09:17:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v7 21/32] drm/msm/dpu: simplify dpu_plane_validate_src()
Date:   Thu, 16 Mar 2023 19:16:42 +0300
Message-Id: <20230316161653.4106395-22-dmitry.baryshkov@linaro.org>
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

The plane's clipped coordinates has already been validated against FB
size in the drm_atomic_plane_check(). There is no need to check them
again. Remove corresponding checks and inline dpu_plane_validate_src().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
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
2.30.2

