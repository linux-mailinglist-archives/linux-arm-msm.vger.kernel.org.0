Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4292930EEF2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 09:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235203AbhBDIsL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 03:48:11 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:7476 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235135AbhBDIrL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 03:47:11 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1148gwgE000414;
        Thu, 4 Feb 2021 09:46:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=EK3CcO1sgQ2dyiUJB/DiEfQT2xQz3x3vXQzu8hqKjLk=;
 b=y3CAsIyxtAjM/CG3e0XnxrKXY9B4uliGMU7HMIs9XhIpJw7mpAOIaRWoZYTeB73PNa8H
 7aBUKkqcIfmUPpdM2ivCbEsEpkXVtV1Lt/BZggFEE6vENwwB4PA64XUMnuR1oPavUvco
 ZSfBMPxJV3ATBOT/Xf4iEv2dTLJhMR0Si0PzoOtQ+jrwuruJxBPoE2UAl0K6gvA7W8Hm
 CiIm3K2SwfuE4h6nAzZzgbF9DBHQ1z/ar+BzfJ82isB8yBSE+5CP+5ll8GYF8ssS0ddS
 Ci6shHGlsi//lox4ycGshrAZ35u4XN8RZ08qVPITwE+04PAdaKIy6z929BryiApJp+xO vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36d0ns6pus-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 Feb 2021 09:46:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1379510002A;
        Thu,  4 Feb 2021 09:46:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 069A922AE4D;
        Thu,  4 Feb 2021 09:46:26 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb 2021 09:46:25
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v3 09/15] rpmsg: smd: add sendto and trysendto ops
Date:   Thu, 4 Feb 2021 09:45:28 +0100
Message-ID: <20210204084534.10516-10-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
References: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
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
The SMD implementation does not need a destination address so ignores it.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/qcom_smd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 40a1c415c775..2d279c03a090 100644
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
 
-- 
2.17.1

