Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5412E422296
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 11:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233564AbhJEJqj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 05:46:39 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:17693 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233517AbhJEJqi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 05:46:38 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 05 Oct 2021 02:44:48 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Oct 2021 02:44:47 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg01-blr.qualcomm.com with ESMTP; 05 Oct 2021 15:14:34 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 2953A221DF; Tue,  5 Oct 2021 15:14:33 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, robdclark@gmail.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v1] drm/msm: use compatible string to find mdp node
Date:   Tue,  5 Oct 2021 15:14:31 +0530
Message-Id: <1633427071-19523-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the current implementation, substring comparison
using device node name is used to find mdp node
during driver probe. Use compatible string instead
of node name to get mdp node from the parent mdss node.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2e6fc18..50a23cf 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1241,9 +1241,16 @@ static int add_components_mdp(struct device *mdp_dev,
 	return 0;
 }
 
-static int compare_name_mdp(struct device *dev, void *data)
+static int find_mdp_node(struct device *dev, void *data)
 {
-	return (strstr(dev_name(dev), "mdp") != NULL);
+	return of_device_is_compatible(dev->of_node, "qcom,mdp4") ||
+		of_device_is_compatible(dev->of_node, "qcom,mdp5") ||
+		of_device_is_compatible(dev->of_node, "qcom,mdss_mdp") ||
+		of_device_is_compatible(dev->of_node, "qcom,sdm845-dpu") ||
+		of_device_is_compatible(dev->of_node, "qcom,sm8150-dpu") ||
+		of_device_is_compatible(dev->of_node, "qcom,sm8250-dpu") ||
+		of_device_is_compatible(dev->of_node, "qcom,sc7180-dpu") ||
+		of_device_is_compatible(dev->of_node, "qcom,sc7280-dpu");
 }
 
 static int add_display_components(struct platform_device *pdev,
@@ -1268,7 +1275,7 @@ static int add_display_components(struct platform_device *pdev,
 			return ret;
 		}
 
-		mdp_dev = device_find_child(dev, NULL, compare_name_mdp);
+		mdp_dev = device_find_child(dev, NULL, find_mdp_node);
 		if (!mdp_dev) {
 			DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
 			of_platform_depopulate(dev);
-- 
2.7.4

