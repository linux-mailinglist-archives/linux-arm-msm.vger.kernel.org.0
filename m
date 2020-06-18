Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C05F71FF431
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 16:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730250AbgFROIC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 10:08:02 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:28282 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730360AbgFROIB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 10:08:01 -0400
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Jun 2020 10:07:58 EDT
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 18 Jun 2020 07:01:54 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 18 Jun 2020 07:01:52 -0700
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg02-blr.qualcomm.com with ESMTP; 18 Jun 2020 19:31:28 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 5292D4A0A; Thu, 18 Jun 2020 19:31:27 +0530 (IST)
From:   Kalyan Thota <kalyan_t@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        dianders@chromium.org, mkrishn@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org
Subject: [v8] drm/msm/dpu: ensure device suspend happens during PM sleep
Date:   Thu, 18 Jun 2020 19:31:24 +0530
Message-Id: <1592488884-21890-1-git-send-email-kalyan_t@codeaurora.org>
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

Changes in v7:
- Add "__maybe_unused" to the functions to avoid compilation
  failures. Cleanup unnecessary configs (Doug).

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  2 +
 drivers/gpu/drm/msm/dsi/dsi.c           |  2 +
 drivers/gpu/drm/msm/msm_drv.c           | 67 +++++++++++++++------------------
 3 files changed, 35 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a5da7aa..dcf5b9a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1150,6 +1150,8 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
 
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
index f6ce40b..6d294c8 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1039,75 +1039,70 @@ static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
-#ifdef CONFIG_PM_SLEEP
-static int msm_pm_suspend(struct device *dev)
+static int __maybe_unused msm_runtime_suspend(struct device *dev)
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
+static int __maybe_unused msm_runtime_resume(struct device *dev)
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
-#endif
 
-#ifdef CONFIG_PM
-static int msm_runtime_suspend(struct device *dev)
+static int __maybe_unused msm_pm_suspend(struct device *dev)
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
+static int __maybe_unused msm_pm_resume(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return msm_runtime_resume(dev);
 }
 
-static int msm_runtime_resume(struct device *dev)
+static int __maybe_unused msm_pm_prepare(struct device *dev)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
-	struct msm_drm_private *priv = ddev->dev_private;
-	struct msm_mdss *mdss = priv->mdss;
 
-	DBG("");
+	return drm_mode_config_helper_suspend(ddev);
+}
 
-	if (mdss && mdss->funcs)
-		return mdss->funcs->enable(mdss);
+static void __maybe_unused msm_pm_complete(struct device *dev)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
 
-	return 0;
+	drm_mode_config_helper_resume(ddev);
 }
-#endif
 
 static const struct dev_pm_ops msm_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend, msm_pm_resume)
 	SET_RUNTIME_PM_OPS(msm_runtime_suspend, msm_runtime_resume, NULL)
+	.prepare = msm_pm_prepare,
+	.complete = msm_pm_complete,
 };
 
 /*
-- 
1.9.1

