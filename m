Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2C432DF1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 02:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbhCEBcO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 20:32:14 -0500
Received: from z11.mailgun.us ([104.130.96.11]:25074 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229436AbhCEBcO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 20:32:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614907934; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MrBaxd8I1lCJhc1xiJgcuKzJdIqqY481nXmjMo1dSxY=; b=pl76956UOhT7BceqCxnfZ3PzwmGgUL2d054xEWVRZdeZDGEnH+Q7R+tLaGcLdbDrIHbb0WtH
 mTArvTcPbk4WKF4/eu3imNSQKeejs6QgDs545wULLwCkmG90DsfsVhIFSJjlSv4r2tBDoOoI
 iZDZ7cPJfZmiSAYyLRr3oxZt+IQ=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60418a162a5e6d1bfa216026 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 01:32:06
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 435F7C43462; Fri,  5 Mar 2021 01:32:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A7FCFC433CA;
        Fri,  5 Mar 2021 01:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A7FCFC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        tanmay@codeaurora.org, khsieh@codeaurora.org,
        dan.carpenter@oracle.com
Subject: [PATCH] drm/msm/dp: Fix warnings reported by kbot in DP driver
Date:   Thu,  4 Mar 2021 17:31:52 -0800
Message-Id: <1614907912-6880-1-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the warnings reported by kbot across MSM DP driver.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_debug.c | 33 +++++----------------------------
 drivers/gpu/drm/msm/dp/dp_hpd.c   |  4 ++--
 drivers/gpu/drm/msm/dp/dp_power.c |  2 +-
 3 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 84670bc..2f6247e 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -226,7 +226,7 @@ static int dp_test_data_show(struct seq_file *m, void *data)
 					debug->link->test_video.test_h_width);
 			seq_printf(m, "vdisplay: %d\n",
 					debug->link->test_video.test_v_height);
-					seq_printf(m, "bpc: %u\n",
+			seq_printf(m, "bpc: %u\n",
 					dp_link_bit_depth_to_bpc(bpc));
 		} else
 			seq_puts(m, "0");
@@ -368,44 +368,21 @@ static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)
 	int rc = 0;
 	struct dp_debug_private *debug = container_of(dp_debug,
 			struct dp_debug_private, dp_debug);
-	struct dentry *file;
-	struct dentry *test_active;
-	struct dentry *test_data, *test_type;
 
-	file = debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
+	debugfs_create_file("dp_debug", 0444, minor->debugfs_root,
 			debug, &dp_debug_fops);
-	if (IS_ERR_OR_NULL(file)) {
-		rc = PTR_ERR(file);
-		DRM_ERROR("[%s] debugfs create file failed, rc=%d\n",
-				  DEBUG_NAME, rc);
-	}
 
-	test_active = debugfs_create_file("msm_dp_test_active", 0444,
+	debugfs_create_file("msm_dp_test_active", 0444,
 			minor->debugfs_root,
 			debug, &test_active_fops);
-	if (IS_ERR_OR_NULL(test_active)) {
-		rc = PTR_ERR(test_active);
-		DRM_ERROR("[%s] debugfs test_active failed, rc=%d\n",
-				  DEBUG_NAME, rc);
-	}
 
-	test_data = debugfs_create_file("msm_dp_test_data", 0444,
+	debugfs_create_file("msm_dp_test_data", 0444,
 			minor->debugfs_root,
 			debug, &dp_test_data_fops);
-	if (IS_ERR_OR_NULL(test_data)) {
-		rc = PTR_ERR(test_data);
-		DRM_ERROR("[%s] debugfs test_data failed, rc=%d\n",
-				  DEBUG_NAME, rc);
-	}
 
-	test_type = debugfs_create_file("msm_dp_test_type", 0444,
+	debugfs_create_file("msm_dp_test_type", 0444,
 			minor->debugfs_root,
 			debug, &dp_test_type_fops);
-	if (IS_ERR_OR_NULL(test_type)) {
-		rc = PTR_ERR(test_type);
-		DRM_ERROR("[%s] debugfs test_type failed, rc=%d\n",
-				  DEBUG_NAME, rc);
-	}
 
 	debug->root = minor->debugfs_root;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
index 5b8fe3202..e1c90fa 100644
--- a/drivers/gpu/drm/msm/dp/dp_hpd.c
+++ b/drivers/gpu/drm/msm/dp/dp_hpd.c
@@ -34,8 +34,8 @@ int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
 
 	dp_usbpd->hpd_high = hpd;
 
-	if (!hpd_priv->dp_cb && !hpd_priv->dp_cb->configure
-				&& !hpd_priv->dp_cb->disconnect) {
+	if (!hpd_priv->dp_cb || !hpd_priv->dp_cb->configure
+				|| !hpd_priv->dp_cb->disconnect) {
 		pr_err("hpd dp_cb not initialized\n");
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 9c4ea00..3961ba4 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -269,7 +269,7 @@ int dp_power_clk_enable(struct dp_power *dp_power,
 		DRM_ERROR("failed to '%s' clks for: %s. err=%d\n",
 			enable ? "enable" : "disable",
 			dp_parser_pm_name(pm_type), rc);
-			return rc;
+		return rc;
 	}
 
 	if (pm_type == DP_CORE_PM)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

