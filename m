Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94B8A4F5645
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 08:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245706AbiDFFjI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 01:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1449336AbiDFCuM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 22:50:12 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FDE6A049
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 16:51:03 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id m3so1151748lfj.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 16:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g8HxgIzIziq2OPXz19ooLUkTn3BguDIOwpX2djsD+HY=;
        b=P8RMabMdq4cwuY8w13Ud8vFPiw6cnkxqe3MbSGE9965Ye6eJ+Y/UqF+6rDVOqffmd4
         HSg7gWsjMdz+PiGTimTBKlfSvaam00z56zgxoHIeNb1LceTKU0LwBIWSZCaOIIr6GiU6
         aAf3bzrplG+HVSCIVyVY7dmlWcr/3E0087ryUeEYU7n7/v7pV2O5NamgRcQSuNnifvB1
         BSegDDD2fvD+NZFsuU6wn4CLSFTNz+JBCxPgBGPLnZNTkDwtpwzVvOtKK5mLX6LxWyPL
         LHBE2XlQTW0PeEocHa/fiGTBESbcLm5XcwjUZ3iRni/XQpK8ueY1r6GSBbY11d8z5ui3
         mB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g8HxgIzIziq2OPXz19ooLUkTn3BguDIOwpX2djsD+HY=;
        b=g6OPl7tnrfwmARNLv9JUxCMRHIFwGzeSMDOmKHZ9x6QjWO0ivh3SboCoXB2WnJSfBo
         Hb4B6ErGLfvIdxU06cROVbpQFPMQO06Xb8oWu02rSwOo6STCfQ8mUcn1SJjdaozF6Nr4
         MmDS2Wujhzx/xPhT0bNuCGppYLO4LhZA5kv9CA13vc2LRRuDCbOncb8XKJr98gtgBXDi
         rkSnfSfTybPhVLdwR+re3V9ufanchx6K47JK8WMFvd1BlTHON07CB1RyPSYLLQTKUF3z
         puWOISI6ETobuRTTEkUUyPQyciUPlpv1z0ecEIVe/D4i6P+szwmrogaMsqwMc7o4BoM3
         v+Qw==
X-Gm-Message-State: AOAM530LSwF9Lx4EgKiOtHmJd8IMI3Z7NTnhK3wo8PZEh7GQAoVOIn+W
        H/PqBz6eQP8U8scogvgx/rXdIA==
X-Google-Smtp-Source: ABdhPJwUuy03sVyyX7SdKutpm2TdEedWDMODXc0jfw0XMizE3ABHzmKRS9JmwP0YF7WkHkpH2dwbLw==
X-Received: by 2002:a19:4f1a:0:b0:44a:22fa:704 with SMTP id d26-20020a194f1a000000b0044a22fa0704mr4148471lfb.59.1649202661533;
        Tue, 05 Apr 2022 16:51:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f26-20020a19381a000000b0044ad7a29b4csm1645280lfa.37.2022.04.05.16.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 16:51:01 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm/dpu: remove manual destruction of DRM objects
Date:   Wed,  6 Apr 2022 02:50:57 +0300
Message-Id: <20220405235059.359738-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
References: <20220405235059.359738-1-dmitry.baryshkov@linaro.org>
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

Remove manual removal of DRM modesetting objects, it is done anyway by
the drm_mode_config_cleanup() called from msm_drm_uninit(). Other
MSM display drivers (MDP4, MDP5) do not manually destroy objects and
trust generic code to do it's work.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 33 +++----------------------
 1 file changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e29796c4f27b..d0525a9ea92b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -675,30 +675,6 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 	return rc;
 }
 
-static void _dpu_kms_drm_obj_destroy(struct dpu_kms *dpu_kms)
-{
-	struct msm_drm_private *priv;
-	int i;
-
-	priv = dpu_kms->dev->dev_private;
-
-	for (i = 0; i < priv->num_crtcs; i++)
-		priv->crtcs[i]->funcs->destroy(priv->crtcs[i]);
-	priv->num_crtcs = 0;
-
-	for (i = 0; i < priv->num_planes; i++)
-		priv->planes[i]->funcs->destroy(priv->planes[i]);
-	priv->num_planes = 0;
-
-	for (i = 0; i < priv->num_connectors; i++)
-		priv->connectors[i]->funcs->destroy(priv->connectors[i]);
-	priv->num_connectors = 0;
-
-	for (i = 0; i < priv->num_encoders; i++)
-		priv->encoders[i]->funcs->destroy(priv->encoders[i]);
-	priv->num_encoders = 0;
-}
-
 static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 {
 	struct drm_device *dev;
@@ -721,7 +697,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	 */
 	ret = _dpu_kms_setup_displays(dev, priv, dpu_kms);
 	if (ret)
-		goto fail;
+		return ret;
 
 	max_crtc_count = min(catalog->mixer_count, priv->num_encoders);
 
@@ -746,7 +722,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 		if (IS_ERR(plane)) {
 			DPU_ERROR("dpu_plane_init failed\n");
 			ret = PTR_ERR(plane);
-			goto fail;
+			return ret;
 		}
 		priv->planes[priv->num_planes++] = plane;
 
@@ -763,7 +739,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
 		if (IS_ERR(crtc)) {
 			ret = PTR_ERR(crtc);
-			goto fail;
+			return ret;
 		}
 		priv->crtcs[priv->num_crtcs++] = crtc;
 	}
@@ -773,9 +749,6 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 		priv->encoders[i]->possible_crtcs = (1 << priv->num_crtcs) - 1;
 
 	return 0;
-fail:
-	_dpu_kms_drm_obj_destroy(dpu_kms);
-	return ret;
 }
 
 static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
-- 
2.35.1

