Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7CD21997FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 15:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730693AbgCaN7l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 09:59:41 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:52797 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730442AbgCaN7k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 09:59:40 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 31 Mar 2020 19:28:53 +0530
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
  by ironmsg02-blr.qualcomm.com with ESMTP; 31 Mar 2020 19:28:30 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id BC89B47A1; Tue, 31 Mar 2020 19:28:29 +0530 (IST)
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
Date:   Tue, 31 Mar 2020 19:28:27 +0530
Message-Id: <1585663107-12406-1-git-send-email-kalyan_t@codeaurora.org>
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

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
 drivers/gpu/drm/msm/dsi/dsi.c           | 2 ++
 drivers/gpu/drm/msm/msm_drv.c           | 4 ++++
 3 files changed, 8 insertions(+)

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
index 7d985f8..2b8c99c 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1051,6 +1051,8 @@ static int msm_pm_suspend(struct device *dev)
 		return ret;
 	}
 
+	pm_runtime_force_suspend(dev);
+
 	return 0;
 }
 
@@ -1063,6 +1065,8 @@ static int msm_pm_resume(struct device *dev)
 	if (WARN_ON(!priv->pm_state))
 		return -ENOENT;
 
+	pm_runtime_force_resume(dev);
+
 	ret = drm_atomic_helper_resume(ddev, priv->pm_state);
 	if (!ret)
 		priv->pm_state = NULL;
-- 
1.9.1

