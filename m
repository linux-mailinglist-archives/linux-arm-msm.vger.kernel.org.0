Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB86831F842
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 12:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhBSLU4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 06:20:56 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:58279 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230421AbhBSLT5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 06:19:57 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11JBILXl024274;
        Fri, 19 Feb 2021 12:19:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=vvNAyI9ruMSPKPHLlkuNsluMR8Afys++5OiV9+LgOgg=;
 b=UZ73H0lOyhNxPzMHFJIGTNr0iv0hHMWbojSCd66muagxu9omG7Zp4Y/DyyoIaazgsA83
 KrpKmWVKEAWE+m12OE2zxaNTFB7D3TtGaqnnupIhy2WC1iPy7Eyp0Ry/2Y8zAoLcB0L5
 M79kQOmRCQnt6T4l/GtLZKvUf4KZ89eOhwTde9ovxNkeupHssb5qg6HC3uh7qPAbdpuR
 EH+G4WS0SNeKJKnCnIL8HyiPbh5K7k6vr8c7OQ8jyoeSi7xwcUOC2qmT1XzeFz1PVUM5
 dUbGs1ZQzijCtlxQaema0WIhfi+hXtmDyHvIXgoXNRogElZhoWs6I0zuj3aknowRt4nR Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36sqadeywc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Feb 2021 12:19:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3AD49100034;
        Fri, 19 Feb 2021 12:19:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D054221760;
        Fri, 19 Feb 2021 12:19:11 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Feb 2021 12:19:10
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v5 15/16] rpmsg: char: no dynamic endpoint management for the default one
Date:   Fri, 19 Feb 2021 12:15:00 +0100
Message-ID: <20210219111501.14261-16-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-19_04:2021-02-18,2021-02-19 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Do not dynamically manage the default endpoint. The ept address must
not change.
This update is needed to manage the RPMSG_CREATE_DEV_IOCTL. In this
case a default endpoint is used and it's address must not change or
been reused by another service.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index c98b0e69679b..8d3f9d6c20ad 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -114,14 +114,23 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 	struct rpmsg_endpoint *ept;
 	struct rpmsg_device *rpdev = eptdev->rpdev;
 	struct device *dev = &eptdev->dev;
+	u32 addr = eptdev->chinfo.src;
 
 	get_device(dev);
 
-	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
-	if (!ept) {
-		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
-		put_device(dev);
-		return -EINVAL;
+	/*
+	 * The RPMsg device can has been created by a ns announcement. In this
+	 * case a default endpoint has been created. Reuse it to avoid to manage
+	 * a new address on each open close.
+	 */
+	ept = rpdev->ept;
+	if (!ept || addr != ept->addr) {
+		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
+		if (!ept) {
+			dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
+			put_device(dev);
+			return -EINVAL;
+		}
 	}
 
 	eptdev->ept = ept;
@@ -133,12 +142,17 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
 {
 	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
+	struct rpmsg_device *rpdev = eptdev->rpdev;
 	struct device *dev = &eptdev->dev;
 
-	/* Close the endpoint, if it's not already destroyed by the parent */
+	/*
+	 * Close the endpoint, if it's not already destroyed by the parent and it is not the
+	 * default one.
+	 */
 	mutex_lock(&eptdev->ept_lock);
 	if (eptdev->ept) {
-		rpmsg_destroy_ept(eptdev->ept);
+		if (eptdev->ept != rpdev->ept)
+			rpmsg_destroy_ept(eptdev->ept);
 		eptdev->ept = NULL;
 	}
 	mutex_unlock(&eptdev->ept_lock);
-- 
2.17.1

