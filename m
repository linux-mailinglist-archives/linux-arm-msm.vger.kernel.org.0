Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A90B31DAAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 14:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233119AbhBQNe1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 08:34:27 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:39690 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233112AbhBQNcl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 08:32:41 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11HDQiL6019042;
        Wed, 17 Feb 2021 14:31:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=9otI8hBeC46Slwkg9Iec+E1E6ulCMz/xpbQrJjFhILA=;
 b=W2Ycckai3Uba1hsH8i7v8jWXOkKhuJZQxV2zl9TEO5UDcxLLSRca1b1E8d/zn6112IFp
 zfaZJWSS8uoPGiqDEvzqhMXP+MFQwMIl8yKYMWe9dIe8g806Oa/MevAbOR/MF+0Bp/2y
 yeXsuN+SUIT59KLIajo6ogfiNS/9oDT4HfEamKukr2rP3auamGyWB8Xak4pvjQuP9bKP
 H1/4v/f+4PPQ3u5bPbxX5OmYn2atHFTlnqYI+ZYFFgFvTLmTDJqQL4U2mpPdcCNJIAjp
 +dYvy4ZF4PEwOysSsvZqrkBDnPG28wVvlwLyVlKWdhvAkidUhbNTAv+3iy4jvq8xqzqp hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36p706nnhx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Feb 2021 14:31:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9C3DE10002A;
        Wed, 17 Feb 2021 14:31:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8D0F02370CD;
        Wed, 17 Feb 2021 14:31:54 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Feb 2021 14:31:54
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v4 10/16] rpmsg: char: use sendto to specify the message destination address
Date:   Wed, 17 Feb 2021 14:28:59 +0100
Message-ID: <20210217132905.1485-11-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
References: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-17_11:2021-02-16,2021-02-17 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When the endpoint device is created by the application a destination
address as been specified in the rpmsg_channel_info structure.
Send the message to this address instead of the default one.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 83c10b39b139..09ae1304837c 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -225,9 +225,9 @@ static ssize_t rpmsg_eptdev_write_iter(struct kiocb *iocb,
 	}
 
 	if (filp->f_flags & O_NONBLOCK)
-		ret = rpmsg_trysend(eptdev->ept, kbuf, len);
+		ret = rpmsg_trysendto(eptdev->ept, kbuf, len, eptdev->chinfo.dst);
 	else
-		ret = rpmsg_send(eptdev->ept, kbuf, len);
+		ret = rpmsg_sendto(eptdev->ept, kbuf, len, eptdev->chinfo.dst);
 
 unlock_eptdev:
 	mutex_unlock(&eptdev->ept_lock);
-- 
2.17.1

