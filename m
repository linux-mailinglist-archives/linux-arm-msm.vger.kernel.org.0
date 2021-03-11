Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB5B3374F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 15:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233857AbhCKOEi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 09:04:38 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:36286 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233852AbhCKOEa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 09:04:30 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BE35fq014991;
        Thu, 11 Mar 2021 15:04:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=v8txream0i2iNYejsg6TwbWegioUuHjMWET/Z9cj2U0=;
 b=2lrcpMoSt+DsfNpeZAc4o2SnY8THHwIWnQCjCrZv2CjNLaszYqCmWVEUgqKRW7WXvdWS
 8zRIhfCDMgeG0NhI0dqawmWUXkVYjcrsHU9W/o8zymqrndUUUsgR088rFpp/LEcUu0KC
 JdMnexn/Ha3xU9tOWY6i+RGSO7j7eAPp4w+AbXWKuwsMCblYMTHZD0uBsJLLHbYw9Kgs
 MpbUldZeJBfsMhHlPT7PjQDiBXia+MjO4rKYKbw05Vw335zk9pu2VEJY5SBZcnPhTh2N
 SgHt5JxRIZQQawQMusNq6GZ1Es0acMMH+oZl94hBJh5ydO09Z7u69EH8mFSEx4teNl21 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3741y76hy3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 15:04:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8EAF310002A;
        Thu, 11 Mar 2021 15:04:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7D913245D4C;
        Thu, 11 Mar 2021 15:04:24 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Mar 2021 15:04:24
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 0/6] rpmsg: enable the use of the rpmsg_char device for the Virtio backend
Date:   Thu, 11 Mar 2021 15:04:07 +0100
Message-ID: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-11_05:2021-03-10,2021-03-11 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series is the first step in the division of the series: 
"Introduce a generic IOCTL interface for RPMsg channels management"[1]

The main goal here is to enable the RPMsg char interface for
the virtio RPMsg backend. 

In addition some patches have been includes in order to document the
interface and rename the rpmsg_char_init function.

It also includes Mathieu Poirier's comments made on [1]

Patchsets that should be the next steps:
 - Extract the control part of the char dev and create the rpmsg_ctrl.c
   file
 - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL to instantiate RPMsg devices


[1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523

Arnaud Pouliquen (6):
  rpmsg: char: Rename rpmsg_char_init to rpmsg_chrdev_init
  rpmsg: Move RPMSG_ADDR_ANY in user API
  rpmsg: Add short description of the IOCTL defined in UAPI.
  rpmsg: char: Use rpmsg_sendto to specify the message destination
    address
  rpmsg: virtio: Register the rpmsg_char device
  rpmsg: char: Return an error if device already open

 drivers/rpmsg/qcom_glink_native.c | 16 ++++++++
 drivers/rpmsg/qcom_smd.c          | 16 ++++++++
 drivers/rpmsg/rpmsg_char.c        | 11 ++++--
 drivers/rpmsg/virtio_rpmsg_bus.c  | 62 ++++++++++++++++++++++++++++---
 include/linux/rpmsg.h             |  3 +-
 include/uapi/linux/rpmsg.h        | 13 ++++++-
 6 files changed, 108 insertions(+), 13 deletions(-)

-- 
2.17.1

