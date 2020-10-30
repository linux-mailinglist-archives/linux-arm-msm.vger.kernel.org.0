Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4E429FADD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 02:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgJ3Bwj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 21:52:39 -0400
Received: from z5.mailgun.us ([104.130.96.5]:43112 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726338AbgJ3BwS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 21:52:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604022737; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=6XTYQyO2klmQXkKHAEjhN4DTjPEKBBsIlMgadavihz4=; b=CEJUZI7HfNSCxEb6GJrdridzOfxfypqwXeNtdF+pxIXZKjWwjfmJv5tO5YueZ5+Z8mtK5p1E
 Bu40dBUVQ4PGoL5p3fr6ZFh/TuY3U08e+SHoI6TfIzIakD1UfpGqUjRTE+9cnGepY1IWNYll
 6kI9GXkEBXbT1l35SuHur0MAkhk=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f9b71d1519f072fa41d19db (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 01:52:17
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E62C7C433CB; Fri, 30 Oct 2020 01:52:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 71D26C433C9;
        Fri, 30 Oct 2020 01:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 71D26C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 10/12] bus: mhi: core: Separate system error and power down handling
Date:   Thu, 29 Oct 2020 18:52:01 -0700
Message-Id: <1604022723-34578-11-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604022723-34578-1-git-send-email-bbhatt@codeaurora.org>
References: <1604022723-34578-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, there exist a set of if...else statements in the
mhi_pm_disable_transition() function which make handling system
error and disable transitions differently complex. To make that
cleaner and facilitate differences in behavior, separate these
two transitions for MHI host.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/pm.c | 159 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 137 insertions(+), 22 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 1d04e401..347ae7d 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -444,7 +444,7 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
 	return ret;
 }
 
-/* Handle SYS_ERR and Shutdown transitions */
+/* Handle shutdown transitions */
 static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
 				      enum mhi_pm_state transition_state)
 {
@@ -460,10 +460,6 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
 		to_mhi_pm_state_str(mhi_cntrl->pm_state),
 		to_mhi_pm_state_str(transition_state));
 
-	/* We must notify MHI control driver so it can clean up first */
-	if (transition_state == MHI_PM_SYS_ERR_PROCESS)
-		mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_SYS_ERROR);
-
 	mutex_lock(&mhi_cntrl->pm_mutex);
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	prev_state = mhi_cntrl->pm_state;
@@ -502,11 +498,8 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
 							    MHICTRL_RESET_SHIFT,
 							    &in_reset) ||
 					!in_reset, timeout);
-		if ((!ret || in_reset) && cur_state == MHI_PM_SYS_ERR_PROCESS) {
+		if (!ret || in_reset)
 			dev_err(dev, "Device failed to exit MHI Reset state\n");
-			mutex_unlock(&mhi_cntrl->pm_mutex);
-			return;
-		}
 
 		/*
 		 * Device will clear BHI_INTVEC as a part of RESET processing,
@@ -566,19 +559,142 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
 		er_ctxt->wp = er_ctxt->rbase;
 	}
 
-	if (cur_state == MHI_PM_SYS_ERR_PROCESS) {
-		mhi_ready_state_transition(mhi_cntrl);
-	} else {
-		/* Move to disable state */
-		write_lock_irq(&mhi_cntrl->pm_lock);
-		cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_DISABLE);
-		write_unlock_irq(&mhi_cntrl->pm_lock);
-		if (unlikely(cur_state != MHI_PM_DISABLE))
-			dev_err(dev, "Error moving from PM state: %s to: %s\n",
-				to_mhi_pm_state_str(cur_state),
-				to_mhi_pm_state_str(MHI_PM_DISABLE));
+	/* Move to disable state */
+	write_lock_irq(&mhi_cntrl->pm_lock);
+	cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_DISABLE);
+	write_unlock_irq(&mhi_cntrl->pm_lock);
+	if (unlikely(cur_state != MHI_PM_DISABLE))
+		dev_err(dev, "Error moving from PM state: %s to: %s\n",
+			to_mhi_pm_state_str(cur_state),
+			to_mhi_pm_state_str(MHI_PM_DISABLE));
+
+	dev_dbg(dev, "Exiting with PM state: %s, MHI state: %s\n",
+		to_mhi_pm_state_str(mhi_cntrl->pm_state),
+		TO_MHI_STATE_STR(mhi_cntrl->dev_state));
+
+	mutex_unlock(&mhi_cntrl->pm_mutex);
+}
+
+/* Handle system error transitions */
+static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
+{
+	enum mhi_pm_state cur_state, prev_state;
+	struct mhi_event *mhi_event;
+	struct mhi_cmd_ctxt *cmd_ctxt;
+	struct mhi_cmd *mhi_cmd;
+	struct mhi_event_ctxt *er_ctxt;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	int ret, i;
+
+	dev_dbg(dev, "Transitioning from PM state: %s to: %s\n",
+		to_mhi_pm_state_str(mhi_cntrl->pm_state),
+		to_mhi_pm_state_str(MHI_PM_SYS_ERR_PROCESS));
+
+	/* We must notify MHI control driver so it can clean up first */
+	mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_SYS_ERROR);
+
+	mutex_lock(&mhi_cntrl->pm_mutex);
+	write_lock_irq(&mhi_cntrl->pm_lock);
+	prev_state = mhi_cntrl->pm_state;
+	cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_SYS_ERR_PROCESS);
+	write_unlock_irq(&mhi_cntrl->pm_lock);
+
+	if (cur_state != MHI_PM_SYS_ERR_PROCESS) {
+		dev_err(dev, "Failed to transition from PM state: %s to: %s\n",
+			to_mhi_pm_state_str(cur_state),
+			to_mhi_pm_state_str(MHI_PM_SYS_ERR_PROCESS));
+		goto exit_sys_error_transition;
+	}
+
+	mhi_cntrl->ee = MHI_EE_DISABLE_TRANSITION;
+	mhi_cntrl->dev_state = MHI_STATE_RESET;
+
+	/* Wake up threads waiting for state transition */
+	wake_up_all(&mhi_cntrl->state_event);
+
+	/* Trigger MHI RESET so that the device will not access host memory */
+	if (MHI_REG_ACCESS_VALID(prev_state)) {
+		u32 in_reset = -1;
+		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
+
+		dev_dbg(dev, "Triggering MHI Reset in device\n");
+		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
+
+		/* Wait for the reset bit to be cleared by the device */
+		ret = wait_event_timeout(mhi_cntrl->state_event,
+					 mhi_read_reg_field(mhi_cntrl,
+							    mhi_cntrl->regs,
+							    MHICTRL,
+							    MHICTRL_RESET_MASK,
+							    MHICTRL_RESET_SHIFT,
+							    &in_reset) ||
+					!in_reset, timeout);
+		if (!ret || in_reset) {
+			dev_err(dev, "Device failed to exit MHI Reset state\n");
+			goto exit_sys_error_transition;
+		}
+
+		/*
+		 * Device will clear BHI_INTVEC as a part of RESET processing,
+		 * hence re-program it
+		 */
+		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
+	}
+
+	dev_dbg(dev,
+		"Waiting for all pending event ring processing to complete\n");
+	mhi_event = mhi_cntrl->mhi_event;
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
+		if (mhi_event->offload_ev)
+			continue;
+		tasklet_kill(&mhi_event->task);
 	}
 
