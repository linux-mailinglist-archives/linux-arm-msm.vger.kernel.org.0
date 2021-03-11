Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D00D3374ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 15:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232949AbhCKOEi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 09:04:38 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:51626 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233853AbhCKOEb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 09:04:31 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BE3C4k014731;
        Thu, 11 Mar 2021 15:04:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=tREfudYH//6SNbPDrRPld3Prur5y8EVURbgSuNnueFc=;
 b=IkI6FPFe+iYbo0Drkh4G6a+zeyd3wMAIIRTuKorLhaNs2JcN5jCwmdOyv0bLgNcB6UJQ
 h8LuTGXcytHcgAmfuYjCjsJZtqay3uz0RR6spdnBwhRtzUhNg/cHh0ezgB5fQzsvgjcO
 kRYr9Ev1aDyXiwME/fWxzWRSn6kmui6V4UHzJm+urnDJOE8riJ2c3gPvMcHuiE0zKIN5
 YBdDuOh03fKwYg8JBXp37Jes9JY6awS26mRAjvG21TCQwrAZvWYcFfCK1n1n7NGF7++I
 yylz7UTyWUa0QGngy5BDD7DoDU0y+frr7izjhfdCh+ofwcmCHQ1uOSSnqXldKjk07AKo pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3741gpy6wy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 15:04:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CBD7F100034;
        Thu, 11 Mar 2021 15:04:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C0377247BC8;
        Thu, 11 Mar 2021 15:04:26 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar 2021 15:04:26
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 3/6] rpmsg: Add short description of the IOCTL defined in UAPI.
Date:   Thu, 11 Mar 2021 15:04:10 +0100
Message-ID: <20210311140413.31725-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
References: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-11_05:2021-03-10,2021-03-11 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a description of the IOCTLs and provide information on the default
value of the source and destination addresses.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 include/uapi/linux/rpmsg.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
index 5e00748da319..f5ca8740f3fb 100644
--- a/include/uapi/linux/rpmsg.h
+++ b/include/uapi/linux/rpmsg.h
@@ -14,8 +14,8 @@
 /**
  * struct rpmsg_endpoint_info - endpoint info representation
  * @name: name of service
- * @src: local address
- * @dst: destination address
+ * @src: local address. To set to RPMSG_ADDR_ANY if not used.
+ * @dst: destination address. To set to RPMSG_ADDR_ANY if not used.
  */
 struct rpmsg_endpoint_info {
 	char name[32];
@@ -23,7 +23,14 @@ struct rpmsg_endpoint_info {
 	__u32 dst;
 };
 
+/**
+ * Instantiate a new rmpsg char device endpoint.
+ */
 #define RPMSG_CREATE_EPT_IOCTL	_IOW(0xb5, 0x1, struct rpmsg_endpoint_info)
+
+/**
+ * Destroy a rpmsg char device endpoint created by the RPMSG_CREATE_EPT_IOCTL.
+ */
 #define RPMSG_DESTROY_EPT_IOCTL	_IO(0xb5, 0x2)
 
 #endif
-- 
2.17.1

