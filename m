Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB013323627
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 04:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233403AbhBXDpi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 22:45:38 -0500
Received: from z11.mailgun.us ([104.130.96.11]:39424 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233398AbhBXDph (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 22:45:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614138312; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=JvA82ucU686T5w3s1gkPD71FWMg3XDZav4r5XPIDTrY=; b=AER8QM4PmYJr3mdWJ+ts9z7NDqdNGv4wOH9svnQ1CvTnfqxqh4gR+bhlmppJC6UxI9mvaIdJ
 bD26xRgKdASu6RnmZ92qWmTHpPlWWg3X0Ylb39biKn3LQH0wnTSYJtYv+axSDpxEECbMR541
 4LqURY/wnQz4YG1k+qufkuq/dAs=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6035cba7090a7742872f7463 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 03:44:39
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CE54EC43463; Wed, 24 Feb 2021 03:44:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC617C433ED;
        Wed, 24 Feb 2021 03:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC617C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 1/3] bus: mhi: core: Introduce internal register poll helper function
Date:   Tue, 23 Feb 2021 19:44:28 -0800
Message-Id: <1614138270-2374-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614138270-2374-1-git-send-email-bbhatt@codeaurora.org>
References: <1614138270-2374-1-git-send-email-bbhatt@codeaurora.org>
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
index 4e0131b..249ae26 100644
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
+	int ret = -ENOENT;
+	u32 out, retry = (mhi_cntrl->timeout_ms * 1000) / delayus;
+
+	while (retry--) {
+		ret = mhi_read_reg_field(mhi_cntrl, base, offset, mask, shift,
+					 &out);
+		if (ret)
+			return -EIO;
+
+		if (out == val)
+			return 0;
+
+		udelay(delayus);
+	}
+
+	return ret;
+}
+
 void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
 		   u32 offset, u32 val)
 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

