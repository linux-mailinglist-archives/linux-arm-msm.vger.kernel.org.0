Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD5B31DA96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 14:35:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233090AbhBQNc3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 08:32:29 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:39314 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233077AbhBQNbi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 08:31:38 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11HDQ2F0017925;
        Wed, 17 Feb 2021 14:30:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=M1W7lnH3WVTrEg/mRlrlwrtBldl3psNcbgfNxLcMeWc=;
 b=5oEp4dFty/rj17KYD5JjY+d0TCSrz8NAo07al8jk7dsq+bmF+C6bNcFLl+lOS4CEcte3
 +nOzPF0W8x9AcA0qd1z6MTD2ahMAqSbmCirH9BB5bBboDCMokeUlKLuE4+fMsqAzFrNc
 Da0HfhTFwgLZ2G1sZuhy2VRMIoj0WmY0rd3axnCn3mZJkAV+UmjhmfmlhvyUwwF11n5q
 ILU4JPpmYGWdb/DPj9vMdUZpDVfgpaK/FGIuhZNovBs1r4482pj3Ght9Ow4MbGoS8Yeg
 LQnIFWI2ssv38kQWn8qvOYTD1GLQr2VxbuEuBxklFeqoFmP0Can0zLlfyeB12ayxSc1l dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36p706nnbp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Feb 2021 14:30:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF55710002A;
        Wed, 17 Feb 2021 14:30:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C40E22370C9;
        Wed, 17 Feb 2021 14:30:50 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Feb 2021 14:30:50
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v4 05/16] rpmsg: char: dissociate the control device from the rpmsg class
Date:   Wed, 17 Feb 2021 14:28:54 +0100
Message-ID: <20210217132905.1485-6-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
References: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-17_11:2021-02-16,2021-02-17 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The RPMsg control device is a RPMsg device, it is already
referenced in the RPMsg bus. There is only an interest to
reference the ept char devices in the rpmsg class.
This patch prepares the code split of the control and end point
devices in two separate files.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 78a6d19fdf82..23e369a00531 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -485,7 +485,6 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 	dev = &ctrldev->dev;
 	device_initialize(dev);
 	dev->parent = &rpdev->dev;
-	dev->class = rpmsg_class;
 
 	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
 	ctrldev->cdev.owner = THIS_MODULE;
-- 
2.17.1

