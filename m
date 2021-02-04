Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A84830EF02
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 09:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235061AbhBDIuZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 03:50:25 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:36154 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235122AbhBDIrI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 03:47:08 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1148gY3o023567;
        Thu, 4 Feb 2021 09:46:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=cuI0QyzGfCE9A2PPLZ3Vi0BGYQWHZbe/HztsvrFJe24=;
 b=4Mtmq2l1STVjySbYOj3xJkcBXzNyiJewSIB6A4FhS6X8oyrMclwPL2d7VOCTPxn5IhPd
 6XoX1A+GBHLC4vXNo+RZupBDJZTbEsOaJ/QOepm+DdaY0RFjWCXP7mOQxYqU8t2uV7SK
 Sd/GxEjm2EQ4Hd/55BWJVn1KmnxrFWEm779zqa/q6Itb0ndL0yzcfsUXcVYNcubNgPEf
 9fxGVp3IHlBbaiOuKK9vP9k9bWzs15ADbJOPl2zAbiBeBfieO5OUs5yWK/get8U4W4CI
 w8I25ryW9Af2IziIUXrdZojJE7Ub3KStZFf+uc8PR6uGFL5E+pFOid/nhNgKiz62nacu cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36ey7h7fy8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 Feb 2021 09:46:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A2FDB10002A;
        Thu,  4 Feb 2021 09:46:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9631122AE4D;
        Thu,  4 Feb 2021 09:46:22 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb 2021 09:46:22
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v3 08/15] rpmsg: glink: add sendto and trysendto ops
Date:   Thu, 4 Feb 2021 09:45:27 +0100
Message-ID: <20210204084534.10516-9-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
References: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-04_03:2021-02-04,2021-02-04 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement the sendto ops to support the future rpmsg_char update for the
vitio backend support.
The use of sendto in rpmsg_char is needed as a destination address is
requested at least by the virtio backend.
The glink implementation does not need a destination address so ignores it.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/qcom_glink_native.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index d4e4dd482614..ae2c03b59c55 100644
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
-- 
2.17.1

