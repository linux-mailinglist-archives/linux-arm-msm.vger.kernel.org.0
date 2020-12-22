Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6072E0926
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 12:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgLVK6v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 05:58:51 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:39062 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726288AbgLVK6u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 05:58:50 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BMAw5bP004484;
        Tue, 22 Dec 2020 11:58:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=UPiHBdbTHBNY7dOfvc0ufFTBldl3o20yeOxrHUfL6kA=;
 b=aFPViVI0NW7dADKfDwovSbcpRfZr3rzSvb4GZ+NwE8AGTBgHtY2hDk09ztV0zoAYWYaI
 NlveXdKspUPgA7dDEl2nBvneCfetq056cn8lBXKJ+zYvRSVOjiBAnv31uqmbor5rxT5o
 pnshpAd7q2ybPFnxY/T1vKuf1MeJgBBOyoOHwqGYyUDchLRzgEID0COpxfxEBXCFWx3H
 SH3a1q6m74wbAfSuxBKa7u5TFGwtL1w1QqfSWyToZ6ab/pKGgR4vmuYSPmVJrgqUDaPi
 c6Wi1xgRUFIl92Q0UBOSZZn5qRapV+/cR3hF6gteW6e5sXEKKp4kfD4cMGu7SgdjrYeL Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35k0cgky50-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Dec 2020 11:58:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E65810002A;
        Tue, 22 Dec 2020 11:58:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6FC4A2073FA;
        Tue, 22 Dec 2020 11:58:03 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
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
Subject: [PATCH v2 06/16] rpmsg: add helper to register the rpmsg ctrl device
Date:   Tue, 22 Dec 2020 11:57:16 +0100
Message-ID: <20201222105726.16906-7-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-22_04:2020-12-21,2020-12-22 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This function registers a rpmsg_ctl device and its associated
/dev/rpmsg_ctrl interface.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_ctrl.c | 16 ++++++++++++++++
 include/linux/rpmsg.h      |  7 +++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index 8381b5b2b794..e4b0ca6dffe3 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -271,6 +271,22 @@ void rpmsg_ctrl_unregister_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
 }
 EXPORT_SYMBOL(rpmsg_ctrl_unregister_ctl);
 
+/**
+ * rpmsg_ctl_register_device() - register control device based on rpdev
+ * @rpdev:	prepared rpdev to be used for creating endpoints
+ *
+ * This function wraps rpmsg_register_device() preparing the rpdev for use as
+ * a control rpmsg driver forcing the channel name.
+ */
+int rpmsg_ctl_register_device(struct rpmsg_device *rpdev)
+{
+	strcpy(rpdev->id.name, KBUILD_MODNAME);
+	rpdev->driver_override = KBUILD_MODNAME;
+
+	return rpmsg_register_device(rpdev);
+}
+EXPORT_SYMBOL(rpmsg_ctl_register_device);
+
 static int rpmsg_ctrl_init(void)
 {
 	int ret;
diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
index 5681c585e235..86540528325f 100644
--- a/include/linux/rpmsg.h
+++ b/include/linux/rpmsg.h
@@ -335,6 +335,8 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
 int  rpmsg_ctrl_register_ctl(const struct rpmsg_drv_ctrl_info *ctrl);
 void rpmsg_ctrl_unregister_ctl(const struct rpmsg_drv_ctrl_info *ctrl);
 
+int rpmsg_ctl_register_device(struct rpmsg_device *rpdev);
+
 #else
 
 static inline int rpmsg_ctrl_register_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
@@ -346,6 +348,11 @@ static inline void rpmsg_ctrl_unregister_ctl(const struct rpmsg_drv_ctrl_info *c
 {
 }
 
+static inline int rpmsg_ctl_register_device(struct rpmsg_device *rpdev)
+{
+	return 0;
+}
+
 #endif /* IS_ENABLED(CONFIG_RPMSG_CTRL) */
 
 #endif /* _LINUX_RPMSG_H */
-- 
2.17.1

