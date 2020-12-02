Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB0A2CB98B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388557AbgLBJod (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:44:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388323AbgLBJoc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:44:32 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF4AC061A47
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:43:53 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id w4so733900pgg.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DxMcwlRnYOKwFiXUfJbjrsm9AnRKM8HjvrrBztUq5gc=;
        b=QHcSwPcwGVNBEE5mvHIAqYAg6N20F+Jv7lqpw2qmnk8AQLttJtVTuTjE5aBvpXvoAu
         7xqe9gdR0C77nbXxM8ejB40Ax1GAHQw3QgoqKTgziJxwjcM+U/u1j8/4sXgHtdKDeYeI
         LFVp4TGkJ9NqlYqZwT8vBr4BH09J1SUbGW5mYU8HvyToh0H4IJ8pfSxTThbsBW2l9T/R
         qk9PsXEUiEuZS888+AlzkGVXVErcw6jKYy/k7agzcusaKPxt2a1OdsLh3zncu6TeRCZm
         Vt/7JAGnvW8V8o3FkIcpqwtcEh8jHluguanOlAx4vPNxrZwq0CI7VGjxYdLhBEdH+IO7
         LDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DxMcwlRnYOKwFiXUfJbjrsm9AnRKM8HjvrrBztUq5gc=;
        b=kLtvRqfp41MaiSrhmJQhrvxE5l0jYvxushwN2ohQ8f9EjOut4NKdDWgKM3FZuIn02L
         1gfCaLuXjduQMWs14rpL0sYfSHJyRvkhSuQxPg0a7580GU+1tG5pfAidBNFatxDIbM7H
         jwk0x6wXnFvD3oshmV4wD1MDfDvq/yQZs/Gza+qSbAb0pG6UjWBmRThJUBAiqOL+DfcK
         tfgZHjf1rKZMckgBaxrTdB3JJgq5tVdfCFWHM/Ew/S3XLf3gpatvWIxRK4X0m4NAgJTP
         je145g1ngxFeYXOFistfJr0uLifkR9HmgKGD0bzuT/UfNs86/G8zHJdoK9nr5NRf7Jgd
         YOwA==
X-Gm-Message-State: AOAM530d0DCS9JIFrM1ssOWXOlF1JUuxIoB36DmVPSNuLhtAODdO3Csa
        HzBBDt0wC3xeFKe8W7QGpD+M
X-Google-Smtp-Source: ABdhPJwnL3ybErXyDS1USRYTA3QBTQZLtEkScMUI8q6mdAdX1hZlj2edhllHdn3QCpZvkF9ckhmFsQ==
X-Received: by 2002:a63:5802:: with SMTP id m2mr1907530pgb.58.1606902233325;
        Wed, 02 Dec 2020 01:43:53 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:43:52 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 22/29] bus: mhi: core: Separate system error and power down handling
Date:   Wed,  2 Dec 2020 15:11:52 +0530
Message-Id: <20201202094159.107075-23-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Currently, there exist a set of if...else statements in the
mhi_pm_disable_transition() function which make handling system
error and disable transitions differently complex. To make that
cleaner and facilitate differences in behavior, separate these
two transitions for MHI host.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 159 ++++++++++++++++++++++++++++++++------
 1 file changed, 137 insertions(+), 22 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 1d04e401b67f..347ae7dd6cf8 100644
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
2.25.1

