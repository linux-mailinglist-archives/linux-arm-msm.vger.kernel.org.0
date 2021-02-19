Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30AA831F841
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 12:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhBSLUn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 06:20:43 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:11642 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230420AbhBSLT5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 06:19:57 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11JBIKr3024229;
        Fri, 19 Feb 2021 12:19:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=npnCdg9P84ZC4R2qY5iUG26l9krhi70nLlkWTe/TIss=;
 b=zYiVq2tJSfgSXvjKPSOKHfuRDHFXsKkZwbfN8OSDlLykawsYFzSh7DaVw7fOkkm0RBjx
 S9NVgo4iE4PDv3zj0a7e0tg1qyVrJks6x39PHNW8BlgDWowS/yyr5DaAh906HF98HNMZ
 +0wlq6LKjho+LdpLolp7x1PoubR/Qpq589Zt4CFXSPJLF7Xxt0PBt8LwN3gJmL7bTp67
 yToKaXgB1WbXlu/QKo/7SOzChP6icn3swU6+kCX8mxD34bl7GC/jbzbw8nQ7ezostVXL
 qfYLLhtJKvg0mNBiA+2BPZlAVWM4ZVuPoHu4PZDTVL++wEnkhyo1LIIcgIwMZIPmRcYe Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36sqadeyw8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Feb 2021 12:19:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 75FC210002A;
        Fri, 19 Feb 2021 12:19:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 675EF221760;
        Fri, 19 Feb 2021 12:19:10 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Feb 2021 12:19:10
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v5 14/16] rpmsg: char: introduce a RPMsg driver for the RPMsg char device
Date:   Fri, 19 Feb 2021 12:14:59 +0100
Message-ID: <20210219111501.14261-15-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-19_04:2021-02-18,2021-02-19 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A RPMsg char device allows to probe the endpoint device on a remote name
service announcement. With this patch the /dev/rpmsgX interface is created
either by a user application or by the remote firmware.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 65 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 66dcb8845d6c..c98b0e69679b 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -28,6 +28,8 @@
 
 #define RPMSG_DEV_MAX	(MINORMASK + 1)
 
+#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
+
 static dev_t rpmsg_major;
 static struct class *rpmsg_class;
 
@@ -408,6 +410,52 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
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
+	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo);
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
+	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
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
@@ -421,10 +469,23 @@ static int rpmsg_chrdev_init(void)
 	rpmsg_class = class_create(THIS_MODULE, "rpmsg");
 	if (IS_ERR(rpmsg_class)) {
 		pr_err("failed to create rpmsg class\n");
-		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
-		return PTR_ERR(rpmsg_class);
+		ret = PTR_ERR(rpmsg_class);
+		goto free_region;
 	}
 
+	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
+	if (ret < 0) {
+		pr_err("rpmsg: failed to register rpmsg raw driver\n");
+		goto free_class;
+	}
+
+	return 0;
+
+free_class:
+	class_destroy(rpmsg_class);
+free_region:
+	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+
 	return ret;
 }
 postcore_initcall(rpmsg_chrdev_init);
-- 
2.17.1

