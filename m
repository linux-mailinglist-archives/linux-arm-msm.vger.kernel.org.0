Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADAD231F3F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 03:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhBSCSn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 21:18:43 -0500
Received: from z11.mailgun.us ([104.130.96.11]:49278 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229620AbhBSCSj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 21:18:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613701093; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=RSZJlvTSuoNP/f8lXXU4TuJQYuVJO516ef2MclePcFE=; b=S1xFXwIT19k5PmDTl0beQGW4SLX0lRVYDidkkYGyiD4o72MuLez+Nu5Sib8NGMHXNsRQnABq
 9gjU/0UzPrMkkz5RulgqfI3Wqj6hF9zwL/KbbDhhrmuhqFblcslKmacYgHCFUJAsOqo7UYjq
 NLLparSGf8++kfCXSbDPogQKTBM=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 602f1fc637f02eb714211788 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Feb 2021 02:17:42
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 44B0BC43461; Fri, 19 Feb 2021 02:17:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8DCDBC433C6;
        Fri, 19 Feb 2021 02:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8DCDBC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 3/3] bus: mhi: core: Process execution environment changes serially
Date:   Thu, 18 Feb 2021 18:17:32 -0800
Message-Id: <1613701052-38885-4-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613701052-38885-1-git-send-email-bbhatt@codeaurora.org>
References: <1613701052-38885-1-git-send-email-bbhatt@codeaurora.org>
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

We must handle and wait for SYS_ERROR in any case to facilitate
clean-up for the controller and handle RDDM. Ensure that EE
changes are handled only from appropriate places and occur one
after another and handle only PBL modes or RDDM EE changes as
critical events directly from the interrupt handler. This also
makes sure that we use the correct execution environment to notify
the controller driver when the device resets to one of the PBL
execution environments.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 40 +++++++++++++++++++++-------------------
 drivers/bus/mhi/core/pm.c   |  5 +++--
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 58f1425..0cfe0f5 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -428,7 +428,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	enum mhi_state state = MHI_STATE_MAX;
 	enum mhi_pm_state pm_state = 0;
-	enum mhi_ee_type ee = 0;
+	enum mhi_ee_type ee = MHI_EE_MAX;
 
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
@@ -437,8 +437,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 	}
 
 	state = mhi_get_mhi_state(mhi_cntrl);
-	ee = mhi_cntrl->ee;
-	mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
+	ee = mhi_get_exec_env(mhi_cntrl);
 	dev_dbg(dev, "local ee:%s device ee:%s dev_state:%s\n",
 		TO_MHI_EXEC_STR(mhi_cntrl->ee), TO_MHI_EXEC_STR(ee),
 		TO_MHI_STATE_STR(state));
@@ -450,27 +449,30 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
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
+		if (!mhi_cntrl->rddm_image)
+			goto exit_intvec;
+		/* proceed if power down is not already in progress */
+		if (mhi_is_active(mhi_cntrl)) {
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
+	/* continue */
+	default:
+		mhi_pm_sys_err_handler(mhi_cntrl);
 		wake_up_all(&mhi_cntrl->state_event);
-
-		/* For fatal errors, we let controller decide next step */
-		if (MHI_IN_PBL(ee))
-			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
-		else
-			mhi_pm_sys_err_handler(mhi_cntrl);
+		break;
 	}
 
 exit_intvec:
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 44aa7eb..c870fa8 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -384,14 +384,15 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
 
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

