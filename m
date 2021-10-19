Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5492B432D3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 07:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233452AbhJSFdH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 01:33:07 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:59252 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233730AbhJSFdF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 01:33:05 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 18 Oct 2021 22:30:54 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 18 Oct 2021 22:30:52 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg01-blr.qualcomm.com with ESMTP; 19 Oct 2021 11:00:42 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 125DB2224F; Tue, 19 Oct 2021 11:00:41 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        kalyan_t@codeaurora.org, robdclark@gmail.com, swboyd@chromium.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/msm: use compatible lists to find mdp node
Date:   Tue, 19 Oct 2021 11:00:28 +0530
Message-Id: <1634621428-11652-1-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the current implementation, substring comparison
using device node name is used to find mdp node
during driver probe. Use compatible string list instead
of node name to get mdp node from the parent mdss node.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Changes in v2:
   - Use compatible lists instead of duplicate string
     check (Stephen Boyd)
---
 drivers/gpu/drm/msm/msm_drv.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2e6fc18..451d667 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1241,9 +1241,13 @@ static int add_components_mdp(struct device *mdp_dev,
 	return 0;
 }
 
-static int compare_name_mdp(struct device *dev, void *data)
+static int find_mdp_node(struct device *dev, void *data)
 {
-	return (strstr(dev_name(dev), "mdp") != NULL);
+	if (!dev->driver)
+		return 0;
+
+	return (of_match_node(dev->driver->of_match_table,
+				dev->of_node) != NULL);
 }
 
 static int add_display_components(struct platform_device *pdev,
@@ -1268,7 +1272,7 @@ static int add_display_components(struct platform_device *pdev,
 			return ret;
 		}
 
-		mdp_dev = device_find_child(dev, NULL, compare_name_mdp);
+		mdp_dev = device_find_child(dev, NULL, find_mdp_node);
 		if (!mdp_dev) {
 			DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
 			of_platform_depopulate(dev);
-- 
2.7.4

