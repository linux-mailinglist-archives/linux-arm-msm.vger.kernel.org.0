Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7322C29FADB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 02:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgJ3BwY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 21:52:24 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:15865 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbgJ3BwS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 21:52:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604022737; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Du0L7znsZbpysoHB9CLpyUVXUEDUv0T27NVa+UG6pNg=; b=Y9KOmIfxXG0h9g6eweOFwvCQxuPSlCadeOGzVwfCjIqGEyzdv4l6+2+FYzgBdRJfmD8qn45E
 SygDzB1/P8HBrzz5mjNE5VbnjUz0vqDH3sSGSam5qCa8syOQiRq2f1lhiV6I3HYtg85OiY5R
 uH0NkJHZWvrtUaR9iISRHIMwGtE=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f9b71d11df7f5f83c791876 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 01:52:17
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 48FB3C433FE; Fri, 30 Oct 2020 01:52:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EF0FEC433FE;
        Fri, 30 Oct 2020 01:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EF0FEC433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 11/12] bus: mhi: core: Mark and maintain device states early on after power down
Date:   Thu, 29 Oct 2020 18:52:02 -0700
Message-Id: <1604022723-34578-12-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604022723-34578-1-git-send-email-bbhatt@codeaurora.org>
References: <1604022723-34578-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

mhi_power_down() does not ensure that the PM state is moved to an
inaccessible state soon enough as the system can encounter
scheduling delays till mhi_pm_disable_transition() gets called.
Additionally, if an MHI controller decides that the device is now
inaccessible and issues a power down, the register inaccessible
state is not maintained by moving from MHI_PM_LD_ERR_FATAL_DETECT
to MHI_PM_SHUTDOWN_PROCESS. This can result in bus errors if a
client driver attempted to read registers when powering down.
Close these gaps and avoid any race conditions to prevent such
activity.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/pm.c | 77 ++++++++++++++++++++---------------------------
 1 file changed, 33 insertions(+), 44 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 347ae7d..ffbf6f5 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -37,9 +37,10 @@
  *     M0 -> FW_DL_ERR
  *     M0 -> M3_ENTER -> M3 -> M3_EXIT --> M0
  * L1: SYS_ERR_DETECT -> SYS_ERR_PROCESS --> POR
- * L2: SHUTDOWN_PROCESS -> DISABLE
+ * L2: SHUTDOWN_PROCESS -> LD_ERR_FATAL_DETECT
+ *     SHUTDOWN_PROCESS -> DISABLE
  * L3: LD_ERR_FATAL_DETECT <--> LD_ERR_FATAL_DETECT
- *     LD_ERR_FATAL_DETECT -> SHUTDOWN_PROCESS
+ *     LD_ERR_FATAL_DETECT -> DISABLE
  */
 static struct mhi_pm_transitions const dev_state_transitions[] = {
 	/* L0 States */
@@ -72,7 +73,7 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
 	{
 		MHI_PM_M3,
 		MHI_PM_M3_EXIT | MHI_PM_SYS_ERR_DETECT |
-		MHI_PM_SHUTDOWN_PROCESS | MHI_PM_LD_ERR_FATAL_DETECT
+		MHI_PM_LD_ERR_FATAL_DETECT
 	},
 	{
 		MHI_PM_M3_EXIT,
@@ -103,7 +104,7 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
 	/* L3 States */
 	{
 		MHI_PM_LD_ERR_FATAL_DETECT,
-		MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_SHUTDOWN_PROCESS
+		MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_DISABLE
 	},
 };
 
@@ -445,10 +446,9 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
 }
 
 /* Handle shutdown transitions */
