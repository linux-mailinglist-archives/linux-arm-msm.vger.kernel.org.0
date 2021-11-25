Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADB345DD01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 16:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240344AbhKYPPL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 10:15:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353210AbhKYPNL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 10:13:11 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B27F6C0613D7;
        Thu, 25 Nov 2021 07:09:59 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 069CB1F45900
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637852996; bh=Rv1jRLcowZm99hT/zu7+THzcYVzW6fHVM8XmlXMUXeY=;
        h=From:To:Cc:Subject:Date:From;
        b=LQpcwBkI3xvrvAEDTnF5OywjJ/5S04v2FtMZ/nP1dB+EyqJMMwZEQzU698tKJ8gIG
         9RijVStBQR3JTbfa6GpyWK9qV/eP90PvJ5VTdpzQgG2i8UyPaMnKn+czqYa+J/rWWO
         f4y0EAGaNwYk/Xvgd+EnH96LDpx3OYdtzWixWYneDMhvAxP61GLJt+dcxAs3URpTob
         fWxkLy0IOYAQxSMC/TA+b8LmnYjwbK0rFHUjejd6o7afLKzUtX2p4U9llYYNbAloKp
         9UZ3kfRbfhIPupkNIlmejdp7hdnEQxi+2W4CXRyER2WcEiMSjyWQJYS3vgUmf+k7zW
         KzblCYInOGydQ==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        maxime@cerno.tech, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        jami.kettunen@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] drm/msm: Initialize MDSS irq domain at probe time
Date:   Thu, 25 Nov 2021 16:09:47 +0100
Message-Id: <20211125150947.354076-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order"), the
DSI host gets initialized earlier, but this caused unability to probe
the entire stack of components because they all depend on interrupts
coming from the main `mdss` node (mdp5, or dpu1).

To fix this issue, also anticipate probing mdp5 or dpu1 by initializing
them at msm_pdev_probe() time: this will make sure that we add the
required interrupt controller mapping before dsi and/or other components
try to initialize, finally satisfying the dependency.

While at it, also change the allocation of msm_drm_private to use the
devm variant of kzalloc().

Fixes: 8f59ee9a570c ("drm/msm/dsi: Adjust probe order")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 81 ++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7936e8d498dd..790acf4993c0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -512,45 +512,12 @@ static int msm_init_vram(struct drm_device *dev)
 static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct drm_device *ddev;
-	struct msm_drm_private *priv;
-	struct msm_kms *kms;
-	struct msm_mdss *mdss;
+	struct drm_device *ddev = platform_get_drvdata(pdev);
+	struct msm_drm_private *priv = ddev->dev_private;
+	struct msm_kms *kms = priv->kms;
+	struct msm_mdss *mdss = priv->mdss;
 	int ret, i;
 
-	ddev = drm_dev_alloc(drv, dev);
-	if (IS_ERR(ddev)) {
-		DRM_DEV_ERROR(dev, "failed to allocate drm_device\n");
-		return PTR_ERR(ddev);
-	}
-
-	platform_set_drvdata(pdev, ddev);
-
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		ret = -ENOMEM;
-		goto err_put_drm_dev;
-	}
-
-	ddev->dev_private = priv;
-	priv->dev = ddev;
-
-	switch (get_mdp_ver(pdev)) {
-	case KMS_MDP5:
-		ret = mdp5_mdss_init(ddev);
-		break;
-	case KMS_DPU:
-		ret = dpu_mdss_init(ddev);
-		break;
-	default:
-		ret = 0;
-		break;
-	}
-	if (ret)
-		goto err_free_priv;
-
-	mdss = priv->mdss;
-
 	priv->wq = alloc_ordered_workqueue("msm", 0);
 	priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
 
@@ -685,11 +652,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 err_destroy_mdss:
 	if (mdss && mdss->funcs)
 		mdss->funcs->destroy(ddev);
-err_free_priv:
-	kfree(priv);
-err_put_drm_dev:
-	drm_dev_put(ddev);
-	platform_set_drvdata(pdev, NULL);
 	return ret;
 }
 
@@ -1382,12 +1344,42 @@ static const struct component_master_ops msm_drm_ops = {
 static int msm_pdev_probe(struct platform_device *pdev)
 {
 	struct component_match *match = NULL;
+	struct msm_drm_private *priv;
+	struct drm_device *ddev;
 	int ret;
 
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ddev = drm_dev_alloc(&msm_driver, &pdev->dev);
+	if (IS_ERR(ddev)) {
+		DRM_DEV_ERROR(&pdev->dev, "failed to allocate drm_device\n");
+		return PTR_ERR(ddev);
+	}
+
+	platform_set_drvdata(pdev, ddev);
+	ddev->dev_private = priv;
+	priv->dev = ddev;
+
+	switch (get_mdp_ver(pdev)) {
+	case KMS_MDP5:
+		ret = mdp5_mdss_init(ddev);
+		break;
+	case KMS_DPU:
+		ret = dpu_mdss_init(ddev);
+		break;
+	default:
+		ret = 0;
+		break;
+	}
+	if (ret)
+		goto err_put_drm_dev;
+
 	if (get_mdp_ver(pdev)) {
 		ret = add_display_components(pdev, &match);
 		if (ret)
-			return ret;
+			goto fail;
 	}
 
 	ret = add_gpu_components(&pdev->dev, &match);
@@ -1409,6 +1401,9 @@ static int msm_pdev_probe(struct platform_device *pdev)
 
 fail:
 	of_platform_depopulate(&pdev->dev);
+err_put_drm_dev:
+	drm_dev_put(ddev);
+	platform_set_drvdata(pdev, NULL);
 	return ret;
 }
 
-- 
2.33.1

