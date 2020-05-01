Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04CF91C15B4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 16:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730265AbgEANcM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 09:32:12 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:23307 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730254AbgEANcM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 09:32:12 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 01 May 2020 19:01:32 +0530
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg01-blr.qualcomm.com with ESMTP; 01 May 2020 19:01:09 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id EEBE4487F; Fri,  1 May 2020 19:01:07 +0530 (IST)
From:   Kalyan Thota <kalyan_t@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        dianders@chromium.org, jsanka@codeaurora.org,
        mkrishn@codeaurora.org, travitej@codeaurora.org,
        nganji@codeaurora.org
Subject: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
Date:   Fri,  1 May 2020 19:01:03 +0530
Message-Id: <1588339863-1322-1-git-send-email-kalyan_t@codeaurora.org>
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

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  2 ++
 drivers/gpu/drm/msm/dsi/dsi.c           |  2 ++
 drivers/gpu/drm/msm/msm_drv.c           | 20 ++++++++++++++++----
 3 files changed, 20 insertions(+), 4 deletions(-)

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
index 7d985f8..47d492b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1036,7 +1036,7 @@ static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
 };
 
 #ifdef CONFIG_PM_SLEEP
-static int msm_pm_suspend(struct device *dev)
+static int msm_pm_prepare(struct device *dev)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct msm_drm_private *priv = ddev->dev_private;
@@ -1054,18 +1054,28 @@ static int msm_pm_suspend(struct device *dev)
 	return 0;
 }
 
-static int msm_pm_resume(struct device *dev)
+static void msm_pm_complete(struct device *dev)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct msm_drm_private *priv = ddev->dev_private;
 	int ret;
 
 	if (WARN_ON(!priv->pm_state))
-		return -ENOENT;
+		return;
 
 	ret = drm_atomic_helper_resume(ddev, priv->pm_state);
 	if (!ret)
 		priv->pm_state = NULL;
+}
+
+static int msm_pm_resume(struct device *dev)
+{
+	int ret;
+
+	/* unwind runtime_disable called by force suspend */
+	pm_runtime_enable(dev);
+
+	ret = pm_runtime_resume(dev);
 
 	return ret;
 }
@@ -1102,8 +1112,10 @@ static int msm_runtime_resume(struct device *dev)
 #endif
 
 static const struct dev_pm_ops msm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend, msm_pm_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, msm_pm_resume)
 	SET_RUNTIME_PM_OPS(msm_runtime_suspend, msm_runtime_resume, NULL)
+	.prepare = msm_pm_prepare,
+	.complete = msm_pm_complete,
 };
 
 /*
-- 
1.9.1

