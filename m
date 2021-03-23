Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3122E345E12
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 13:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbhCWM2s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 08:28:48 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:9506 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230407AbhCWM21 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 08:28:27 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12NCN2cu029921;
        Tue, 23 Mar 2021 13:28:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=7xCX7GIYLaV0sVmXeAUeryIkjuUg8J1UwYYlHrPsQ+g=;
 b=zgVUsbozIt/JvQmOzELt4R/Z01eknq+zTX6lG1e63DUGFhdfNo7Ub3LZkrUT36okGNnn
 aOhaNcilaIYitfWS9FGTyvP2drk9xpcSDT+lbPdQhxha5v00H2hfAva3Ls++tne76XdF
 jB601p4P7tfi3cNC4aSID2vkMky+NDltBvvoWLzK7yAR23NMbVpEl18yQ+9trNYB2yZL
 itvbxGY6C2cZ+dubOFodkHwLfqzDeqLG4u6FMLfIwMEJeoKqmhFxdv7K8TCF7ax/LPSA
 itKLs9rRYc0QSz/uBcqwgF+Zgw5vslJUWwXAV8aaW3LAz201kd0YhisWR+QxGACknjHJ FQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37d72dqkwg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Mar 2021 13:28:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41160100034;
        Tue, 23 Mar 2021 13:28:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 31FBB24CF45;
        Tue, 23 Mar 2021 13:28:21 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 23 Mar 2021 13:28:20
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 1/7] rpmsg: char: Export eptdev create an destroy functions
Date:   Tue, 23 Mar 2021 13:27:31 +0100
Message-ID: <20210323122737.23035-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
References: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-23_06:2021-03-22,2021-03-23 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To prepare the split of the code related to the control (ctrldev)
and the endpoint (eptdev) devices in 2 separate files:

- Rename and export the functions in rpmsg_char.h.

- Suppress the dependency with the rpmsg_ctrldev struct in the
  rpmsg_chrdev_create_eptdev function.

- The rpmsg class is provided as parameter in rpmsg_chrdev_create_eptdev,
  because the class is associated to the control part.

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

---
Update from [1]:
- Directly export rpmsg_eptdev_destroy after renaming it.
- use IS_REACHABLE instead of IS_ENABLED to solve build issue when
CONFIG_RPMSG_CHAR=m && CONFIG_RPMSG_CTRL=y

[1] https://patchwork.kernel.org/project/linux-remoteproc/patch/20210219111501.14261-5-arnaud.pouliquen@foss.st.com/
---
 drivers/rpmsg/rpmsg_char.c | 19 +++++++++------
 drivers/rpmsg/rpmsg_char.h | 50 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 8 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.h

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 2bebc9b2d163..b9df8dc4365f 100644
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
+int rpmsg_chrdev_destroy_eptdev(struct device *dev, void *data)
 {
 	struct rpmsg_eptdev *eptdev = dev_to_eptdev(dev);
 
@@ -97,6 +99,7 @@ static int rpmsg_eptdev_destroy(struct device *dev, void *data)
 
 	return 0;
 }
+EXPORT_SYMBOL(rpmsg_chrdev_destroy_eptdev);
 
 static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
 			void *priv, u32 addr)
@@ -280,7 +283,7 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
 		return -EINVAL;
 
-	return rpmsg_eptdev_destroy(&eptdev->dev, NULL);
+	return rpmsg_chrdev_destroy_eptdev(&eptdev->dev, NULL);
 }
 
 static const struct file_operations rpmsg_eptdev_fops = {
@@ -339,10 +342,9 @@ static void rpmsg_eptdev_release_device(struct device *dev)
 	kfree(eptdev);
 }
 
-static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
-			       struct rpmsg_channel_info chinfo)
+int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
+			       struct rpmsg_channel_info chinfo, struct class *rpmsg_class)
 {
-	struct rpmsg_device *rpdev = ctrldev->rpdev;
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev;
 	int ret;
@@ -362,7 +364,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
 
 	device_initialize(dev);
 	dev->class = rpmsg_class;
-	dev->parent = &ctrldev->dev;
+	dev->parent = parent;
 	dev->groups = rpmsg_eptdev_groups;
 	dev_set_drvdata(dev, eptdev);
 
@@ -405,6 +407,7 @@ static int rpmsg_eptdev_create(struct rpmsg_ctrldev *ctrldev,
 
 	return ret;
 }
+EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
 
 static int rpmsg_ctrldev_open(struct inode *inode, struct file *filp)
 {
@@ -444,7 +447,7 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
 	chinfo.src = eptinfo.src;
 	chinfo.dst = eptinfo.dst;
 
-	return rpmsg_eptdev_create(ctrldev, chinfo);
+	return rpmsg_chrdev_create_eptdev(ctrldev->rpdev, &ctrldev->dev, chinfo, rpmsg_class);
 };
 
 static const struct file_operations rpmsg_ctrldev_fops = {
@@ -530,7 +533,7 @@ static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
 	int ret;
 
 	/* Destroy all endpoints */
-	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_eptdev_destroy);
+	ret = device_for_each_child(&ctrldev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
 	if (ret)
 		dev_warn(&rpdev->dev, "failed to nuke endpoints: %d\n", ret);
 
diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
new file mode 100644
index 000000000000..379d2ae2bee8
--- /dev/null
+++ b/drivers/rpmsg/rpmsg_char.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) STMicroelectronics 2021.
+ */
+
+#ifndef __RPMSG_CHRDEV_H__
+#define __RPMSG_CHRDEV_H__
+
+#if IS_REACHABLE(CONFIG_RPMSG_CHAR)
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
+			       struct rpmsg_channel_info chinfo, struct class *rpmsg_class);
+
+/**
+ * rpmsg_chrdev_destroy_eptdev() - destroy created char device endpoint.
+ * @data: private data associated to the endpoint device
+ *
+ * This function destroys a rpmsg char endpoint device created by the RPMSG_DESTROY_EPT_IOCTL
+ * control.
+ */
+int rpmsg_chrdev_destroy_eptdev(struct device *dev, void *data);
+
+#else  /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
+
+static inline int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
+					     struct rpmsg_channel_info chinfo,
+					     struct class *rpmsg_class)
+{
+	return -EINVAL;
+}
+
+static inline int rpmsg_chrdev_destroy_eptdev(struct device *dev, void *data)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return 0;
+}
+
+#endif /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
+
+#endif /*__RPMSG_CHRDEV_H__ */
-- 
2.17.1

