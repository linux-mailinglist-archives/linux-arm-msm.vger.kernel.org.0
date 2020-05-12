Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D43411CEA70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 04:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728301AbgELCDV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 22:03:21 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:43392 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727892AbgELCDU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 22:03:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589248999; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=RtUWUS+pFxvJRUquo7n1E/ZGT5CWzd232ByelLCc/UQ=; b=KsdrbyfIBZqBA8ZRGIgr7zS7YCQW1FLCTPL1s+CQ5dr3zeMY5tKTiUvpxzSQwvAZaPa+uPIr
 l7JMlu+v5cwwK+CryX3QUzx8Rc5pLYdZwBeUk3C1oI4MokcDNXjqLZKMubz5NFB+JN4pDCNF
 3SaEoidAlsqLfpfKP+WGbuvRuqE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eba03e5.7f058cb20fb8-smtp-out-n01;
 Tue, 12 May 2020 02:03:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 65396C433CB; Tue, 12 May 2020 02:03:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 908E8C433F2;
        Tue, 12 May 2020 02:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 908E8C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v1 1/5] bus: mhi: core: Remove the system error worker thread
Date:   Mon, 11 May 2020 19:03:05 -0700
Message-Id: <1589248989-23824-2-git-send-email-hemantk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
References: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove the system error worker thread and instead have the
execution environment worker handle that transition to serialize
processing and avoid any possible race conditions during
shutdown.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/bus/mhi/core/init.c     |  2 +-
 drivers/bus/mhi/core/internal.h |  3 ++-
 drivers/bus/mhi/core/main.c     |  6 +++---
 drivers/bus/mhi/core/pm.c       | 32 ++++++++++++++------------------
 include/linux/mhi.h             |  2 --
 5 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 6882206..3a853c5 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -34,6 +34,7 @@
 	[DEV_ST_TRANSITION_READY] = "READY",
 	[DEV_ST_TRANSITION_SBL] = "SBL",
 	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
+	[DEV_ST_TRANSITION_SYS_ERR] = "SYS_ERR",
 };
 
 const char * const mhi_state_str[MHI_STATE_MAX] = {
@@ -834,7 +835,6 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	spin_lock_init(&mhi_cntrl->transition_lock);
 	spin_lock_init(&mhi_cntrl->wlock);
 	INIT_WORK(&mhi_cntrl->st_worker, mhi_pm_st_worker);
-	INIT_WORK(&mhi_cntrl->syserr_worker, mhi_pm_sys_err_worker);
 	init_waitqueue_head(&mhi_cntrl->state_event);
 
 	mhi_cmd = mhi_cntrl->mhi_cmd;
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 80b32c2..f01283b 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -386,6 +386,7 @@ enum dev_st_transition {
 	DEV_ST_TRANSITION_READY,
 	DEV_ST_TRANSITION_SBL,
 	DEV_ST_TRANSITION_MISSION_MODE,
+	DEV_ST_TRANSITION_SYS_ERR,
 	DEV_ST_TRANSITION_MAX,
 };
 
@@ -587,7 +588,7 @@ enum mhi_pm_state __must_check mhi_tryset_pm_state(
 int mhi_queue_state_transition(struct mhi_controller *mhi_cntrl,
 			       enum dev_st_transition state);
 void mhi_pm_st_worker(struct work_struct *work);
-void mhi_pm_sys_err_worker(struct work_struct *work);
+void mhi_pm_sys_err_handler(struct mhi_controller *mhi_cntrl);
 void mhi_fw_load_worker(struct work_struct *work);
 int mhi_ready_state_transition(struct mhi_controller *mhi_cntrl);
 void mhi_ctrl_ev_task(unsigned long data);
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 6a80666..9ec9b36 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -406,7 +406,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *dev)
 		if (MHI_IN_PBL(ee))
 			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
 		else
-			schedule_work(&mhi_cntrl->syserr_worker);
+			mhi_pm_sys_err_handler(mhi_cntrl);
 	}
 
 exit_intvec:
