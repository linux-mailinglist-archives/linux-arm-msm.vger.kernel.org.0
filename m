Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6436590EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 20:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234008AbiL2TTU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 14:19:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234009AbiL2TTR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 14:19:17 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A712A140A1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:16 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 1so28744369lfz.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3z7cTtmMGquXrl4qC30QYnlf1FGLEKUraRX/smFo6E=;
        b=yby6BHnVWgMDpXylSvbYcgJIhLQluU0tPNg/btT84gCrXykdu71AMYlbEpK8c5Ui/z
         kq+pSip/WDZ0GHEWcZACf5b4V3g5fEcsJGLH6qH4sP9YuRKMjIIy4LzIXBgTb90HpfmW
         g+NwNiJ2CfKNPU145TdSyGDEOQ9R208NhGMBwsjwkCek/oy9LWVY/wGOJslcofs1ttDf
         F0X1442zizpHV7mUWemIaqeHD3IZomlT2WvoLrpxQxiK5vyF7sU9t9ihR3ECmzNvxTlw
         GvIEQw8jYJwc+SSra94UuMfXMpwQE78wiOgyD+q08R0EGrKtCFPtKY9pEBNHlvv6SpNL
         yFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3z7cTtmMGquXrl4qC30QYnlf1FGLEKUraRX/smFo6E=;
        b=hALFHgnCQYHRMHghp+FK2fYBVPP4+OyPQO9lvRjphb+DBpy9yG2sKMZKzQktDUKObJ
         sCObnM+UB/rxzhoJp572KJjDLwRWvzEax7d+dNNCgZ9r3jJM7EcLYLWgspqUnU5lNtj/
         pxTajVp5Cv8g3cLT8R4ELHKWPjOpSaym3AgQ0EiqHfKg6NSR0XXXURzFESQLQ6eHhMz7
         jQvC6aHk5mO71ZEk+Ftm2uI5QYs/HNKeJRt9lsgoxBmnf3xKbaXy5R+4RRitM9x6xByU
         OtKqeeKNDF7rsesWzZNObQ1B71I802sJufu8qicPCV7mmUX+183snWzi/PU714YOByuD
         e5ZA==
X-Gm-Message-State: AFqh2krpEyC0h6g3GfSOpTekz///fVqBbbS8BZyOlR0WPGW9oPSjIkcJ
        FW7gN5AYoxR7TkKImxDoovTxQA==
X-Google-Smtp-Source: AMrXdXttRP03pQCPnGGb47vZceJ+4CSnSqmhhnNzg4yVXDQ4iZc8e3ss8nwUu1TAL8AuWxhM+ibIHQ==
X-Received: by 2002:a05:6512:16a8:b0:4b5:b7ba:cae with SMTP id bu40-20020a05651216a800b004b5b7ba0caemr8566894lfb.48.1672341556264;
        Thu, 29 Dec 2022 11:19:16 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 11:19:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 18/27] drm/msm/dpu: simplify dpu_plane_validate_src()
Date:   Thu, 29 Dec 2022 21:18:47 +0200
Message-Id: <20221229191856.3508092-19-dmitry.baryshkov@linaro.org>
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

Since the driver uses clipped src coordinates, there is no need to check
against the fb coordinates. Remove corresponding checks and inline
dpu_plane_validate_src().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 30 ++++++++---------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ff32c28ee16a..a2c891034512 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -906,25 +906,6 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
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
@@ -1010,6 +991,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
@@ -1024,7 +1013,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 
 	/* check src bounds */
-	} else if (!dpu_plane_validate_src(&pipe_cfg->src_rect, &fb_rect, min_src_size)) {
+	} else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
+		   drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
 		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&pipe_cfg->src_rect));
 		return -E2BIG;
-- 
2.39.0

