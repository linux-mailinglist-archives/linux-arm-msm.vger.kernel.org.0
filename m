Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88B21D9931
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 16:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728832AbgESOPJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 10:15:09 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:37180 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729123AbgESOOv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 10:14:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589897690; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=XHmND3fQT5PSM3pNbwndq6avcfseUG3fdlWUgExhaP4=; b=PoD2m6TwATTDvjIuGVeT8GKm1UZXnk551FbV7+aKp+E8nrX+pf1JRjO6M4I4RJZ5exibR76m
 ZZybBRPIQYxFewMFkWeOlnSvZHssNXgPtu1nlFHbj7AHKkcROwl9aw1O45nED36twODEoTWq
 +jxqK8V/ThuEGZ6opCezA9h8AXE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec3e9c6.7f698f683e68-smtp-out-n03;
 Tue, 19 May 2020 14:14:30 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 91D42C44791; Tue, 19 May 2020 14:14:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E8403C43636;
        Tue, 19 May 2020 14:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E8403C43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     manivannan.sadhasivam@linaro.org, bjorn.andersson@linaro.org,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [RFC v2 PATCH 7/8] qaic: Implement MHI error status handler
Date:   Tue, 19 May 2020 08:14:04 -0600
Message-Id: <1589897645-17088-8-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589897645-17088-1-git-send-email-jhugo@codeaurora.org>
References: <1589897645-17088-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the MHI bus has detected some kind of error with the device, it will
invoke the registered status_cb().  We are intrested in both the fatal
error and sys error events.

For a fatal error, the device has essentially gone away, and needs to be
reinited from scratch.  We lose all state.  The MHI bus expects the
controller to fully handle this scenario

For a sys error, the device can recover by going through the MHI reset
flow, but we lose all state.  The MHI bus is going to handle the MHI
reset flow, but we need to still clean up our local state.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/misc/qaic/mhi_controller.c | 26 ++++++++++++++++++++++++++
 drivers/misc/qaic/mhi_controller.h |  2 ++
 drivers/misc/qaic/qaic.h           |  2 ++
 drivers/misc/qaic/qaic_drv.c       | 16 +++++++++++++++-
 4 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/qaic/mhi_controller.c b/drivers/misc/qaic/mhi_controller.c
index 9ba74fc..50a078f 100644
--- a/drivers/misc/qaic/mhi_controller.c
+++ b/drivers/misc/qaic/mhi_controller.c
@@ -8,6 +8,7 @@
 #include <linux/pci.h>
 
 #include "mhi_controller.h"
+#include "qaic.h"
 
 static unsigned int mhi_timeout = 20000; /* 20 sec default */
 module_param(mhi_timeout, uint, 0600);
@@ -426,6 +427,15 @@ static void mhi_runtime_put(struct mhi_controller *mhi_cntl)
 static void mhi_status_cb(struct mhi_controller *mhi_cntl,
 			  enum mhi_callback reason)
 {
+	struct qaic_device *qdev = (struct qaic_device *)pci_get_drvdata(
+					to_pci_dev(mhi_cntl->cntrl_dev));
+
+	/* this event occurs in atomic context */
+	if (reason == MHI_CB_FATAL_ERROR && !qdev->in_reset)
+		schedule_work(&qdev->reset_mhi_work);
+	/* this event occurs in non-atomic context */
+	if (reason == MHI_CB_SYS_ERROR && !qdev->in_reset)
+		qaic_dev_reset_clean_local_state(qdev);
 }
 
 struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev,
@@ -511,3 +521,19 @@ void qaic_mhi_link_up(struct mhi_controller *mhi_cntl)
 	if (ret)
 		pci_err(pci_dev, "mhi_async_power_up failed when link came back %d\n", ret);
 }
+
+void qaic_mhi_start_reset(struct mhi_controller *mhi_cntl)
+{
+	mhi_power_down(mhi_cntl, true);
+}
+
+void qaic_mhi_reset_done(struct mhi_controller *mhi_cntl)
+{
+	struct pci_dev *pci_dev = container_of(mhi_cntl->cntrl_dev,
+					       struct pci_dev, dev);
+	int ret;
+
+	ret = mhi_async_power_up(mhi_cntl);
+	if (ret)
+		pci_err(pci_dev, "mhi_async_power_up failed after reset %d\n", ret);
+}
diff --git a/drivers/misc/qaic/mhi_controller.h b/drivers/misc/qaic/mhi_controller.h
index 6dca59d..82b2b77 100644
--- a/drivers/misc/qaic/mhi_controller.h
+++ b/drivers/misc/qaic/mhi_controller.h
@@ -14,5 +14,7 @@ void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up);
 
 void qaic_mhi_link_down(struct mhi_controller *mhi_cntl);
 void qaic_mhi_link_up(struct mhi_controller *mhi_cntl);
