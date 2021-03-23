Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4F3345E20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 13:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhCWM2w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 08:28:52 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:57434 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229900AbhCWM2o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 08:28:44 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12NCM2oU026276;
        Tue, 23 Mar 2021 13:28:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=OdCGnvZvsqW8L7Hiub86e4p9kdexa74S2YJuiSUbTQU=;
 b=M0q+gOzpfl4fZG8SPbCI0haLW3kSHcMQl1CqV4HmcBP0rI53Wv17C41kLVrvYFNVyw65
 i/hrslDQ6cGs/xxAHlIh6dL60hpDz1GxxKkpZyyr7ahSKHvyzPr3wFkqIR6K3uAOeWgs
 44xjKoQnUXYp5Mthf2yzqr4jdunfnsdjuErpP5P+m51GZ2spufcuESowQWM3gcTlontI
 2wa72Z6/jQtT9UQW6iMbLScxaNayjBIP+hHwhMxG9qlcrh21D7EMHoe0YV0QIkhNybsd
 0ChX7wUfYjS39ZPbvc4wCH15OE3JJbF3GZfwYb/7jNVJE6kqIq+YMksjNjDo6u1A5nw5 GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37d8tpfata-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Mar 2021 13:28:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2FD8010002A;
        Tue, 23 Mar 2021 13:28:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1FFB124CF48;
        Tue, 23 Mar 2021 13:28:40 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 23 Mar 2021 13:28:39
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 7/7] rpmsg: char: Return error if user try to destroy a default endpoint.
Date:   Tue, 23 Mar 2021 13:27:37 +0100
Message-ID: <20210323122737.23035-8-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
References: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-23_06:2021-03-22,2021-03-23 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using the RPMSG_DESTROY_EPT_IOCTL control, user application can
destroy an endpoint. This patch prevents to destroy a default endpoint
associated to a channel.

This update is needed to manage the "rpmsg-raw" channel. In this
case a default endpoint is used and destroying it without the
channel does not make sense.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 8064244f8f18..08670e94714a 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -282,6 +282,10 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
 		return -EINVAL;
 
+	/* Don't allow to destroy a default endpoint. */
+	if (!eptdev->rpdev || eptdev->ept == eptdev->rpdev->ept)
+		return -EPERM;
+
 	return rpmsg_chrdev_destroy_eptdev(&eptdev->dev, NULL);
 }
 
-- 
2.17.1

