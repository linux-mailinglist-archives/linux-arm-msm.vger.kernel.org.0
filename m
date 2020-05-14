Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7F01D3238
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbgENOIi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:08:38 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:37514 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727903AbgENOIh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:08:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589465316; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=/r1bgVMeJkBXiz1H+2qM7BXH6fCeQ1Tn4MROHmsuqVs=; b=GcT05nCzsl+vV6nCF9abLKIao2znkULwzbVouAA3t6tuvNKYAisXX0Ygo7nAIvDp9+Bvgc84
 Y+PO3WObJkUH6tKcdHCw2NIDRix9+bLKTODHCmdP0Bz96k57dEW/hekErUTXwu3GqZ/mMSVM
 lD93520O7jCnK1ke/9Wik12d72E=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd50d2.7fa03765f0a0-smtp-out-n02;
 Thu, 14 May 2020 14:08:18 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A14DDC433D2; Thu, 14 May 2020 14:08:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ADA0DC433D2;
        Thu, 14 May 2020 14:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ADA0DC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     manivannan.sadhasivam@linaro.org, bjorn.andersson@linaro.org,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [RFC PATCH 3/8] qaic: Create char dev
Date:   Thu, 14 May 2020 08:07:41 -0600
Message-Id: <1589465266-20056-4-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that we can fully boot the device, we should start making it usable.
The primary interface to the device will be via a char dev.  Add the
necessary framework to detect when the device is fully booted, and create
the char dev at that point.  The device is only usable when it is fully
booted.  The char dev does nothing useful yet, but we can easily build on
this to provide functionality.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/misc/qaic/qaic.h     |  19 +++
 drivers/misc/qaic/qaic_drv.c | 303 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 321 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/qaic/qaic.h b/drivers/misc/qaic/qaic.h
index 379aa82..58ca167 100644
--- a/drivers/misc/qaic/qaic.h
+++ b/drivers/misc/qaic/qaic.h
@@ -6,13 +6,32 @@
 #ifndef QAICINTERNAL_H_
 #define QAICINTERNAL_H_
 
+#include <linux/cdev.h>
+#include <linux/kref.h>
 #include <linux/mhi.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/srcu.h>
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
+	struct cdev		*cdev;
+	struct device		*dev;
+	bool			in_reset;
+	struct srcu_struct	dev_lock;
+	struct list_head	users;
+	struct mutex		users_mutex;
 };
 #endif /* QAICINTERNAL_H_ */
diff --git a/drivers/misc/qaic/qaic_drv.c b/drivers/misc/qaic/qaic_drv.c
index b624daa..6e4b936 100644
--- a/drivers/misc/qaic/qaic_drv.c
+++ b/drivers/misc/qaic/qaic_drv.c
@@ -2,8 +2,14 @@
 
 /* Copyright (c) 2019-2020, The Linux Foundation. All rights reserved. */
 
+#include <linux/cdev.h>
+#include <linux/idr.h>
+#include <linux/list.h>
+#include <linux/kref.h>
+#include <linux/mhi.h>
 #include <linux/module.h>
 #include <linux/msi.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/pci_ids.h>
 
@@ -13,9 +19,242 @@
 #define PCI_DEV_AIC100			0xa100
 
 #define QAIC_NAME			"Qualcomm Cloud AI 100"
+#define QAIC_MAX_MINORS			256
 
