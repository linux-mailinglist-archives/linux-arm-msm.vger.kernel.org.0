Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36351CEA6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 04:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728408AbgELCDT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 22:03:19 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:11680 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727942AbgELCDT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 22:03:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589248999; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=sB4Rjkb7qIuLcCTYtGiQC/L8BR2eEI+tANIskUqLp8U=; b=CQhIa1JAzkG0x5PQY3XjAHNIH1vqIFDgzsVm8Vg9I4ZuNu+STM45kafpVQlH4Zvo5Zc6oT5G
 JBLEdZXRyKSkvPzDZhhi5KMy4FGBMk+BnZKg9HW8fhgRNEQyrnJzkvDr5xC/4g+Tqap+F1aw
 xtCblJgBZzM6ojoC5tmYyL7Vd6A=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eba03e6.7feb2893ea78-smtp-out-n02;
 Tue, 12 May 2020 02:03:18 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 451D6C433F2; Tue, 12 May 2020 02:03:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D521C432C2;
        Tue, 12 May 2020 02:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D521C432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v1 3/5] bus: mhi: core: Skip handling BHI irq if MHI reg access is not allowed
Date:   Mon, 11 May 2020 19:03:07 -0700
Message-Id: <1589248989-23824-4-git-send-email-hemantk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
References: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Driver continues handling of BHI interrupt even if MHI register access
is not allowed. By doing so it calls the status call back and performs
early notification for the MHI client. This is not needed when MHI
register access is not allowed. Hence skip the handling in this case and
return. Also add debug log to print device state, local EE and device EE
when reg access is valid.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 9ec9b36..467c0ba 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -369,22 +369,29 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
 	return IRQ_HANDLED;
 }
 
-irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *dev)
+irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 {
-	struct mhi_controller *mhi_cntrl = dev;
+	struct mhi_controller *mhi_cntrl = priv;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	enum mhi_state state = MHI_STATE_MAX;
 	enum mhi_pm_state pm_state = 0;
 	enum mhi_ee_type ee = 0;
 
 	write_lock_irq(&mhi_cntrl->pm_lock);
-	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
-		state = mhi_get_mhi_state(mhi_cntrl);
-		ee = mhi_cntrl->ee;
-		mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
+	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
+		write_unlock_irq(&mhi_cntrl->pm_lock);
+		goto exit_intvec;
 	}
 
+	state = mhi_get_mhi_state(mhi_cntrl);
+	ee = mhi_cntrl->ee;
+	mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
+	dev_dbg(dev, "local ee:%s device ee:%s dev_state:%s\n",
+		TO_MHI_EXEC_STR(mhi_cntrl->ee), TO_MHI_EXEC_STR(ee),
+		TO_MHI_STATE_STR(state));
+
 	if (state == MHI_STATE_SYS_ERR) {
-		dev_dbg(&mhi_cntrl->mhi_dev->dev, "System error detected\n");
+		dev_dbg(dev, "System error detected\n");
 		pm_state = mhi_tryset_pm_state(mhi_cntrl,
 					       MHI_PM_SYS_ERR_DETECT);
 	}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
