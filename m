Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1396C2D219D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Dec 2020 04:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgLHD4B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 22:56:01 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:23893 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgLHD4B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 22:56:01 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607399738; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=SU3gzYwu1P778bk/k8VTWVgsSzAf+P8ZZyYKWgrzL8w=; b=BGlGvfOsv0oRsDD5W57ciHo8OiyLAmeGvNAHzxpmPTsAss1VIBERvyLQSOvVA4ocw3nUNXWC
 YI+T9xCNgrDxPgZWHnwXYMtiWcdy3ooeO3hJ+Ir7BpiTY7UbZ6/nhEWtCoGa6NikV1u+rUNo
 KGQDsuL7SBj8psBVNVTaDt8zSzU=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fcef91cca03b14965ae9146 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Dec 2020 03:55:08
 GMT
Sender: cjhuang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6A1DEC43461; Tue,  8 Dec 2020 03:55:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from cjhuang-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cjhuang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8F047C433C6;
        Tue,  8 Dec 2020 03:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8F047C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=cjhuang@codeaurora.org
From:   Carl Huang <cjhuang@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] mhi: use irq_flags if client driver configures it
Date:   Mon,  7 Dec 2020 22:55:00 -0500
Message-Id: <20201208035500.30581-1-cjhuang@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If client driver has specified the irq_flags, mhi uses this specified
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
---
 drivers/bus/mhi/core/init.c | 9 +++++++--
 include/linux/mhi.h         | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 0ffdebd..5f74e1e 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -148,12 +148,17 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
 	int i, ret;
 
+	/* if client driver has set irq_flags, use it */
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
index d4841e5..f039e58 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -442,6 +442,7 @@ struct mhi_controller {
 	bool fbc_download;
 	bool pre_init;
 	bool wake_set;
+	unsigned long irq_flags;
 };
 
 /**
-- 
2.7.4

