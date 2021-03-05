Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4176032F3B6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 20:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhCETST (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 14:18:19 -0500
Received: from z11.mailgun.us ([104.130.96.11]:11652 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229969AbhCETR7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 14:17:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614971879; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=4yj4BLUjKC2+C0TFQ3euq+M9GNFyVABLQZ+Lu8m9ayY=; b=Efdpt+Rc7ZbjhO3XVIcdJ4UQO/tOIpSQdqfH7sJg7vNEyPIZPEvdBj5suq60y2wGWnQRGXjJ
 cDaLztBxEuuFWVr1VLFdXCs4uA+oS7Y/M1NZw8Z3dGmJUtBSt/Uu+kGrEtF7vZiQ9uUMVsdX
 JLsKDaYNdU2XSe8NP4OPeOc3Mm8=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 604283cfcb774affa9b0798e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 19:17:35
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A3A9DC433C6; Fri,  5 Mar 2021 19:17:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 66324C433CA;
        Fri,  5 Mar 2021 19:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 66324C433CA
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
Subject: [PATCH 3/3] drm/msm/dp: delete unnecessary debugfs error handling
Date:   Fri,  5 Mar 2021 11:17:19 -0800
Message-Id: <1614971839-2686-3-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
References: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently the error checking logic in the dp_debug module could
pass zero to PTR_ERR and it causes the below kbot warnings:

drivers/gpu/drm/msm/dp/dp_debug.c:378 dp_debug_init()
warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/msm/dp/dp_debug.c:387 dp_debug_init()
warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/msm/dp/dp_debug.c:396 dp_debug_init()
warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/msm/dp/dp_debug.c:405 dp_debug_init()
warn: passing zero to 'PTR_ERR'

Debugfs functions are not supposed to be checked in the normal
case so delete this code.  Also it silences the above Smatch
warnings that we're checking for NULL when these functions only
return error pointers.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_debug.c | 31 ++++---------------------------
 1 file changed, 4 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 6c6998f..2f6247e 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
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
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

