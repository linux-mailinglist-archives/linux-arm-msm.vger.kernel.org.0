Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27AF31EE52C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 15:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbgFDNUr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 09:20:47 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:55827 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728055AbgFDNUr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 09:20:47 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Jun 2020 18:50:05 +0530
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg02-blr.qualcomm.com with ESMTP; 04 Jun 2020 18:49:41 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 55AFD49A8; Thu,  4 Jun 2020 18:49:40 +0530 (IST)
From:   Kalyan Thota <kalyan_t@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        dianders@chromium.org, jsanka@codeaurora.org,
        mkrishn@codeaurora.org, travitej@codeaurora.org,
        nganji@codeaurora.org
Subject: [PATCH v6] drm/msm/dpu: ensure device suspend happens during PM sleep
Date:   Thu,  4 Jun 2020 18:49:35 +0530
Message-Id: <1591276775-13949-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

"The PM core always increments the runtime usage counter
before calling the ->suspend() callback and decrements it
after calling the ->resume() callback"

DPU and DSI are managed as runtime devices. When
suspend is triggered, PM core adds a refcount on all the
devices and calls device suspend, since usage count is
already incremented, runtime suspend was not getting called
and it kept the clocks on which resulted in target not
entering into XO shutdown.

Add changes to force suspend on runtime devices during pm sleep.

Changes in v1:
 - Remove unnecessary checks in the function
    _dpu_kms_disable_dpu (Rob Clark).

Changes in v2:
 - Avoid using suspend_late to reset the usagecount
   as suspend_late might not be called during suspend
   call failures (Doug).

Changes in v3:
 - Use force suspend instead of managing device usage_count
   via runtime put and get API's to trigger callbacks (Doug).

Changes in v4:
 - Check the return values of pm_runtime_force_suspend and
   pm_runtime_force_resume API's and pass appropriately (Doug).

Changes in v5:
 - With v4 patch, test cycle has uncovered issues in device resume.

   On bubs: cmd tx failures were seen as SW is sending panel off
   commands when the dsi resources are turned off.

   Upon suspend, DRM driver will issue a NULL composition to the
   dpu, followed by turning off all the HW blocks.

   v5 changes will serialize the NULL commit and resource unwinding
   by handling them under PM prepare and PM complete phases there by
   ensuring that clks are on when panel off commands are being
   processed.

Changes in v6:
- Use drm_mode_config_helper_suspend/resume() instead of legacy API
  drm_atomic_helper_suspend/resume() (Doug).

  Trigger runtime callbacks from the suspend/resume call to turn
  off the resources.

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  2 +
 drivers/gpu/drm/msm/dsi/dsi.c           |  2 +
 drivers/gpu/drm/msm/msm_drv.c           | 67 ++++++++++++++++-----------------
 3 files changed, 37 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ce19f1d..b886d9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1123,6 +1123,8 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops dpu_pm_ops = {
 	SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static const struct of_device_id dpu_dt_match[] = {
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 55ea4bc2..62704885 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -161,6 +161,8 @@ static int dsi_dev_remove(struct platform_device *pdev)
 
 static const struct dev_pm_ops dsi_pm_ops = {
 	SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, msm_dsi_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct platform_driver dsi_driver = {
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7d985f8..da42ff7 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1035,75 +1035,74 @@ static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
-#ifdef CONFIG_PM_SLEEP
-static int msm_pm_suspend(struct device *dev)
+#ifdef CONFIG_PM
+static int msm_runtime_suspend(struct device *dev)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct msm_drm_private *priv = ddev->dev_private;
+	struct msm_mdss *mdss = priv->mdss;
 
-	if (WARN_ON(priv->pm_state))
-		drm_atomic_state_put(priv->pm_state);
+	DBG("");
 
-	priv->pm_state = drm_atomic_helper_suspend(ddev);
-	if (IS_ERR(priv->pm_state)) {
-		int ret = PTR_ERR(priv->pm_state);
-		DRM_ERROR("Failed to suspend dpu, %d\n", ret);
-		return ret;
-	}
+	if (mdss && mdss->funcs)
+		return mdss->funcs->disable(mdss);
 
 	return 0;
 }
 
-static int msm_pm_resume(struct device *dev)
+static int msm_runtime_resume(struct device *dev)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct msm_drm_private *priv = ddev->dev_private;
-	int ret;
+	struct msm_mdss *mdss = priv->mdss;
 
-	if (WARN_ON(!priv->pm_state))
-		return -ENOENT;
+	DBG("");
 
-	ret = drm_atomic_helper_resume(ddev, priv->pm_state);
-	if (!ret)
-		priv->pm_state = NULL;
+	if (mdss && mdss->funcs)
+		return mdss->funcs->enable(mdss);
 
-	return ret;
+	return 0;
 }
 #endif
 
-#ifdef CONFIG_PM
-static int msm_runtime_suspend(struct device *dev)
+#ifdef CONFIG_PM_SLEEP
+static int msm_pm_suspend(struct device *dev)
 {
-	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct msm_drm_private *priv = ddev->dev_private;
-	struct msm_mdss *mdss = priv->mdss;
 
-	DBG("");
+	if (pm_runtime_suspended(dev))
+		return 0;
 
-	if (mdss && mdss->funcs)
-		return mdss->funcs->disable(mdss);
+	return msm_runtime_suspend(dev);
+}
 
-	return 0;
+static int msm_pm_resume(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return msm_runtime_resume(dev);
 }
 
-static int msm_runtime_resume(struct device *dev)
+static int msm_pm_prepare(struct device *dev)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct msm_drm_private *priv = ddev->dev_private;
-	struct msm_mdss *mdss = priv->mdss;
 
-	DBG("");
+	return drm_mode_config_helper_suspend(ddev);
+}
 
-	if (mdss && mdss->funcs)
-		return mdss->funcs->enable(mdss);
+static void msm_pm_complete(struct device *dev)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
 
-	return 0;
+	drm_mode_config_helper_resume(ddev);
 }
 #endif
 
 static const struct dev_pm_ops msm_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend, msm_pm_resume)
 	SET_RUNTIME_PM_OPS(msm_runtime_suspend, msm_runtime_resume, NULL)
+	.prepare = msm_pm_prepare,
+	.complete = msm_pm_complete,
 };
 
 /*
-- 
1.9.1