@@ -734,7 +734,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 							MHI_PM_SYS_ERR_DETECT);
 				write_unlock_irq(&mhi_cntrl->pm_lock);
 				if (new_state == MHI_PM_SYS_ERR_DETECT)
-					schedule_work(&mhi_cntrl->syserr_worker);
+					mhi_pm_sys_err_handler(mhi_cntrl);
 				break;
 			}
 			default:
@@ -920,7 +920,7 @@ void mhi_ctrl_ev_task(unsigned long data)
 		}
 		write_unlock_irq(&mhi_cntrl->pm_lock);
 		if (pm_state == MHI_PM_SYS_ERR_DETECT)
-			schedule_work(&mhi_cntrl->syserr_worker);
+			mhi_pm_sys_err_handler(mhi_cntrl);
 	}
 }
 
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 3cc238a..d9964d4 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -449,19 +449,8 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
 		to_mhi_pm_state_str(transition_state));
 
 	/* We must notify MHI control driver so it can clean up first */
-	if (transition_state == MHI_PM_SYS_ERR_PROCESS) {
-		/*
-		 * If controller supports RDDM, we do not process
-		 * SYS error state, instead we will jump directly
-		 * to RDDM state
-		 */
-		if (mhi_cntrl->rddm_image) {
-			dev_dbg(dev,
-				 "Controller supports RDDM, so skip SYS_ERR\n");
-			return;
-		}
+	if (transition_state == MHI_PM_SYS_ERR_PROCESS)
 		mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_SYS_ERROR);
-	}
 
 	mutex_lock(&mhi_cntrl->pm_mutex);
 	write_lock_irq(&mhi_cntrl->pm_lock);
@@ -527,7 +516,6 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
 	mutex_unlock(&mhi_cntrl->pm_mutex);
 	dev_dbg(dev, "Waiting for all pending threads to complete\n");
 	wake_up_all(&mhi_cntrl->state_event);
-	flush_work(&mhi_cntrl->st_worker);
 
 	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
 	device_for_each_child(mhi_cntrl->cntrl_dev, NULL, mhi_destroy_device);
@@ -607,13 +595,17 @@ int mhi_queue_state_transition(struct mhi_controller *mhi_cntrl,
 }
 
 /* SYS_ERR worker */
-void mhi_pm_sys_err_worker(struct work_struct *work)
+void mhi_pm_sys_err_handler(struct mhi_controller *mhi_cntrl)
 {
-	struct mhi_controller *mhi_cntrl = container_of(work,
-							struct mhi_controller,
-							syserr_worker);
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+
+	/* skip if controller supports RDDM */
+	if (mhi_cntrl->rddm_image) {
+		dev_dbg(dev, "Controller supports RDDM, skip SYS_ERROR\n");
+		return;
+	}
 
-	mhi_pm_disable_transition(mhi_cntrl, MHI_PM_SYS_ERR_PROCESS);
+	mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_SYS_ERR);
 }
 
 /* Device State Transition worker */
@@ -661,6 +653,10 @@ void mhi_pm_st_worker(struct work_struct *work)
 		case DEV_ST_TRANSITION_READY:
 			mhi_ready_state_transition(mhi_cntrl);
 			break;
+		case DEV_ST_TRANSITION_SYS_ERR:
+			mhi_pm_disable_transition
+				(mhi_cntrl, MHI_PM_SYS_ERR_PROCESS);
+			break;
 		default:
 			break;
 		}
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 2b20b9c..b008914 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -331,7 +331,6 @@ struct mhi_controller_config {
  * @wlock: Lock for protecting device wakeup
  * @mhi_link_info: Device bandwidth info
  * @st_worker: State transition worker
- * @syserr_worker: System error worker
  * @state_event: State change event
  * @status_cb: CB function to notify power states of the device (required)
  * @wake_get: CB function to assert device wake (optional)
@@ -411,7 +410,6 @@ struct mhi_controller {
 	spinlock_t wlock;
 	struct mhi_link_info mhi_link_info;
 	struct work_struct st_worker;
-	struct work_struct syserr_worker;
 	wait_queue_head_t state_event;
 
 	void (*status_cb)(struct mhi_controller *mhi_cntrl,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
