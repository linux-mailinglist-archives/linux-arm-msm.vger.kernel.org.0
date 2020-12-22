Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50CF72E0947
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 12:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgLVK7b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 05:59:31 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:53815 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725897AbgLVK6w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 05:58:52 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BMAvIUK004003;
        Tue, 22 Dec 2020 11:58:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=i5G4OSHl8Y/N2J/A+l3Tj+VqlW43Rc+ecwFsHG5sGFg=;
 b=WRUUuuJxXrs9jPatrCFblGqbnxRgHzHkmzdi8Fyq9pxGTQ8KkdQSVr9JTcBl9Dg1GU4A
 MfwGiJ6Rw6jcBtVkGYx+JECaZcnw3L5C9TJZPZkBcFI1xg3sd8EGiiexnRdnGxNpxcJA
 qkD7y795cVPjGE6/czZ+X/fAvcfN74mMD/iOauqKVtshUdtEyFEftMpvsBZWm8W5AHoT
 V4fCGOwcUuQacUxRT//xnqOisUDEdY6uCUrK/lqI1l5pp67VZw4OGfV4FCM9iEqjeCX0
 AzCmpbcmsmnfwOZnxM6rYs9sCq3d4+4NJu0sIApu9HmYfjMmxa0hquoWpS5sga2qL55U aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35k0d1bjts-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Dec 2020 11:58:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 887BE10002A;
        Tue, 22 Dec 2020 11:58:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F02A721BD81;
        Tue, 22 Dec 2020 11:58:04 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Dec 2020 11:58:04
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 08/16] rpmsg: char: make char rpmsg a rpmsg device without the control part
Date:   Tue, 22 Dec 2020 11:57:18 +0100
Message-ID: <20201222105726.16906-9-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-22_04:2020-12-21,2020-12-22 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The RPMsg control part is migrated to the rpmsg_ctrl.c. Clean up the
code associated to the support of the /dev/rpmsgctrl0 and update the
driver to only manage the char devices as a RPMsg generic service.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 166 +++++++------------------------------
 1 file changed, 28 insertions(+), 138 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 732f5caf068a..3d77f4d5fc32 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -28,16 +28,12 @@
 
 static dev_t rpmsg_major;
 
-static DEFINE_IDA(rpmsg_ctrl_ida);
 static DEFINE_IDA(rpmsg_ept_ida);
 static DEFINE_IDA(rpmsg_minor_ida);
 
 #define dev_to_eptdev(dev) container_of(dev, struct rpmsg_eptdev, dev)
 #define cdev_to_eptdev(i_cdev) container_of(i_cdev, struct rpmsg_eptdev, cdev)
 
-#define dev_to_ctrldev(dev) container_of(dev, struct rpmsg_ctrldev, dev)
-#define cdev_to_ctrldev(i_cdev) container_of(i_cdev, struct rpmsg_ctrldev, cdev)
-
 /**
  * struct rpmsg_ctrldev - control device for instantiating endpoint devices
  * @rpdev:	underlaying rpmsg device
@@ -300,10 +296,8 @@ static void rpmsg_eptdev_release_device(struct device *dev)
 	kfree(eptdev);
 }
 
-static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
-			       struct rpmsg_channel_info chinfo)
+static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 {
-	struct rpmsg_device *rpdev = ctrldev->rpdev;
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev;
 	int ret;
@@ -314,7 +308,9 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
 
 	dev = &eptdev->dev;
 	eptdev->rpdev = rpdev;
-	eptdev->chinfo = chinfo;
+	strncpy(eptdev->chinfo.name, rpdev->id.name, RPMSG_NAME_SIZE);
+	eptdev->chinfo.src = rpdev->src;
+	eptdev->chinfo.dst = rpdev->dst;
 
 	mutex_init(&eptdev->ept_lock);
 	spin_lock_init(&eptdev->queue_lock);
@@ -322,15 +318,18 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
 	init_waitqueue_head(&eptdev->readq);
 
 	device_initialize(dev);
-	dev->parent = &ctrldev->dev;
+	dev->parent = &rpdev->dev;
 	dev_set_drvdata(dev, eptdev);
 
 	cdev_init(&eptdev->cdev, &rpmsg_eptdev_fops);
 	eptdev->cdev.owner = THIS_MODULE;
 
 	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "failed to get IDA (%d)\n", ret);
 		goto free_eptdev;
+	}
+
 	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
 
 	ret = ida_simple_get(&rpmsg_ept_ida, 0, 0, GFP_KERNEL);
@@ -340,8 +339,10 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
 	dev_set_name(dev, "rpmsg%d", ret);
 
 	ret = cdev_add(&eptdev->cdev, dev->devt, 1);
-	if (ret)
+	if (ret) {
+		dev_err(&rpdev->dev, "failed to add char device(%d)\n", ret);
 		goto free_ept_ida;
+	}
 
 	/* We can now rely on the release function for cleanup */
 	dev->release = rpmsg_eptdev_release_device;
@@ -352,6 +353,8 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
 		put_device(dev);
 	}
 
