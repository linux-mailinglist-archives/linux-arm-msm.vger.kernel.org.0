Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C0A30EEF0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 09:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234953AbhBDIr4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 03:47:56 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:2816 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235154AbhBDIrX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 03:47:23 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1148fvtl005356;
        Thu, 4 Feb 2021 09:46:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=h8BuLQc6wA4LPMA6U4rmS0YJqMj4AsWKDTNSsFE26UI=;
 b=FVjfJBxu06qIeUdbnmH1eFNLnbsIgtsNhgpeXSrQMM3mUP4CnK6sfb52VQHWUV0nRLcr
 KYZqbXM+MAuUukQqtPE0C9wwEHRt5YZ6U6yRjqyXEfh/iHJcLUwXNb+cVmSOo+ReMiJo
 GMuj1mOuKDiviLFTSkvFmRgixDzpbdqD17Y0UodYbh9rNH9QePQ1VNfjVHz7e9zEc3nf
 JUEXa/E4mYnKyVQkGZcknAl7MAMrVJivphp2oUHP/rQDLX67Lptn6f/DqHEVIS0TD7ka
 eKoDJQiJYjIpYZYVQzIA6tg24LfGCaRZl80OtVi/DCOlvYadG3R+BmbhCdAc5kymn6r9 rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36d0fs5xv1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 Feb 2021 09:46:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9A27A100038;
        Thu,  4 Feb 2021 09:46:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8D6D622AE50;
        Thu,  4 Feb 2021 09:46:36 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb 2021 09:46:36
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v3 12/15] rpmsg: char: introduce __rpmsg_chrdev_create_eptdev function
Date:   Thu, 4 Feb 2021 09:45:31 +0100
Message-ID: <20210204084534.10516-13-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
References: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-04_03:2021-02-04,2021-02-04 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
the rpmsg_eptdev context structure.
This patch prepares the introduction of a RPMsg device for the
char device. the RPMsg device will need a reference to the context.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 09ae1304837c..66dcb8845d6c 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -328,8 +328,9 @@ int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
 }
 EXPORT_SYMBOL(rpmsg_chrdev_eptdev_destroy);
 
-int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
-			       struct rpmsg_channel_info chinfo)
+static struct rpmsg_eptdev *__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev,
+							 struct device *parent,
+							 struct rpmsg_channel_info chinfo)
 {
 	struct rpmsg_eptdev *eptdev;
 	struct device *dev;
@@ -337,7 +338,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
 
 	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
 	if (!eptdev)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	dev = &eptdev->dev;
 	eptdev->rpdev = rpdev;
@@ -381,7 +382,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
 		put_device(dev);
 	}
 
-	return ret;
+	return eptdev;
 
 free_ept_ida:
 	ida_simple_remove(&rpmsg_ept_ida, dev->id);
@@ -391,7 +392,19 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
 	put_device(dev);
 	kfree(eptdev);
 
-	return ret;
+	return ERR_PTR(ret);
+}
+
+int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
+			       struct rpmsg_channel_info chinfo)
+{
+	struct rpmsg_eptdev *eptdev;
+
+	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo);
+	if (IS_ERR(eptdev))
+		return PTR_ERR(eptdev);
+
+	return 0;
 }
 EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
 
-- 
2.17.1

