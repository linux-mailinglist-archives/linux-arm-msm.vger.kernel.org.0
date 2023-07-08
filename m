Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 423B874BABB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 03:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232853AbjGHBEX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 21:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232785AbjGHBEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 21:04:22 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E95D211F
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 18:04:21 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b700e85950so38175281fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 18:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688778259; x=1691370259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0P9HJbKd5pefh9k+jZU4bdKvFEyzVuBH1X6M1Y88Usw=;
        b=a31oq6OGAcje1AiL5IbM+GG5R4iC6rxEqOnqXyjsbF6PPiNnBUEnsOOgF96cYrrHix
         u3HV085kfkLm8BYOycBBxEDpIKfEzwPZlfAtyx0R//cfFo5G12ZKEq4Kfv3DdaSFzWe0
         BxJCIDSBUMCglZPgPRKRHNBffVsm7pcbBAwan4ojGk161+SKuDs5OSxTiayX+Jlfwwxp
         STYj+hdYQHVQsJo9360vpOFdVR1xV2EaWu7IYSP+x5Osv+jzZJkHTJ55s5N8WnggqfBH
         49GZ4MHVQ08Q3NS9joOBiN7jBo/EmTjn19Xls5JVK5dwwalefcW3k/+u0au+cPl9fS+W
         HwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778259; x=1691370259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0P9HJbKd5pefh9k+jZU4bdKvFEyzVuBH1X6M1Y88Usw=;
        b=B++erNo7VO+36jdKWEUSR99JWKvgoFvFcZutdbf5Pqe/MhbhZG8q6fL31inzM+n+uZ
         wrMYdn4gce+Ue+nUwVYqVhs/6N82xYeze4Z1T+ikcy7ura2CESokQAr6CJNNnOMvhKlW
         3FRpy5skFWmpfvmSuDRpGLcUEj2SND5Y0LwMmfLwXEuixwY+vleQ45aNQbEzESQTI4Tr
         ffLcVENSMrvxug2BqOObCOMFGvvY7WtDu6lz9OH/lhRxHPd8bpATzAL5muIHs0gc0GdB
         ZvH5AKfo6DwrBQmfTulTZmvbWxeVTQQOVDzVT8zbXvyxfATMCByF55FWSn3deGr/yQAE
         D01w==
X-Gm-Message-State: ABy/qLYF02jTCnpPrDQVdIWrwyTj11N5Kxd7vrXTW3LhhONXPnvY/p6N
        uDX4H57vBdEvAZzyNzVV7638ww==
X-Google-Smtp-Source: APBJJlHwrq0JaK65jl1O+8LqBBpBQvsLOv+4sKEHHZsvrO7eK2LShQ3hjSa0JnNcoGRMvVFOcPmZzA==
X-Received: by 2002:a2e:924e:0:b0:2b1:b4e9:4c3 with SMTP id v14-20020a2e924e000000b002b1b4e904c3mr5007689ljg.2.1688778259768;
        Fri, 07 Jul 2023 18:04:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:04:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 16/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_plane
Date:   Sat,  8 Jul 2023 04:04:06 +0300
Message-Id: <20230708010407.3871346-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change struct mdp4_plane allocation to use drmm_plane_alloc(). This
removes the need to perform any actions on plane destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c | 59 ++++++++--------------
 1 file changed, 20 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index b689b618da78..1149e6721534 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -20,12 +20,6 @@ struct mdp4_plane {
 	const char *name;
 
 	enum mdp4_pipe pipe;
-
-	uint32_t caps;
-	uint32_t nformats;
-	uint32_t formats[32];
-
-	bool enabled;
 };
 #define to_mdp4_plane(x) container_of(x, struct mdp4_plane, base)
 
@@ -59,15 +53,6 @@ static struct mdp4_kms *get_kms(struct drm_plane *plane)
 	return to_mdp4_kms(to_mdp_kms(priv->kms));
 }
 
-static void mdp4_plane_destroy(struct drm_plane *plane)
-{
-	struct mdp4_plane *mdp4_plane = to_mdp4_plane(plane);
-
-	drm_plane_cleanup(plane);
-
-	kfree(mdp4_plane);
-}
-
 /* helper to install properties which are common to planes and crtcs */
 static void mdp4_plane_install_properties(struct drm_plane *plane,
 		struct drm_mode_object *obj)
@@ -85,7 +70,6 @@ static int mdp4_plane_set_property(struct drm_plane *plane,
 static const struct drm_plane_funcs mdp4_plane_funcs = {
 		.update_plane = drm_atomic_helper_update_plane,
 		.disable_plane = drm_atomic_helper_disable_plane,
-		.destroy = mdp4_plane_destroy,
 		.set_property = mdp4_plane_set_property,
 		.reset = drm_atomic_helper_plane_reset,
 		.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
@@ -377,31 +361,34 @@ struct drm_plane *mdp4_plane_init(struct drm_device *dev,
 {
 	struct drm_plane *plane = NULL;
 	struct mdp4_plane *mdp4_plane;
-	int ret;
 	enum drm_plane_type type;
+	uint32_t pipe_caps;
+	const uint32_t *formats;
+	size_t nformats;
 
-	mdp4_plane = kzalloc(sizeof(*mdp4_plane), GFP_KERNEL);
-	if (!mdp4_plane) {
-		ret = -ENOMEM;
-		goto fail;
+	type = private_plane ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
+
+	pipe_caps = mdp4_pipe_caps(pipe_id);
+	if (pipe_supports_yuv(pipe_caps)) {
+		formats = mdp_rgb_yuv_formats;
+		nformats = mdp_rgb_yuv_num_formats;
+	} else {
+		formats = mdp_rgb_formats;
+		nformats = mdp_rgb_num_formats;
 	}
 
+	mdp4_plane = drmm_universal_plane_alloc(dev, struct mdp4_plane, base,
+						0xff, &mdp4_plane_funcs,
+						formats, nformats,
+						supported_format_modifiers,
+						type, NULL);
+	if (IS_ERR(mdp4_plane))
+		return ERR_CAST(mdp4_plane);
+
 	plane = &mdp4_plane->base;
 
 	mdp4_plane->pipe = pipe_id;
 	mdp4_plane->name = pipe_names[pipe_id];
-	mdp4_plane->caps = mdp4_pipe_caps(pipe_id);
-
-	mdp4_plane->nformats = mdp_get_formats(mdp4_plane->formats,
-			ARRAY_SIZE(mdp4_plane->formats),
-			!pipe_supports_yuv(mdp4_plane->caps));
-
-	type = private_plane ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
-	ret = drm_universal_plane_init(dev, plane, 0xff, &mdp4_plane_funcs,
-				 mdp4_plane->formats, mdp4_plane->nformats,
-				 supported_format_modifiers, type, NULL);
-	if (ret)
-		goto fail;
 
 	drm_plane_helper_add(plane, &mdp4_plane_helper_funcs);
 
@@ -410,10 +397,4 @@ struct drm_plane *mdp4_plane_init(struct drm_device *dev,
 	drm_plane_enable_fb_damage_clips(plane);
 
 	return plane;
-
-fail:
-	if (plane)
-		mdp4_plane_destroy(plane);
-
-	return ERR_PTR(ret);
 }
-- 
2.39.2

