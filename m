Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B35D464C06
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 11:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243096AbhLAKzl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 05:55:41 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34816 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242446AbhLAKzj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 05:55:39 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 1AC031F454D0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1638355937; bh=eApAyqdSVpyTOjdPkX+zeafHUUm1uhsDd/MyJ+DFpd4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SIfcQXnR5Bmc01Kub9RHnvWdgCg5Rj3tcuY7fUPCWMp7PK+j9rEa4ZUge/nc7Ol0X
         EPjUeWqdI5+o/29LQEBmGGNt9VMoYgILsb1uoNG7lS25Y7jzcM0ButVbHL0LlVDLCM
         FekgU3OoZg5Q2ksOkOdmuAvRBZDvpzWYb6EoEpusg+b8BWvfJuFjMIx/bLIrmCKnGe
         OrYrlGV+TO7R480ha9R0iS4NG9C7AsMy9PdhniJZDkTiyVmjnN5ZXSw+hTTULDu5JI
         kj31kLko9ZbDrGAJPMMd0QOycxYesYfsDM4f88FuUNMGPhRmRuDpdkKNh9tnfWa+ae
         GGAJw60vgO36Q==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     robdclark@gmail.com
Cc:     dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, maxime@cerno.tech, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        jami.kettunen@somainline.org, martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 1/2] drm/msm: Allocate msm_drm_private early and pass it as driver data
Date:   Wed,  1 Dec 2021 11:52:09 +0100
Message-Id: <20211201105210.24970-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211201105210.24970-1-angelogioacchino.delregno@collabora.com>
References: <20211201105210.24970-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation for registering the mdss interrupt controller earlier,
move the allocation of msm_drm_private from component bind time to
msm_drv probe; this also allows us to use the devm variant of kzalloc.

Since it is not right to allocate the drm_device at probe time (as
it should exist only when all components are bound, and taken down
when components get cleaned up), the only way to make this happen is
to pass a pointer to msm_drm_private as driver data (like done in
many other DRM drivers), instead of one to drm_device like it's
currently done in this driver.

This is also simplifying some bind/unbind functions around drm/msm,
as some of them are using drm_device just to grab a pointer to the
msm_drm_private structure, which we now retrieve in one call.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 16 +++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |  4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   |  3 +-
 drivers/gpu/drm/msm/dp/dp_display.c        | 10 ++---
 drivers/gpu/drm/msm/dsi/dsi.c              |  6 +--
 drivers/gpu/drm/msm/edp/edp.c              |  6 +--
 drivers/gpu/drm/msm/hdmi/hdmi.c            |  7 ++--
 drivers/gpu/drm/msm/msm_drv.c              | 46 +++++++++-------------
 8 files changed, 38 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 2a6ce76656aa..6b113881aefb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -427,13 +427,6 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	return gpu;
 }
 