+static int qaic_major;
+static struct class *qaic_class;
+static DEFINE_IDR(qaic_devs);
+static DEFINE_MUTEX(qaic_devs_lock);
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
+	ret = mutex_lock_interruptible(&qaic_devs_lock);
+	if (ret)
+		return ret;
+	qdev = idr_find(&qaic_devs, iminor(inode));
+	mutex_unlock(&qaic_devs_lock);
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
+	if (!usr)
+		return -ENOMEM;
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
+	dev_t devno;
+	int ret;
+
+	/*
+	 * Invoking this function indicates that the control channel to the
+	 * device is available.  We use that as a signal to indicate that
+	 * the device side firmware has booted.  The device side firmware
+	 * manages the device resources, so we need to communicate with it
+	 * via the control channel in order to utilize the device.  Therefore
+	 * we wait until this signal to create the char dev that userspace will
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
+	mutex_lock(&qaic_devs_lock);
+	ret = idr_alloc(&qaic_devs, qdev, 0, QAIC_MAX_MINORS, GFP_KERNEL);
+	mutex_unlock(&qaic_devs_lock);
+
+	if (ret < 0) {
+		pci_dbg(qdev->pdev, "%s: idr_alloc failed %d\n", __func__, ret);
+		goto err;
+	}
+
+	devno = MKDEV(qaic_major, ret);
+
+	qdev->cdev = cdev_alloc();
+	if (!qdev->cdev) {
+		pci_dbg(qdev->pdev, "%s: cdev_alloc failed\n", __func__);
+		ret = -ENOMEM;
+		goto free_idr;
+	}
+
+	qdev->cdev->owner = THIS_MODULE;
+	qdev->cdev->ops = &qaic_ops;
+	ret = cdev_add(qdev->cdev, devno, 1);
+	if (ret) {
+		pci_dbg(qdev->pdev, "%s: cdev_add failed %d\n", __func__, ret);
+		goto free_cdev;
+	}
+
+	qdev->dev = device_create(qaic_class, NULL, devno, NULL,
+				  "qaic_aic100_%04x:%02x:%02x.%d",
+				  pci_domain_nr(qdev->pdev->bus),
+				  qdev->pdev->bus->number,
+				  PCI_SLOT(qdev->pdev->devfn),
+				  PCI_FUNC(qdev->pdev->devfn));
+	if (IS_ERR(qdev->dev)) {
+		ret = PTR_ERR(qdev->dev);
+		pci_dbg(qdev->pdev, "%s: device_create failed %d\n", __func__, ret);
+		goto free_cdev;
+	}
+
+	dev_set_drvdata(qdev->dev, qdev);
+
+	return 0;
+
+free_cdev:
+	cdev_del(qdev->cdev);
+free_idr:
+	mutex_lock(&qaic_devs_lock);
+	idr_remove(&qaic_devs, MINOR(devno));
+	mutex_unlock(&qaic_devs_lock);
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
+	dev_t devno;
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
+	if (qdev->dev) {
+		devno = qdev->dev->devt;
+		qdev->dev = NULL;
+		device_destroy(qaic_class, devno);
+		cdev_del(qdev->cdev);
+		mutex_lock(&qaic_devs_lock);
+		idr_remove(&qaic_devs, MINOR(devno));
+		mutex_unlock(&qaic_devs_lock);
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
@@ -33,6 +272,9 @@ static int qaic_pci_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, qdev);
 	qdev->pdev = pdev;
+	init_srcu_struct(&qdev->dev_lock);
+	INIT_LIST_HEAD(&qdev->users);
+	mutex_init(&qdev->users_mutex);
 
 	qdev->bars = pci_select_bars(pdev, IORESOURCE_MEM);
 
@@ -107,6 +349,7 @@ static int qaic_pci_probe(struct pci_dev *pdev,
 enable_fail:
 	pci_set_drvdata(pdev, NULL);
 bar_fail:
+	cleanup_srcu_struct(&qdev->dev_lock);
 	kfree(qdev);
 qdev_fail:
 	return ret;
@@ -120,6 +363,7 @@ static void qaic_pci_remove(struct pci_dev *pdev)
 	if (!qdev)
 		return;
 
+	qaic_dev_reset_clean_local_state(qdev);
 	qaic_mhi_free_controller(qdev->mhi_cntl, link_up);
 	pci_free_irq_vectors(pdev);
 	iounmap(qdev->bar_0);
@@ -127,9 +371,27 @@ static void qaic_pci_remove(struct pci_dev *pdev)
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
@@ -146,13 +408,48 @@ static struct pci_driver qaic_pci_driver = {
 static int __init qaic_init(void)
 {
 	int ret;
+	dev_t dev;
 
 	pr_debug("qaic: init\n");
 
+	ret = alloc_chrdev_region(&dev, 0, QAIC_MAX_MINORS, QAIC_NAME);
+	if (ret < 0) {
+		pr_debug("qaic: alloc_chrdev_region failed %d\n", ret);
+		goto out;
+	}
+
+	qaic_major = MAJOR(dev);
+
+	qaic_class = class_create(THIS_MODULE, QAIC_NAME);
+	if (IS_ERR(qaic_class)) {
+		ret = PTR_ERR(qaic_class);
+		pr_debug("qaic: class_create failed %d\n", ret);
+		goto free_major;
+	}
+
+	ret = mhi_driver_register(&qaic_mhi_driver);
+	if (ret) {
+		pr_debug("qaic: mhi_driver_register failed %d\n", ret);
+		goto free_class;
+	}
+
 	ret = pci_register_driver(&qaic_pci_driver);
 
-	pr_debug("qaic: init success\n");
+	if (ret) {
+		pr_debug("qaic: pci_register_driver failed %d\n", ret);
+		goto free_mhi;
+	}
 
+	pr_debug("qaic: init success\n");
+	goto out;
+
+free_mhi:
+	mhi_driver_unregister(&qaic_mhi_driver);
+free_class:
+	class_destroy(qaic_class);
+free_major:
+	unregister_chrdev_region(MKDEV(qaic_major, 0), QAIC_MAX_MINORS);
+out:
 	return ret;
 }
 
@@ -161,6 +458,10 @@ static void __exit qaic_exit(void)
 	pr_debug("qaic: exit\n");
 	link_up = true;
 	pci_unregister_driver(&qaic_pci_driver);
+	mhi_driver_unregister(&qaic_mhi_driver);
+	class_destroy(qaic_class);
+	unregister_chrdev_region(MKDEV(qaic_major, 0), QAIC_MAX_MINORS);
+	idr_destroy(&qaic_devs);
 }
 
 module_init(qaic_init);
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
