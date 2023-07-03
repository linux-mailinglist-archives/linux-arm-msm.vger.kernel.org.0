Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16BF4745335
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 02:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjGCAhx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 20:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjGCAhv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 20:37:51 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26C1E46
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 17:37:49 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b6a16254a4so56771511fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 17:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688344668; x=1690936668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Dse1m0G6m1qASsdCM4uiEj+LGG7/GtCG3G9yRY+V70=;
        b=rgN5LtpMcynWbivkJfmuRMBWRQxhyaiEraTUiV9rBrZH/mYHP35gwv1z0WkEP54YQ0
         BSBzIn74O8T6cyN1DgSoZCgkxOVQSNmXTNe0xm3BvJTF6uR7gfObF3jT/OvDjlPPqZE8
         1hNWodzmZD6xWldYA2KewlDug33Jqd9wXweoCils8K6/YGa1k8NlV/Z1uRMkggrIk0bb
         yXvAE0QoFZckmynQ8r57Y5LcfpgHUdMsFBgGip6Jtbpz7j8v1EIhW7uS80O+OKCEF2E4
         EAvxIKhKPHzW1/SjSzDFjnc8LTxpdx+aAm1DGWrZcTI2Ue119VpfkaxymOnJZiqKh3qq
         vZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688344668; x=1690936668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Dse1m0G6m1qASsdCM4uiEj+LGG7/GtCG3G9yRY+V70=;
        b=jqyRv6CDwsVWCDm+kVNwLUzU8gyeBdAirvIsG7zwokhJORBhUacsR97Lg3X5fE7n0T
         V9U3QTzK3hqASpKLRFDvZatBXKF1BqhBXd/87ECqh4swFF/iBvXugWmHse5VGg86aWYo
         zF2of/M6IP8M86U5UX8mbS+u3L3C6u8EkwcdKD/RDL6hhY9hGhSGtKfLEDty273YZwOT
         5PEapKmLY3UOke8GzrRl6F/6sw7r6rGzMnDsyGp58F6Df8EtOv4/RRDFQIhcHTSIY5vM
         RVUCFvW3ngoDPtwlbLF9CuJNVAG8sf11qc1asnWe0ReoiPmKgttaE2o6lQxjGQRPO/yx
         gCIw==
X-Gm-Message-State: ABy/qLbmUGBqcUfRzOAQOuxFtQ1BZL7le7R3s1Xkdztjq+JpoV1LXi7O
        ET+5XdGYGgKOBbGjA+MbmOL9Mw==
X-Google-Smtp-Source: APBJJlHi3v8VjEObPhV7IPLFGJAl5ZS3wLaqgtqQ2wH2F6pdj0og7uKtkuYkMO8m6b1dyG1zLx4uyw==
X-Received: by 2002:a2e:83cd:0:b0:2b4:7f66:8c92 with SMTP id s13-20020a2e83cd000000b002b47f668c92mr5920737ljh.31.1688344668207;
        Sun, 02 Jul 2023 17:37:48 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 17:37:47 -0700 (PDT)
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
Subject: [PATCH 02/13] drm/msm/hdmi: switch to devm_drm_bridge_add()
Date:   Mon,  3 Jul 2023 03:37:34 +0300
Message-Id: <20230703003745.34239-3-dmitry.baryshkov@linaro.org>
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

Make MSM HDMI driver use devm_drm_bridge_add() instead of plain
drm_bridge_add(). As the driver doesn't require any additional cleanup,
stop adding created bridge to the priv->bridges array.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 22 +++++--------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  5 ++---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 ++++++++------------------
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    |  3 +--
 4 files changed, 17 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 3132105a2a43..1967d88d93a1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -158,24 +158,16 @@ static int msm_hdmi_init(struct hdmi *hdmi)
 int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		struct drm_device *dev, struct drm_encoder *encoder)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
-	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
-		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
-		return -ENOSPC;
-	}
-
 	hdmi->dev = dev;
 	hdmi->encoder = encoder;
 
 	hdmi_audio_infoframe_init(&hdmi->audio.infoframe);
 
