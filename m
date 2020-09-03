Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C17E25CDEB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 00:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgICWoF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 18:44:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32425 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728678AbgICWoF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 18:44:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599173044; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=+AqJv5xReoPxYZca1y9FbMp8I/h1HFflAyFqYjsbaCs=; b=rPPD40NMPWqm2ZZsuzxzGeqEWnMbP4Cvp0A8B+brht9EpyCqCI8kdCLrJKHNBhEyFHA2RSOY
 ynUEfBkKxB1Ncixaw6FLbSkEyEBqXrjm0UW00HlAEujDZ4r2aoCONw+/mFklpYhlU+69ElLU
 yWKDLqCUbwJurEgMgrzixyanjRU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f5171a34f13e63f041f372e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 22:43:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B6560C433A1; Thu,  3 Sep 2020 22:43:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 63860C4339C;
        Thu,  3 Sep 2020 22:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 63860C4339C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        khsieh@codeaurora.org
Subject: [PATCH 2/4] drm/msm/dp: move debugfs node to /sys/kernel/debug/dri/*/
Date:   Thu,  3 Sep 2020 15:43:26 -0700
Message-Id: <20200903224328.26452-3-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200903224328.26452-1-abhinavk@codeaurora.org>
References: <20200903224328.26452-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the MSM DP debugfs node from /sys/kernel/debug/drm_dp
to /sys/kernel/debug/dri/*/ as required for video pattern
compliance test suite.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  7 +++++
 drivers/gpu/drm/msm/dp/dp_debug.c       | 31 ++++++++--------------
 drivers/gpu/drm/msm/dp/dp_debug.h       |  5 +++-
 drivers/gpu/drm/msm/dp/dp_display.c     | 34 +++++++++++++++----------
 drivers/gpu/drm/msm/msm_drv.h           |  2 ++
 5 files changed, 44 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index bcb5ee50568c..db9e2761085b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -195,10 +195,15 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
 	void *p = dpu_hw_util_get_log_mask_ptr();
 	struct dentry *entry;
+	struct drm_device *dev;
+	struct msm_drm_private *priv;
 
 	if (!p)
 		return -EINVAL;
 
+	dev = dpu_kms->dev;
+	priv = dev->dev_private;
+
 	entry = debugfs_create_dir("debug", minor->debugfs_root);
 
 	debugfs_create_x32(DPU_DEBUGFS_HWMASKNAME, 0600, entry, p);
@@ -207,6 +212,8 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	dpu_debugfs_vbif_init(dpu_kms, entry);
 	dpu_debugfs_core_irq_init(dpu_kms, entry);
 
+	msm_dp_debugfs_init(priv->dp, minor);
+
 	return dpu_core_perf_debugfs_init(dpu_kms, entry);
 }
 #endif
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 92019f3e1a1f..099e989f214d 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -7,6 +7,7 @@
 
 #include <linux/debugfs.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_file.h>
 
 #include "dp_parser.h"
 #include "dp_catalog.h"
@@ -15,7 +16,7 @@
 #include "dp_debug.h"
 #include "dp_display.h"
 
