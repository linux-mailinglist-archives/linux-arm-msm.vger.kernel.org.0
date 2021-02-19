Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 598CE31F832
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 12:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbhBSLTw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 06:19:52 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:58859 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230280AbhBSLSw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 06:18:52 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11JBCEXQ008790;
        Fri, 19 Feb 2021 12:18:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=EK3CcO1sgQ2dyiUJB/DiEfQT2xQz3x3vXQzu8hqKjLk=;
 b=2mdM/vN8sOJdnOU7LEpJ2BODafUjoLn0ZRZZA1MaN2HiobBrn0St0pITjBrgdhfvR69Y
 0zbkTwFMcdE/czow90mPN1fp/LQTYZF/FMhxCWEBw1Yv8+U9+0kpeOr1xpw2Rb5vrvB6
 Vu35KdlD1ifIZZsxAQiLe2Q+cAntANdsqkBNm4OF+wmqchxpwP0r02JPUtcehDc//+8x
 rMy92Wmcwr7fpCpN1FdetiYJLMdphikvY+nN9OTzD2AAtNdW9V4G8W7x1gS/Erf04x1D
 l1ZLMKYdhxLHPG58q/4LSp9Mzuu2/JqbZiciQU+u6YnOV4j+WjebdYXTnUJMVF/JxKXs UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36sqadeynu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Feb 2021 12:18:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 581DB10002A;
        Fri, 19 Feb 2021 12:18:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 491712266D7;
        Fri, 19 Feb 2021 12:18:06 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Feb 2021 12:18:05
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v5 09/16] rpmsg: smd: add sendto and trysendto ops
Date:   Fri, 19 Feb 2021 12:14:54 +0100
Message-ID: <20210219111501.14261-10-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-19_04:2021-02-18,2021-02-19 signatures=0
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

