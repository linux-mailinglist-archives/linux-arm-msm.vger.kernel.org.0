Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96DED1D9929
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 16:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729164AbgESOOw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 10:14:52 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:25399 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729114AbgESOOv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 10:14:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589897690; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=jtysM4V9vCTOmg5VxS8zBsi6/rp5NN9JvWjUars0hjQ=; b=aIJuWOkuKW+F/ukM4KVA6Rg1fFHWUuyDE6dhPi5qbQAnni/vSgG3cYBTlc1XhHkUdQmoTTfS
 1zLF0QF/TY3KqevHhYDFP+94lb/x4MsKVLL56GMFjaS3wv0sTygkECamOAn7mOueQk7+f0+p
 I6TSFd1TZ5EazVPYL0CFEaPt9Ws=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec3e9c0.7fdb6ef67378-smtp-out-n02;
 Tue, 19 May 2020 14:14:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EC60DC433D2; Tue, 19 May 2020 14:14:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 73275C432C2;
        Tue, 19 May 2020 14:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 73275C432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     manivannan.sadhasivam@linaro.org, bjorn.andersson@linaro.org,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [RFC v2 PATCH 3/8] qaic: Create misc dev
Date:   Tue, 19 May 2020 08:14:00 -0600
Message-Id: <1589897645-17088-4-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589897645-17088-1-git-send-email-jhugo@codeaurora.org>
References: <1589897645-17088-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that we can fully boot the device, we should start making it usable.
The primary interface to the device will be via a misc dev.  Add the
necessary framework to detect when the device is fully booted, and create
the misc dev at that point.  The device is only usable when it is fully
booted.  The misc dev does nothing useful yet, but we can easily build on
this to provide functionality.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/misc/qaic/qaic.h     |  21 ++++
 drivers/misc/qaic/qaic_drv.c | 233 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 254 insertions(+)

diff --git a/drivers/misc/qaic/qaic.h b/drivers/misc/qaic/qaic.h
index 379aa82..7b430cf 100644
--- a/drivers/misc/qaic/qaic.h
+++ b/drivers/misc/qaic/qaic.h
@@ -6,13 +6,34 @@
 #ifndef QAICINTERNAL_H_
 #define QAICINTERNAL_H_
 
+#include <linux/kref.h>
 #include <linux/mhi.h>
+#include <linux/miscdevice.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/srcu.h>
+
+#define QAIC_MDEV_NAME_MAX	25
+
+struct qaic_user {
+	pid_t			handle;
+	struct qaic_device	*qdev;
+	struct list_head	node;
+	struct srcu_struct	qdev_lock;
+	struct kref		ref_count;
+};
 
 struct qaic_device {
 	struct pci_dev		*pdev;
 	int			bars;
 	void __iomem		*bar_0;
 	struct mhi_controller	*mhi_cntl;
+	struct mhi_device	*cntl_ch;
+	struct miscdevice	mdev;
+	char			mdev_name[QAIC_MDEV_NAME_MAX];
+	bool			in_reset;
+	struct srcu_struct	dev_lock;
+	struct list_head	users;
+	struct mutex		users_mutex;
 };
 #endif /* QAICINTERNAL_H_ */
diff --git a/drivers/misc/qaic/qaic_drv.c b/drivers/misc/qaic/qaic_drv.c
index 65cd9d9..899b944 100644
--- a/drivers/misc/qaic/qaic_drv.c
+++ b/drivers/misc/qaic/qaic_drv.c
@@ -2,8 +2,14 @@
 
 /* Copyright (c) 2019-2020, The Linux Foundation. All rights reserved. */
 
+#include <linux/idr.h>
+#include <linux/list.h>
+#include <linux/kref.h>
+#include <linux/mhi.h>
+#include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/msi.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/pci_ids.h>
 
@@ -14,6 +20,185 @@
 
 static bool link_up;
 
