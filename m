Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8FC30EED8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 09:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235075AbhBDIqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 03:46:49 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:48220 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235015AbhBDIql (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 03:46:41 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1148hBAJ031732;
        Thu, 4 Feb 2021 09:45:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=BCtcZjJ31QpN6Q3wFqjp7BT9faru6loUa/IXbO149lE=;
 b=1h95J7ZEo8l1FcIKX6FF67A9Ae/fAi982fnmhfGEjsyRY8EooYvidZefn9/cjzhxWDll
 FW7Wh7Q1f8a3u9imLruNTIjb/l6EpwLt3Lcq9x2NpQTLaMgfLfAOH3GOaXgPYL8eQH6x
 ApBNsa/3sUT4HM3YqAIxLdQHvoxNHcy2H+JW6kiAuRWw0LuXutzNTXWtvgzqI8DjNF4h
 dZVfIh0AxseEevTiXXWVfygTRmGonn27an/BVRMbWyAV2MNETSyip20m7vlNUHn18i0a
 D8QEsNOtNlo7upX0HebM0Wn5xF+ucMks2nGGJkpX4/84KtT3yV/JBFujcZy77K0xR4zR bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36e7x16et8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 Feb 2021 09:45:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5B78510002A;
        Thu,  4 Feb 2021 09:45:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A51322AE43;
        Thu,  4 Feb 2021 09:45:54 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb 2021 09:45:54
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v3 01/15] rpmsg: char: rename rpmsg_char_init to rpmsg_chrdev_init
Date:   Thu, 4 Feb 2021 09:45:20 +0100
Message-ID: <20210204084534.10516-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
References: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-04_03:2021-02-04,2021-02-04 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To be coherent with the other functions which are prefixed by
rpmsg_chrdev, rename the rpmsg_chrdev_init function.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 4bbbacdbf3bb..9e33b53bbf56 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -543,7 +543,7 @@ static struct rpmsg_driver rpmsg_chrdev_driver = {
 	},
 };
 
-static int rpmsg_char_init(void)
+static int rpmsg_chrdev_init(void)
 {
 	int ret;
 
@@ -569,7 +569,7 @@ static int rpmsg_char_init(void)
 
 	return ret;
 }
-postcore_initcall(rpmsg_char_init);
+postcore_initcall(rpmsg_chrdev_init);
 
 static void rpmsg_chrdev_exit(void)
 {
-- 
2.17.1

