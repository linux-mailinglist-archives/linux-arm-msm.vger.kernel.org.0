Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB9EB2412C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 00:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgHJWCS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Aug 2020 18:02:18 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:33944 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbgHJWCR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Aug 2020 18:02:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597096937; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ioooE+fzXamAHhCgRQDuFcqRudLDu78ki8QC2uL//R4=; b=R7ljGU+3pS9Rl0NqDVPXHupNN9AoWm67ABJzYKFXzHVCX0ix7csYSBbFjl1UAzIx2jZNq+Z0
 m6B9pHQLzm6uqzpHIYiu382oDXd85Tp5hQg0YJbwM0mN4szinckP4h3MIernZjgkzwbgLyXb
 zq8CnxxDvRl+0UOYXXVKuP0O1LI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-east-1.postgun.com with SMTP id
 5f31c3afd78a2e58337fc070 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 10 Aug 2020 22:01:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2202AC433C6; Mon, 10 Aug 2020 22:01:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BC306C433C6;
        Mon, 10 Aug 2020 22:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BC306C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v7 10/11] bus: mhi: core: Introduce APIs to allocate and free the MHI controller
Date:   Mon, 10 Aug 2020 15:01:04 -0700
Message-Id: <1597096865-19636-11-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597096865-19636-1-git-send-email-bbhatt@codeaurora.org>
References: <1597096865-19636-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Client devices should use the APIs provided to allocate and free
the MHI controller structure. This will help ensure that the
structure is zero-initialized and there are no false positives
with respect to reading any values such as the serial number or
the OEM PK hash.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 16 ++++++++++++++++
 include/linux/mhi.h         | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index d2c0f6e..972dbf0 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -959,6 +959,22 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_unregister_controller);
 
+struct mhi_controller *mhi_alloc_controller(void)
+{
+	struct mhi_controller *mhi_cntrl;
+
+	mhi_cntrl = kzalloc(sizeof(*mhi_cntrl), GFP_KERNEL);
+
+	return mhi_cntrl;
+}
+EXPORT_SYMBOL_GPL(mhi_alloc_controller);
+
+void mhi_free_controller(struct mhi_controller *mhi_cntrl)
+{
+	kfree(mhi_cntrl);
+}
+EXPORT_SYMBOL_GPL(mhi_free_controller);
+
 int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 {
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 4065762..4955634 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -530,6 +530,18 @@ struct mhi_driver {
 #define to_mhi_device(dev) container_of(dev, struct mhi_device, dev)
 
 /**
+ * mhi_alloc_controller - Allocate the MHI Controller structure
+ * Allocate the mhi_controller structure using zero initialized memory
+ */
+struct mhi_controller *mhi_alloc_controller(void);
+
+/**
+ * mhi_free_controller - Free the MHI Controller structure
+ * Free the mhi_controller structure which was previously allocated
+ */
+void mhi_free_controller(struct mhi_controller *mhi_cntrl);
+
+/**
  * mhi_register_controller - Register MHI controller
  * @mhi_cntrl: MHI controller to register
  * @config: Configuration to use for the controller
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

