Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6AE31DD8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 17:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234055AbhBQQox (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 11:44:53 -0500
Received: from z11.mailgun.us ([104.130.96.11]:14982 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234013AbhBQQox (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 11:44:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613580273; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=8z+GQFDMPDxWqMGf+iZxNYROZ5xgetxMNrnNdc81W2Q=; b=f8hoMdfbF6vQsIMUcWwpu4b4I60wMrxervZG+DM/TTlvGYJErspFE7/Y32J61o/nAZ1fj6/N
 rtuq40f9nL1R1avt4GnW9JyKfTLq7pt0mtrfoyl+DUkVMmp5b+nfZuUVVNQiwDXvVc0dnsNc
 UfU99GkrRrIroveXgP1g2+nULTo=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 602d47cbeb4f89cdf86906f1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 16:43:55
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F0F83C433C6; Wed, 17 Feb 2021 16:43:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A4D2BC433CA;
        Wed, 17 Feb 2021 16:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A4D2BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v2] bus: mhi: core: Check state before processing power_down
Date:   Wed, 17 Feb 2021 09:43:31 -0700
Message-Id: <1613580211-22744-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We cannot process a power_down if the power state is DISABLED.  There is
no valid mhi_ctxt in that case, so attepting to process the power_down
will likely result in a null pointer dereference.  If the power state is
DISABLED, there is nothing to do anyways, so just bail early.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---

v2: Fix subject and tweak the locking to avoid needless lock/unlock/relock

 drivers/bus/mhi/core/pm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 56ba3ab..47f6621 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -1144,6 +1144,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 		mhi_deinit_dev_ctxt(mhi_cntrl);
 
 error_dev_ctxt:
+	mhi_cntrl->pm_state = MHI_PM_DISABLE;
 	mutex_unlock(&mhi_cntrl->pm_mutex);
 
 	return ret;
@@ -1155,11 +1156,17 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
 	enum mhi_pm_state cur_state, transition_state;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 
+	mutex_lock(&mhi_cntrl->pm_mutex);
+	cur_state = mhi_cntrl->pm_state;
+	if (cur_state == MHI_PM_DISABLE) {
+		mutex_unlock(&mhi_cntrl->pm_mutex);
+		return; /* Already powered down */
+	}
+
 	/* If it's not a graceful shutdown, force MHI to linkdown state */
 	transition_state = (graceful) ? MHI_PM_SHUTDOWN_PROCESS :
 			   MHI_PM_LD_ERR_FATAL_DETECT;
 
-	mutex_lock(&mhi_cntrl->pm_mutex);
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	cur_state = mhi_tryset_pm_state(mhi_cntrl, transition_state);
 	if (cur_state != transition_state) {
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