-static void set_gpu_pdev(struct drm_device *dev,
-		struct platform_device *pdev)
-{
-	struct msm_drm_private *priv = dev->dev_private;
-	priv->gpu_pdev = pdev;
-}
-
 static int find_chipid(struct device *dev, struct adreno_rev *rev)
 {
 	struct device_node *node = dev->of_node;
@@ -482,8 +475,8 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 {
 	static struct adreno_platform_config config = {};
 	const struct adreno_info *info;
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct msm_drm_private *priv = drm->dev_private;
+	struct msm_drm_private *priv = dev_get_drvdata(master);
+	struct drm_device *drm = priv->dev;
 	struct msm_gpu *gpu;
 	int ret;
 
@@ -492,7 +485,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	dev->platform_data = &config;
-	set_gpu_pdev(drm, to_platform_device(dev));
+	priv->gpu_pdev = to_platform_device(dev);
 
 	info = adreno_info(config.rev);
 
@@ -521,12 +514,13 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 static void adreno_unbind(struct device *dev, struct device *master,
 		void *data)
 {
+	struct msm_drm_private *priv = dev_get_drvdata(master);
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 
 	pm_runtime_force_suspend(dev);
 	gpu->funcs->destroy(gpu);
 
-	set_gpu_pdev(dev_get_drvdata(master), NULL);
+	priv->gpu_pdev = NULL;
 }
 
 static const struct component_ops a3xx_ops = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a15b26428280..8b038690d9ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1153,9 +1153,9 @@ struct msm_kms *dpu_kms_init(struct drm_device *dev)
 
 static int dpu_bind(struct device *dev, struct device *master, void *data)
 {
-	struct drm_device *ddev = dev_get_drvdata(master);
+	struct msm_drm_private *priv = dev_get_drvdata(master);
 	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_drm_private *priv = ddev->dev_private;
+	struct drm_device *ddev = priv->dev;
 	struct dpu_kms *dpu_kms;
 	struct dss_module_power *mp;
 	int ret = 0;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 7b242246d4e7..cab6451661b2 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -936,7 +936,8 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 
 static int mdp5_bind(struct device *dev, struct device *master, void *data)
 {
-	struct drm_device *ddev = dev_get_drvdata(master);
+	struct msm_drm_private *priv = dev_get_drvdata(master);
+	struct drm_device *ddev = priv->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 
 	DBG("");
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0eb3c007d503..ac29a8a99450 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -224,13 +224,10 @@ static int dp_display_bind(struct device *dev, struct device *master,
 {
 	int rc = 0;
 	struct dp_display_private *dp = dev_get_dp_display_private(dev);
-	struct msm_drm_private *priv;
-	struct drm_device *drm;
-
-	drm = dev_get_drvdata(master);
+	struct msm_drm_private *priv = dev_get_drvdata(master);
+	struct drm_device *drm = priv->dev;
 
 	dp->dp_display.drm_dev = drm;
-	priv = drm->dev_private;
 	priv->dp[dp->id] = &dp->dp_display;
 
 	rc = dp->parser->parse(dp->parser, dp->dp_display.connector_type);
@@ -266,8 +263,7 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 			      void *data)
 {
 	struct dp_display_private *dp = dev_get_dp_display_private(dev);
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct msm_drm_private *priv = drm->dev_private;
+	struct msm_drm_private *priv = dev_get_drvdata(master);
 
 	dp_power_client_deinit(dp->power);
 	dp_aux_unregister(dp->aux);
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 5cd230a5d5d3..9670e548b3e9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -110,8 +110,7 @@ static struct msm_dsi *dsi_init(struct platform_device *pdev)
 
 static int dsi_bind(struct device *dev, struct device *master, void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct msm_drm_private *priv = drm->dev_private;
+	struct msm_drm_private *priv = dev_get_drvdata(master);
 	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
 
 	priv->dsi[msm_dsi->id] = msm_dsi;
@@ -122,8 +121,7 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
 static void dsi_unbind(struct device *dev, struct device *master,
 		void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct msm_drm_private *priv = drm->dev_private;
+	struct msm_drm_private *priv = dev_get_drvdata(master);
 	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
 
 	priv->dsi[msm_dsi->id] = NULL;
diff --git a/drivers/gpu/drm/msm/edp/edp.c b/drivers/gpu/drm/msm/edp/edp.c
index 106a67473af5..101cf1671472 100644
--- a/drivers/gpu/drm/msm/edp/edp.c
+++ b/drivers/gpu/drm/msm/edp/edp.c
@@ -66,8 +66,7 @@ static struct msm_edp *edp_init(struct platform_device *pdev)
 
 static int edp_bind(struct device *dev, struct device *master, void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct msm_drm_private *priv = drm->dev_private;
+	struct msm_drm_private *priv = dev_get_drvdata(master);
 	struct msm_edp *edp;
 
 	DBG("");
@@ -81,8 +80,7 @@ static int edp_bind(struct device *dev, struct device *master, void *data)
 
 static void edp_unbind(struct device *dev, struct device *master, void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct msm_drm_private *priv = drm->dev_private;
+	struct msm_drm_private *priv = dev_get_drvdata(master);
 
 	DBG("");
 	if (priv->edp) {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 75b64e6ae035..64ad73a01edd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -514,8 +514,7 @@ static int msm_hdmi_register_audio_driver(struct hdmi *hdmi, struct device *dev)
 
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct msm_drm_private *priv = drm->dev_private;
+	struct msm_drm_private *priv = dev_get_drvdata(master);
 	struct hdmi_platform_config *hdmi_cfg;
 	struct hdmi *hdmi;
 	struct device_node *of_node = dev->of_node;
@@ -586,8 +585,8 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 static void msm_hdmi_unbind(struct device *dev, struct device *master,
 		void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct msm_drm_private *priv = drm->dev_private;
+	struct msm_drm_private *priv = dev_get_drvdata(master);
+
 	if (priv->hdmi) {
 		if (priv->hdmi->audio_pdev)
 			platform_device_unregister(priv->hdmi->audio_pdev);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 892c04365239..64230e473a34 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -339,8 +339,8 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
 static int msm_drm_uninit(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct drm_device *ddev = platform_get_drvdata(pdev);
-	struct msm_drm_private *priv = ddev->dev_private;
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = priv->dev;
 	struct msm_kms *kms = priv->kms;
 	struct msm_mdss *mdss = priv->mdss;
 	int i;
@@ -409,7 +409,6 @@ static int msm_drm_uninit(struct device *dev)
 	drm_dev_put(ddev);
 
 	destroy_workqueue(priv->wq);
-	kfree(priv);
 
 	return 0;
 }
@@ -512,8 +511,8 @@ static int msm_init_vram(struct drm_device *dev)
 static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 {
 	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev;
-	struct msm_drm_private *priv;
 	struct msm_kms *kms;
 	struct msm_mdss *mdss;
 	int ret, i;
@@ -523,15 +522,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 		DRM_DEV_ERROR(dev, "failed to allocate drm_device\n");
 		return PTR_ERR(ddev);
 	}
-
-	platform_set_drvdata(pdev, ddev);
-
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		ret = -ENOMEM;
-		goto err_put_drm_dev;
-	}
-
 	ddev->dev_private = priv;
 	priv->dev = ddev;
 
@@ -547,7 +537,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 		break;
 	}
 	if (ret)
-		goto err_free_priv;
+		goto err_put_drm_dev;
 
 	mdss = priv->mdss;
 
@@ -685,11 +675,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 err_destroy_mdss:
 	if (mdss && mdss->funcs)
 		mdss->funcs->destroy(ddev);
-err_free_priv:
-	kfree(priv);
 err_put_drm_dev:
 	drm_dev_put(ddev);
-	platform_set_drvdata(pdev, NULL);
 	return ret;
 }
 
@@ -1142,8 +1129,7 @@ static const struct drm_driver msm_driver = {
 
 static int __maybe_unused msm_runtime_suspend(struct device *dev)
 {
-	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct msm_drm_private *priv = ddev->dev_private;
+	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct msm_mdss *mdss = priv->mdss;
 
 	DBG("");
@@ -1156,8 +1142,7 @@ static int __maybe_unused msm_runtime_suspend(struct device *dev)
 
 static int __maybe_unused msm_runtime_resume(struct device *dev)
 {
-	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct msm_drm_private *priv = ddev->dev_private;
+	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct msm_mdss *mdss = priv->mdss;
 
 	DBG("");
@@ -1187,8 +1172,8 @@ static int __maybe_unused msm_pm_resume(struct device *dev)
 
 static int __maybe_unused msm_pm_prepare(struct device *dev)
 {
-	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct msm_drm_private *priv = ddev ? ddev->dev_private : NULL;
+	struct msm_drm_private *priv = dev_get_drvdata(dev);
+	struct drm_device *ddev = priv ? priv->dev : NULL;
 
 	if (!priv || !priv->kms)
 		return 0;
@@ -1198,8 +1183,8 @@ static int __maybe_unused msm_pm_prepare(struct device *dev)
 
 static void __maybe_unused msm_pm_complete(struct device *dev)
 {
-	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct msm_drm_private *priv = ddev ? ddev->dev_private : NULL;
+	struct msm_drm_private *priv = dev_get_drvdata(dev);
+	struct drm_device *ddev = priv ? priv->dev : NULL;
 
 	if (!priv || !priv->kms)
 		return;
@@ -1397,8 +1382,15 @@ static const struct component_master_ops msm_drm_ops = {
 static int msm_pdev_probe(struct platform_device *pdev)
 {
 	struct component_match *match = NULL;
+	struct msm_drm_private *priv;
 	int ret;
 
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
 	if (get_mdp_ver(pdev)) {
 		ret = add_display_components(pdev, &match);
 		if (ret)
@@ -1437,8 +1429,8 @@ static int msm_pdev_remove(struct platform_device *pdev)
 
 static void msm_pdev_shutdown(struct platform_device *pdev)
 {
-	struct drm_device *drm = platform_get_drvdata(pdev);
-	struct msm_drm_private *priv = drm ? drm->dev_private : NULL;
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *drm = priv ? priv->dev : NULL;
 
 	if (!priv || !priv->kms)
 		return;
-- 
2.33.1

