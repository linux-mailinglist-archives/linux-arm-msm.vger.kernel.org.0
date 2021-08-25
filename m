Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAA963F7F1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 01:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234319AbhHYXmN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 19:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234022AbhHYXmK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 19:42:10 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B093C0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 16:41:24 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id o185so1734703oih.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 16:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UyiBHZU0sJ+AAUPSROiGijhdbK/4CnMcUZShDuulJlc=;
        b=mHC5WMLLLkd3vHYZGgKzLtt5Ar+vY3WNkp1XwZ3DWIpEJ+uz9ARYQcmjMx2s3XIZe6
         NKemOyP78VsEmt5EipS7yINKx3n9s42e9i/uan3dIAnwv6HX6ea8Ym+SePpPM7oD81IG
         AxK37JaADJ+/8ttgRDtRq7QJGXDAy5rL9nRBoUKTCGJvkUlOhx8Qqgdj598/3Derx5K6
         2pqdJH1dlB8cRII+RDD1PrMURe1aXRtW9UVSl8ur6S77gkiFzbKgmEaGUZtsL9povck2
         w8KqnzdHf4hZvfknXiy9AB9RbT3YoY/jkVXVlYAv6r+XUU4Db5O6dQagVZOAslWk3Xj6
         zTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UyiBHZU0sJ+AAUPSROiGijhdbK/4CnMcUZShDuulJlc=;
        b=hd6tshSrAngHi1QIQolmElXrkHD2K7yb7dglwleoChRr90jsSF8c6MkGZ95iFhWDRY
         14c4JKcBDUqk77ibpjZy32OS69zIIhhOw2RnhysBYBe2Rd8v0tmr6V0y2s919t/RfIl0
         gHeQshTNZRE0MuFmi0Hij9p5xZn30ZhPA3Hn8idvq+X7Ll1RNbZiCVWNxq89OCimdhUD
         1uW5WWZo09+PRIGvAIZkM7myC6Srp4jcvypBCuKW276NiXlgWpI899jEDee2QChYX80h
         UuXwoK3HK1oGGBZDsxa5/9KNE3OhBHYBYbG42HLJobeprILivUEkjAfaiaPCMTadZqZP
         62kA==
X-Gm-Message-State: AOAM5332UGh19MNyDxJAXE1J9+4zYsDfkObapQ29ixN20Ep8VL7DVeT+
        3ABcWIMX5oP62YFjfZMDSkurMg==
X-Google-Smtp-Source: ABdhPJzEnblQnPdJ/ykSrSzM1zfRAHxhhvqELPfwSNnXdHFfhOiPYtsTwKWEZmIH2sNI1xb+YQPQrw==
X-Received: by 2002:a05:6808:10c8:: with SMTP id s8mr422586ois.6.1629934883884;
        Wed, 25 Aug 2021 16:41:23 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g10sm267136oof.37.2021.08.25.16.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 16:41:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] drm/msm/dp: Support up to 3 DP controllers
Date:   Wed, 25 Aug 2021 16:42:31 -0700
Message-Id: <20210825234233.1721068-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Based on the removal of the g_dp_display and the movement of the
priv->dp lookup into the DP code it's now possible to have multiple
DP instances.

In line with the other controllers in the MSM driver, introduce a
per-compatible list of base addresses which is used to resolve the
"instance id" for the given DP controller. This instance id is used as
index in the priv->dp[] array.

Then extend the initialization code to initialize struct drm_encoder for
each of the registered priv->dp[] and update the logic for associating
each struct msm_dp with the struct dpu_encoder_virt.

Lastly, bump the number of struct msm_dp instances carries by priv->dp
to 3, the currently known maximum number of controllers found in a
Qualcomm SoC.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Update dpu_encoder_setup() to store the reference to the msm_dp in our dpu_enc

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 60 +++++++++++--------
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  8 ++-
 drivers/gpu/drm/msm/dp/dp_display.c           | 51 ++++++++++++++--
 drivers/gpu/drm/msm/msm_drv.h                 |  2 +-
 5 files changed, 90 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b7f33da2799c..9cd9539a1504 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2173,7 +2173,7 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 				dpu_encoder_vsync_event_handler,
 				0);
 	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
-		dpu_enc->dp = priv->dp;
+		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f655adbc2421..a793cc8a007e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -188,6 +188,7 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	struct dentry *entry;
 	struct drm_device *dev;
 	struct msm_drm_private *priv;
+	int i;
 
 	if (!p)
 		return -EINVAL;
@@ -203,8 +204,8 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	dpu_debugfs_vbif_init(dpu_kms, entry);
 	dpu_debugfs_core_irq_init(dpu_kms, entry);
 
-	if (priv->dp)
-		msm_dp_debugfs_init(priv->dp, minor);
+	for (i = 0; i < ARRAY_SIZE(priv->dp); i++)
+		msm_dp_debugfs_init(priv->dp[i], minor);
 
 	return dpu_core_perf_debugfs_init(dpu_kms, entry);
 }
@@ -545,33 +546,40 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	struct drm_encoder *encoder = NULL;
 	struct msm_display_info info;
 	int rc = 0;
+	int i;
 
-	if (!priv->dp)
-		return rc;
+	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
+		if (!priv->dp[i])
+			continue;
 
