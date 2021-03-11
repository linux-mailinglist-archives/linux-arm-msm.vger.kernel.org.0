Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32E73374F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 15:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233814AbhCKOEj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 09:04:39 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:51624 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233760AbhCKOEb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 09:04:31 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BE3Bs8014673;
        Thu, 11 Mar 2021 15:04:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=FcW1J/setFwTwOH+VhdGFYbPkMfYg30KWwRW0YzViPA=;
 b=MAMVEQzQgb6GBssu6hZACAjwzq13I32eCtBKV4Wm5h1XdcMM5Km/8Ok99ZN1JT6JaS3o
 yZwcGx9gojwimu/cNo227fMilDHG9zz1b6bRycqTPgGda2NND5zOTgn3mkm1SQV5e4iT
 I05wfCzuUx26bc9fNLXsgvI7T8ORi/vFFa7RNfFLNbVgtYUx9df32F1hkcyitxpzpRPq
 74LCOgLAIcc/dBHgagd3h2HqKsDOTmDgUDMugo9osb63+qeygAqooM1CmcYGSd7knntM
 PunRni5Pe1TsWPvfCDgY/kO1XhLA46cExfFgKX9m9C+LpiA9rEdMnwmY1kCd6LDL0fju 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3741gpy6wv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 15:04:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1CB1210002A;
        Thu, 11 Mar 2021 15:04:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12887247BC8;
        Thu, 11 Mar 2021 15:04:26 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar 2021 15:04:25
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 2/6] rpmsg: Move RPMSG_ADDR_ANY in user API
Date:   Thu, 11 Mar 2021 15:04:09 +0100
Message-ID: <20210311140413.31725-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
References: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-11_05:2021-03-10,2021-03-11 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As the RPMSG_ADDR_ANY is a valid src or dst address that can be set by
user applications, migrate its definition in user API.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 include/linux/rpmsg.h      | 3 +--
 include/uapi/linux/rpmsg.h | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index a5db828b2420..d97dcd049f18 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -18,8 +18,7 @@
 #include <linux/mutex.h>
 #include <linux/poll.h>
 #include <linux/rpmsg/byteorder.h>
-
-#define RPMSG_ADDR_ANY		0xFFFFFFFF
+#include <uapi/linux/rpmsg.h>
 
 struct rpmsg_device;
 struct rpmsg_endpoint;
diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
index e14c6dab4223..5e00748da319 100644
--- a/include/uapi/linux/rpmsg.h
+++ b/include/uapi/linux/rpmsg.h
@@ -9,6 +9,8 @@
 #include <linux/ioctl.h>
 #include <linux/types.h>
 
+#define RPMSG_ADDR_ANY		0xFFFFFFFF
+
 /**
  * struct rpmsg_endpoint_info - endpoint info representation
  * @name: name of service
-- 
2.17.1

