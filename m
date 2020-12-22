Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B972E0932
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 12:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgLVK6y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 05:58:54 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:60576 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726485AbgLVK6x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 05:58:53 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BMAv8qC017308;
        Tue, 22 Dec 2020 11:58:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=a62gM3orD3nqincVNUEbPtqfMSCUDzJOCYWC7XKQ9Vk=;
 b=QQn8J9j5woiZ1m0pKpdr2gfQd+Z0q48wWQnsdHo8Y8/eZINFYgjVIR40RUwD065opNJ0
 i9Q5hRe1em4LPQzH81KIPcxJ8p0AbJnxV1UJg++8SzsVN20DqZa1CiK6vYFcTlOz6aTw
 aOmx7raG23JVxbd7oTx3GLjKJuHrC1cAmIjslhkdRQ0xh+3NMPcOLPUeICnqtQkWoGR3
 1cb9oD2Nlrxa0ZKimukaUXpwgZR+/HiC+wKGA/oveFqqi5vC/OiZPoYCXfVqwk7O98WI
 dgPN3zUDaK3yPRj8yh3m3lXCkUMWAaLEfu6E/XkXBe3/+HXrrBBZdUYfU9MA1pgc9441 UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35k7vva3ha-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Dec 2020 11:58:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 13A53100038;
        Tue, 22 Dec 2020 11:58:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B81B021BD81;
        Tue, 22 Dec 2020 11:58:05 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Dec 2020 11:58:05
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 09/16] rpmsg: char: register RPMsg raw service to the ioctl interface.
Date:   Tue, 22 Dec 2020 11:57:19 +0100
Message-ID: <20201222105726.16906-10-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-22_04:2020-12-21,2020-12-22 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Associate the RPMsg char to the RPMSG_RAW_SERVICE, by registering it to the
RPMsg Control.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 3d77f4d5fc32..66e01b979e72 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -394,6 +394,11 @@ static struct rpmsg_driver rpmsg_chrdev_driver = {
 	},
 };
 
+const struct rpmsg_drv_ctrl_info  rpmsg_chrdev_ctrl = {
+	.drv_name = "rpmsg_chrdev",
+	.service = RPMSG_RAW_SERVICE,
+};
+
 static int rpmsg_chrdev_init(void)
 {
 	int ret;
@@ -407,15 +412,27 @@ static int rpmsg_chrdev_init(void)
 	ret = register_rpmsg_driver(&rpmsg_chrdev_driver);
 	if (ret < 0) {
 		pr_err("rpmsg: failed to register rpmsg chrdev driver\n");
-		unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+		goto free_region;
 	}
 
+	ret = rpmsg_ctrl_register_ctl(&rpmsg_chrdev_ctrl);
+	if (ret < 0)
+		goto free_rpmsg;
+
+	return 0;
+
+free_rpmsg:
+	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
+free_region:
+	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
+
 	return ret;
 }
 postcore_initcall(rpmsg_chrdev_init);
 
 static void rpmsg_chrdev_exit(void)
 {
+	rpmsg_ctrl_unregister_ctl(&rpmsg_chrdev_ctrl);
 	unregister_rpmsg_driver(&rpmsg_chrdev_driver);
 	unregister_chrdev_region(rpmsg_major, RPMSG_DEV_MAX);
 }
-- 
2.17.1

