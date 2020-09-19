Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E542709D6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Sep 2020 04:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgISCCx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 22:02:53 -0400
Received: from so254-54.mailgun.net ([198.61.254.54]:32247 "EHLO
        so254-54.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726361AbgISCCu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 22:02:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600480969; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=/06be2WqbhKuXJzJdazBcUlFvcleAekB8N5QwkQrdyo=; b=ELS6DTMJrFwDqXAw7EgbzMSTqClVmHOz1UhBDMUdeCEr65T6Jej2WlJZVsv7VYVLL0vYuO4w
 XS4fdS2zk/Djh/Uh9K+pDMra88bJ5113PhmYtrBnwbWO1WYnI+9ro2/uEPR2WYEz6Z0lBRfh
 CtBGICHiYDj6/326pXoqXcfCy2o=
X-Mailgun-Sending-Ip: 198.61.254.54
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f6566c92131f7663acaa4ca (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 19 Sep 2020 02:02:49
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5DB58C433FF; Sat, 19 Sep 2020 02:02:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 94B9DC433C8;
        Sat, 19 Sep 2020 02:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 94B9DC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 10/10] bus: mhi: core: Mark device inactive soon after host issues a shutdown
Date:   Fri, 18 Sep 2020 19:02:35 -0700
Message-Id: <1600480955-16827-11-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Clients on the host may see the device in an active state for a short
period of time after the host detects a device error or power down.
Prevent any further host activity which could lead to race conditions
or multiple callbacks to the controller or any timeouts seen by
clients attempting to push data as they must be notified of the host
intent sooner rather than later. This also allows the host and device
states to be in sync with one another and prevents unnecessary host
operations.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/main.c |  4 ++++
 drivers/bus/mhi/core/pm.c   | 31 +++++++++++++++++++------------
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 1c8e332..5ec89e9 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -400,6 +400,10 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 
 	 /* If device supports RDDM don't bother processing SYS error */
 	if (mhi_cntrl->rddm_image) {
+		/* host may be performing a device power down already */
+		if (!mhi_is_active(mhi_cntrl))
+			goto exit_intvec;
+
 		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
 			/* prevent clients from queueing any more packets */
 			write_lock_irq(&mhi_cntrl->pm_lock);
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 16c04ab..4e2cb41 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -469,15 +469,10 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	prev_state = mhi_cntrl->pm_state;
 	cur_state = mhi_tryset_pm_state(mhi_cntrl, transition_state);
-	if (cur_state == transition_state) {
-		mhi_cntrl->ee = MHI_EE_DISABLE_TRANSITION;
+	if (cur_state == MHI_PM_SYS_ERR_PROCESS)
 		mhi_cntrl->dev_state = MHI_STATE_RESET;
-	}
 	write_unlock_irq(&mhi_cntrl->pm_lock);
 
-	/* Wake up threads waiting for state transition */
-	wake_up_all(&mhi_cntrl->state_event);
-
 	if (cur_state != transition_state) {
 		dev_err(dev, "Failed to transition to state: %s from: %s\n",
 			to_mhi_pm_state_str(transition_state),
@@ -486,6 +481,11 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
 		return;
 	}
 
+	mhi_cntrl->ee = MHI_EE_DISABLE_TRANSITION;
+
+	/* Wake up threads waiting for state transition */
+	wake_up_all(&mhi_cntrl->state_event);
+
 	/* Trigger MHI RESET so that the device will not access host memory */
 	if (MHI_REG_ACCESS_VALID(prev_state)) {
 		u32 in_reset = -1;
@@ -1051,22 +1051,29 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
 	enum dev_st_transition next_state = DEV_ST_TRANSITION_DISABLE;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 
+	mutex_lock(&mhi_cntrl->pm_mutex);
+	write_lock_irq(&mhi_cntrl->pm_lock);
+
 	/* If it's not a graceful shutdown, force MHI to linkdown state */
 	if (!graceful) {
-		mutex_lock(&mhi_cntrl->pm_mutex);
-		write_lock_irq(&mhi_cntrl->pm_lock);
 		cur_state = mhi_tryset_pm_state(mhi_cntrl,
 						MHI_PM_LD_ERR_FATAL_DETECT);
-		write_unlock_irq(&mhi_cntrl->pm_lock);
-		mutex_unlock(&mhi_cntrl->pm_mutex);
-		if (cur_state != MHI_PM_LD_ERR_FATAL_DETECT)
+		if (cur_state != MHI_PM_LD_ERR_FATAL_DETECT) {
 			dev_dbg(dev, "Failed to move to state: %s from: %s\n",
 				to_mhi_pm_state_str(MHI_PM_LD_ERR_FATAL_DETECT),
 				to_mhi_pm_state_str(mhi_cntrl->pm_state));
-		else
+		} else {
 			next_state = DEV_ST_TRANSITION_FATAL;
+			wake_up_all(&mhi_cntrl->state_event);
+		}
 	}
 
+	/* mark device inactive to avoid any further host processing */
+	mhi_cntrl->dev_state = MHI_STATE_RESET;
+
+	write_unlock_irq(&mhi_cntrl->pm_lock);
+	mutex_unlock(&mhi_cntrl->pm_mutex);
+
 	mhi_queue_state_transition(mhi_cntrl, next_state);
 
 	/* Wait for shutdown to complete */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