-	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
-	if (IS_ERR(encoder)) {
-		DPU_ERROR("encoder init failed for dsi display\n");
-		return PTR_ERR(encoder);
-	}
+		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
+		if (IS_ERR(encoder)) {
+			DPU_ERROR("encoder init failed for dsi display\n");
+			return PTR_ERR(encoder);
+		}
 
-	memset(&info, 0, sizeof(info));
-	rc = msm_dp_modeset_init(priv->dp, dev, encoder);
-	if (rc) {
-		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
-		drm_encoder_cleanup(encoder);
-		return rc;
-	}
+		memset(&info, 0, sizeof(info));
+		rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
+		if (rc) {
+			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
+			drm_encoder_cleanup(encoder);
+			return rc;
+		}
 
-	priv->encoders[priv->num_encoders++] = encoder;
+		priv->encoders[priv->num_encoders++] = encoder;
+
+		info.num_of_h_tiles = 1;
+		info.h_tile_instance[0] = i;
+		info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
+		info.intf_type = encoder->encoder_type;
+		rc = dpu_encoder_setup(dev, encoder, &info);
+		if (rc) {
+			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+				  encoder->base.id, rc);
+			return rc;
+		}
+	}
 
-	info.num_of_h_tiles = 1;
-	info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
-	info.intf_type = encoder->encoder_type;
-	rc = dpu_encoder_setup(dev, encoder, &info);
-	if (rc)
-		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
-			  encoder->base.id, rc);
 	return rc;
 }
 
@@ -792,6 +800,7 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
 {
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
+	int i;
 
 	if (!dpu_kms || !dpu_kms->dev)
 		return -EINVAL;
@@ -800,7 +809,8 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
 	if (!priv)
 		return -EINVAL;
 
-	msm_dp_irq_postinstall(priv->dp);
+	for (i = 0; i < ARRAY_SIZE(priv->dp); i++)
+		msm_dp_irq_postinstall(priv->dp[i]);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index cabe15190ec1..2e1acb1bc390 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -126,8 +126,12 @@ void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
 	priv = drm_dev->dev_private;
 	kms = priv->kms;
 
-	if (priv->dp)
-		msm_dp_snapshot(disp_state, priv->dp);
+	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
+		if (!priv->dp[i])
+			continue;
+
+		msm_dp_snapshot(disp_state, priv->dp[i]);
+	}
 
 	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
 		if (!priv->dsi[i])
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 2c7de43f655a..4a6132c18e57 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -78,6 +78,8 @@ struct dp_display_private {
 	char *name;
 	int irq;
 
+	int id;
+
 	/* state variables */
 	bool core_initialized;
 	bool hpd_irq_on;
@@ -115,8 +117,19 @@ struct dp_display_private {
 	struct dp_audio *audio;
 };
 
+
+struct msm_dp_config {
+	phys_addr_t io_start[3];
+	size_t num_dp;
+};
+
+static const struct msm_dp_config sc7180_dp_cfg = {
+	.io_start = { 0x0ae90000 },
+	.num_dp = 1,
+};
+
 static const struct of_device_id dp_dt_match[] = {
-	{.compatible = "qcom,sc7180-dp"},
+	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
 	{}
 };
 
@@ -211,7 +224,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
 
 	dp->dp_display.drm_dev = drm;
 	priv = drm->dev_private;
-	priv->dp = &(dp->dp_display);
+	priv->dp[dp->id] = &(dp->dp_display);
 
 	rc = dp->parser->parse(dp->parser);
 	if (rc) {
@@ -233,8 +246,11 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	}
 
 	rc = dp_register_audio_driver(dev, dp->audio);
-	if (rc)
+	if (rc) {
 		DRM_ERROR("Audio registration Dp failed\n");
+		goto end;
+	}
+
 
 end:
 	return rc;
@@ -249,7 +265,7 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 
 	dp_power_client_deinit(dp->power);
 	dp_aux_unregister(dp->aux);
-	priv->dp = NULL;
+	priv->dp[dp->id] = NULL;
 }
 
 static const struct component_ops dp_display_comp_ops = {
@@ -1180,6 +1196,26 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 	return 0;
 }
 
+static int dp_display_get_id(struct platform_device *pdev)
+{
+	const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
+	struct resource *res;
+	int i;
+
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	for (i = 0; i < cfg->num_dp; i++) {
+		if (cfg->io_start[i] == res->start)
+			return i;
+	}
+
+	dev_err(&pdev->dev, "unknown displayport instance\n");
+	return -EINVAL;
+}
+
 static int dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
@@ -1194,6 +1230,10 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!dp)
 		return -ENOMEM;
 
+	dp->id = dp_display_get_id(pdev);
+	if (dp->id < 0)
+		return -EINVAL;
+
 	dp->pdev = pdev;
 	dp->name = "drm_dp";
 
@@ -1388,6 +1428,9 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	struct device *dev;
 	int rc;
 
+	if (!dp_display)
+		return;
+
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 	dev = &dp->pdev->dev;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 8b005d1ac899..2e84dc30e12e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -161,7 +161,7 @@ struct msm_drm_private {
 	/* DSI is shared by mdp4 and mdp5 */
 	struct msm_dsi *dsi[2];
 
-	struct msm_dp *dp;
+	struct msm_dp *dp[3];
 
 	/* when we have more than one 'msm_gpu' these need to be an array: */
 	struct msm_gpu *gpu;
-- 
2.29.2