+	/* Release lock and wait for all pending threads to complete */
+	mutex_unlock(&mhi_cntrl->pm_mutex);
+	dev_dbg(dev, "Waiting for all pending threads to complete\n");
+	wake_up_all(&mhi_cntrl->state_event);
+
+	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
+	device_for_each_child(mhi_cntrl->cntrl_dev, NULL, mhi_destroy_device);
+
+	mutex_lock(&mhi_cntrl->pm_mutex);
+
+	WARN_ON(atomic_read(&mhi_cntrl->dev_wake));
+	WARN_ON(atomic_read(&mhi_cntrl->pending_pkts));
+
+	/* Reset the ev rings and cmd rings */
+	dev_dbg(dev, "Resetting EV CTXT and CMD CTXT\n");
+	mhi_cmd = mhi_cntrl->mhi_cmd;
+	cmd_ctxt = mhi_cntrl->mhi_ctxt->cmd_ctxt;
+	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++, cmd_ctxt++) {
+		struct mhi_ring *ring = &mhi_cmd->ring;
+
+		ring->rp = ring->base;
+		ring->wp = ring->base;
+		cmd_ctxt->rp = cmd_ctxt->rbase;
+		cmd_ctxt->wp = cmd_ctxt->rbase;
+	}
+
+	mhi_event = mhi_cntrl->mhi_event;
+	er_ctxt = mhi_cntrl->mhi_ctxt->er_ctxt;
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, er_ctxt++,
+	     mhi_event++) {
+		struct mhi_ring *ring = &mhi_event->ring;
+
+		/* Skip offload events */
+		if (mhi_event->offload_ev)
+			continue;
+
+		ring->rp = ring->base;
+		ring->wp = ring->base;
+		er_ctxt->rp = er_ctxt->rbase;
+		er_ctxt->wp = er_ctxt->rbase;
+	}
+
+	mhi_ready_state_transition(mhi_cntrl);
+
+exit_sys_error_transition:
 	dev_dbg(dev, "Exiting with PM state: %s, MHI state: %s\n",
 		to_mhi_pm_state_str(mhi_cntrl->pm_state),
 		TO_MHI_STATE_STR(mhi_cntrl->dev_state));
@@ -666,8 +782,7 @@ void mhi_pm_st_worker(struct work_struct *work)
 			mhi_ready_state_transition(mhi_cntrl);
 			break;
 		case DEV_ST_TRANSITION_SYS_ERR:
-			mhi_pm_disable_transition
-				(mhi_cntrl, MHI_PM_SYS_ERR_PROCESS);
+			mhi_pm_sys_error_transition(mhi_cntrl);
 			break;
 		case DEV_ST_TRANSITION_DISABLE:
 			mhi_pm_disable_transition
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

