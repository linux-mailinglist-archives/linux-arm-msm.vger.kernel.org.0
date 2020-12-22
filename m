Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA3E72E0934
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 12:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgLVK6y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 05:58:54 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:10208 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726558AbgLVK6x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 05:58:53 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BMAw6be012877;
        Tue, 22 Dec 2020 11:58:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=kDkn3Ch/ijKh7T5HcklMbiVwxsHO7ZaypNzAx6hkCrs=;
 b=ctsYdK2/hB54QI+hF2dR3CgMnDFRg+t/F69zvtv22DiyDdVc+6UM2ac1tbuDE3qz01nn
 XbEtBjB/spm0W0XlFDK6uu88RM/CZDj16aeWvhUZaXGP/chIG8k1TCJCp6kUAn8J403T
 UcL8c6XITqDZYU2JiFUiSUp70rv/Uz8m4w5w9xM0u7RoRsBIOmAlTIAu8Lc5RXJ+ByA3
 bBD5BU7L6RuaXutnb8WFy+SAPKnCillTTxQ14TZyeY1rBOjyara+4RoZ70KNVlQ4n33l
 NBSlTnUfIpr6y0PSgjg4ohNyPrOUyXp8xoUJ/hYvL0K9EmTfXmTNtdaewGBl/MmQOM27 MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35k0eb3xbv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Dec 2020 11:58:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 76CB7100034;
        Tue, 22 Dec 2020 11:58:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A3BB22ECB4;
        Tue, 22 Dec 2020 11:58:07 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Dec 2020 11:58:06
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 11/16] rpmsg: char: check destination address is not null
Date:   Tue, 22 Dec 2020 11:57:21 +0100
Message-ID: <20201222105726.16906-12-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-22_04:2020-12-21,2020-12-22 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The name service announcement is not sent if no endpoint is created by
default. If the destination address is not precised by the
application when creating the device (thanks to the RPMsg CTRL interface),
it is not possible to have a valid RPMsg channel.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 4b0674a2e3e9..8b1928594d10 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -305,6 +305,16 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 	struct device *dev;
 	int ret;
 
+	/* There is not ept created by default. As consequence there is not NS
+	 * announcement and the destination address has to be set.
+	 * this limitation could be solved in future by adding a helper in
+	 * rpmsg_ns.
+	 */
+	if (rpdev->dst == RPMSG_ADDR_ANY) {
+		dev_err(dev, "destination address invalid (%d)\n", rpdev->dst);
+		return -EINVAL;
+	}
+
 	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
 	if (!eptdev)
 		return -ENOMEM;
-- 
2.17.1

