Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBA224F5F5E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 15:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbiDFNXY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 09:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233436AbiDFNWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 09:22:40 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158BA63E019
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 03:13:31 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id k21so3241468lfe.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 03:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y7XhTOS8dyDsJq/tLHxB8s8UpB/ZC8LdUdSKfZZti7Q=;
        b=lBMNDe7gQCC4ebFNFGkC26gogyipiwJpnq+UUgho6W5FDPVtZBBJ2TbdeFuD8Iyws+
         0Cmjjd3a0qkYR7ffYMxGZTDCCyCDSyC1fD/L9e0WpxuJ/9lOOSu3wvby4164Vt0A5v82
         wgr+U7vIb9Vn39TSzE7EnXeyutb87PFKKZn1aKLpZrB2o7WsbZX4IMOba2V2z9wEq5Ul
         pxNRKtcTzfWjzg8AmtL4Kne50qx+kWZuFgjqDD8gYEdD/q4tCCfnxKaVDShJcHtEKYd7
         CJh6PIa+skjqafUh/UJqNC/lxBCWT1ZoW78W2NnC/9J4AqKabCf62PtwBx1Tv4HJAssl
         RdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y7XhTOS8dyDsJq/tLHxB8s8UpB/ZC8LdUdSKfZZti7Q=;
        b=O57FJVMsK9uQ1y8cgQ/TT6qFxqbVEccElV+nDefNdyLEX48hQ+9sPTAojEJ8lpMCAg
         wTuYa8X2eDUPlG3cnAIkw0X3s8sCz3DZvLxVuS1ScB4utfM/KSBjUWV1OFByr545sc/P
         MuXpm08zcnAMm42ic3SwU+dV3iZDlJ+Zc9ZzVnmiOcgaPuxNwo18rJ8XJZb2ZUtCTW4O
         6XtW1xJgykXJf/Tplzhaw/wiUDpzh6nRlqbWlXTcuYi1aDsojNNgooMyA5EQz3XgqrGH
         x3uv94fbWZFjb8oVFcpv4AFeJFjp2sGiRzWIOIYxFumMjKWjXZUdYMejTxG7jRdBk1tL
         3rdg==
X-Gm-Message-State: AOAM533Xvl1b398yqSu7cmREhSLx4AN3RgntIGLhi9RbzINa85A6ZbR/
        fAF3WxUErgvgJyCPp82oCSiMcA==
X-Google-Smtp-Source: ABdhPJyLBSnTtkWo/vQTUbP0vBJBZvPflYJTgehBeZ456ZJrkY0WQK6Nu1zweHG/3EPRSjO68Tok4w==
X-Received: by 2002:a19:7501:0:b0:44a:2f6f:3ae8 with SMTP id y1-20020a197501000000b0044a2f6f3ae8mr5430428lfe.143.1649239969985;
        Wed, 06 Apr 2022 03:12:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i4-20020a056512340400b0044a310f72f6sm1782154lfr.250.2022.04.06.03.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 03:12:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/msm/dpu: remove manual destruction of DRM objects
Date:   Wed,  6 Apr 2022 13:12:45 +0300
Message-Id: <20220406101247.483649-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406101247.483649-1-dmitry.baryshkov@linaro.org>
References: <20220406101247.483649-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
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

