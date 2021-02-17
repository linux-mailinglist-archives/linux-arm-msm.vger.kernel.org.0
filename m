Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA02431DAA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 14:35:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232997AbhBQNdf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 08:33:35 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:29954 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233086AbhBQNbj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 08:31:39 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11HDS14s026018;
        Wed, 17 Feb 2021 14:30:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=EK3CcO1sgQ2dyiUJB/DiEfQT2xQz3x3vXQzu8hqKjLk=;
 b=wot89PnsothtehapmPAAhw2uOntLEyLbqkN1ne2XI5+WIwCtJd7rcy7x37EdgHKRIG1i
 BNWHWdF2+JpAY1gp3hGc6rZT+jA2g7BVIAZ0KE/1fQ2jG6TUFyAl+tg2Iq6MrnHfojd+
 wr7frgVNICoPuyrwrPnkMDdxrvCT8e5dp0XPh9nxmxeTzsfca3ujWFIS7h3dqzzY421t
 +49kcx1PfFTkE5pfzzYPvbegN/i+XIbbGw+Ty+9LfelhX+aWqvftUC4FraqVDmVrRvJc
 Ksq5FLEaSBAUqIwryoR6NKsO1IsIC9OxA5HIXpnBgeKx+Bim12L4geGUekQucF1Qe9m/ Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36p547p3qg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Feb 2021 14:30:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF3EA10002A;
        Wed, 17 Feb 2021 14:30:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C1AD82370C9;
        Wed, 17 Feb 2021 14:30:53 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Feb 2021 14:30:53
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v4 09/16] rpmsg: smd: add sendto and trysendto ops
Date:   Wed, 17 Feb 2021 14:28:58 +0100
Message-ID: <20210217132905.1485-10-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
References: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-17_11:2021-02-16,2021-02-17 signatures=0
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