+	dev_set_drvdata(&rpdev->dev, eptdev);
+
 	return ret;
 
 free_ept_ida:
@@ -365,138 +368,25 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
 	return ret;
 }
 
-static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
-{
-	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
-
-	get_device(&ctrldev->dev);
-	filp->private_data = ctrldev;
-
-	return 0;
-}
-
-static int rpmsg_ctrldev_release(struct inode *inode, struct file *filp)
+static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
 {
-	struct rpmsg_ctrldev *ctrldev = cdev_to_ctrldev(inode->i_cdev);
+	struct rpmsg_eptdev *eptdev = dev_get_drvdata(&rpdev->dev);
 
-	put_device(&ctrldev->dev);
+	/* Wake up any blocked readers */
+	wake_up_interruptible(&eptdev->readq);
 
-	return 0;
+	device_del(&eptdev->dev);
+	put_device(&eptdev->dev);
 }
 
-static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
-				unsigned long arg)
-{
-	struct rpmsg_ctrldev *ctrldev = fp->private_data;
-	void __user *argp = (void __user *)arg;
-	struct rpmsg_endpoint_info eptinfo;
-	struct rpmsg_channel_info chinfo;
-
-	if (cmd != RPMSG_CREATE_EPT_IOCTL)
-		return -EINVAL;
-
-	if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
-		return -EFAULT;
-
-	memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
-	chinfo.name[RPMSG_NAME_SIZE-1] = '\0';
-	chinfo.src = eptinfo.src;
-	chinfo.dst = eptinfo.dst;
-
-	return rpmsg_eptdev_create(ctrldev, chinfo);
+static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
+	{ .name	= "rpmsg-raw" },
+	{ },
 };
-
-static const struct file_operations rpmsg_ctrldev_fops = {
-	.owner = THIS_MODULE,
-	.open = rpmsg_ctrldev_open,
-	.release = rpmsg_ctrldev_release,
-	.unlocked_ioctl = rpmsg_ctrldev_ioctl,
-	.compat_ioctl = compat_ptr_ioctl,
-};
-
-static void rpmsg_ctrldev_release_device(struct device *dev)
-{
-	struct rpmsg_ctrldev *ctrldev = dev_to_ctrldev(dev);
-
-	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
-	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
-	cdev_del(&ctrldev->cdev);
-	kfree(ctrldev);
-}
-
-static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
-{
-	struct rpmsg_ctrldev *ctrldev;
-	struct device *dev;
-	int ret;
-
-	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
-	if (!ctrldev)
-		return -ENOMEM;
-
-	ctrldev->rpdev = rpdev;
-
-	dev = &ctrldev->dev;
-	device_initialize(dev);
-	dev->parent = &rpdev->dev;
-
-	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
-	ctrldev->cdev.owner = THIS_MODULE;
-
-	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
-	if (ret < 0)
-		goto free_ctrldev;
-	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
-
-	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
-	if (ret < 0)
-		goto free_minor_ida;
-	dev->id = ret;
-	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
-
-	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
-	if (ret)
-		goto free_ctrl_ida;
-
-	/* We can now rely on the release function for cleanup */
-	dev->release = rpmsg_ctrldev_release_device;
-
-	ret = device_add(dev);
-	if (ret) {
-		dev_err(&rpdev->dev, "device_add failed: %d\n", ret);
-		put_device(dev);
-	}
-
-	dev_set_drvdata(&rpdev->dev, ctrldev);
-
-	return ret;
-
-free_ctrl_ida:
-	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
-free_minor_ida:
-	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
-free_ctrldev:
-	put_device(dev);
-	kfree(ctrldev);
-
-	return ret;
-}
-
-static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
-{
-	struct rpmsg_ctrldev *ctrldev = dev_get_drvdata(&rpdev->dev);
-	int ret;
-
-	/* Destroy all endpoints */
-	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_eptdev_destroy);
-	if (ret)
-		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
-
-	device_del(&ctrldev->dev);
-	put_device(&ctrldev->dev);
-}
+MODULE_DEVICE_TABLE(rpmsg, rpmsg_chrdev_id_table);
 
 static struct rpmsg_driver rpmsg_chrdev_driver = {
+	.id_table	= rpmsg_chrdev_id_table,
 	.probe = rpmsg_chrdev_probe,
 	.remove = rpmsg_chrdev_remove,
 	.drv = {
@@ -504,7 +394,7 @@ static struct rpmsg_driver rpmsg_chrdev_driver = {
 	},
 };
 
-static int rpmsg_char_init(void)
+static int rpmsg_chrdev_init(void)
 {
 	int ret;
 
@@ -516,13 +406,13 @@ static int rpmsg_char_init(void)
 
 	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
 	if (ret < 0) {
-		pr_err("rpmsgchr: failed to register rpmsg driver\n");
+		pr_err("rpmsg: failed to register rpmsg chrdev driver\n");
 		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 	}
 
 	return ret;
 }
-postcore_initcall(rpmsg_char_init);
+postcore_initcall(rpmsg_chrdev_init);
 
 static void rpmsg_chrdev_exit(void)
 {
-- 
2.17.1

