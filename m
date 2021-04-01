Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A9335216D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 23:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234715AbhDAVQg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 17:16:36 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:33124 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234640AbhDAVQf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 17:16:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617311795; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=bSrTASaAjl6GFLySRGQ8IuA+5XxvwjR6NtVXMaVGdmE=; b=gCRb3fjGJqFNTTCWvN53+JY7Ebjt2JivypSJ7d1QNy2VXLmKx/MB1sFlc6VPzuPBKb39TTBX
 JqeS2KmV51i54KXPi4ktCQl8PbhqHvkbUV6arlXNyc4H44smqju0MLA2W8+zkGDrxBLnZpa2
 LBbjjug8penVP7zglI6kgfRendc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 606638308166b7eff7a2d62a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Apr 2021 21:16:32
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 21C79C433ED; Thu,  1 Apr 2021 21:16:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A0DCC43462;
        Thu,  1 Apr 2021 21:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4A0DCC43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v8 9/9] bus: mhi: Improve documentation on channel transfer setup APIs
Date:   Thu,  1 Apr 2021 14:16:18 -0700
Message-Id: <1617311778-1254-10-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
References: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The mhi_prepare_for_transfer() and mhi_unprepare_from_transfer()
APIs could use better explanation. Add details on what MHI does
when these APIs are used.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/linux/mhi.h | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index b16afd3..43a66e1 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -714,13 +714,27 @@ int mhi_device_get_sync(struct mhi_device *mhi_dev);
 void mhi_device_put(struct mhi_device *mhi_dev);
 
 /**
- * mhi_prepare_for_transfer - Setup channel for data transfer
+ * mhi_prepare_for_transfer - Setup UL and DL channels for data transfer.
+ *                            Allocate and initialize the channel context and
+ *                            also issue the START channel command to both
+ *                            channels. Channels can be started only if both
+ *                            host and device execution environments match and
+ *                            channels are in a DISABLED state.
  * @mhi_dev: Device associated with the channels
  */
 int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
 
 /**
- * mhi_unprepare_from_transfer - Unprepare the channels
+ * mhi_unprepare_from_transfer - Reset UL and DL channels for data transfer.
+ *                               Issue the RESET channel command and let the
+ *                               device clean-up the context so no incoming
+ *                               transfers are seen on the host. Free memory
+ *                               associated with the context on host. If device
+ *                               is unresponsive, only perform a host side
+ *                               clean-up. Channels can be reset only if both
+ *                               host and device execution environments match
+ *                               and channels are in an ENABLED, STOPPED or
+ *                               SUSPENDED state.
  * @mhi_dev: Device associated with the channels
  */
 void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

