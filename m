Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3970E30EF04
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 09:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235121AbhBDIrG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 03:47:06 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:48418 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235104AbhBDIrD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 03:47:03 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1148hDeP031781;
        Thu, 4 Feb 2021 09:46:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=BVE+I5iFOeWM48KNuYiJUl0A62njhY+yZNe54mFDfz4=;
 b=eEhQ9V+C8EmsaLCwedxBUNoPOYZOo3wF4lwqXcPek1h0k5kQxu1pKr0GxSQX9PxIbL1s
 inmQlO6mnlHe9UYIwCmA6YghVdbXO3HZbC9BBI9MQcIIy9CVh3AJgjMJYr9nsAr5OlWz
 aptNhXKOvsv/2VpUxaQUNWXUD/DDZAum66FtzqKxO4BNaAI4tn5w0tXoMdi14QVpRDkc
 HlMq0ipYvsVPk6JRxYUaDUOM3bRB7sqUMtsvTkKmn9sgwSYBZcTuZFKtWiry2V/B0bMJ
 2JJnHhhwqCIzW7I+0v26svSlaJ+gMCwi6qyVyjMk8OChEje1COTtK4lyLowwmIFsiNeW Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36e7x16ew1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 Feb 2021 09:46:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7AF8110002A;
        Thu,  4 Feb 2021 09:46:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F2C522AE4B;
        Thu,  4 Feb 2021 09:46:15 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb 2021 09:46:15
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v3 06/15] rpmsg: update rpmsg_chrdev_register_device function
Date:   Thu, 4 Feb 2021 09:45:25 +0100
Message-ID: <20210204084534.10516-7-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
References: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-04_03:2021-02-04,2021-02-04 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As driver is now the rpmsg_ioctl, rename the function.
In addition, to avoid probe issue related to module dependency,
move the function in the rpmsg_ctrl module. This ensure that the
rpmsg_ctrl module is loaded before that the device is created.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/qcom_glink_native.c |  2 +-
 drivers/rpmsg/qcom_smd.c          |  2 +-
 drivers/rpmsg/rpmsg_ctrl.c        | 20 +++++++++++++++++++-
 drivers/rpmsg/rpmsg_internal.h    | 10 ++--------
 4 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 27a05167c18c..d4e4dd482614 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1625,7 +1625,7 @@ static int qcom_glink_create_chrdev(struct qcom_glink *glink)
 	rpdev->dev.parent = glink->dev;
 	rpdev->dev.release = qcom_glink_device_release;
 
-	return rpmsg_chrdev_register_device(rpdev);
+	return rpmsg_ctrl_register_device(rpdev);
 }
 
 struct qcom_glink *qcom_glink_native_probe(struct device *dev,
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 19903de6268d..40a1c415c775 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1097,7 +1097,7 @@ static int qcom_smd_create_chrdev(struct qcom_smd_edge *edge)
 	qsdev->rpdev.dev.parent = &edge->dev;
 	qsdev->rpdev.dev.release = qcom_smd_release_device;
 
-	return rpmsg_chrdev_register_device(&qsdev->rpdev);
+	return rpmsg_ctrl_register_device(&qsdev->rpdev);
 }
 
 /*
diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index fa05b67d24da..f9b90e927fff 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -176,11 +176,29 @@ static void rpmsg_ctrl_remove(struct rpmsg_device *rpdev)
 	put_device(&ctrldev->dev);
 }
 
+/**
+ * rpmsg_ctrl_register_device() - register name service device based on rpdev
+ * @rpdev: prepared rpdev to be used for creating endpoints
+ *
+ * This function wraps rpmsg_register_device() preparing the rpdev for use as
+ * basis for the rpmsg control service device.
+ */
+int rpmsg_ctrl_register_device(struct rpmsg_device *rpdev)
+{
+	strcpy(rpdev->id.name, "rpmsg_ctrl");
+	rpdev->driver_override = KBUILD_MODNAME;
+	rpdev->src = RPMSG_ADDR_ANY;
+	rpdev->dst = RPMSG_ADDR_ANY;
+
+	return rpmsg_register_device(rpdev);
+}
+EXPORT_SYMBOL(rpmsg_ctrl_register_device);
+
 static struct rpmsg_driver rpmsg_ctrl_driver = {
 	.probe = rpmsg_ctrl_probe,
 	.remove = rpmsg_ctrl_remove,
 	.drv = {
-		.name = "rpmsg_chrdev",
+		.name = KBUILD_MODNAME,
 	},
 };
 
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index a76c344253bf..a9e04641866c 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -82,18 +82,12 @@ struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
 int rpmsg_release_channel(struct rpmsg_device *rpdev,
 			  struct rpmsg_channel_info *chinfo);
 /**
- * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
+ * rpmsg_ctrl_register_device() - register chrdev device based on rpdev
  * @rpdev:	prepared rpdev to be used for creating endpoints
  *
  * This function wraps rpmsg_register_device() preparing the rpdev for use as
  * basis for the rpmsg chrdev.
  */
-static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
-{
-	strcpy(rpdev->id.name, "rpmsg_chrdev");
-	rpdev->driver_override = "rpmsg_chrdev";
-
-	return rpmsg_register_device(rpdev);
-}
+int rpmsg_ctrl_register_device(struct rpmsg_device *rpdev);
 
 #endif
-- 
2.17.1

