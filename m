Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8AAF2CCA9D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 00:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728891AbgLBXlq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 18:41:46 -0500
Received: from m42-5.mailgun.net ([69.72.42.5]:19404 "EHLO m42-5.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728121AbgLBXlq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 18:41:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606952481; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=0WKk5xDjofv388J2WnbQdKBLVyRfY397LKch54vy5Yk=; b=jquvAgT0ppTn6qx3USsGfpviqDmMhep70st66A+Rp3Bt7MqLcAAktjr8TKTn2NoxJ/UOXebF
 DMUAtgrPCbHnHdfWBNpGWimMio1cwxRGAbl9onJEfWtjBdLia+SNBr2D1eULRQekAb1G8qzX
 xZXhloyBDcFrYWSq1UGXCrLfTag=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fc82605875646f1e98536d8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Dec 2020 23:40:53
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 38451C43463; Wed,  2 Dec 2020 23:40:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 76050C433C6;
        Wed,  2 Dec 2020 23:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 76050C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, loic.poulain@linaro.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 7/7] bus: mhi: Improve documentation on channel transfer setup APIs
Date:   Wed,  2 Dec 2020 15:40:38 -0800
Message-Id: <1606952438-15321-8-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606952438-15321-1-git-send-email-bbhatt@codeaurora.org>
References: <1606952438-15321-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The mhi_prepare_for_transfer() and mhi_unprepare_from_transfer()
APIs could use better explanation, especially with the addition
of two new APIs to start and stop the transfers on channels. Add
better set of information for those APIs.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 include/linux/mhi.h | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 35779a0..bd229da 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -692,13 +692,35 @@ int mhi_device_get_sync(struct mhi_device *mhi_dev);
 void mhi_device_put(struct mhi_device *mhi_dev);
 
 /**
- * mhi_prepare_for_transfer - Setup channel for data transfer
+ * mhi_prepare_for_transfer - Setup UL and DL channels for data transfer.
+ *                            Allocate and initialize the channel context and
+ *                            also issue the START channel command to both
+ *                            channels. Channels can be started only if both
+ *                            host and device execution environments match and
+ *                            channels are in a DISABLED state. Calling the
+ *                            mhi_start_transfer() function is not required
+ *                            afterwards as channels are already started. This
+ *                            function also initializes the channel context
+ *                            whereas mhi_start_transfer() can only be used to
+ *                            issue the start channel command once the context
+ *                            is setup.
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
+ *                               SUSPENDED state. Calling mhi_stop_transfer() is
+ *                               not required before calling this function as it
+ *                               will only stop transfers, not reset channels.
  * @mhi_dev: Device associated with the channels
  */
 void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

