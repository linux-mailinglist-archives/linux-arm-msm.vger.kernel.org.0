Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B485A1DA698
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 02:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728420AbgETAav (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 20:30:51 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:48058 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728371AbgETAau (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 20:30:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589934649; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=xOiccy8qbN/kYPRHPOv0e/x0ekCBVaAsBCRvQazmjcY=; b=Pmriv/eCuqW59dIJQCXknQ66qb+r83hHOYNL0QYNOPxZ20svZKpEp/CVrmPU89Coq8JqvkHY
 Dr/jU6zPAztLHhJrBYCp8QVl8afOOb8EGQpEo2JQKoVqy3qv/V+Pfir23X5QFk5vgkBFi8G3
 LXpOitvUt23oosOHfGN0XQngnJg=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec47a2f.7fa0fbbe3260-smtp-out-n03;
 Wed, 20 May 2020 00:30:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9E0C3C433A1; Wed, 20 May 2020 00:30:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48198C433CB;
        Wed, 20 May 2020 00:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 48198C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 2/6] bus: mhi: core: Mark device inactive soon after host issues a shutdown
Date:   Tue, 19 May 2020 17:30:27 -0700
Message-Id: <1589934631-22752-3-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589934631-22752-1-git-send-email-bbhatt@codeaurora.org>
References: <1589934631-22752-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Clients on the host may see the device in an active state for a short
period of time after the host detects a device error or power down.
Prevent any further host activity which could lead to race conditions
and timeouts seen by clients attempting to push data as they must be
notified of the host's intent sooner than later. This also allows the
host and device states to be in sync with one another and prevents
unnecessary host operations.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 33 ++++++++++++++++++++++++++-------
 drivers/bus/mhi/core/pm.c   | 31 +++++++++++++++++++------------
 2 files changed, 45 insertions(+), 19 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index bafc12a..da32c23 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -376,6 +376,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 	enum mhi_state state = MHI_STATE_MAX;
 	enum mhi_pm_state pm_state = 0;
 	enum mhi_ee_type ee = 0;
+	bool handle_rddm = false;
 
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
@@ -390,22 +391,40 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 		TO_MHI_EXEC_STR(mhi_cntrl->ee), TO_MHI_EXEC_STR(ee),
 		TO_MHI_STATE_STR(state));
 
-	if (state == MHI_STATE_SYS_ERR) {
-		dev_dbg(dev, "System error detected\n");
-		pm_state = mhi_tryset_pm_state(mhi_cntrl,
-					       MHI_PM_SYS_ERR_DETECT);
-	}
-	write_unlock_irq(&mhi_cntrl->pm_lock);
-
 	 /* If device supports RDDM don't bother processing SYS error */
 	if (mhi_cntrl->rddm_image) {
+		/* host may be performing a device power down already */
+		if (!mhi_is_active(mhi_cntrl)) {
+			write_unlock_irq(&mhi_cntrl->pm_lock);
+			goto exit_intvec;
+		}
+
 		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
+			/* prevent clients from queueing any more packets */
+			pm_state = mhi_tryset_pm_state(mhi_cntrl,
+						       MHI_PM_SYS_ERR_DETECT);
+			if (pm_state == MHI_PM_SYS_ERR_DETECT)
+				handle_rddm = true;
+		}
+
+		write_unlock_irq(&mhi_cntrl->pm_lock);
+
+		if (handle_rddm) {
+			dev_err(dev, "RDDM event occurred!\n");
 			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
 			wake_up_all(&mhi_cntrl->state_event);
 		}
 		goto exit_intvec;
 	}
 
+	if (state == MHI_STATE_SYS_ERR) {
+		dev_dbg(dev, "System error detected\n");
+		pm_state = mhi_tryset_pm_state(mhi_cntrl,
+					       MHI_PM_SYS_ERR_DETECT);
+	}
+
+	write_unlock_irq(&mhi_cntrl->pm_lock);
+
 	if (pm_state == MHI_PM_SYS_ERR_DETECT) {
 		wake_up_all(&mhi_cntrl->state_event);
 
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index b2b3de7..1daed86 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -465,15 +465,10 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
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
@@ -482,6 +477,11 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
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
@@ -1048,22 +1048,29 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
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
 
+	/* mark device as inactive to avoid any further host processing */
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
