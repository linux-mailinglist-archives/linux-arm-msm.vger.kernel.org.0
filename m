Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9477F2E092F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 12:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgLVK6y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 05:58:54 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:39106 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725847AbgLVK6y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 05:58:54 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BMAw7bS004508;
        Tue, 22 Dec 2020 11:58:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=FvUUYLv2sdHQDAD6TMTnFsgYR6QnR4DXZXkL8+B6VwY=;
 b=1oQB3pCeIgtSu1zbzjQT5Xa6VlRLXfLAvy93JORdtgYpHD2lrxw5oGxy5Z+AoO7OBoYF
 lk5sJmAmPxeJGQcZmxNslbXW0yxXZ0CyfO3Ot37ww4YfL2SdIB2zr67gY5cRDuXXMal2
 r4cXDJ62RQcF62ZVN93J+Ymdw8wJyJy/GHw01lXI0YOR+dXWGhJR5JmZqgOcSo8gTyS4
 tukQKhRn1mwNw+X80FOAhzhCtK99y06S70Ff5CcxkHq/JsqA65tLLyb6LWk6z1K3oUrw
 2kj4KDi68tbGVaf0KbO0W/8N+YBCbgNRFq3ls1aRmLAU63X6YkJMCqEP83w48yoD+Zd6 Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35k0cgky5d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Dec 2020 11:58:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2CC1110002A;
        Tue, 22 Dec 2020 11:58:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2038122ECB4;
        Tue, 22 Dec 2020 11:58:08 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Dec 2020 11:58:07
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 12/16] rpmsg: virtio: use the driver_override in channel creation ops
Date:   Tue, 22 Dec 2020 11:57:22 +0100
Message-ID: <20201222105726.16906-13-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-22_04:2020-12-21,2020-12-22 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the override information from the channel info structure
to set the rpdev override and so links the channel to a specific
driver.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index e87d4cf926eb..c1d4bc08b2a5 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -416,6 +416,7 @@ static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
 	rpdev->dst = chinfo->dst;
 	rpdev->ops = &virtio_rpmsg_ops;
 	rpdev->little_endian = virtio_is_little_endian(vrp->vdev);
+	rpdev->driver_override = (char *)chinfo->driver_override;
 
 	/*
 	 * rpmsg server channels has predefined local address (for now),
-- 
2.17.1

