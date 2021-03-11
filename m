Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 008403374FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 15:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233776AbhCKOEk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 09:04:40 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:37401 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233855AbhCKOEg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 09:04:36 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BE32Iu011083;
        Thu, 11 Mar 2021 15:04:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=nBWlEyvQI2fqwZ059ASzKpc9vBdJl0uPh4tn9lalucg=;
 b=zQ+eJDMtEGdHawvMvnq6n9T+NAOR8p1TXx6YkzJYNmFuDd1xqmb5fkUsyn4BdxQepxQ3
 QhGW2wHXYd3vZzs32V4jVdXGYv1pcKq3G7pAxlbsM6z0bJzTNU+kgV0GbFkKfQttBG8p
 ZQmwrNw6DEhQkTZmu/ZgYgp2onsXBKTb5LK8jHG1Rzft2qynzEr/r45gfprTozHZFQ4x
 OaKU6uALJh5FSokbhshd70+qF5PxfNcMWWq4yk9UOnjT037m5523Ck0uoRHDRNoBk+dN
 9aB3WoASp9ni1j1Cj6w92PgCL3d3e/0lKc4jOXmbEJ0P8KqSysORFqDUVJ4G/QUhNHz4 vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37403775mc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 15:04:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 03D3410002A;
        Thu, 11 Mar 2021 15:04:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ED064247BC8;
        Thu, 11 Mar 2021 15:04:28 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar 2021 15:04:28
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 6/6] rpmsg: char: Return an error if device already open
Date:   Thu, 11 Mar 2021 15:04:13 +0100
Message-ID: <20210311140413.31725-7-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
References: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-11_05:2021-03-10,2021-03-11 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The rpmsg_create_ept function is invoked when the device is opened.
As only one endpoint must be created per device. It is not possible to
open the same device twice. But there is nothing to prevent multi open.
Return -EBUSY when device is already opened to have a generic error
instead of relying on the back-end to potentially detect the error.

Without this patch for instance the GLINK driver return -EBUSY while
the virtio bus return -ENOSPC.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 95a65f7a9d8d..2bebc9b2d163 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -127,6 +127,9 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 	struct rpmsg_device *rpdev = eptdev->rpdev;
 	struct device *dev = &eptdev->dev;
 
+	if (eptdev->ept)
+		return -EBUSY;
+
 	get_device(dev);
 
 	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
-- 
2.17.1

