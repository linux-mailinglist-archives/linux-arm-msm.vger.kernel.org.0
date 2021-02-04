Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 990CD30EEE7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 09:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235169AbhBDIrb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 03:47:31 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:36274 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235156AbhBDIrY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 03:47:24 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1148kbBh000582;
        Thu, 4 Feb 2021 09:46:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=eGJzS9Xz7eIhHAVhC6Db4iXWGLF1aUvnd2LYJYUn1C0=;
 b=K2QxkiIysN1PlmwnKYJqays7P9SuwrThm3l3b5SFntTNmhUnBGHw0xo7GOlELZ12kLGi
 XK3FyGY63ruBmdrm4Y257H70FSDp/XxsYbxqNg3YpHk+C/QOG3MwVRAelW2yEapSnN3H
 bJjD0MMETKNsLPUI6K/HGSnS4FNQ378wVJseji1LxkNs4ThNFHtgQ0P/3xxV4B1pKMvb
 3ddLYpskKjcJHTwpdMzJO/7AEB+sU+stYUUMG8SPLyFCPwdrGUMkYyZAMf9v4WedDj8A
 AY7q6Fxx7gHkplvkSeQp5a6hJpQk/jws+gQ8RdKioefgqLw4ljLsKBTlBoAYtp4tbcOZ hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36ey7h7g17-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 Feb 2021 09:46:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8917B10002A;
        Thu,  4 Feb 2021 09:46:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A98E22AE4B;
        Thu,  4 Feb 2021 09:46:39 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb 2021 09:46:39
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v3 13/15] rpmsg: char: introduce a RPMsg driver for the RPmsg char device
Date:   Thu, 4 Feb 2021 09:45:32 +0100
Message-ID: <20210204084534.10516-14-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
References: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-04_03:2021-02-04,2021-02-04 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A RPMsg char device allows to probe the endpoint device on a remote name
service announcement. With this patch the /dev/rpmsgX interface is created
either by a user application or by the remote firmware.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 63 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 66dcb8845d6c..d5aa874865f7 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -28,6 +28,8 @@
 
 #define RPMSG_DEV_MAX	(MINORMASK + 1)
 
+#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
+
 static dev_t rpmsg_major;
 static struct class *rpmsg_class;
 
@@ -408,6 +410,51 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
 }
 EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
 
+static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_channel_info chinfo;
+	struct rpmsg_eptdev *eptdev;
+
+	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
+	chinfo.src = rpdev->src;
+	chinfo.dst = rpdev->dst;
+
+	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo);
+	if (IS_ERR(eptdev) && rpdev->ept) {
+		rpmsg_destroy_ept(rpdev->ept);
+		return PTR_ERR(eptdev);
+	}
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
@@ -422,9 +469,23 @@ static int rpmsg_chrdev_init(void)
 	if (IS_ERR(rpmsg_class)) {
 		pr_err("failed to create rpmsg class\n");
 		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
-		return PTR_ERR(rpmsg_class);
+		ret = PTR_ERR(rpmsg_class);
+		goto free_region;
 	}
 
+	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
+	if (ret < 0) {
+		pr_err("rpmsg raw: failed to register rpmsg driver\n");
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

