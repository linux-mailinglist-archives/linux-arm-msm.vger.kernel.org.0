Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26AC2E9322
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 11:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725468AbhADKM0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 05:12:26 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:35773 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbhADKMY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 05:12:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609755124; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=b1YdbSOxLE1TmKfcFnR94xmBHprCl+Qqt/okT9c2OCE=; b=YFpOdUee4Vz3PUdSmuAdmNF+akD5BeHeYwZZobntCjPnRKQ6I1u5yOuWP3JIpCuB3VNpHp6v
 9U1lvdSOejYb83+z6pDE64uCHR4BngD1fiZSw7PQaKedUEYJSToxQluk5+64/F41c6e8IesW
 XizHe8gw3LGiwM+YaDHDdZbLf4s=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5ff2e9d9cf8ceaa9eec0fa6f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Jan 2021 10:11:37
 GMT
Sender: cjhuang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2417C433C6; Mon,  4 Jan 2021 10:11:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from cjhuang-Celadon-RN.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cjhuang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 663C1C433CA;
        Mon,  4 Jan 2021 10:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 663C1C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=cjhuang@codeaurora.org
From:   Carl Huang <cjhuang@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
Subject: [PATCH v3] mhi: use irq_flags if controller driver configures it
Date:   Mon,  4 Jan 2021 18:11:28 +0800
Message-Id: <20210104101128.8217-1-cjhuang@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If controller driver has specified the irq_flags, mhi uses this specified
irq_flags. Otherwise, mhi uses default irq_flags.

The purpose of this change is to support one MSI vector for QCA6390.
MHI will use one same MSI vector too in this scenario.

In case of one MSI vector, IRQ_NO_BALANCING is needed when irq handler
is requested. The reason is if irq migration happens, the msi_data may
change too. However, the msi_data is already programmed to QCA6390
hardware during initialization phase. This msi_data inconsistence will
result in crash in kernel.

Another issue is in case of one MSI vector, IRQF_NO_SUSPEND will trigger
WARNINGS because QCA6390 wants to disable the IRQ during the suspend.

To avoid above two issues, QCA6390 driver specifies the irq_flags in case
of one MSI vector when mhi_register_controller is called.

Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
v3:
- replace "client driver" with "controller driver"
- add Reviewed-by: Manivannan Sadhasivam 

v2:
- document irq_flags added to mhi_controller

 drivers/bus/mhi/core/init.c | 9 +++++++--
 include/linux/mhi.h         | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 381fdea..37903a8 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -148,12 +148,17 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
 	int i, ret;
 
+	/* if controller driver has set irq_flags, use it */
+	if (mhi_cntrl->irq_flags)
+		irq_flags = mhi_cntrl->irq_flags;
+
 	/* Setup BHI_INTVEC IRQ */
 	ret = request_threaded_irq(mhi_cntrl->irq[0], mhi_intvec_handler,
 				   mhi_intvec_threaded_handler,
-				   IRQF_SHARED | IRQF_NO_SUSPEND,
+				   irq_flags,
 				   "bhi", mhi_cntrl);
 	if (ret)
 		return ret;
@@ -171,7 +176,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 
 		ret = request_irq(mhi_cntrl->irq[mhi_event->irq],
 				  mhi_irq_handler,
-				  IRQF_SHARED | IRQF_NO_SUSPEND,
+				  irq_flags,
 				  "mhi", mhi_event);
 		if (ret) {
 			dev_err(dev, "Error requesting irq:%d for ev:%d\n",
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index cb7cd54..77f1e3f 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -351,6 +351,7 @@ struct mhi_controller_config {
  * @fbc_download: MHI host needs to do complete image transfer (optional)
  * @pre_init: MHI host needs to do pre-initialization before power up
  * @wake_set: Device wakeup set flag
+ * @irq_flags: irq flags passed to request_irq (optional)
  *
  * Fields marked as (required) need to be populated by the controller driver
  * before calling mhi_register_controller(). For the fields marked as (optional)
@@ -440,6 +441,7 @@ struct mhi_controller {
 	bool fbc_download;
 	bool pre_init;
 	bool wake_set;
+	unsigned long irq_flags;
 };
 
 /**
-- 
2.7.4