-#define DEBUG_NAME "drm_dp"
+#define DEBUG_NAME "msm_dp"
 
 struct dp_debug_private {
 	struct dentry *root;
@@ -25,6 +26,7 @@ struct dp_debug_private {
 	struct dp_panel *panel;
 	struct drm_connector **connector;
 	struct device *dev;
+	struct drm_device *drm_dev;
 
 	struct dp_debug dp_debug;
 };
@@ -206,41 +208,29 @@ static const struct file_operations dp_debug_fops = {
 	.read = dp_debug_read_info,
 };
 
-static int dp_debug_init(struct dp_debug *dp_debug)
+static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 {
 	int rc = 0;
 	struct dp_debug_private *debug = container_of(dp_debug,
 			struct dp_debug_private, dp_debug);
-	struct dentry *dir, *file;
+	struct dentry *file;
 
-	dir = debugfs_create_dir(DEBUG_NAME, NULL);
-	if (IS_ERR_OR_NULL(dir)) {
-		rc = PTR_ERR(dir);
-		DRM_ERROR("[%s] debugfs create dir failed, rc = %d\n",
-				  DEBUG_NAME, rc);
-		goto error;
-	}
-
-	file = debugfs_create_file("dp_debug", 0444, dir,
+	file = debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
 			debug, &dp_debug_fops);
 	if (IS_ERR_OR_NULL(file)) {
 		rc = PTR_ERR(file);
 		DRM_ERROR("[%s] debugfs create file failed, rc=%d\n",
 				  DEBUG_NAME, rc);
-		goto error_remove_dir;
 	}
 
-	debug->root = dir;
-	return rc;
- error_remove_dir:
-	debugfs_remove(dir);
- error:
+	debug->root = minor->debugfs_root;
+
 	return rc;
 }
 
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector **connector)
+		struct drm_connector **connector, struct drm_minor *minor)
 {
 	int rc = 0;
 	struct dp_debug_private *debug;
@@ -263,6 +253,7 @@ struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 	debug->link = link;
 	debug->panel = panel;
 	debug->dev = dev;
+	debug->drm_dev = minor->dev;
 	debug->connector = connector;
 
 	dp_debug = &debug->dp_debug;
@@ -270,7 +261,7 @@ struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 	dp_debug->hdisplay = 0;
 	dp_debug->vrefresh = 0;
 
-	rc = dp_debug_init(dp_debug);
+	rc = dp_debug_init(dp_debug, minor);
 	if (rc) {
 		devm_kfree(dev, debug);
 		goto error;
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
index fddf827ac089..377e166fd0ea 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.h
+++ b/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -35,6 +35,7 @@ struct dp_debug {
  * @usbpd: instance of usbpd module
  * @link: instance of link module
  * @connector: double pointer to display connector
+ * @minor: pointer to drm minor number after device registration
  * return: pointer to allocated debug module data
  *
  * This function sets up the debug module and provides a way
@@ -42,7 +43,9 @@ struct dp_debug {
  */
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector **connector);
+		struct drm_connector **connector,
+		struct drm_minor *minor);
+
 /**
  * dp_debug_put()
  *
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3495ca367dc1..2c20898ce77b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -222,10 +222,8 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	}
 
 	rc = dp_register_audio_driver(dev, dp->audio);
-	if (rc) {
+	if (rc)
 		DRM_ERROR("Audio registration Dp failed\n");
-		goto end;
-	}
 
 end:
 	return rc;
@@ -762,19 +760,8 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error_audio;
 	}
 
-	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
-			dp->link, &dp->dp_display.connector);
-	if (IS_ERR(dp->debug)) {
-		rc = PTR_ERR(dp->debug);
-		DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
-		dp->debug = NULL;
-		goto error_debug;
-	}
-
 	return rc;
 
-error_debug:
-	dp_audio_put(dp->audio);
 error_audio:
 	dp_ctrl_put(dp->ctrl);
 error_ctrl:
@@ -1278,6 +1265,25 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
 }
 
+void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
+{
+	struct dp_display_private *dp;
+	struct device *dev;
+	int rc;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	dev = &dp->pdev->dev;
+
+	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
+					dp->link, &dp->dp_display.connector,
+					minor);
+	if (IS_ERR(dp->debug)) {
+		rc = PTR_ERR(dp->debug);
+		DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
+		dp->debug = NULL;
+	}
+}
+
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d30b2a2e25ec..0311a4f8bbe2 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -390,6 +390,8 @@ void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
 				struct drm_display_mode *adjusted_mode);
 void msm_dp_irq_postinstall(struct msm_dp *dp_display);
 
+void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
+
 #else
 static inline int __init msm_dp_register(void)
 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

