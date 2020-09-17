Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6AE126E82B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 00:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgIQWTv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 18:19:51 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48632 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgIQWTv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 18:19:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600381190; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=9U+sIM4HgoQ4mM7GVYUjmyjeo7KyvIH/zEueXXDHD/8=; b=sMGSBHFb2OvEDggyRYBw960nbhgunH8OuJPajFmqwVuNNy0eFIqMnO0K9Sv7q3a0hDzZQpsJ
 ProUQ8UtX7wh2EHktmZyFr6bUvFjivQOsQcroxB2UOBwLAUlbBj0zAynkUm6T3LtN2fFyM4t
 1GupxQWhDgyyotRIOtTZKZRIF4Y=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f63e106aac0601354e93cf4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Sep 2020 22:19:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D88C7C433CA; Thu, 17 Sep 2020 22:19:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 233FCC433CB;
        Thu, 17 Sep 2020 22:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 233FCC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 1/3] bus: mhi: core: Remove warnings for missing MODULE_LICENSE()
Date:   Thu, 17 Sep 2020 15:19:34 -0700
Message-Id: <1600381176-37604-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600381176-37604-1-git-send-email-bbhatt@codeaurora.org>
References: <1600381176-37604-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When building MHI as a module, missing MODULE_LICENSE() warnings
are seen. Avoid them by adding the license and description
information for the files where the warnings are seen.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c | 3 +++
 drivers/bus/mhi/core/main.c | 3 +++
 drivers/bus/mhi/core/pm.c   | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 24422f5..78140cc 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -523,3 +523,6 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 error_alloc_fw_table:
 	release_firmware(firmware);
 }
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MHI Host Interface");
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 2cff5dd..172026f 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1533,3 +1533,6 @@ int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mhi_poll);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MHI Host Interface");
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index ce4d969..72c3dbc 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -1150,3 +1150,6 @@ void mhi_device_put(struct mhi_device *mhi_dev)
 	read_unlock_bh(&mhi_cntrl->pm_lock);
 }
 EXPORT_SYMBOL_GPL(mhi_device_put);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MHI Host Interface");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

