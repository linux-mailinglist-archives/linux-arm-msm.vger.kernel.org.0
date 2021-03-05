Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1FA32F3AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 20:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhCETRq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 14:17:46 -0500
Received: from z11.mailgun.us ([104.130.96.11]:11652 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229446AbhCETRb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 14:17:31 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614971851; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=tQsjUdisHqup2rm/CiOsVWOKMCAiCZyMziboVUEMsXo=; b=J8PS17plO07ws2rwimz+pfhBcd76/tgdOOSIefdDYR2AxZJT/P4USSdbsTBpiSYfk8io16be
 HiIIICvOsHDFapiJ/QG9ilp5VoB+m0VR3ECH7u26kCFgGwMwF+cUqMDgx85DH2piqkMzyt+z
 A1NQsFoNqUXbci39g0e72acnGZU=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 604283c97b648e24363b993e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 19:17:29
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E4368C43465; Fri,  5 Mar 2021 19:17:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 84D5DC433C6;
        Fri,  5 Mar 2021 19:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 84D5DC433C6
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
Subject: [PATCH 1/3] drm/msm/dp: Fix indentation kbot warnings in DP driver
Date:   Fri,  5 Mar 2021 11:17:17 -0800
Message-Id: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix a couple of indentation warnings reported by
kbot across MSM DP driver:

New smatch warnings:
drivers/gpu/drm/msm/dp/dp_debug.c:229 dp_test_data_show()
warn: inconsistent indenting

drivers/gpu/drm/msm/dp/dp_power.c:203 dp_power_clk_enable()
warn: inconsistent indenting

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_debug.c | 2 +-
 drivers/gpu/drm/msm/dp/dp_power.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 84670bc..6c6998f 100644
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

