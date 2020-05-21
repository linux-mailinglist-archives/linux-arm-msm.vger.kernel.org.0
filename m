Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E27D1DD1C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 17:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730502AbgEUP0e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 11:26:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:34572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729934AbgEUP0d (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 11:26:33 -0400
Received: from localhost.localdomain (unknown [157.51.235.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57002204EA;
        Thu, 21 May 2020 15:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590074793;
        bh=/JOK14SOM60ziAiJO2/MKFl7qaujWCFYsI0VYAcfIFU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UL7hdY7GPrESAxXxj8Uf+vp1q1LIIwVxnt/mVwwK6NFZ1+jIxD9nFDBUYLzjE+YkY
         oe+zo51LkaDIzF3EbfMvPAIS/Xu2TD4joBThyO9u89rpyyr547IOlSD4inGjqTtlIm
         KIRGXPGcWKVMkqk8ONWPfXvqVj46EpeTYH6BUvAc=
From:   mani@kernel.org
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 09/14] bus: mhi: core: Remove the system error worker thread
Date:   Thu, 21 May 2020 20:55:35 +0530
Message-Id: <20200521152540.17335-10-mani@kernel.org>
X-Mailer: git-send-email 2.26.GIT
In-Reply-To: <20200521152540.17335-1-mani@kernel.org>
References: <20200521152540.17335-1-mani@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

Remove the system error worker thread and instead have the
execution environment worker handle that transition to serialize
processing and avoid any possible race conditions during
shutdown.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c     |  2 +-
 drivers/bus/mhi/core/internal.h |  3 ++-
 drivers/bus/mhi/core/main.c     |  6 +++---
 drivers/bus/mhi/core/pm.c       | 32 ++++++++++++++------------------
 include/linux/mhi.h             |  2 --
 5 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 6882206ad80e..3a853c5d2103 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -34,6 +34,7 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
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
index 80b32c20149c..f01283b8a451 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -386,6 +386,7 @@ enum dev_st_transition {
 	DEV_ST_TRANSITION_READY,
 	DEV_ST_TRANSITION_SBL,
 	DEV_ST_TRANSITION_MISSION_MODE,
+	DEV_ST_TRANSITION_SYS_ERR,
 	DEV_ST_TRANSITION_MAX,
 };
 
@@ -587,7 +588,7 @@ enum mhi_ee_type mhi_get_exec_env(struct mhi_controller *mhi_cntrl);
 int mhi_queue_state_transition(struct mhi_controller *mhi_cntrl,
 			       enum dev_st_transition state);
 void mhi_pm_st_worker(struct work_struct *work);
-void mhi_pm_sys_err_worker(struct work_struct *work);
+void mhi_pm_sys_err_handler(struct mhi_controller *mhi_cntrl);
 void mhi_fw_load_worker(struct work_struct *work);
 int mhi_ready_state_transition(struct mhi_controller *mhi_cntrl);
 void mhi_ctrl_ev_task(unsigned long data);
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index a394691d9383..e5f6500e89fd 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -405,7 +405,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *dev)
 		if (MHI_IN_PBL(ee))
 			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
 		else
-			schedule_work(&mhi_cntrl->syserr_worker);
+			mhi_pm_sys_err_handler(mhi_cntrl);
 	}
 
 exit_intvec:
@@ -733,7 +733,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 							MHI_PM_SYS_ERR_DETECT);
 				write_unlock_irq(&mhi_cntrl->pm_lock);
 				if (new_state == MHI_PM_SYS_ERR_DETECT)
-					schedule_work(&mhi_cntrl->syserr_worker);
+					mhi_pm_sys_err_handler(mhi_cntrl);
 				break;
 			}
 			default:
@@ -919,7 +919,7 @@ void mhi_ctrl_ev_task(unsigned long data)
 		}
 		write_unlock_irq(&mhi_cntrl->pm_lock);
 		if (pm_state == MHI_PM_SYS_ERR_DETECT)
-			schedule_work(&mhi_cntrl->syserr_worker);
+			mhi_pm_sys_err_handler(mhi_cntrl);
 	}
 }
 
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 6d56441013af..743b3207c390 100644
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
index a60312927b4d..642ef1f40a2b 100644
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
2.26.GIT