-static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
-				      enum mhi_pm_state transition_state)
+static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
 {
-	enum mhi_pm_state cur_state, prev_state;
+	enum mhi_pm_state cur_state;
 	struct mhi_event *mhi_event;
 	struct mhi_cmd_ctxt *cmd_ctxt;
 	struct mhi_cmd *mhi_cmd;
@@ -456,33 +456,13 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	int ret, i;
 
-	dev_dbg(dev, "Transitioning from PM state: %s to: %s\n",
-		to_mhi_pm_state_str(mhi_cntrl->pm_state),
-		to_mhi_pm_state_str(transition_state));
+	dev_dbg(dev, "Processing disable transition with PM state: %s\n",
+		to_mhi_pm_state_str(mhi_cntrl->pm_state));
 
 	mutex_lock(&mhi_cntrl->pm_mutex);
-	write_lock_irq(&mhi_cntrl->pm_lock);
-	prev_state = mhi_cntrl->pm_state;
-	cur_state = mhi_tryset_pm_state(mhi_cntrl, transition_state);
-	if (cur_state == transition_state) {
-		mhi_cntrl->ee = MHI_EE_DISABLE_TRANSITION;
-		mhi_cntrl->dev_state = MHI_STATE_RESET;
-	}
-	write_unlock_irq(&mhi_cntrl->pm_lock);
-
-	/* Wake up threads waiting for state transition */
-	wake_up_all(&mhi_cntrl->state_event);
-
-	if (cur_state != transition_state) {
-		dev_err(dev, "Failed to transition to state: %s from: %s\n",
-			to_mhi_pm_state_str(transition_state),
-			to_mhi_pm_state_str(cur_state));
-		mutex_unlock(&mhi_cntrl->pm_mutex);
-		return;
-	}
 
 	/* Trigger MHI RESET so that the device will not access host memory */
-	if (MHI_REG_ACCESS_VALID(prev_state)) {
+	if (!MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state)) {
 		u32 in_reset = -1;
 		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
 
@@ -785,8 +765,7 @@ void mhi_pm_st_worker(struct work_struct *work)
 			mhi_pm_sys_error_transition(mhi_cntrl);
 			break;
 		case DEV_ST_TRANSITION_DISABLE:
-			mhi_pm_disable_transition
-				(mhi_cntrl, MHI_PM_SHUTDOWN_PROCESS);
+			mhi_pm_disable_transition(mhi_cntrl);
 			break;
 		default:
 			break;
@@ -1153,23 +1132,33 @@ EXPORT_SYMBOL_GPL(mhi_async_power_up);
 
 void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
 {
-	enum mhi_pm_state cur_state;
+	enum mhi_pm_state cur_state, transition_state;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 
 	/* If it's not a graceful shutdown, force MHI to linkdown state */
-	if (!graceful) {
-		mutex_lock(&mhi_cntrl->pm_mutex);
-		write_lock_irq(&mhi_cntrl->pm_lock);
-		cur_state = mhi_tryset_pm_state(mhi_cntrl,
-						MHI_PM_LD_ERR_FATAL_DETECT);
-		write_unlock_irq(&mhi_cntrl->pm_lock);
-		mutex_unlock(&mhi_cntrl->pm_mutex);
-		if (cur_state != MHI_PM_LD_ERR_FATAL_DETECT)
-			dev_dbg(dev, "Failed to move to state: %s from: %s\n",
-				to_mhi_pm_state_str(MHI_PM_LD_ERR_FATAL_DETECT),
-				to_mhi_pm_state_str(mhi_cntrl->pm_state));
+	transition_state = (graceful) ? MHI_PM_SHUTDOWN_PROCESS :
+			   MHI_PM_LD_ERR_FATAL_DETECT;
+
+	mutex_lock(&mhi_cntrl->pm_mutex);
+	write_lock_irq(&mhi_cntrl->pm_lock);
+	cur_state = mhi_tryset_pm_state(mhi_cntrl, transition_state);
+	if (cur_state != transition_state) {
+		dev_err(dev, "Failed to move to state: %s from: %s\n",
+			to_mhi_pm_state_str(transition_state),
+			to_mhi_pm_state_str(mhi_cntrl->pm_state));
+		/* Force link down or error fatal detected state */
+		mhi_cntrl->pm_state = MHI_PM_LD_ERR_FATAL_DETECT;
 	}
 
+	/* mark device inactive to avoid any further host processing */
+	mhi_cntrl->ee = MHI_EE_DISABLE_TRANSITION;
+	mhi_cntrl->dev_state = MHI_STATE_RESET;
+
+	wake_up_all(&mhi_cntrl->state_event);
+
+	write_unlock_irq(&mhi_cntrl->pm_lock);
+	mutex_unlock(&mhi_cntrl->pm_mutex);
+
 	mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_DISABLE);
 
 	/* Wait for shutdown to complete */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

