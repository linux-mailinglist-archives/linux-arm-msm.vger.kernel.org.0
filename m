Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19EEA31DA8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 14:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233101AbhBQNcA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 08:32:00 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:14148 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233073AbhBQNbh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 08:31:37 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11HDSVIU001039;
        Wed, 17 Feb 2021 14:30:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=eL8fdw48NUXLNEyAuslWK3wA6wxsb+gv6VUFyukuFOo=;
 b=RW0Z5bTwy8XCiqpWgX/mePZrYlKxC/7Um5fk2Y0FDJVq7Ra05c+2/fCyeBGaSDOTOrMT
 7cS6h/zKFIWKBCCnSBO4HSNwg6LhqLUUb8Jg1FDMaLBLoS4I9qY3WGx3uCrlWsNRZjRC
 Z8BVQhVRjb2g2LgmTI2MwVJvoDsdIbhDrS0R8mR76zpKg3WIJ06qaLn9R8KRnRXROLR1
 ZR9Ujxc7KpaWx+9HBR1g9CW9zYANoiIomKC5p7e023b9oWtJcKF3mnySgcqjqP6rWJT+
 uivyKuDtRQFowkwC2erTm4KM6BM/m6v5RwXnpvYlrmJqBSKWTD/2W1vhOYVZ5KjPyfd+ Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36p4sffbvc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Feb 2021 14:30:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3391D100038;
        Wed, 17 Feb 2021 14:30:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 20B9E2370C9;
        Wed, 17 Feb 2021 14:30:50 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Feb 2021 14:30:49
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v4 04/16] rpmsg: char: export eptdev create an destroy functions
Date:   Wed, 17 Feb 2021 14:28:53 +0100
Message-ID: <20210217132905.1485-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
References: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-17_11:2021-02-16,2021-02-17 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To prepare the split code related to the control and the endpoint
devices in separate files:
- suppress the dependency with the rpmsg_ctrldev struct,
- rename and export the functions in rpmsg_char.h.

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 22 ++++++++++------
 drivers/rpmsg/rpmsg_char.h | 51 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 7 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.h

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 9e33b53bbf56..78a6d19fdf82 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
+ * Copyright (C) 2021, STMicroelectronics
  * Copyright (c) 2016, Linaro Ltd.
  * Copyright (c) 2012, Michal Simek <monstr@monstr.eu>
  * Copyright (c) 2012, PetaLogix
@@ -22,6 +23,7 @@
 #include <linux/uaccess.h>
 #include <uapi/linux/rpmsg.h>
 
+#include "rpmsg_char.h"
 #include "rpmsg_internal.h"
 
 #define RPMSG_DEV_MAX	(MINORMASK + 1)
@@ -78,7 +80,7 @@ struct rpmsg_eptdev {
 	wait_queue_head_t readq;
 };
 
-static int rpmsg_eptdev_destroy(struct device *dev, void *data)
+static int rpmsg_eptdev_destroy(struct device *dev)
 {
 	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
 
@@ -277,7 +279,7 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
 		return -EINVAL;
 
-	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
+	return rpmsg_eptdev_destroy(&eptdev->dev);
 }
 
 static const struct file_operations rpmsg_eptdev_fops = {
@@ -336,10 +338,15 @@ static void rpmsg_eptdev_release_device(struct device *dev)
 	kfree(eptdev);
 }
 
-static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
+int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
+{
+	return rpmsg_eptdev_destroy(dev);
+}
+EXPORT_SYMBOL(rpmsg_chrdev_eptdev_destroy);
+
+int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
 			       struct rpmsg_channel_info chinfo)
 {
-	struct rpmsg_device *rpdev = ctrldev->rpdev;
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev;
 	int ret;
@@ -359,7 +366,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
 
 	device_initialize(dev);
 	dev->class = rpmsg_class;
-	dev->parent = &ctrldev->dev;
+	dev->parent = parent;
 	dev->groups = rpmsg_eptdev_groups;
 	dev_set_drvdata(dev, eptdev);
 
@@ -402,6 +409,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
 
 	return ret;
 }
+EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
 
 static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
 {
@@ -441,7 +449,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
 	chinfo.src = eptinfo.src;
 	chinfo.dst = eptinfo.dst;
 
-	return rpmsg_eptdev_create(ctrldev, chinfo);
+	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo);
 };
 
 static const struct file_operations rpmsg_ctrldev_fops = {
@@ -527,7 +535,7 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
 	int ret;
 
 	/* Destroy all endpoints */
-	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_eptdev_destroy);
+	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
 	if (ret)
 		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
 
diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
new file mode 100644
index 000000000000..0feb3ea9445c
--- /dev/null
+++ b/drivers/rpmsg/rpmsg_char.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) STMicroelectronics 2021.
+ */
+
+#ifndef __RPMSG_CHRDEV_H__
+#define __RPMSG_CHRDEV_H__
+
+#if IS_ENABLED(CONFIG_RPMSG_CHAR)
+/**
+ * rpmsg_chrdev_create_eptdev() - register char device based on an endpoint
+ * @rpdev:  prepared rpdev to be used for creating endpoints
+ * @parent: parent device
+ * @chinfo: assiated endpoint channel information.
+ *
+ * This function create a new rpmsg char endpoint device to instantiate a new
+ * endpoint based on chinfo information.
+ */
+int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
+			       struct rpmsg_channel_info chinfo);
+
+/**
+ * rpmsg_chrdev_eptdev_destroy() - destroy created char device
+ * @data: parent device
+ * @chinfo: assiated endpoint channel information.
+ *
+ * This function create a new rpmsg char endpoint device to instantiate a new
+ * endpoint based on chinfo information.
+ */
+int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data);
+
+#else  /*IS_ENABLED(CONFIG_RPMSG_CHAR) */
+
+static inline int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev,
+					     struct device *parent,
+					     struct rpmsg_channel_info chinfo)
+{
+	return -EINVAL;
+}
+
+static inline int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return 0;
+}
+
+#endif /*IS_ENABLED(CONFIG_RPMSG_CHAR) */
+
+#endif /*__RPMSG_CHRDEV_H__ */
-- 
2.17.1