-	hdmi->bridge = msm_hdmi_bridge_init(hdmi);
-	if (IS_ERR(hdmi->bridge)) {
-		ret = PTR_ERR(hdmi->bridge);
+	ret = msm_hdmi_bridge_init(hdmi);
+	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to create HDMI bridge: %d\n", ret);
-		hdmi->bridge = NULL;
 		goto fail;
 	}
 
@@ -213,16 +205,9 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	priv->bridges[priv->num_bridges++]       = hdmi->bridge;
-
 	return 0;
 
 fail:
-	/* bridge is normally destroyed by drm: */
-	if (hdmi->bridge) {
-		msm_hdmi_bridge_destroy(hdmi->bridge);
-		hdmi->bridge = NULL;
-	}
 	if (hdmi->connector) {
 		hdmi->connector->funcs->destroy(hdmi->connector);
 		hdmi->connector = NULL;
@@ -393,6 +378,9 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
 		if (priv->hdmi->audio_pdev)
 			platform_device_unregister(priv->hdmi->audio_pdev);
 
+		if (priv->hdmi->bridge)
+			msm_hdmi_hpd_disable(priv->hdmi);
+
 		msm_hdmi_destroy(priv->hdmi);
 		priv->hdmi = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index e8dbee50637f..ec5786440391 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -224,14 +224,13 @@ void msm_hdmi_audio_set_sample_rate(struct hdmi *hdmi, int rate);
  * hdmi bridge:
  */
 
-struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi);
-void msm_hdmi_bridge_destroy(struct drm_bridge *bridge);
+int msm_hdmi_bridge_init(struct hdmi *hdmi);
 
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge);
 enum drm_connector_status msm_hdmi_bridge_detect(
 		struct drm_bridge *bridge);
 int msm_hdmi_hpd_enable(struct drm_bridge *bridge);
-void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge);
+void msm_hdmi_hpd_disable(struct hdmi *hdmi);
 
 /*
  * i2c adapter for ddc:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 9b1391d27ed3..0b7a6a56677e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -11,14 +11,6 @@
 #include "msm_kms.h"
 #include "hdmi.h"
 
-void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
-{
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-
-	msm_hdmi_hpd_disable(hdmi_bridge);
-	drm_bridge_remove(bridge);
-}
-
 static void msm_hdmi_power_on(struct drm_bridge *bridge)
 {
 	struct drm_device *dev = bridge->dev;
@@ -317,7 +309,7 @@ msm_hdmi_hotplug_work(struct work_struct *work)
 }
 
 /* initialize bridge */
-struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
+int msm_hdmi_bridge_init(struct hdmi *hdmi)
 {
 	struct drm_bridge *bridge = NULL;
 	struct hdmi_bridge *hdmi_bridge;
@@ -325,10 +317,8 @@ struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
 
 	hdmi_bridge = devm_kzalloc(hdmi->dev->dev,
 			sizeof(*hdmi_bridge), GFP_KERNEL);
-	if (!hdmi_bridge) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!hdmi_bridge)
+		return -ENOMEM;
 
 	hdmi_bridge->hdmi = hdmi;
 	INIT_WORK(&hdmi_bridge->hpd_work, msm_hdmi_hotplug_work);
@@ -341,17 +331,15 @@ struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_EDID;
 
-	drm_bridge_add(bridge);
+	ret = devm_drm_bridge_add(&hdmi->pdev->dev, bridge);
+	if (ret)
+		return ret;
 
 	ret = drm_bridge_attach(hdmi->encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
-		goto fail;
+		return ret;
 
-	return bridge;
+	hdmi->bridge = bridge;
 
-fail:
-	if (bridge)
-		msm_hdmi_bridge_destroy(bridge);
-
-	return ERR_PTR(ret);
+	return 0;
 }
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index bfa827b47989..9ce0ffa35417 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -147,9 +147,8 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	return ret;
 }
 
-void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge)
+void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 {
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
 	struct device *dev = &hdmi->pdev->dev;
 	int ret;
-- 
2.39.2

