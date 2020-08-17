Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C89B3247A2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 00:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730236AbgHQWLp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 18:11:45 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20751 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728881AbgHQWLp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 18:11:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597702304; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=wRrmOXqAh8TIJG1prAvavq6m3QBtBfcFpVW2Wj05v5s=; b=SN50VaCUwHBRrLHgEVq4oVodWC5DTZsWTSpBiqGoQgwwNhsslMHuBQV1oAR7tfNz33opEz8q
 WEsSoA3fIcyolEHL4V7N1WvHXAWomLTqpfbKX/F9djGe3t3NUVH5GBfWPFZ+gMbQ/VJQd7qX
 kK+Bh7950pswzaZGgU7+KwmGHX8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5f3b009f2b87d6604996f70f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 22:11:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 04203C4339C; Mon, 17 Aug 2020 22:11:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D7FE1C433C6;
        Mon, 17 Aug 2020 22:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D7FE1C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        cychiang@chromium.org, khsieh@codeaurora.org,
        vsujithk@codeaurora.org, rohitkr@codeaurora.org
Subject: [PATCH v3 1/5] drm/msm/dp: store dp_display in the driver data
Date:   Mon, 17 Aug 2020 15:11:27 -0700
Message-Id: <20200817221131.16162-2-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200817221131.16162-1-abhinavk@codeaurora.org>
References: <20200817221131.16162-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Store the dp_display in the platform driver data instead of the
dp_display_private.

This is required to allow other sub-modules to reuse the platform
driver data.

Changes in v3: none

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4cce7e5017a5..d32ce6753883 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -170,11 +170,11 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	struct dp_display_private *dp;
 	struct drm_device *drm;
 	struct msm_drm_private *priv;
-	struct platform_device *pdev = to_platform_device(dev);
 
 	drm = dev_get_drvdata(master);
 
-	dp = platform_get_drvdata(pdev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 	if (!dp) {
 		DRM_ERROR("DP driver bind failed. Invalid driver data\n");
 		return -EINVAL;
@@ -209,11 +209,11 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 			      void *data)
 {
 	struct dp_display_private *dp;
-	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct msm_drm_private *priv = drm->dev_private;
 
-	dp = platform_get_drvdata(pdev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 	if (!dp) {
 		DRM_ERROR("Invalid DP driver data\n");
 		return;
@@ -348,7 +348,8 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 		goto end;
 	}
 
-	dp = dev_get_drvdata(dev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 	if (!dp) {
 		DRM_ERROR("no driver data found\n");
 		rc = -ENODEV;
@@ -372,7 +373,8 @@ static int dp_display_usbpd_disconnect_cb(struct device *dev)
 	int rc = 0;
 	struct dp_display_private *dp;
 
-	dp = dev_get_drvdata(dev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 
 	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 
@@ -424,7 +426,8 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 		return -EINVAL;
 	}
 
-	dp = dev_get_drvdata(dev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 	if (!dp) {
 		DRM_ERROR("no driver data found\n");
 		return -ENODEV;
@@ -995,11 +998,12 @@ static int dp_display_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
-	platform_set_drvdata(pdev, dp);
-
 	mutex_init(&dp->event_mutex);
+
 	g_dp_display = &dp->dp_display;
 
+	platform_set_drvdata(pdev, g_dp_display);
+
 	rc = component_add(&pdev->dev, &dp_display_comp_ops);
 	if (rc) {
 		DRM_ERROR("component add failed, rc=%d\n", rc);
@@ -1013,7 +1017,8 @@ static int dp_display_remove(struct platform_device *pdev)
 {
 	struct dp_display_private *dp;
 
-	dp = platform_get_drvdata(pdev);
+	dp = container_of(g_dp_display,
+			struct dp_display_private, dp_display);
 
 	dp_display_deinit_sub_modules(dp);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

