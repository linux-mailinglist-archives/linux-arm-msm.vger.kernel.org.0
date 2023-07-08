Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB3974BAB4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 03:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232533AbjGHBET (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 21:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232526AbjGHBES (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 21:04:18 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37A6210B
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 18:04:17 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b70404a5a0so39865531fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 18:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688778256; x=1691370256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=598BryRQCllm5ISOzEN9gochJO1I/MNw3Ujjm+xPuLs=;
        b=vj5PfahW28Im1lZ0vTFaFlu7Umhyqg3iCSlOaDS8k71IIhB1GZSrJg+c4K6+enjnfl
         dgBPf+NLFQxVuV7KrbmNnk9eq44WhovgAFRiCdS4fJC9Vq8yPrym8vvbxZcxvA/igfPA
         8zpNyW+ushWolMOSyiMGHnqPGmCzsRet2Pbmk3DV38NSarDX6F/kjBsQsLwmsRDWaRf5
         yzj4lbQsxaLaScfsQnBQoRK/O42wlwgq+0A9TqeqndlG5F46A5hTIBrct1SvLPc/4QN4
         ghSCrv3wkt6RKud+OzoQryZWymibgvPJZhRZhVy4Dwi1RJe7/qH3462XUkJbr74LFK0d
         acKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778256; x=1691370256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=598BryRQCllm5ISOzEN9gochJO1I/MNw3Ujjm+xPuLs=;
        b=kl75RXIz9CWVo3mo34LH9DgsNxhSM3Ku1jViDpcq2JrLxCRTuqM6MA11TW5CnVwqcU
         szshTO8KLiwdUJWAYiH0IAG9KdOKGtd5kSlkIFxd413/65ptQ0oQT8W7Xl5Dfa0E9QIE
         7/8WVzLouQudLECDvBrk/4apYMfM0iwbKHZ4t7RUSGqZZHdF2te5+Xz+Ujb7oZRvFhZB
         qvQ7ASOZfyKBs2q7yCwztIL0siAfRUyuMBPTCUcrK/XRS4WABfrfRBPbufpVIZqD+CWk
         ekVjusDbinp8Do/J1qZTUvcC5Q9Fn5b1w5Oq94Eoidk0c21DeScTSKTj0VgKRLYRCrSy
         qC+w==
X-Gm-Message-State: ABy/qLaTiCykKDg8BILbmc3ma6zzLWhcZTBHVzqWgXw2EUXXNHL7VMI/
        QXUfH8iBCZiogWMOIf/vq8MpQg==
X-Google-Smtp-Source: APBJJlG0kajx57KenGJOCjZPD7CvtA81GcxS6VxCtq7C2DZCC5UbaybVopoQ7PdMjLL2U15AzqjOPA==
X-Received: by 2002:a2e:9b44:0:b0:2b7:a64:91bd with SMTP id o4-20020a2e9b44000000b002b70a6491bdmr4427171ljj.35.1688778255736;
        Fri, 07 Jul 2023 18:04:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:04:15 -0700 (PDT)
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
Subject: [PATCH 10/17] drm/msm/mdp5: use drmm-managed allocation for mdp5_plane
Date:   Sat,  8 Jul 2023 04:04:00 +0300
Message-Id: <20230708010407.3871346-11-dmitry.baryshkov@linaro.org>
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

Change struct mdp5_plane allocation to use drmm_plane_alloc(). This
removes the need to perform any actions on plane destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 40 ++++------------------
 1 file changed, 6 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index bd2c4ac45601..177fc1a56aad 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -17,9 +17,6 @@
 
 struct mdp5_plane {
 	struct drm_plane base;
-
-	uint32_t nformats;
-	uint32_t formats[32];
 };
 #define to_mdp5_plane(x) container_of(x, struct mdp5_plane, base)
 
@@ -38,15 +35,6 @@ static bool plane_enabled(struct drm_plane_state *state)
 	return state->visible;
 }
 
-static void mdp5_plane_destroy(struct drm_plane *plane)
-{
-	struct mdp5_plane *mdp5_plane = to_mdp5_plane(plane);
-
-	drm_plane_cleanup(plane);
-
-	kfree(mdp5_plane);
-}
-
 /* helper to install properties which are common to planes and crtcs */
 static void mdp5_plane_install_properties(struct drm_plane *plane,
 		struct drm_mode_object *obj)
@@ -139,7 +127,6 @@ static void mdp5_plane_destroy_state(struct drm_plane *plane,
 static const struct drm_plane_funcs mdp5_plane_funcs = {
 		.update_plane = drm_atomic_helper_update_plane,
 		.disable_plane = drm_atomic_helper_disable_plane,
-		.destroy = mdp5_plane_destroy,
 		.reset = mdp5_plane_reset,
 		.atomic_duplicate_state = mdp5_plane_duplicate_state,
 		.atomic_destroy_state = mdp5_plane_destroy_state,
@@ -1014,25 +1001,16 @@ struct drm_plane *mdp5_plane_init(struct drm_device *dev,
 {
 	struct drm_plane *plane = NULL;
 	struct mdp5_plane *mdp5_plane;
-	int ret;
 
-	mdp5_plane = kzalloc(sizeof(*mdp5_plane), GFP_KERNEL);
-	if (!mdp5_plane) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	mdp5_plane = drmm_universal_plane_alloc(dev, struct mdp5_plane, base,
+						0xff, &mdp5_plane_funcs,
+						mdp_rgb_yuv_formats, mdp_rgb_yuv_num_formats,
+						NULL, type, NULL);
+	if (IS_ERR(mdp5_plane))
+		return ERR_CAST(mdp5_plane);
 
 	plane = &mdp5_plane->base;
 
-	mdp5_plane->nformats = mdp_get_formats(mdp5_plane->formats,
-		ARRAY_SIZE(mdp5_plane->formats), false);
-
-	ret = drm_universal_plane_init(dev, plane, 0xff, &mdp5_plane_funcs,
-			mdp5_plane->formats, mdp5_plane->nformats,
-			NULL, type, NULL);
-	if (ret)
-		goto fail;
-
 	drm_plane_helper_add(plane, &mdp5_plane_helper_funcs);
 
 	mdp5_plane_install_properties(plane, &plane->base);
@@ -1040,10 +1018,4 @@ struct drm_plane *mdp5_plane_init(struct drm_device *dev,
 	drm_plane_enable_fb_damage_clips(plane);
 
 	return plane;
-
-fail:
-	if (plane)
-		mdp5_plane_destroy(plane);
-
-	return ERR_PTR(ret);
 }
-- 
2.39.2

