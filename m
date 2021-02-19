Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16AC731F83E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 12:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbhBSLUa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 06:20:30 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:11608 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230417AbhBSLT4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 06:19:56 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11JBGj2b016646;
        Fri, 19 Feb 2021 12:19:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=h8BuLQc6wA4LPMA6U4rmS0YJqMj4AsWKDTNSsFE26UI=;
 b=ud6971nua46E71EYJn31gu365Wv97tmg+PhXBfb6ZGrWmQLs2h4sYWXfqpgpPYoZYDqJ
 h+BUzkOGZDAMcFfk0u6ACHBwLYi5NOnk8VqsvJhub/Izvb26MOTOi3k5TBDhKzY8zfux
 o9gLUdaO6Q1hbD06NY+X3GbyaNt6elGyZKNlE6aJGgqHHliqIqm+2duBLmEW0rJZ8bh6
 LKljJz2Qs8AVyVPpELL0R8NE6EBJlFXHw+bu+0avCuTcjxTK4+gRG22zks5OVyzs0rZ3
 +vJO0DJ2jsiN2H21/cpRu5suwf7fPswCTH4DVWXgctic5Zv2uGm2uO3F01/KiJRmPkMu gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36sse3xhbx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Feb 2021 12:19:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E15A100034;
        Fri, 19 Feb 2021 12:19:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 80B9B221760;
        Fri, 19 Feb 2021 12:19:09 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Feb 2021 12:19:09
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v5 13/16] rpmsg: char: introduce __rpmsg_chrdev_create_eptdev function
Date:   Fri, 19 Feb 2021 12:14:58 +0100
Message-ID: <20210219111501.14261-14-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-19_04:2021-02-18,2021-02-19 signatures=0
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

