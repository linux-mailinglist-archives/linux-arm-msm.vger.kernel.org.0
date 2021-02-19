Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F24C031F81F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 12:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhBSLSz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 06:18:55 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:4574 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230071AbhBSLSs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 06:18:48 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11JBGiBf016593;
        Fri, 19 Feb 2021 12:18:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=Eg4OKsTKzswaEDxBH77D2QEGSARCRjEDw0vkCFnM8gE=;
 b=GcY54TPYLVHHjWyWXlvV7blNjRpVqjnB/w5nWrEjQGTggqBB6x2ZPJeX4KusEePQplvq
 RCr01iMocpmqocIb7Sja8MvvD+Yu33S3dTLL+keFuKWIP8etqLWIyaPKrLo8nAClpy9k
 uU94mMmrCF7Yb5xQEHWjVWL2U76e+VFVpJx/6h0HGa4LSKc1fQSwfmJP3QB4iTp+hj8U
 geOvPEjd/jJTubD/R2YgkwZzePMUzp6TUbCJX/CdbXbYXpFTjTp0RYCo5zt3vjJfWv02
 Q5+8kTXenQ4cvR7CIokLrgCCC2Ai5yqQ39DEVVKmYqxjRmjYObKgHx7uhRAMyX6N2EW6 Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36sse3xh39-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Feb 2021 12:18:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AA767100038;
        Fri, 19 Feb 2021 12:17:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D52B2266D7;
        Fri, 19 Feb 2021 12:17:59 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Feb 2021 12:17:59
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v5 01/16] rpmsg: char: rename rpmsg_char_init to rpmsg_chrdev_init
Date:   Fri, 19 Feb 2021 12:14:46 +0100
Message-ID: <20210219111501.14261-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-19_04:2021-02-18,2021-02-19 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To be coherent with the other functions which are prefixed by
rpmsg_chrdev, rename the rpmsg_char_init function.

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

