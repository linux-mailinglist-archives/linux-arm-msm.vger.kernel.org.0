Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6300E2E093C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 12:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgLVK65 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 05:58:57 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:60602 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726681AbgLVK64 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 05:58:56 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BMAvKvC017379;
        Tue, 22 Dec 2020 11:58:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=hSH+H/5k2tLr+GOxs0FZsD8RmN2qSemTHcqXNWMd+Kk=;
 b=akxDJVmAlcc8vCZTooD8MGXAmwVlQPkX5n52kvzCdN9l/knVvzjLf2eb5AHtvxrpa1P6
 Z4aD3KF+Oxf1MOHAgKBH1H9+DvhIlQP43aq30zqiEHfM2Pdj4ndsFeI2mgW00gV7Rg0h
 /X9Z27iO8PElu5FZ0dKnNwmRhNWxweNulPgU+34oVPM0hQt0myDZOYno7vHm5uHeg6y7
 wQMTWvOcJ1WRSLFRZdtUItIUtTH6OAleMCof8n1wlieSTC8cpdHMpJEf7vTAEhLczrst
 aXVovvAbU0goo92Qe9dNNDii28wvgxdoLiWFs3SYAsR6sYzGBqA9KoZkgMo+xj0awMMX SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35k7vva3hq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Dec 2020 11:58:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 934F5100034;
        Tue, 22 Dec 2020 11:58:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8663622ECB4;
        Tue, 22 Dec 2020 11:58:10 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Dec 2020 11:58:10
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 15/16] rpmsg: smd: add create and release rpmsg channel ops
Date:   Tue, 22 Dec 2020 11:57:25 +0100
Message-ID: <20201222105726.16906-16-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
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
 drivers/rpmsg/qcom_smd.c | 57 ++++++++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 8 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 19903de6268d..40853702f54f 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -67,6 +67,7 @@ struct smd_channel_info_word;
 struct smd_channel_info_word_pair;
 
 static const struct rpmsg_endpoint_ops qcom_smd_endpoint_ops;
+static const struct rpmsg_device_ops qcom_smd_device_ops;
 
 #define SMD_ALLOC_TBL_COUNT	2
 #define SMD_ALLOC_TBL_SIZE	64
@@ -1013,6 +1014,52 @@ static struct device_node *qcom_smd_match_channel(struct device_node *edge_node,
 	return NULL;
 }
 
+static void qcom_smd_release_device(struct device *dev)
+{
+	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
+	struct qcom_smd_device *qsdev = to_smd_device(rpdev);
+
+	kfree(qsdev);
+}
+
+static struct rpmsg_device *
+qcom_smd_create_rpmsg_ch(struct rpmsg_device *rp_parent,
+			 struct rpmsg_channel_info *chinfo)
+{
+	struct qcom_smd_device *qsdev, *qspdev = to_smd_device(rp_parent);
+	struct qcom_smd_edge *edge = qspdev->edge;
+	int ret;
+
+	qsdev = kzalloc(sizeof(*qsdev), GFP_KERNEL);
+	if (!qsdev)
+		return ERR_PTR(-ENOMEM);
+
+	qsdev->edge = edge;
+	strncpy(qsdev->rpdev.id.name, chinfo->name, RPMSG_NAME_SIZE);
+	qsdev->rpdev.src = chinfo->src;
+	qsdev->rpdev.dst = chinfo->dst;
+	qsdev->rpdev.ops = &qcom_smd_device_ops;
+	qsdev->rpdev.dev.parent = &edge->dev;
+	qsdev->rpdev.dev.release = qcom_smd_release_device;
+	qsdev->rpdev.driver_override = (char *)chinfo->driver_override;
+
+	ret = rpmsg_register_device(&qsdev->rpdev);
+	if (ret) {
+		kfree(qsdev);
+		return ERR_PTR(ret);
+	}
+
+	return &qsdev->rpdev;
+}
+
+static int qcom_smd_release_rpmsg_ch(struct rpmsg_device *rpdev,
+				     struct rpmsg_channel_info *chinfo)
+{
+	struct qcom_smd_device *qsdev = to_smd_device(rpdev);
+
+	return rpmsg_unregister_device(&qsdev->edge->dev, chinfo);
+}
+
 static int qcom_smd_announce_create(struct rpmsg_device *rpdev)
 {
 	struct qcom_smd_endpoint *qept = to_smd_endpoint(rpdev->ept);
@@ -1033,6 +1080,8 @@ static int qcom_smd_announce_create(struct rpmsg_device *rpdev)
 static const struct rpmsg_device_ops qcom_smd_device_ops = {
 	.create_ept = qcom_smd_create_ept,
 	.announce_create = qcom_smd_announce_create,
+	.create_channel = qcom_smd_create_rpmsg_ch,
+	.release_channel = qcom_smd_release_rpmsg_ch,
 };
 
 static const struct rpmsg_endpoint_ops qcom_smd_endpoint_ops = {
@@ -1042,14 +1091,6 @@ static const struct rpmsg_endpoint_ops qcom_smd_endpoint_ops = {
 	.poll = qcom_smd_poll,
 };
 
-static void qcom_smd_release_device(struct device *dev)
-{
-	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
-	struct qcom_smd_device *qsdev = to_smd_device(rpdev);
-
-	kfree(qsdev);
-}
-
 /*
  * Create a smd client device for channel that is being opened.
  */
-- 
2.17.1

