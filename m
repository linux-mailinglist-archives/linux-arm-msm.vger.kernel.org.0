Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE6F334C8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 00:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233830AbhCJXbf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 18:31:35 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:33254 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233873AbhCJXbc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 18:31:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615419092; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=8QPQ7A4y9jySrbcGeh1018gAyYPHik4GWI6KwBvFwWU=; b=QbJGJd8pjw1lVyHA8OnnDbCY5Y6ljAROPfUZVtMlOBsKAAPXDddD7X8Sx0ox5zmd1AqfQyKK
 bAp/RbYbEGKAuU6h4uVouxGI/QlF2HvR3w7ArE5eCxKz9mI1A9vBD9Z5oFckjx1RZwu0PGbx
 09vZtEZ72B160ncrkB6xxjPLyKI=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 604956d3fa6ebd85e8c11c90 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 23:31:31
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AABAEC43464; Wed, 10 Mar 2021 23:31:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C6FB9C43463;
        Wed, 10 Mar 2021 23:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C6FB9C43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 2/3] bus: mhi: core: Move to polling method to wait for MHI ready
Date:   Wed, 10 Mar 2021 15:31:19 -0800
Message-Id: <1615419080-26540-3-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615419080-26540-1-git-send-email-bbhatt@codeaurora.org>
References: <1615419080-26540-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In certain devices, it is likely that there is no incoming MHI
interrupt for a transition to MHI READY state. One such example
is the move from Pass Through to an SBL or AMSS execution
environment. In order to facilitate faster bootup times as there
is no need to wait until timeout_ms completes, MHI host can poll
every 25 milliseconds to check if device has entered MHI READY
until a maximum timeout of twice the timeout_ms is reached.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/pm.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 681960c..dcc7fe0 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -153,34 +153,32 @@ static void mhi_toggle_dev_wake(struct mhi_controller *mhi_cntrl)
 /* Handle device ready state transition */
 int mhi_ready_state_transition(struct mhi_controller *mhi_cntrl)
 {
-	void __iomem *base = mhi_cntrl->regs;
 	struct mhi_event *mhi_event;
 	enum mhi_pm_state cur_state;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	u32 reset = 1, ready = 0;
+	u32 interval_us = 25000; /* poll register field every 25 milliseconds */
 	int ret, i;
 
-	/* Wait for RESET to be cleared and READY bit to be set by the device */
-	wait_event_timeout(mhi_cntrl->state_event,
-			   MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
-			   mhi_read_reg_field(mhi_cntrl, base, MHICTRL,
-					      MHICTRL_RESET_MASK,
-					      MHICTRL_RESET_SHIFT, &reset) ||
-			   mhi_read_reg_field(mhi_cntrl, base, MHISTATUS,
-					      MHISTATUS_READY_MASK,
-					      MHISTATUS_READY_SHIFT, &ready) ||
-			   (!reset && ready),
-			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
-
 	/* Check if device entered error state */
 	if (MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state)) {
 		dev_err(dev, "Device link is not accessible\n");
 		return -EIO;
 	}
 
-	/* Timeout if device did not transition to ready state */
-	if (reset || !ready) {
-		dev_err(dev, "Device Ready timeout\n");
+	/* Wait for RESET to be cleared and READY bit to be set by the device */
+	ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
+				 MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 0,
+				 interval_us);
+	if (ret) {
+		dev_err(dev, "Device failed to clear MHI Reset\n");
+		return -ETIMEDOUT;
+	}
+
+	ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHISTATUS,
+				 MHISTATUS_READY_MASK, MHISTATUS_READY_SHIFT, 1,
+				 interval_us);
+	if (ret) {
+		dev_err(dev, "Device failed to enter MHI Ready\n");
 		return -ETIMEDOUT;
 	}
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

