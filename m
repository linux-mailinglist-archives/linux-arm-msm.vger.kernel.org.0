Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D52E81E5AF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 10:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgE1Iia (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 04:38:30 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:47804 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727102AbgE1Ii3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 04:38:29 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 28 May 2020 14:08:26 +0530
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg02-blr.qualcomm.com with ESMTP; 28 May 2020 14:08:26 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id DE28247C1; Thu, 28 May 2020 14:08:24 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org, mka@chromium.org
Subject: [v1] drm/msm: add shutdown support for display platform_driver
Date:   Thu, 28 May 2020 14:08:23 +0530
Message-Id: <1590655103-21568-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define shutdown callback for display drm driver,
so as to disable all the CRTCS when shutdown
notification is received by the driver.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index e4b750b..7a8953f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1322,6 +1322,18 @@ static int msm_pdev_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void msm_pdev_shutdown(struct platform_device *pdev)
+{
+	struct drm_device *drm = platform_get_drvdata(pdev);
+
+	if (!drm) {
+		DRM_ERROR("Invalid drm device node\n");
+		return;
+	}
+
+	drm_atomic_helper_shutdown(drm);
+}
+
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
 	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
@@ -1334,6 +1346,7 @@ static int msm_pdev_remove(struct platform_device *pdev)
 static struct platform_driver msm_platform_driver = {
 	.probe      = msm_pdev_probe,
 	.remove     = msm_pdev_remove,
+	.shutdown   = msm_pdev_shutdown,
 	.driver     = {
 		.name   = "msm",
 		.of_match_table = dt_match,
-- 
1.9.1

