Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92643345E19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 13:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbhCWM2v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 08:28:51 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:57128 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229670AbhCWM2k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 08:28:40 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12NCQleN014129;
        Tue, 23 Mar 2021 13:28:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=/lkDlj4cMSEIUFruBh3qzfmMBC+k0fMrgJjspzqvOF4=;
 b=2Hr3rcj3nQFostNUi0VVxyTQUbvkOx8xzOGL5RIptGxNrqO72XOXyIL5ktYGCwKCeLbH
 BdagHzITm8lyOdCK1GYwgsQmgG6HOgxOpLcnwdtU9GR3OGMDP76R4uy9yqh5EL/zdbER
 Mr2bwnM4gk9U8gH8zF0ek22ocKX5+DO4eyzg8UF0TMai/gJS/k8guxrwt/sWx9RZyoI8
 jksOX7f1ygQAZ6FRtmw4Y8ZBLkTzvOZ6YELC1nlDE7PPKgHz8xaStlloHhDmF5hPqLTO
 OSOtjnFDefTbM3/ofIPqzExv/3LVfdhTjyAnXtIF6gu2CD6ySrU/iG4OZcKV/j7UjYSo dQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37d996f7jr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Mar 2021 13:28:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B1CCF10002A;
        Tue, 23 Mar 2021 13:28:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A2F6C24CF45;
        Tue, 23 Mar 2021 13:28:34 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 23 Mar 2021 13:28:33
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 5/7] rpmsg: char: Introduce a rpmsg driver for the rpmsg char device
Date:   Tue, 23 Mar 2021 13:27:35 +0100
Message-ID: <20210323122737.23035-6-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
References: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-23_06:2021-03-22,2021-03-23 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A rpmsg char device allows to probe the endpoint device on a remote name
service announcement.

With this patch the /dev/rpmsgX interface is created either by a user
application or by the remote firmware.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 58 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 7f6d46078179..69e774edb74b 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -28,6 +28,8 @@
 
 #define RPMSG_DEV_MAX	(MINORMASK + 1)
 
+#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
+
 static dev_t rpmsg_major;
 
 static DEFINE_IDA(rpmsg_ept_ida);
@@ -405,13 +407,67 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
 }
 EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
 
+static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_channel_info chinfo;
+	struct rpmsg_eptdev *eptdev;
+
+	if (!rpdev->ept)
+		return -EINVAL;
+
+	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
+	chinfo.src = rpdev->src;
+	chinfo.dst = rpdev->dst;
+
+	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo, NULL);
+	if (IS_ERR(eptdev))
+		return PTR_ERR(eptdev);
+
+	/* Set the private field of the default endpoint to retrieve context on callback. */
+	rpdev->ept->priv = eptdev;
+
+	return 0;
+}
+
+static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
+{
+	int ret;
+
+	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_destroy_eptdev);
+	if (ret)
+		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
+}
+
+static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
+	{ .name	= RPMSG_CHAR_DEVNAME },
+	{ },
+};
+
+static struct rpmsg_driver rpmsg_chrdev_driver = {
+	.probe = rpmsg_chrdev_probe,
+	.remove = rpmsg_chrdev_remove,
+	.id_table = rpmsg_chrdev_id_table,
+	.callback = rpmsg_ept_cb,
+	.drv = {
+		.name = "rpmsg_chrdev",
+	},
+};
+
 static int rpmsg_chrdev_init(void)
 {
 	int ret;
 
 	ret = alloc_chrdev_region(&rpmsg_major, 0, RPMSG_DEV_MAX, "rpmsg");
-	if (ret < 0)
+	if (ret < 0) {
 		pr_err("rpmsg: failed to allocate char dev region\n");
+		return ret;
+	}
+
+	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
+	if (ret < 0) {
+		pr_err("rpmsg: failed to register rpmsg raw driver\n");
+		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+	}
 
 	return ret;
 }
-- 
2.17.1

