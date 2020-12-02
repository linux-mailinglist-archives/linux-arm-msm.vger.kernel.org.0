Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0F12CB98C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388349AbgLBJpG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:45:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388556AbgLBJod (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:44:33 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDA06C061A4B
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:43:57 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id n7so302145pgg.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UqJtPPbam5F4e6lWYSMgvhm5ifJn4YWUg9vIO4IndOc=;
        b=Yu3nOBg/WmUy21MfNUE/dGvV8kG5uWRcbNvXGAxcCcCu0pgrx1eJ9ovJn2xuSn0NVF
         r6n5dJkVVTCxTu/VJrQ4wxFCuQjLAxoMDzSDlLgDuG8UJsG4t+NRdU65qNh49ZQlvBop
         IJpVIiZnGranLAnFleZNWCIhEkwcgUfIM3KcNlwPIB+jbSlaa0NVFB0+3/QL5Yff/8Fj
         ARKeiSFLGxO4LdXldbbGa1kP48gvVW0gdR8mB5ykaVzMIIPwJZWYIuEen8zDA1qr3rji
         k/lfQdn0MBHMjEhGQv0eLwtWSXaaJo95HnL9tzeGsmqhXUrRMEvGlKlcqJFn8NXtCcgz
         89lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UqJtPPbam5F4e6lWYSMgvhm5ifJn4YWUg9vIO4IndOc=;
        b=m5mPIJOHJjjzvkbj1ajE+ZuJJlng2SLSd5UYMnoPwlhb7DcylI/U1yNUXzfEIU6zK1
         Ju8kNpqeVj+DZgVFlcyPXMsNBVl6dLrBI5hTlXuZfDfcbpvzeek/2dexPkGECkdHj88u
         Shv9i8GvmwJDv7eitcaFMUrUvgfZPgCzerPyt22rczTFatmG/EDNUW/tzB38t+K/MP6H
         6SRdUf0IGMX9b02+pFYQjxUoTfxhKRxA5KBhyQq1skoSMiAgEKAPOcTpS5jkU6OtslP8
         kZmdi87iyjywcfwrwpGAMM8zjneZTxPppWybYWkkVIrv/SeyHx38oV1AG/poNS0mKiTd
         FSXA==
X-Gm-Message-State: AOAM532CDLOra6reCA5ty0tXxCL0i/iH6FJ+dEGWszR8KNDwwGPvE2Ha
        KUs61oYb584wR1n3HecWEtmE
X-Google-Smtp-Source: ABdhPJxgpirlp8u5nNy3PSOMExUYH7E12PBpbpSWbJ92dRUA+DrVCLDgALn6RlrGheF4rakeahBTOw==
X-Received: by 2002:a63:368e:: with SMTP id d136mr1885181pga.239.1606902237328;
        Wed, 02 Dec 2020 01:43:57 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:43:56 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 23/29] bus: mhi: core: Mark and maintain device states early on after power down
Date:   Wed,  2 Dec 2020 15:11:53 +0530
Message-Id: <20201202094159.107075-24-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 77 +++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 44 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 347ae7dd6cf8..ffbf6f539510 100644
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
2.25.1