+static int qaic_device_open(struct inode *inode, struct file *filp);
+static int qaic_device_release(struct inode *inode, struct file *filp);
+
+static const struct file_operations qaic_ops = {
+	.owner = THIS_MODULE,
+	.open = qaic_device_open,
+	.release = qaic_device_release,
+};
+
+static void free_usr(struct kref *kref)
+{
+	struct qaic_user *usr = container_of(kref, struct qaic_user, ref_count);
+
+	list_del(&usr->node);
+	cleanup_srcu_struct(&usr->qdev_lock);
+	kfree(usr);
+}
+
+static int qaic_device_open(struct inode *inode, struct file *filp)
+{
+	struct qaic_device *qdev;
+	struct qaic_user *usr;
+	int rcu_id;
+	int ret;
+
+	qdev = container_of(filp->private_data, struct qaic_device, mdev);
+
+	pci_dbg(qdev->pdev, "%s pid:%d\n", __func__, current->pid);
+
+	rcu_id = srcu_read_lock(&qdev->dev_lock);
+	if (qdev->in_reset) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return -ENODEV;
+	}
+
+	usr = kmalloc(sizeof(*usr), GFP_KERNEL);
+	if (!usr) {
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return -ENOMEM;
+	}
+
+	usr->handle = current->pid;
+	usr->qdev = qdev;
+	init_srcu_struct(&usr->qdev_lock);
+	kref_init(&usr->ref_count);
+
+	ret = mutex_lock_interruptible(&qdev->users_mutex);
+	if (ret) {
+		cleanup_srcu_struct(&usr->qdev_lock);
+		kfree(usr);
+		srcu_read_unlock(&qdev->dev_lock, rcu_id);
+		return ret;
+	}
+
+	list_add(&usr->node, &qdev->users);
+	mutex_unlock(&qdev->users_mutex);
+
+	filp->private_data = usr;
+	nonseekable_open(inode, filp);
+
+	srcu_read_unlock(&qdev->dev_lock, rcu_id);
+	return 0;
+}
+
+static int qaic_device_release(struct inode *inode, struct file *filp)
+{
+	struct qaic_user *usr = filp->private_data;
+	struct qaic_device *qdev = usr->qdev;
+	int qdev_rcu_id;
+	int usr_rcu_id;
+
+	usr_rcu_id = srcu_read_lock(&usr->qdev_lock);
+	if (qdev) {
+		qdev_rcu_id = srcu_read_lock(&qdev->dev_lock);
+		if (!qdev->in_reset) {
+			pci_dbg(qdev->pdev, "%s pid:%d\n", __func__,
+								current->pid);
+		}
+		srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
+
+		srcu_read_unlock(&usr->qdev_lock, usr_rcu_id);
+		mutex_lock(&qdev->users_mutex);
+		kref_put(&usr->ref_count, free_usr);
+		mutex_unlock(&qdev->users_mutex);
+	} else {
+		srcu_read_unlock(&usr->qdev_lock, usr_rcu_id);
+		/* safe to do without the mutex because reset already has ref */
+		kref_put(&usr->ref_count, free_usr);
+	}
+
+	filp->private_data = NULL;
+	return 0;
+}
+
+static int qaic_mhi_probe(struct mhi_device *mhi_dev,
+			  const struct mhi_device_id *id)
+{
+	struct qaic_device *qdev;
+	int ret;
+
+	/*
+	 * Invoking this function indicates that the control channel to the
+	 * device is available.  We use that as a signal to indicate that
+	 * the device side firmware has booted.  The device side firmware
+	 * manages the device resources, so we need to communicate with it
+	 * via the control channel in order to utilize the device.  Therefore
+	 * we wait until this signal to create the misc dev that userspace will
+	 * use to control the device, because without the device side firmware,
+	 * userspace can't do anything useful.
+	 */
+
+	qdev = (struct qaic_device *)pci_get_drvdata(
+				to_pci_dev(mhi_dev->mhi_cntrl->cntrl_dev));
+
+	pci_dbg(qdev->pdev, "%s\n", __func__);
+	qdev->in_reset = false;
+
+	dev_set_drvdata(&mhi_dev->dev, qdev);
+	qdev->cntl_ch = mhi_dev;
+
+	ret = misc_register(&qdev->mdev);
+	if (ret) {
+		pci_dbg(qdev->pdev, "%s: Misc device register failed Ret: %d\n", __func__, ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	return ret;
+}
+
+static void qaic_mhi_remove(struct mhi_device *mhi_dev)
+{
+}
+
+static void qaic_mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
+				struct mhi_result *mhi_result)
+{
+}
+
+static void qaic_mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
+				struct mhi_result *mhi_result)
+{
+}
+
+void qaic_dev_reset_clean_local_state(struct qaic_device *qdev)
+{
+	struct qaic_user *usr;
+	struct qaic_user *u;
+
+	qdev->in_reset = true;
+	synchronize_srcu(&qdev->dev_lock);
+
+	/*
+	 * while the usr still has access to the qdev, use the mutex to add
+	 * a reference for later.  This makes sure the usr can't disappear on
+	 * us at the wrong time.  The mutex use in close() system call handling
+	 * makes sure the usr will be valid or complete not exist here.
+	 */
+	mutex_lock(&qdev->users_mutex);
+	list_for_each_entry_safe(usr, u, &qdev->users, node)
+		kref_get(&usr->ref_count);
+	mutex_unlock(&qdev->users_mutex);
+
+	/* remove chardev to prevent new users from coming in */
+	if (qdev->mdev.minor != MISC_DYNAMIC_MINOR) {
+		misc_deregister(&qdev->mdev);
+		qdev->mdev.minor = MISC_DYNAMIC_MINOR;
+	}
+
+	/* make existing users get unresolvable errors until they close FDs */
+	list_for_each_entry_safe(usr, u, &qdev->users, node) {
+		usr->qdev = NULL;
+		synchronize_srcu(&usr->qdev_lock);
+		kref_put(&usr->ref_count, free_usr);
+	}
+}
+
 static int qaic_pci_probe(struct pci_dev *pdev,
 			  const struct pci_device_id *id)
 {
@@ -31,6 +216,18 @@ static int qaic_pci_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, qdev);
 	qdev->pdev = pdev;
