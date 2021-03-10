Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 252C533491F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 21:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbhCJUt5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 15:49:57 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:34493 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231575AbhCJUtx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 15:49:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615409393; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=6Dex5qLQKQqs46mtJ5oJBUS+U8y6SzohFsM/HQL/NDs=; b=tsonqj3xPVoARWPuC7GHGTFtG4k8DuxT6+z8DcXRZmzXOkUim9QgAkirFW27ocjl2gD09XqO
 gz07KF8FN3sIs7DrEPspFdtAZBq/v4hi0d/wtXmX2tFiYWv6YEuONKdP4gtqeH/0JFTespoj
 DXylITgl0udhoCOq64OFxwySaHo=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 604930e1a6850484a6844cd6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 20:49:37
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 74303C43461; Wed, 10 Mar 2021 20:49:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 21566C433CA;
        Wed, 10 Mar 2021 20:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 21566C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v3] bus: mhi: core: Check state before processing power_down
Date:   Wed, 10 Mar 2021 13:49:25 -0700
Message-Id: <1615409365-8165-1-git-send-email-jhugo@codeaurora.org>
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

v3: Move the pm_lock use up
v2: Fix subject and tweak the locking to avoid needless lock/unlock/relock

 drivers/bus/mhi/core/pm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 414da4f..ea62549 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -1149,6 +1149,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 		mhi_deinit_dev_ctxt(mhi_cntrl);
 
 error_dev_ctxt:
+	mhi_cntrl->pm_state = MHI_PM_DISABLE;
 	mutex_unlock(&mhi_cntrl->pm_mutex);
 
 	return ret;
@@ -1160,12 +1161,19 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
 	enum mhi_pm_state cur_state, transition_state;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 
+	mutex_lock(&mhi_cntrl->pm_mutex);
+	write_lock_irq(&mhi_cntrl->pm_lock);
+	cur_state = mhi_cntrl->pm_state;
+	if (cur_state == MHI_PM_DISABLE) {
+		write_unlock_irq(&mhi_cntrl->pm_lock);
+		mutex_unlock(&mhi_cntrl->pm_mutex);
+		return; /* Already powered down */
+	}
+
 	/* If it's not a graceful shutdown, force MHI to linkdown state */
 	transition_state = (graceful) ? MHI_PM_SHUTDOWN_PROCESS :
 			   MHI_PM_LD_ERR_FATAL_DETECT;
 
-	mutex_lock(&mhi_cntrl->pm_mutex);
-	write_lock_irq(&mhi_cntrl->pm_lock);
 	cur_state = mhi_tryset_pm_state(mhi_cntrl, transition_state);
 	if (cur_state != transition_state) {
 		dev_err(dev, "Failed to move to state: %s from: %s\n",
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

