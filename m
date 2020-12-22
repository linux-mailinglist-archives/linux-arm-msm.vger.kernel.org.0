Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5562E094B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 12:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgLVK7x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 05:59:53 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:54011 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725913AbgLVK6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 05:58:47 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BMAvLIs004367;
        Tue, 22 Dec 2020 11:58:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=5eMiDoWgwQvikTXRS1GkDala9j21tGpEhMxUXtCgE/U=;
 b=uhMqA30nMSmMCno86N7IhNPG/zo6D6bW4SVAjBo0jQv4JnEXX4DC557VJdSV59mCRp0R
 UIXt0f2nuAT8D3GeNoQHuZgyxlHul308lH0xf8GrxP/Jnzh9zeaGOx0SD8/IXJf3hKch
 t1h4+y/0SQuvzLqEoD5o955I3I3e3s7bn3QNaeBAI1h7LhNOhvMfmIbFAdTI49GO8vSw
 7+EvN7/nfzXoDAU2oToTgnyu5m384XhRBoivLxWHNl0HV4Pq//v4UhLPgdjyNvAlhi77
 jXE6kazijozbY8LJOJz7FlMdk76l4CJkmddC2X9nUU1rbCbRLwQTNmdcWR7SSZu+vJm1 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35k0d1bjtm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Dec 2020 11:58:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C07FB10002A;
        Tue, 22 Dec 2020 11:58:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0285231603;
        Tue, 22 Dec 2020 11:58:02 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Dec 2020 11:58:02
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 05/16] rpmsg: ns: initialize channel info override field
Date:   Tue, 22 Dec 2020 11:57:15 +0100
Message-ID: <20201222105726.16906-6-arnaud.pouliquen@foss.st.com>
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

By default driver_override should be 0 to avoid to force
the channel creation with a specified name.The local variable
is not initialized.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_ns.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
index 762ff1ae279f..a526bff62947 100644
--- a/drivers/rpmsg/rpmsg_ns.c
+++ b/drivers/rpmsg/rpmsg_ns.c
@@ -55,6 +55,7 @@ static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
 	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
 	chinfo.src = RPMSG_ADDR_ANY;
 	chinfo.dst = rpmsg32_to_cpu(rpdev, msg->addr);
+	chinfo.driver_override = NULL;
 
 	dev_info(dev, "%sing channel %s addr 0x%x\n",
 		 rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY ?
-- 
2.17.1