+	init_srcu_struct(&qdev->dev_lock);
+	INIT_LIST_HEAD(&qdev->users);
+	mutex_init(&qdev->users_mutex);
+	snprintf(qdev->mdev_name, QAIC_MDEV_NAME_MAX,
+		 "qaic_aic100_%04x:%02x:%02x.%d",
+		 pci_domain_nr(qdev->pdev->bus),
+		 qdev->pdev->bus->number,
+		 PCI_SLOT(qdev->pdev->devfn),
+		 PCI_FUNC(qdev->pdev->devfn));
+	qdev->mdev.minor = MISC_DYNAMIC_MINOR;
+	qdev->mdev.name = &qdev->mdev_name[0];
+	qdev->mdev.fops = &qaic_ops;
 
 	qdev->bars = pci_select_bars(pdev, IORESOURCE_MEM);
 
@@ -105,6 +302,7 @@ static int qaic_pci_probe(struct pci_dev *pdev,
 enable_fail:
 	pci_set_drvdata(pdev, NULL);
 bar_fail:
+	cleanup_srcu_struct(&qdev->dev_lock);
 	kfree(qdev);
 qdev_fail:
 	return ret;
@@ -118,6 +316,7 @@ static void qaic_pci_remove(struct pci_dev *pdev)
 	if (!qdev)
 		return;
 
+	qaic_dev_reset_clean_local_state(qdev);
 	qaic_mhi_free_controller(qdev->mhi_cntl, link_up);
 	pci_free_irq_vectors(pdev);
 	iounmap(qdev->bar_0);
@@ -125,9 +324,27 @@ static void qaic_pci_remove(struct pci_dev *pdev)
 	pci_release_selected_regions(pdev, qdev->bars);
 	pci_disable_device(pdev);
 	pci_set_drvdata(pdev, NULL);
+	cleanup_srcu_struct(&qdev->dev_lock);
 	kfree(qdev);
 }
 
+static const struct mhi_device_id qaic_mhi_match_table[] = {
+	{ .chan = "QAIC_CONTROL", },
+	{},
+};
+
+static struct mhi_driver qaic_mhi_driver = {
+	.id_table = qaic_mhi_match_table,
+	.remove = qaic_mhi_remove,
+	.probe = qaic_mhi_probe,
+	.ul_xfer_cb = qaic_mhi_ul_xfer_cb,
+	.dl_xfer_cb = qaic_mhi_dl_xfer_cb,
+	.driver = {
+		.name = "qaic_mhi",
+		.owner = THIS_MODULE,
+	},
+};
+
 static const struct pci_device_id ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, PCI_DEV_AIC100), },
 	{ 0, }
@@ -147,10 +364,25 @@ static int __init qaic_init(void)
 
 	pr_debug("qaic: init\n");
 
+	ret = mhi_driver_register(&qaic_mhi_driver);
+	if (ret) {
+		pr_debug("qaic: mhi_driver_register failed %d\n", ret);
+		goto out;
+	}
+
 	ret = pci_register_driver(&qaic_pci_driver);
 
+	if (ret) {
+		pr_debug("qaic: pci_register_driver failed %d\n", ret);
+		goto free_mhi;
+	}
+
 	pr_debug("qaic: init success\n");
+	goto out;
 
+free_mhi:
+	mhi_driver_unregister(&qaic_mhi_driver);
+out:
 	return ret;
 }
 
@@ -159,6 +391,7 @@ static void __exit qaic_exit(void)
 	pr_debug("qaic: exit\n");
 	link_up = true;
 	pci_unregister_driver(&qaic_pci_driver);
+	mhi_driver_unregister(&qaic_mhi_driver);
 }
 
 module_init(qaic_init);
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
