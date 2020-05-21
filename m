Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345961DD1BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 17:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730170AbgEUP0T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 11:26:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:34324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730156AbgEUP0Q (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 11:26:16 -0400
Received: from localhost.localdomain (unknown [157.51.235.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1ED45204EA;
        Thu, 21 May 2020 15:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590074775;
        bh=Kpuuv4zdUqvxPGRQ8qDzw7NY8a29xJgZhj2zLKNQu4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TlYSDxIBnxWNoj1DWUjj0ZQRtSKMqGs5Rrg1Hq+ECSiIOGlGBXS8BU9Hfcm5a6sCa
         jF4XXTcNEbcw0/h8XN152IUyefFzEyMUNT5qXYxLICwOuj+63uq9sAewI+HbYFUiZp
         JmSzbNhoUexQjUbA/YLCW3kncUtZF14SPW91bhE4=
From:   mani@kernel.org
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 05/14] bus: mhi: core: Handle firmware load using state worker
Date:   Thu, 21 May 2020 20:55:31 +0530
Message-Id: <20200521152540.17335-6-mani@kernel.org>
X-Mailer: git-send-email 2.26.GIT
In-Reply-To: <20200521152540.17335-1-mani@kernel.org>
References: <20200521152540.17335-1-mani@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Upon power up, driver queues firmware worker thread if the execution
environment is PBL. Firmware worker is blocked with a timeout until
state worker gets a chance to run and unblock firmware worker. An
endpoint power up failure can be seen if state worker gets a chance to
run after firmware worker has timed out. Remove this dependency and
handle firmware load directly using state worker thread.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/boot.c     | 18 +++---------------
 drivers/bus/mhi/core/init.c     |  1 -
 drivers/bus/mhi/core/internal.h |  1 +
 drivers/bus/mhi/core/pm.c       |  6 +-----
 include/linux/mhi.h             |  2 --
 5 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index ebad5eb48e5a..17c636b4bc6e 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -377,30 +377,18 @@ static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
 	}
 }
 
-void mhi_fw_load_worker(struct work_struct *work)
+void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 {
-	struct mhi_controller *mhi_cntrl;
 	const struct firmware *firmware = NULL;
 	struct image_info *image_info;
-	struct device *dev;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	const char *fw_name;
 	void *buf;
 	dma_addr_t dma_addr;
 	size_t size;
 	int ret;
 
-	mhi_cntrl = container_of(work, struct mhi_controller, fw_worker);
-	dev = &mhi_cntrl->mhi_dev->dev;
-
-	dev_dbg(dev, "Waiting for device to enter PBL from: %s\n",
-		TO_MHI_EXEC_STR(mhi_cntrl->ee));
-
-	ret = wait_event_timeout(mhi_cntrl->state_event,
-				 MHI_IN_PBL(mhi_cntrl->ee) ||
-				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
-				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
-
-	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
+	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
 		dev_err(dev, "Device MHI is not in valid state\n");
 		return;
 	}
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 1a93d24efffc..6882206ad80e 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -835,7 +835,6 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	spin_lock_init(&mhi_cntrl->wlock);
 	INIT_WORK(&mhi_cntrl->st_worker, mhi_pm_st_worker);
 	INIT_WORK(&mhi_cntrl->syserr_worker, mhi_pm_sys_err_worker);
-	INIT_WORK(&mhi_cntrl->fw_worker, mhi_fw_load_worker);
 	init_waitqueue_head(&mhi_cntrl->state_event);
 
 	mhi_cmd = mhi_cntrl->mhi_cmd;
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 40c47f918ca3..0965ca3c9632 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -627,6 +627,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl);
 void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl);
 void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 		      struct image_info *img_info);
+void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
 int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
 			struct mhi_chan *mhi_chan);
 int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index dc83d65f7784..6d56441013af 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -528,7 +528,6 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
 	dev_dbg(dev, "Waiting for all pending threads to complete\n");
 	wake_up_all(&mhi_cntrl->state_event);
 	flush_work(&mhi_cntrl->st_worker);
-	flush_work(&mhi_cntrl->fw_worker);
 
 	dev_dbg(dev, "Reset all active channels and remove MHI devices\n");
 	device_for_each_child(mhi_cntrl->cntrl_dev, NULL, mhi_destroy_device);
@@ -643,7 +642,7 @@ void mhi_pm_st_worker(struct work_struct *work)
 				mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
 			write_unlock_irq(&mhi_cntrl->pm_lock);
 			if (MHI_IN_PBL(mhi_cntrl->ee))
-				wake_up_all(&mhi_cntrl->state_event);
+				mhi_fw_load_handler(mhi_cntrl);
 			break;
 		case DEV_ST_TRANSITION_SBL:
 			write_lock_irq(&mhi_cntrl->pm_lock);
@@ -833,9 +832,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 	next_state = MHI_IN_PBL(current_ee) ?
 		DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;
 
-	if (next_state == DEV_ST_TRANSITION_PBL)
-		schedule_work(&mhi_cntrl->fw_worker);
-
 	mhi_queue_state_transition(mhi_cntrl, next_state);
 
 	mutex_unlock(&mhi_cntrl->pm_mutex);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 3d7c3c26eeb9..a60312927b4d 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -331,7 +331,6 @@ struct mhi_controller_config {
  * @wlock: Lock for protecting device wakeup
  * @mhi_link_info: Device bandwidth info
  * @st_worker: State transition worker
- * @fw_worker: Firmware download worker
  * @syserr_worker: System error worker
  * @state_event: State change event
  * @status_cb: CB function to notify power states of the device (required)
@@ -412,7 +411,6 @@ struct mhi_controller {
 	spinlock_t wlock;
 	struct mhi_link_info mhi_link_info;
 	struct work_struct st_worker;
-	struct work_struct fw_worker;
 	struct work_struct syserr_worker;
 	wait_queue_head_t state_event;
 
-- 
2.26.GIT

