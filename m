Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20D52AA5D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 16:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389200AbfIEO1j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 10:27:39 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:1282 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389044AbfIEO12 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 10:27:28 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x85EQQxn026558;
        Thu, 5 Sep 2019 16:27:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=YrWE+pFDSWWveSDQIG3fJMGYfBJNITVKHz/E5fZx6Q0=;
 b=hJa87dgr3fDuxI0od5m6ziF60QB8V7L0qDSVQe5agQO3O/+BAdQW0+R/SVAUJxG2bi3i
 eFW4Gp61ywrOTnFpHkQu9u74q/8HVrh5yqeOChG4pJTcFda/Dp2IQzto2TbHRihu3DDW
 WKeNKimSz9lpGh+AjBBfbHsWHyK57ZHxsPAVd7mYtNam6Nko/m1ALuqxyLZ7QWTlKK/K
 pQeXYRSaCVG9Bp9KIhvL+1mPsLYuTzFcqUz9vfxjHLfoA2/yikmA1MJMN8AhMGq3ApX6
 DHNYYhzaf/7/Kx8tymPN3iX2/Eh4EF+2xowpb+1KdGQQg95FBxx6R3kzIh6FtHk7AzYF gA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
        by mx08-00178001.pphosted.com with ESMTP id 2uqe1a0xrt-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Thu, 05 Sep 2019 16:27:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AE72123;
        Thu,  5 Sep 2019 14:27:19 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6B08A2D6C48;
        Thu,  5 Sep 2019 16:27:19 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019
 16:27:19 +0200
Received: from localhost (10.48.0.131) by Webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019 16:27:19 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@st.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
CC:     <arnaud.pouliquen@st.com>, Suman Anna <s-anna@ti.com>,
        Fabien DESSENNE <fabien.dessenne@st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH 2/3] rpmsg: glink: implement get_mtu ops
Date:   Thu, 5 Sep 2019 16:27:09 +0200
Message-ID: <1567693630-27544-3-git-send-email-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567693630-27544-1-git-send-email-arnaud.pouliquen@st.com>
References: <1567693630-27544-1-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.0.131]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-05_04:2019-09-04,2019-09-05 signatures=0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement the get_mtu ops to return the maximum size of
the message that can be sent.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/rpmsg/qcom_glink_native.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 621f1afd4d6b..8a477416a38a 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1312,6 +1312,29 @@ static int qcom_glink_trysend(struct rpmsg_endpoint *ept, void *data, int len)
 	return __qcom_glink_send(channel, data, len, false);
 }
 
+static ssize_t qcom_glink_get_mtu(struct rpmsg_endpoint *ept)
+{
+	struct glink_channel *channel = to_glink_channel(ept);
+	size_t mtu_size = 0;
+	struct qcom_glink *glink = channel->glink;
+	struct glink_core_rx_intent *tmp;
+	unsigned long flags;
+	int iid = 0;
+
+	if (!glink->intentless) {
+		spin_lock_irqsave(&channel->intent_lock, flags);
+		idr_for_each_entry(&channel->riids, tmp, iid) {
+			if (tmp->size > mtu_size && !tmp->in_use)
+				mtu_size = tmp->size;
+		}
+		spin_unlock_irqrestore(&channel->intent_lock, flags);
+
+		return mtu_size;
+	} else {
+		return qcom_glink_tx_avail(glink);
+	}
+}
+
 /*
  * Finds the device_node for the glink child interested in this channel.
  */
@@ -1345,6 +1368,7 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
 	.destroy_ept = qcom_glink_destroy_ept,
 	.send = qcom_glink_send,
 	.trysend = qcom_glink_trysend,
+	.get_mtu = qcom_glink_get_mtu,
 };
 
 static void qcom_glink_rpdev_release(struct device *dev)
-- 
2.7.4