+void qaic_mhi_start_reset(struct mhi_controller *mhi_cntl);
+void qaic_mhi_reset_done(struct mhi_controller *mhi_cntl);
 
 #endif /* MHICONTROLLERQAIC_H_ */
diff --git a/drivers/misc/qaic/qaic.h b/drivers/misc/qaic/qaic.h
index 769f827..7c4eed6 100644
--- a/drivers/misc/qaic/qaic.h
+++ b/drivers/misc/qaic/qaic.h
@@ -70,6 +70,7 @@ struct qaic_device {
 	struct miscdevice	mdev;
 	char			mdev_name[QAIC_MDEV_NAME_MAX];
 	struct dma_bridge_chan	dbc[QAIC_NUM_DBC];
+	struct work_struct	reset_mhi_work;
 	struct workqueue_struct	*cntl_wq;
 	bool			in_reset;
 	struct srcu_struct	dev_lock;
@@ -108,4 +109,5 @@ void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id);
 void release_dbc(struct qaic_device *qdev, u32 dbc_id);
 
 void wake_all_cntl(struct qaic_device *qdev);
+void qaic_dev_reset_clean_local_state(struct qaic_device *qdev);
 #endif /* QAICINTERNAL_H_ */
diff --git a/drivers/misc/qaic/qaic_drv.c b/drivers/misc/qaic/qaic_drv.c
index ac4315a..3caafd8 100644
--- a/drivers/misc/qaic/qaic_drv.c
+++ b/drivers/misc/qaic/qaic_drv.c
@@ -303,6 +303,18 @@ void qaic_dev_reset_clean_local_state(struct qaic_device *qdev)
 		release_dbc(qdev, i);
 }
 
+static void reset_mhi_work_func(struct work_struct *work)
+{
+	struct qaic_device *qdev;
+
+	qdev = container_of(work, struct qaic_device, reset_mhi_work);
+
+	qaic_dev_reset_clean_local_state(qdev);
+	qaic_mhi_start_reset(qdev->mhi_cntl);
+	qdev->in_reset = false;
+	qaic_mhi_reset_done(qdev->mhi_cntl);
+}
+
 static int qaic_pci_probe(struct pci_dev *pdev,
 			  const struct pci_device_id *id)
 {
@@ -328,6 +340,7 @@ static int qaic_pci_probe(struct pci_dev *pdev,
 	qdev->pdev = pdev;
 	mutex_init(&qdev->cntl_mutex);
 	INIT_LIST_HEAD(&qdev->cntl_xfer_list);
+	INIT_WORK(&qdev->reset_mhi_work, reset_mhi_work_func);
 	init_srcu_struct(&qdev->dev_lock);
 	INIT_LIST_HEAD(&qdev->users);
 	mutex_init(&qdev->users_mutex);
@@ -467,6 +480,7 @@ static void qaic_pci_remove(struct pci_dev *pdev)
 		return;
 
 	qaic_dev_reset_clean_local_state(qdev);
+	cancel_work_sync(&qdev->reset_mhi_work);
 	qaic_mhi_free_controller(qdev->mhi_cntl, link_up);
 	for (i = 0; i < QAIC_NUM_DBC; ++i) {
 		devm_free_irq(&pdev->dev, pci_irq_vector(pdev, i + 1),
@@ -585,4 +599,4 @@ module_exit(qaic_exit);
 MODULE_AUTHOR("Qualcomm Cloud AI 100 Accelerator Kernel Driver Team");
 MODULE_DESCRIPTION("Qualcomm Cloud AI 100 Accelerators Driver");
 MODULE_LICENSE("GPL v2");
-MODULE_VERSION("0.0.0"); /* MAJOR.MINOR.PATCH */
+MODULE_VERSION("3.0.1"); /* MAJOR.MINOR.PATCH */
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
