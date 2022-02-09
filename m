Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 353644AF839
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234599AbiBIRZw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238155AbiBIRZn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:43 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC683C05CB8C
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:45 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id m18so5559209lfq.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zscC5lsPDSIUC6EIflLZwP0Y4/X7Lz0x0KN68AEWQMk=;
        b=QdWHP8/Jdki2lNNzdtGCQvLFL4SXOXshlqCxTM20bK7p+s1RSUDy1VHaAU7bBnSVuW
         oKq4s2h2UkO2nScV0h7MciS2lQABo9gmuSfI7W5J84gmWZMPijZoEgih8gpXyxsD9Zi7
         5shvEtZ2HsbohQWFMPWEgRHO11n+RHNOTc0xbDlYkg1+uQuj0a0PqAboGmBAS3vPIonW
         2sWMkk4qV7zxb6L211whh/ZknaxF6ahfbkFvl+ADmwQ6JtEBjuMULgB2jZB6GHaZmrYR
         q6gp5T9uabXckj4zx9Fx9svIxpwOvTIUPJe/2WYo2OZ23KXsaElTSbX+Pik3uXZ4/Hnj
         fEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zscC5lsPDSIUC6EIflLZwP0Y4/X7Lz0x0KN68AEWQMk=;
        b=HwTiTjoW5lz/Q4/r1uERVYSQsBzwHplkoz+0AaOiy5mZbuZOc1xlrSVC4UbMyr2FqD
         BbfPLDa0Pd0pDEv8FWJ0ICt4EpGE2xztV36Ur8NNP8myQy6VXg2kvSiZMUOsSCZ/uRNj
         SXFPmLXyjtyAfaf70jjT385wAQpfGNQwKYklHmeVnI79brRe01xnzq9WkU8w2tHWqPQV
         j8z+glvlpbw7fo46YnwRpYEB6adv48VTTBsDxCo7KNAa/mas1fL9RbzzdC76V5hoDSIm
         1Uy2/0imR63hqXHQTGJsjtoXfmNWJOafjo2XPx/JwzOcBM/5nLeQ+Z/Y2P49iaCFq9Fo
         lnRQ==
X-Gm-Message-State: AOAM53049H+EDsKiB/1G5CiQ1tJqgQBYv8wgNn/yMxQ12o/tKbpU4L7T
        TdVKnkmMyUBhLYvmm3G0/4H7Bw==
X-Google-Smtp-Source: ABdhPJzkZXFPBFN2hKc8oso+UxgdZ4tDXH2HyH2lU8xqTax0xsSLhLo3+Fax23zqexzS1tkZYKjxFQ==
X-Received: by 2002:a05:6512:3dab:: with SMTP id k43mr2258606lfv.385.1644427544191;
        Wed, 09 Feb 2022 09:25:44 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:43 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 21/25] drm/msm/dpu: simplify dpu_plane_validate_src()
Date:   Wed,  9 Feb 2022 20:25:16 +0300
Message-Id: <20220209172520.3719906-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since the driver uses clipped src coordinates, there is no need to check
against the fb coordinates. Remove corresponding checks and inline
dpu_plane_validate_src().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 30 ++++++++---------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 863aedcda66e..37810948ffe6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -874,25 +874,6 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 	msm_framebuffer_cleanup(old_state->fb, old_pstate->aspace);
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
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
@@ -947,6 +928,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
@@ -961,7 +950,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	/* check src bounds */
-	} else if (!dpu_plane_validate_src(&pipe_cfg->src_rect, &fb_rect, min_src_size)) {
+	} else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
+		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
 		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&pipe_cfg->src_rect));
 		return -E2BIG;
-- 
2.34.1

