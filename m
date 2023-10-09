Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEFBE7BE8E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377454AbjJISKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377450AbjJISKs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:10:48 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC3994
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:10:46 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5068692b0d9so3841932e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696875045; x=1697479845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/ggZZmOOvUZ/jHV96y3poAAIRXv6qRJqOXl/4SuAQc=;
        b=D1CB2eyrVs+Wse8pmQ0bVqZgLfFrzXyEhlC6ipbBNLimW+Of/zLJ/NQUG6eMoGoK55
         QgAt4JB5RYjEQ24sKAwRX6p/D3+4v7CILK1XxJCzPrLqU+fYxY2jw0tq2Z0XNBcocnRh
         RinkSIyqylpHOwaMuUtj0puOEKqC3zZ5SjtEjC/dkBVvojl0F/s1u0N3pCZxk4EcG9OM
         yAusOdxK7tyhFKqjQYfSCgMMfdZ166Zx4QTKShXSLipaJOXyfal830I7BniIWEwPIPfH
         UxalKqxbsQmqIQPpW1R2EaPVb2mUHMbncp7lCqVwAqHRoqHPk9V52a+xb9ZZ2wQiXg6f
         XDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696875045; x=1697479845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/ggZZmOOvUZ/jHV96y3poAAIRXv6qRJqOXl/4SuAQc=;
        b=mIIi4tAyaOTuNT0pNMgDaw1hNA+tiun/d6mqzS/3oED3K6fbqVZQi92HTP6V72mnAP
         BpSrByRtq2u1fPrpSTVDkTSADZ1U+FiLUu+Egh+nZce087h6T8dymvXG/1MqNiLIeDkG
         exvktZgZ5AIzxCPReOFMhdlKEq9+IdMrtdnc8kAOwVrLLcgqmFBihCe/GMjn44hz68cH
         hmKZfxpjSlkAo2y4ql/gpvJbpVZ9TBvnjjufWOMC5Ui/6390IVsQFEfu9hrW+qbiuJEQ
         TY9x1PxwHyLe1gHbwwizE/eFUuqd5Z4W5wURteqCKxvHgUw7GRn5Sa5h9OWFTpa3fWKm
         QSOw==
X-Gm-Message-State: AOJu0Yzrg0STUTw5how+RL97aBlv32OjNZDWG/r1+2EO0dzmVgICmsbK
        uTNJju1EMZ1+vE86bH9rmcNL5A==
X-Google-Smtp-Source: AGHT+IEkZphNwAOKp9JtA7qMk7prsRuhaPwpf+e6gDGlK1W+jDqKLj+YRJsuImLEuWVeqkYOfEBCIg==
X-Received: by 2002:a05:6512:3b9a:b0:503:18c5:6833 with SMTP id g26-20020a0565123b9a00b0050318c56833mr17676101lfv.61.1696875044954;
        Mon, 09 Oct 2023 11:10:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:10:44 -0700 (PDT)
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
Subject: [PATCH v2 04/13] drm/msm/dp: switch to devm_drm_bridge_add()
Date:   Mon,  9 Oct 2023 21:10:31 +0300
Message-Id: <20231009181040.2743847-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make MSM DP driver use devm_drm_bridge_add() instead of plain
drm_bridge_add(). As the driver doesn't require any additional cleanup,
stop adding created bridge to the priv->bridges array.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  9 ++-------
 drivers/gpu/drm/msm/dp/dp_drm.c     | 21 +++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 +-
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 172daa5ad004..e329e03e068d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1530,7 +1530,6 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	struct dp_display_private *dp_priv;
 	int ret;
 
@@ -1548,17 +1547,13 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
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

