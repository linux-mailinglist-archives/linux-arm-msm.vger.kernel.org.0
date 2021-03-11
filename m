Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 125883374F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 15:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233226AbhCKOEj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 09:04:39 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:36296 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233854AbhCKOEc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 09:04:32 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BE2KRI014655;
        Thu, 11 Mar 2021 15:04:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=clzsKOQrZtu1JsISAcyAcvlZH0GBurC/MmdHmg2hM00=;
 b=eJjfT2jisFTZHROjAEdYNIwOzhejxRvyWM1Uzoq+eAie5rfUplZHJO9S1akPbkYRByWk
 KWkv3GNPJE4PKdK4IkpNFX9u1wN1QzbgLwUVQDGu9Dvfru/SuN1r7FnmXVLrKPnWyQSy
 Nn4qYxs5NbmBWL8+5ehi1zzr+pZ1DNSmyuV4cgpAhbI7ZbhRNgD7xTOSyfROgkZ1Gz16
 asVvf7MpyoeOZt4q+PUZvY/QE6WwjkXG0OOseXKLh3ll3AocurX0PxdG95rsFsZvECvE
 kLaOVVtFbubuJQYfbgG8/JRouyTonoR/se2zINlSD8MmhowPiRdeG34RLo0YYCnTWkgJ wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3741y76hy4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 15:04:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 89D7910002A;
        Thu, 11 Mar 2021 15:04:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D06F247BC8;
        Thu, 11 Mar 2021 15:04:27 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar 2021 15:04:27
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 4/6] rpmsg: char: Use rpmsg_sendto to specify the message destination address
Date:   Thu, 11 Mar 2021 15:04:11 +0100
Message-ID: <20210311140413.31725-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
References: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-11_05:2021-03-10,2021-03-11 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When the endpoint device is created by the application, a destination
address is specified in the rpmsg_channel_info structure. Since the
rpmsg_endpoint structure does not store the destination address,
this destination address must be specified when sending a message.

Replaces rpmsg_send with rpmsg_sendto to allow to specify the
destination address. This implementation is requested for compatibly with
some rpmsg backends like the virtio backend.

For this, the GLINK an SMD drivers have been updated to support the
rpmsg_sendto, even if the destination address is ignored for these
backends. For these drivers, the rpmsg_send and rpmsg_trysend ops are
preserved to avoid breaking the legacy.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

--- 
update vs [1]
squash following patches in one:
  rpmsg: glink: add sendto and trysendto ops
  rpmsg: smd: add sendto and trysendto ops
  rpmsg: char: use sendto to specify the message destination address

[1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523

---
 drivers/rpmsg/qcom_glink_native.c | 16 ++++++++++++++++
 drivers/rpmsg/qcom_smd.c          | 16 ++++++++++++++++
 drivers/rpmsg/rpmsg_char.c        |  4 ++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 27a05167c18c..edae0c9a8236 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1332,6 +1332,20 @@ static int qcom_glink_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 	return __qcom_glink_send(channel, data, len, false);
 }
 
+static int qcom_glink_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+{
+	struct glink_channel *channel = to_glink_channel(ept);
+
+	return __qcom_glink_send(channel, data, len, true);
+}
+
+static int qcom_glink_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+{
+	struct glink_channel *channel = to_glink_channel(ept);
+
+	return __qcom_glink_send(channel, data, len, false);
+}
+
 /*
  * Finds the device_node for the glink child interested in this channel.
  */
@@ -1364,7 +1378,9 @@ static const struct rpmsg_device_ops glink_device_ops = {
 static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
 	.destroy_ept = qcom_glink_destroy_ept,
 	.send = qcom_glink_send,
+	.sendto = qcom_glink_sendto,
 	.trysend = qcom_glink_trysend,
+	.trysendto = qcom_glink_trysendto,
 };
 
 static void qcom_glink_rpdev_release(struct device *dev)
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 19903de6268d..8da1b5cb31b3 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -974,6 +974,20 @@ static int qcom_smd_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 	return __qcom_smd_send(qsept->qsch, data, len, false);
 }
 
+static int qcom_smd_sendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+{
+	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
+
+	return __qcom_smd_send(qsept->qsch, data, len, true);
+}
+
+static int qcom_smd_trysendto(struct rpmsg_endpoint *ept, void *data, int len, u32 dst)
+{
+	struct qcom_smd_endpoint *qsept = to_smd_endpoint(ept);
+
+	return __qcom_smd_send(qsept->qsch, data, len, false);
+}
+
 static __poll_t qcom_smd_poll(struct rpmsg_endpoint *ept,
 				  struct file *filp, poll_table *wait)
 {
@@ -1038,7 +1052,9 @@ static const struct rpmsg_device_ops qcom_smd_device_ops = {
 static const struct rpmsg_endpoint_ops qcom_smd_endpoint_ops = {
 	.destroy_ept = qcom_smd_destroy_ept,
 	.send = qcom_smd_send,
+	.sendto = qcom_smd_sendto,
 	.trysend = qcom_smd_trysend,
+	.trysendto = qcom_smd_trysendto,
 	.poll = qcom_smd_poll,
 };
 
diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 9e33b53bbf56..95a65f7a9d8d 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -239,9 +239,9 @@ static ssize_t rpmsg_eptdev_write_iter(struct kiocb *iocb,
 	}
 
 	if (filp->f_flags & O_NONBLOCK)
-		ret = rpmsg_trysend(eptdev->ept, kbuf, len);
+		ret = rpmsg_trysendto(eptdev->ept, kbuf, len, eptdev->chinfo.dst);
 	else
-		ret = rpmsg_send(eptdev->ept, kbuf, len);
+		ret = rpmsg_sendto(eptdev->ept, kbuf, len, eptdev->chinfo.dst);
 
 unlock_eptdev:
 	mutex_unlock(&eptdev->ept_lock);
-- 
2.17.1

