Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC875334C95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 00:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233178AbhCJXcH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 18:32:07 -0500
Received: from z11.mailgun.us ([104.130.96.11]:44679 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233928AbhCJXbr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 18:31:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615419107; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=7ju+k5O+g46JVXx3bckF9QMASzIzv/AQGrr/48ujmEQ=; b=ImABhP6UeQMMXOkHdqLNx8yglbRVZEQ772twHOxyvX/lQ0x5Xyx4wTL8XFvKou7igalsYrmx
 94SzL850Sd8o1pP2/hw/9DkJa7SyR6R9N+Wid+8BzZmUoJfkzTdUtZ1taOjfPU5q/aNYf2U7
 Udk5HvVcmDXx8/OLxCbPxYSQn54=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 604956d3b86af9bf23eba266 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 23:31:31
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F143DC433C6; Wed, 10 Mar 2021 23:31:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 15B30C433ED;
        Wed, 10 Mar 2021 23:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 15B30C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 1/3] bus: mhi: core: Introduce internal register poll helper function
Date:   Wed, 10 Mar 2021 15:31:18 -0800
Message-Id: <1615419080-26540-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615419080-26540-1-git-send-email-bbhatt@codeaurora.org>
References: <1615419080-26540-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce helper function to allow MHI core driver to poll for
a value in a register field. This helps reach a common path to
read and poll register values along with a retry time interval.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/internal.h |  3 +++
 drivers/bus/mhi/core/main.c     | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 6f80ec3..005286b 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -643,6 +643,9 @@ int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
 int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
 				    void __iomem *base, u32 offset, u32 mask,
 				    u32 shift, u32 *out);
+int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
+				    void __iomem *base, u32 offset, u32 mask,
+				    u32 shift, u32 val, u32 delayus);
 void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
 		   u32 offset, u32 val);
 void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void __iomem *base,
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 4e0131b..7c7f41a 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -4,6 +4,7 @@
  *
  */
 
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
@@ -37,6 +38,28 @@ int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
 	return 0;
 }
 
+int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
+				    void __iomem *base, u32 offset,
+				    u32 mask, u32 shift, u32 val, u32 delayus)
+{
+	int ret;
+	u32 out, retry = (mhi_cntrl->timeout_ms * 1000) / delayus;
+
+	while (retry--) {
+		ret = mhi_read_reg_field(mhi_cntrl, base, offset, mask, shift,
+					 &out);
+		if (ret)
+			return ret;
+
+		if (out == val)
+			return 0;
+
+		udelay(delayus);
+	}
+
+	return -ENOENT;
+}
+
 void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
 		   u32 offset, u32 val)
 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

