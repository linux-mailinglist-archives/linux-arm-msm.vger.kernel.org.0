Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8275745337
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 02:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjGCAhy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 20:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjGCAhy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 20:37:54 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A81161BF
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 17:37:51 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b5c231f842so56500341fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 17:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688344670; x=1690936670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93jFhS1FMTLrnvHTPQNzVi4tMfuOvCP3+OwFQYB80dc=;
        b=oveRFf+qZKlMD8iIj2W2xDE//gM0strzsIrwXIcuiKSjbOhCrPjugoVnM4bgVODI6y
         AOWyPo4BjaWHMA+RXYs6D5EI7v+HNVbA2ZaLt8IAye1RL658prp6f+bnzKV+3N6tVJT7
         rlwIO5MrNwkG4REHrZB9jtxIm2OoCne4cKHqCyb4Jftv7c4drJq3tquSE8ZmgB3LNlOv
         8skseV8B3D1/0G1Y0UveONv90ABFm288BZ/migk06CejXcPi0hzz48l5O25GuZxJoBk5
         CmDzWfFM5oBbRGZDOzWa1X2VZmqPP8UR/u/pedidojVbLrKU7YnW6WmXhV5qJa0BkJDs
         kRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688344670; x=1690936670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93jFhS1FMTLrnvHTPQNzVi4tMfuOvCP3+OwFQYB80dc=;
        b=QiftKCJ6BI1ZnkXQnLM5g0DwVqxAjB2MbA5e99VcDsLo6ejBFXmEimWMArpl5A9kpy
         OGH9Mr1Py/mgnFhJ5p7WzXwTfsAlp+3VhMlqPvBUKNp+9XITa0Wk5Y8XE+dZ5jJIOjUv
         dtSFTv9eT87uthdRJ6YPqv6rVTTxtY4ELBPR++W5+6fsvLe3SeqEYbsW6XMmm7wS53D0
         3VjctNGDQinI4d9QxoFovh6A1A8p9DWWTcgQiooxBlMof5zrcM1afKtbUod8XobhuLFj
         bR3NxJ5G+gjmI5Hwh+EdN+8J5/ljc6osXAq8Sy5lCTaWBbypdD+i0heYUBm2YfyIyIHd
         Obuw==
X-Gm-Message-State: ABy/qLZk927P7vW0P2nTKeU0g283pW84LhH/jGo9PSZlbzwapAWypmHJ
        y+GURCx5MiONFP6urRM98wHZug==
X-Google-Smtp-Source: APBJJlHVGpUB4uRGxt5TWIBFwRBLsHdWhRj18cm7VkDHfJNM+HZXqTpUJMXOywHMSZhTRTttDpOQ2Q==
X-Received: by 2002:a2e:87c4:0:b0:2b6:de41:b72f with SMTP id v4-20020a2e87c4000000b002b6de41b72fmr2653817ljj.4.1688344670021;
        Sun, 02 Jul 2023 17:37:50 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 17:37:49 -0700 (PDT)
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
Subject: [PATCH 04/13] drm/msm/dp: switch to devm_drm_bridge_add()
Date:   Mon,  3 Jul 2023 03:37:36 +0300
Message-Id: <20230703003745.34239-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
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

Make MSM DP driver use devm_drm_bridge_add() instead of plain
drm_bridge_add(). As the driver doesn't require any additional cleanup,
stop adding created bridge to the priv->bridges array.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  9 ++-------
 drivers/gpu/drm/msm/dp/dp_drm.c     | 21 +++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 +-
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1267e3dbcb1a..7fa245629251 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1540,7 +1540,6 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	struct dp_display_private *dp_priv;
 	int ret;
 
@@ -1558,17 +1557,13 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	dp_display->bridge = dp_bridge_init(dp_display, dev, encoder);
-	if (IS_ERR(dp_display->bridge)) {
-		ret = PTR_ERR(dp_display->bridge);
+	ret = dp_bridge_init(dp_display, dev, encoder);
+	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
 			"failed to create dp bridge: %d\n", ret);
-		dp_display->bridge = NULL;
 		return ret;
 	}
 
-	priv->bridges[priv->num_bridges++] = dp_display->bridge;
-
 	dp_display->connector = dp_drm_connector_init(dp_display, encoder);
 	if (IS_ERR(dp_display->connector)) {
 		ret = PTR_ERR(dp_display->connector);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 785d76639497..284ff7df058a 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -272,7 +272,7 @@ static const struct drm_bridge_funcs edp_bridge_ops = {
 	.atomic_check = edp_bridge_atomic_check,
 };
 
-struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
+int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
 	int rc;
@@ -281,7 +281,7 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
 
 	dp_bridge = devm_kzalloc(dev->dev, sizeof(*dp_bridge), GFP_KERNEL);
 	if (!dp_bridge)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	dp_bridge->dp_display = dp_display;
 
@@ -307,14 +307,18 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
 			DRM_BRIDGE_OP_MODES;
 	}
 
-	drm_bridge_add(bridge);
+	rc = devm_drm_bridge_add(&dp_display->pdev->dev, bridge);
+	if (rc) {
+		DRM_ERROR("failed to add bridge, rc=%d\n", rc);
+
+		return rc;
+	}
 
 	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (rc) {
 		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
-		drm_bridge_remove(bridge);
 
-		return ERR_PTR(rc);
+		return rc;
 	}
 
 	if (dp_display->next_bridge) {
@@ -323,12 +327,13 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
 					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (rc < 0) {
 			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
-			drm_bridge_remove(bridge);
-			return ERR_PTR(rc);
+			return rc;
 		}
 	}
 
-	return bridge;
+	dp_display->bridge = bridge;
+
+	return 0;
 }
 
 /* connector initialization */
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index afe79b85e183..b3d684db2383 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -20,7 +20,7 @@ struct msm_dp_bridge {
 #define to_dp_bridge(x)     container_of((x), struct msm_dp_bridge, bridge)
 
 struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
-struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
+int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder);
 
 void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-- 
2.39.2

