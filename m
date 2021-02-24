Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5940832477C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 00:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236233AbhBXXYX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 18:24:23 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:15440 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236237AbhBXXYH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 18:24:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614209022; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=aR0Q58rOOfKn7VjsJWYxZHcuTjrPHm0K4ypGD9kG/K8=; b=btikxtRb0llG9bP5cBuLnVNKvCo55mqTEUq4QJ17Q7jy1BhN1MUB5tlXGYlQ0URDSIkSWU4Z
 HzTLJv6074zfO2mudIoOofzDOJ3Db8U/FoxpBzRAegm9qW62QEFSQWQCuQTRDipv42rMqZQ7
 TEVgMFqvi5PFigQ9smfr/bWvj/Y=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6036dfe248e80e1dc5babb1c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 23:23:14
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2A308C433CA; Wed, 24 Feb 2021 23:23:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D12D1C43462;
        Wed, 24 Feb 2021 23:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D12D1C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v6 3/4] bus: mhi: core: Process execution environment changes serially
Date:   Wed, 24 Feb 2021 15:23:04 -0800
Message-Id: <1614208985-20851-4-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org>
References: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In current design, whenever the BHI interrupt is fired, the
execution environment is updated. This can cause race conditions
and impede ongoing power up/down processing. For example, if a
power down is in progress, MHI host updates to a local "disabled"
execution environment. If a BHI interrupt fires later, that value
gets replaced with one from the BHI EE register. This impacts the
controller as it does not expect multiple RDDM execution
environment change status callbacks as an example. Another issue
would be that the device can enter mission mode and the execution
environment is updated, while device creation for SBL channels is
still going on due to slower PM state worker thread run, leading
to multiple attempts at opening the same channel.

Ensure that EE changes are handled only from appropriate places
and occur one after another and handle only PBL modes or RDDM EE
changes as critical events directly from the interrupt handler.
Simplify handling by waiting for SYS ERROR before handling RDDM.
This also makes sure that we use the correct execution environment
to notify the controller driver when the device resets to one of
the PBL execution environments.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 40 +++++++++++++++++++++-------------------
 drivers/bus/mhi/core/pm.c   |  7 ++++---
 2 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 7a2e98c..9715f51 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -430,7 +430,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	enum mhi_state state = MHI_STATE_MAX;
 	enum mhi_pm_state pm_state = 0;
-	enum mhi_ee_type ee = 0;
+	enum mhi_ee_type ee = MHI_EE_MAX;
 
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
@@ -439,8 +439,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 	}
 
 	state = mhi_get_mhi_state(mhi_cntrl);
-	ee = mhi_cntrl->ee;
-	mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
+	ee = mhi_get_exec_env(mhi_cntrl);
 	dev_dbg(dev, "local ee:%s device ee:%s dev_state:%s\n",
 		TO_MHI_EXEC_STR(mhi_cntrl->ee), TO_MHI_EXEC_STR(ee),
 		TO_MHI_STATE_STR(state));
@@ -452,27 +451,30 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 	}
 	write_unlock_irq(&mhi_cntrl->pm_lock);
 
-	 /* If device supports RDDM don't bother processing SYS error */
-	if (mhi_cntrl->rddm_image) {
-		/* host may be performing a device power down already */
-		if (!mhi_is_active(mhi_cntrl))
-			goto exit_intvec;
+	if (pm_state != MHI_PM_SYS_ERR_DETECT || ee == mhi_cntrl->ee)
+		goto exit_intvec;
 
-		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
+	switch (ee) {
+	case MHI_EE_RDDM:
+		/* proceed if power down is not already in progress */
+		if (mhi_cntrl->rddm_image && mhi_is_active(mhi_cntrl)) {
 			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
+			mhi_cntrl->ee = ee;
 			wake_up_all(&mhi_cntrl->state_event);
 		}
-		goto exit_intvec;
-	}
-
-	if (pm_state == MHI_PM_SYS_ERR_DETECT) {
+		break;
+	case MHI_EE_PBL:
+	case MHI_EE_EDL:
+	case MHI_EE_PTHRU:
+		mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
+		mhi_cntrl->ee = ee;
 		wake_up_all(&mhi_cntrl->state_event);
-
-		/* For fatal errors, we let controller decide next step */
-		if (MHI_IN_PBL(ee))
-			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
-		else
-			mhi_pm_sys_err_handler(mhi_cntrl);
+		mhi_pm_sys_err_handler(mhi_cntrl);
+		break;
+	default:
+		wake_up_all(&mhi_cntrl->state_event);
+		mhi_pm_sys_err_handler(mhi_cntrl);
+		break;
 	}
 
 exit_intvec:
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index c09ec13..c870fa8 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -377,21 +377,22 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_event *mhi_event;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	enum mhi_ee_type current_ee = mhi_cntrl->ee;
+	enum mhi_ee_type ee = MHI_EE_MAX, current_ee = mhi_cntrl->ee;
 	int i, ret;
 
 	dev_dbg(dev, "Processing Mission Mode transition\n");
 
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state))
-		mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
+		ee = mhi_get_exec_env(mhi_cntrl);
 
-	if (!MHI_IN_MISSION_MODE(mhi_cntrl->ee)) {
+	if (!MHI_IN_MISSION_MODE(ee)) {
 		mhi_cntrl->pm_state = MHI_PM_LD_ERR_FATAL_DETECT;
 		write_unlock_irq(&mhi_cntrl->pm_lock);
 		wake_up_all(&mhi_cntrl->state_event);
 		return -EIO;
 	}
+	mhi_cntrl->ee = ee;
 	write_unlock_irq(&mhi_cntrl->pm_lock);
 
 	wake_up_all(&mhi_cntrl->state_event);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

