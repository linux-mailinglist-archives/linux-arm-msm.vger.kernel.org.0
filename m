Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7282E0921
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 12:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgLVK6t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 05:58:49 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:7228 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725897AbgLVK6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 05:58:48 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BMAvYlk004475;
        Tue, 22 Dec 2020 11:58:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=Q34Pt7mQM73+LJGSyan1A/A1z8hmgrrHq/rT3Ow5ST8=;
 b=TY3glY+k2ggVKlL2hzeWpqarQZ0UeaVjNUSrcpXIkke9FO8uscDeIYkG0MN/vk23bcxL
 UYMbyHtoISl1NvJZbN82l5dRGysM1oh8hRAfO/g8mub7TJzof4QZMe5lO5xdfRbm4sm3
 0wRuFO0U51NPT+QQAjIfPdP6fuPOvbdaix5A8N7swNhkwbskRluJRpRlvnPWQZOZtXfo
 I9u70irWPH+fuLNkQEVfy6aY3Hx1rFvKlwCiMchjhuEfjWrSHqSstC9PZbZgl5M78gt1
 x5YVXJG3L0+MJQF4astLce+ehUQvYJoAz8gyQk1UtYsKf2zds5bpeMGNMKL+3bY7rcKT eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35k0d1bjth-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Dec 2020 11:58:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5F43110002A;
        Tue, 22 Dec 2020 11:58:01 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 430EF231603;
        Tue, 22 Dec 2020 11:58:01 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Dec 2020 11:58:00
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 03/16] rpmsg: add override field in channel info
Date:   Tue, 22 Dec 2020 11:57:13 +0100
Message-ID: <20201222105726.16906-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-22_04:2020-12-21,2020-12-22 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The override field is already used in the rpmsg_device.
Adding this field in the channel info allows to force the channel
creation with a specified RPMsg service driver.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 include/linux/rpmsg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 5d64704c2346..5681c585e235 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -44,11 +44,13 @@ struct rpmsg_drv_ctrl_info {
  * @name: name of service
  * @src: local address
  * @dst: destination address
+ * @driver_override: driver name to force a match
  */
 struct rpmsg_channel_info {
 	char name[RPMSG_NAME_SIZE];
 	u32 src;
 	u32 dst;
+	const char *driver_override;
 };
 
 /**
-- 
2.17.1

