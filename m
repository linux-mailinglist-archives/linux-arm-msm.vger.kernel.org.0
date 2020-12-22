Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939252E0938
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 12:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbgLVK64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 05:58:56 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:10238 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726666AbgLVK64 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 05:58:56 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BMAw87T012890;
        Tue, 22 Dec 2020 11:58:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=9YJwuMmhvQjiQZdfwPozN0/SAPH4XLa1zY4sMK1+Xeg=;
 b=LeAUFUX7Ip/yc7kvLlcHnK+5FhabePxZma6STCdwPaRczv/OYzqvNyKBXq1FAZEV//xT
 kGnmaZ20KVgX1YxFkgtRqc4p64lipOqivFYKl8pg4DgiKOqDjQuYMyOheRqe3XcYJo6t
 iIXgsIqhOzVVcSyPlACyFo5lywcEGVjkCzG+czalBomy3+pbEGCbq5hS+U8G8pZARuTX
 dPoyhidDxg/vC8ADIKmZlF4nif61MA/hHvP10wYcJNCWhnLiwCOfF9PJaor65VmdZAlh
 aNA0D6G3C5vRy7iS669Ir8LjGBT05c3oojSEe37uLBsjTZI62usn1h05y5lRKvQ2PZqc IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35k0eb3xc6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Dec 2020 11:58:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C270810002A;
        Tue, 22 Dec 2020 11:58:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B51FB22ECB4;
        Tue, 22 Dec 2020 11:58:09 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Dec 2020 11:58:09
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 14/16] rpmsg: glink: add create and release rpmsg channel ops
Date:   Tue, 22 Dec 2020 11:57:24 +0100
Message-ID: <20201222105726.16906-15-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-22_04:2020-12-21,2020-12-22 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the new ops introduced by the rpmsg_ns series and used
by the rpmsg_ctrl driver to instantiate a new rpmsg channel.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/qcom_glink_native.c | 94 ++++++++++++++++++++++++-------
 1 file changed, 75 insertions(+), 19 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 27a05167c18c..d74c338de077 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -205,6 +205,9 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops;
 #define GLINK_FEATURE_INTENTLESS	BIT(1)
 
 static void qcom_glink_rx_done_work(struct work_struct *work);
+static struct rpmsg_device *
+qcom_glink_create_rpdev(struct qcom_glink *glink,
+			struct rpmsg_channel_info *chinfo);
 
 static struct glink_channel *qcom_glink_alloc_channel(struct qcom_glink *glink,
 						      const char *name)
@@ -1203,6 +1206,37 @@ static int qcom_glink_announce_create(struct rpmsg_device *rpdev)
 	return 0;
 }
 
+static struct rpmsg_device *
+qcom_glink_create_channel(struct rpmsg_device *rp_parent,
+			  struct rpmsg_channel_info *chinfo)
+{
+	struct glink_channel *channel = to_glink_channel(rp_parent->ept);
+	struct qcom_glink *glink = channel->glink;
+	struct rpmsg_device *rpdev;
+	const char *name = chinfo->name;
+
+	channel = qcom_glink_alloc_channel(glink, name);
+	if (IS_ERR(channel))
+		return ERR_PTR(PTR_ERR(channel));
+
+	rpdev = qcom_glink_create_rpdev(glink, chinfo);
+	if (!IS_ERR(rpdev)) {
+		rpdev->ept = &channel->ept;
+		channel->rpdev = rpdev;
+	}
+
+	return rpdev;
+}
+
+static int qcom_glink_release_channel(struct rpmsg_device *rpdev,
+				      struct rpmsg_channel_info *chinfo)
+{
+	struct glink_channel *channel = to_glink_channel(rpdev->ept);
+	struct qcom_glink *glink = channel->glink;
+
+	return rpmsg_unregister_device(glink->dev, chinfo);
+}
+
 static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
 {
 	struct glink_channel *channel = to_glink_channel(ept);
@@ -1359,6 +1393,8 @@ static struct device_node *qcom_glink_match_channel(struct device_node *node,
 static const struct rpmsg_device_ops glink_device_ops = {
 	.create_ept = qcom_glink_create_ept,
 	.announce_create = qcom_glink_announce_create,
+	.create_channel = qcom_glink_create_channel,
+	.release_channel = qcom_glink_release_channel,
 };
 
 static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
@@ -1376,13 +1412,45 @@ static void qcom_glink_rpdev_release(struct device *dev)
 	kfree(rpdev);
 }
 
+static struct rpmsg_device *
+qcom_glink_create_rpdev(struct qcom_glink *glink,
+			struct rpmsg_channel_info *chinfo)
+{
+	struct rpmsg_device *rpdev;
+	struct device_node *node;
+	int ret;
+
+	rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
+	if (!rpdev)
+		return ERR_PTR(-ENOMEM);
+
+	strncpy(rpdev->id.name, chinfo->name, RPMSG_NAME_SIZE);
+	rpdev->src = chinfo->src;
+	rpdev->dst = chinfo->dst;
+	rpdev->ops = &glink_device_ops;
+
+	node = qcom_glink_match_channel(glink->dev->of_node, chinfo->name);
+	rpdev->dev.of_node = node;
+	rpdev->dev.parent = glink->dev;
+	rpdev->dev.release = qcom_glink_rpdev_release;
+	rpdev->driver_override = (char *)chinfo->driver_override;
+
+	ret = rpmsg_register_device(rpdev);
+	if (ret) {
+		kfree(rpdev);
+		return ERR_PTR(ret);
+	}
+
+	return rpdev;
+}
+
 static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
 			      char *name)
 {
 	struct glink_channel *channel;
 	struct rpmsg_device *rpdev;
 	bool create_device = false;
-	struct device_node *node;
+	struct rpmsg_channel_info chinfo;
 	int lcid;
 	int ret;
 	unsigned long flags;
@@ -1416,27 +1484,15 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
 	complete_all(&channel->open_req);
 
 	if (create_device) {
-		rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
-		if (!rpdev) {
-			ret = -ENOMEM;
+		strncpy(chinfo.name, channel->name, sizeof(chinfo.name));
+		chinfo.src = RPMSG_ADDR_ANY;
+		chinfo.dst = RPMSG_ADDR_ANY;
+		rpdev = qcom_glink_create_rpdev(glink, &chinfo);
+		if (IS_ERR(rpdev)) {
+			ret = PTR_ERR(rpdev);
 			goto rcid_remove;
 		}
-
 		rpdev->ept = &channel->ept;
-		strncpy(rpdev->id.name, name, RPMSG_NAME_SIZE);
-		rpdev->src = RPMSG_ADDR_ANY;
-		rpdev->dst = RPMSG_ADDR_ANY;
-		rpdev->ops = &glink_device_ops;
-
-		node = qcom_glink_match_channel(glink->dev->of_node, name);
-		rpdev->dev.of_node = node;
-		rpdev->dev.parent = glink->dev;
-		rpdev->dev.release = qcom_glink_rpdev_release;
-
-		ret = rpmsg_register_device(rpdev);
-		if (ret)
-			goto rcid_remove;
-
 		channel->rpdev = rpdev;
 	}
 
-- 
2.17.1

