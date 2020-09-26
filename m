Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7EC279654
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 04:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728871AbgIZCzU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Sep 2020 22:55:20 -0400
Received: from z5.mailgun.us ([104.130.96.5]:12297 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbgIZCzU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Sep 2020 22:55:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601088919; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=dXOYbIBVSuh3lZq5g6RSPeYoOxQgoRVu5CrfkFSqGDQ=; b=xBkhcAmbSEluwz0EiX9NvPvb23jTOm6cxOixU0dl6RIhchlO+IiYIFmGN0cR7ISBoKUouxlx
 bQ6weFWZUnfBkKGLzzkqOwAiB6STRboOZi2cSnkI2cApDFbsj3S+G+L1PYdJ7KjILhDESvu2
 rzI1SP904sNJO018y+pSH6noeK8=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f6ead975fb64f6e3771419e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 26 Sep 2020 02:55:19
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F3D59C433C8; Sat, 26 Sep 2020 02:55:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9B7F8C433C8;
        Sat, 26 Sep 2020 02:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9B7F8C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        tanmay@codeaurora.org, khsieh@codeaurora.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] drm/msm/dp: fix incorrect function prototype of dp_debug_get()
Date:   Fri, 25 Sep 2020 19:55:12 -0700
Message-Id: <20200926025512.15145-1-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the incorrect function prototype for dp_debug_get()
in the dp_debug module to address compilation warning.
Also add prototype for msm_dp_debugfs_init() for fixing compilation
issue with other defconfigs.

changes in v2:
	- add prototype for msm_dp_debugfs_init()

Fixes: f913454aae8e ("drm/msm/dp: move debugfs node to /sys/kernel/debug/dri/*/")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_debug.h | 2 +-
 drivers/gpu/drm/msm/msm_drv.h     | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
index 377e166fd0ea..7eaedfbb149c 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.h
+++ b/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -60,7 +60,7 @@ void dp_debug_put(struct dp_debug *dp_debug);
 static inline
 struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
 		struct dp_usbpd *usbpd, struct dp_link *link,
-		struct drm_connector **connector)
+		struct drm_connector **connector, struct drm_minor *minor)
 {
 	return ERR_PTR(-EINVAL);
 }
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 319327462b29..9f7849c4ece3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -435,6 +435,11 @@ static inline void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 {
 }
 
+static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
+		struct drm_minor *minor)
+{
+}
+
 #endif
 
 void __init msm_mdp_register(void);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

