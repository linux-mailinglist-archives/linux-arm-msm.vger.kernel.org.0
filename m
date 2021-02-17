Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE28F31DA94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 14:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233016AbhBQNc0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 08:32:26 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:55894 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233070AbhBQNbh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 08:31:37 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11HDRRcP001276;
        Wed, 17 Feb 2021 14:30:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=FcW1J/setFwTwOH+VhdGFYbPkMfYg30KWwRW0YzViPA=;
 b=qWZTQbClAlnSPhjTjTdZTlkGkN+JsfLLO96J9mPfVADaeQ5ChTSpJ99AgSxXUl8/9kbK
 gAOeWw+Hldjtys4pCi2egSgiPsBFoliy/j70O3Y9zszF4zkdLGi7NIUOPfChJ3SUZ0E6
 DHXW7Xw0fv/jgedSVlhgB5jt9/qKTg3tQECDfofKaIYb5NjWK3XeqZp8K+konRFH5evU
 k8PksxHOHwLkszBJVWqA2fY75+v8dbefRi3S0lCT+ASs4CABelDUVAxQSx0LBU7/zMyh
 dSJt4+w6kX9ON3l3jBhvRPyK7A4JyNG3sP2NrQmgR+CA0C9wpdIR+ZxFfcqk+L/iiel9 ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36p6hpq0n5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Feb 2021 14:30:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB0B710002A;
        Wed, 17 Feb 2021 14:30:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9ECCB2370C9;
        Wed, 17 Feb 2021 14:30:48 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Feb 2021 14:30:48
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v4 02/16] rpmsg: move RPMSG_ADDR_ANY in user API
Date:   Wed, 17 Feb 2021 14:28:51 +0100
Message-ID: <20210217132905.1485-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
References: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-17_11:2021-02-16,2021-02-17 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As the RPMSG_ADDR_ANY is a valid src or dst address that can be set by
user applications,  migrate its definition in user API.

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

