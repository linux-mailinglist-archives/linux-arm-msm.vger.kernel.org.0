Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF6968A1B4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 19:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233519AbjBCSWF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 13:22:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbjBCSWC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 13:22:02 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917BFADBB3
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 10:21:59 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id n6so6004078edo.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 10:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAOkpQZBJYrBaVkKcS88f22lgVA7f+R2bKYgUh9S0rE=;
        b=HY0q76U2tQlTaepnNsYUTnllZq7G7PN3m5ogkGata/SS9FydvY4NK1YMzUwTPfDFhv
         DSSQZ+rcw645q+OpCq9IPWBkP+hnOBbKIEzbO2TL1gVYYqiaNPl6H8BtM2YCJMSa2ezh
         J+b4ZYXI2s0LmNkU4bvD+K0j8I/nMedRjOg7/dFrgwsX3+gIY2jOgsrRj9Y6h59Y1aFs
         dT3Ctn+iqJbSwz6oXflLwsbrpq6ZFFKk/5HXM5C7aLnp4y3fbb8a+gf94Kpsn7Vi02u4
         DyEWEEXoFclXhBTY/cK5MIFZU7KAnxtDZqrxj6E/dUrc8D73JIRBW7nosYWRxpp6GGOA
         J14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAOkpQZBJYrBaVkKcS88f22lgVA7f+R2bKYgUh9S0rE=;
        b=iyn3zmDYr7HUPPeoQGDcCiR3gG4RJ4sxWYbr2jI//wSUh6ewtPuzx7MWF59R3tvVrC
         csotGYKWuvU2JRzkkYcz72iqx+XH/29B1nwLjq4qYOOmrgQV96Nivu/7+n63uhOq6mi3
         TWP6rrSUq6SUOwqUo9OlQabRzKookAPbhBkDmxtYPFtffNsvEVddrOgizYzUORRe27Ay
         defBuqLUOMN7ORXAHLvk3p/D1QxL8iw3PK4VxEaTSvvNflPExXVrKYMqlww2CjuprVnw
         txk2+m2w9rccRdbM0RtFb+/4zjl4n21V7XcLKLO+RF4s35490FpZrF8zz1e8MWfzhqEO
         I8Yg==
X-Gm-Message-State: AO0yUKUKAjnY7OmO7XAMNbhbfZc7muVJExruMYu48lMebaFIAylZByft
        h+uDniUJSxrM9dE6X9/uaT0oBA==
X-Google-Smtp-Source: AK7set8jBmIN6QF6DFzq0VCjNkvIPdlLJ5QBziNeM6WaL251VvM8H2vatq9uJnSbOwuZsYUP1FZitg==
X-Received: by 2002:a05:6402:134b:b0:4a2:2e8a:14d8 with SMTP id y11-20020a056402134b00b004a22e8a14d8mr10379187edw.30.1675448518134;
        Fri, 03 Feb 2023 10:21:58 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 10:21:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 21/27] drm/msm/dpu: simplify dpu_plane_validate_src()
Date:   Fri,  3 Feb 2023 20:21:26 +0200
Message-Id: <20230203182132.1307834-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
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
index ecf5402ab61a..0986e740b978 100644
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
2.39.1

