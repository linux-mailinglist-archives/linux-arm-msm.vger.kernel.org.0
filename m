Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDDA61D3231
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgENOI3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:08:29 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:37514 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727904AbgENOI3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:08:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589465307; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Z+6iYPlOLD/QWJoCgO3eCUfJnHmQ9IHv3CaRmqVK6BY=; b=QdoFm1Uj0NHyLs4aiafjQ+l4RG9frvNXXeYKGD9j8f/mgRu8ZkiwIH0POEKhh37VwTGa5jVI
 +uXoyOVILFnEAvK7BdQTcgXBRK0C+SQES3xjbeZV05my6ekc39nfrVU3d/S+/QFI17rg3sFG
 wQ2bIsfoNYEH/kWmgkJdLUOrFFI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd50db.7f33deb01260-smtp-out-n02;
 Thu, 14 May 2020 14:08:27 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2123C44798; Thu, 14 May 2020 14:08:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F764C44788;
        Thu, 14 May 2020 14:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4F764C44788
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     manivannan.sadhasivam@linaro.org, bjorn.andersson@linaro.org,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [RFC PATCH 7/8] qaic: Implement MHI error status handler
Date:   Thu, 14 May 2020 08:07:45 -0600
Message-Id: <1589465266-20056-8-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
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
 drivers/misc/qaic/mhi_controller.c | 27 +++++++++++++++++++++++++++
 drivers/misc/qaic/mhi_controller.h |  2 ++
 drivers/misc/qaic/qaic.h           |  2 ++
 drivers/misc/qaic/qaic_drv.c       | 16 +++++++++++++++-
 4 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/qaic/mhi_controller.c b/drivers/misc/qaic/mhi_controller.c
index 18fc830..c1498d4 100644
--- a/drivers/misc/qaic/mhi_controller.c
+++ b/drivers/misc/qaic/mhi_controller.c
@@ -7,6 +7,8 @@
 #include <linux/moduleparam.h>
 #include <linux/pci.h>
 
+#include "qaic.h"
+
 static unsigned int mhi_timeout = 20000; /* 20 sec default */
 module_param(mhi_timeout, uint, 0600);
 
@@ -424,6 +426,15 @@ static void mhi_runtime_put(struct mhi_controller *mhi_cntl)
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
@@ -509,3 +520,19 @@ void qaic_mhi_link_up(struct mhi_controller *mhi_cntl)
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
index 5eca586..1081f0a 100644
--- a/drivers/misc/qaic/mhi_controller.h
+++ b/drivers/misc/qaic/mhi_controller.h
@@ -14,5 +14,7 @@ void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up);
 
 void qaic_mhi_link_down(struct mhi_controller *mhi_cntl);
 void qaic_mhi_link_up(struct mhi_controller *mhi_cntl);
+void qaic_mhi_start_reset(struct mhi_controller *mhi_cntl);
+void qaic_mhi_reset_done(struct mhi_controller *mhi_cntl);
 
 #endif /* MHICONTROLLERQAIC_H_ */
diff --git a/drivers/misc/qaic/qaic.h b/drivers/misc/qaic/qaic.h
index 5f774d4..bbb7512 100644
--- a/drivers/misc/qaic/qaic.h
+++ b/drivers/misc/qaic/qaic.h
@@ -68,6 +68,7 @@ struct qaic_device {
 	struct cdev		*cdev;
 	struct device		*dev;
 	struct dma_bridge_chan	dbc[QAIC_NUM_DBC];
+	struct work_struct	reset_mhi_work;
 	struct workqueue_struct	*cntl_wq;
 	bool			in_reset;
 	struct srcu_struct	dev_lock;
@@ -106,4 +107,5 @@ void wakeup_dbc(struct qaic_device *qdev, u32 dbc_id);
 void release_dbc(struct qaic_device *qdev, u32 dbc_id);
 
 void wake_all_cntl(struct qaic_device *qdev);
+void qaic_dev_reset_clean_local_state(struct qaic_device *qdev);
 #endif /* QAICINTERNAL_H_ */
diff --git a/drivers/misc/qaic/qaic_drv.c b/drivers/misc/qaic/qaic_drv.c
index 1c8eefd..010cf88 100644
--- a/drivers/misc/qaic/qaic_drv.c
+++ b/drivers/misc/qaic/qaic_drv.c
@@ -386,6 +386,18 @@ void qaic_dev_reset_clean_local_state(struct qaic_device *qdev)
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
@@ -411,6 +423,7 @@ static int qaic_pci_probe(struct pci_dev *pdev,
 	qdev->pdev = pdev;
 	mutex_init(&qdev->cntl_mutex);
 	INIT_LIST_HEAD(&qdev->cntl_xfer_list);
+	INIT_WORK(&qdev->reset_mhi_work, reset_mhi_work_func);
 	init_srcu_struct(&qdev->dev_lock);
 	INIT_LIST_HEAD(&qdev->users);
 	mutex_init(&qdev->users_mutex);
@@ -541,6 +554,7 @@ static void qaic_pci_remove(struct pci_dev *pdev)
 		return;
 
 	qaic_dev_reset_clean_local_state(qdev);
+	cancel_work_sync(&qdev->reset_mhi_work);
 	qaic_mhi_free_controller(qdev->mhi_cntl, link_up);
 	for (i = 0; i < QAIC_NUM_DBC; ++i) {
 		devm_free_irq(&pdev->dev, pci_irq_vector(pdev, i + 1),
@@ -682,4 +696,4 @@ module_exit(qaic_exit);
 MODULE_AUTHOR("Qualcomm Cloud AI 100 Accelerator Kernel Driver Team");
 MODULE_DESCRIPTION("Qualcomm Cloud 100 AI Accelerators Driver");
 MODULE_LICENSE("GPL v2");
-MODULE_VERSION("0.0.0"); /* MAJOR.MINOR.PATCH */
+MODULE_VERSION("3.0.1"); /* MAJOR.MINOR.PATCH */
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
