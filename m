Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21BEA34DE06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 04:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhC3CMg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 22:12:36 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:40105 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230512AbhC3CMa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 22:12:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617070350; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=mqFPtALYc1IFYJLj3yyLjqSlkECw91aRiCf5Sxn7myc=; b=oVsNgLNj1u6FtJwcVve2CAGxx1WNTRAJW67jNGDcSb7rre7T8MhCMt4jZ3cOXFwBmMjRQ9NI
 jka2zwv1h5cWa4kc+lFaNJZDmFauPoMGsPQnM05UP0/pjdQbtWPdQYY6RzNYM3o/+iYwQ4Fd
 CRn+bkVCTYAmriOchv1JXhMRlbI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 606288fd0a4a07ffda6ac3fd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 02:12:13
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2611BC43461; Tue, 30 Mar 2021 02:12:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 40299C43463;
        Tue, 30 Mar 2021 02:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 40299C43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v7 7/7] bus: mhi: Improve documentation on channel transfer setup APIs
Date:   Mon, 29 Mar 2021 19:11:47 -0700
Message-Id: <1617070307-5775-8-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617070307-5775-1-git-send-email-bbhatt@codeaurora.org>
References: <1617070307-5775-1-git-send-email-bbhatt@codeaurora.org>
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
index 8f5bf40..838a3c4 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -712,13 +712,27 @@ int mhi_device_get_sync(struct mhi_device *mhi_dev);
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

