Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64228345E10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 13:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhCWM2r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 08:28:47 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:57230 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230264AbhCWM2Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 08:28:24 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12NCMA7O026737;
        Tue, 23 Mar 2021 13:28:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=TFEaoGHubAcvTK6aBZnSgF+yw3/Ea8wZf8ITTSJeSZw=;
 b=YUhffOcZCMjghv1KUTC0P0PKD/SzaRtAlwZveZzaX8JomXbCm5I+zi8O+khx59dDNAxA
 m1TM6JsVrcYi4njCuyPIY7gtYY7REoeQKe26ZB6LgJeTTINNYytpk3PSWVDk3TVl1jf6
 3530kzFNA7CdNAJRKWuuQ8HXnxUaP7/bmTJFEBEe8Z8RoEdibDk3PNxEcc7oQVmO1NJ1
 rWyS4xB1wEX06mRNUk0dUeeBS8TUBVuZ7Jsx5bdKxaHxx5UsOzlmQvJHv+ydRANIv0is
 HLOCU1t4y6K7cnPU6wWG1jf6WbAHdU4KzHgzuN1WkDAqIwf9aNarZQbtcg6gsUWTB6AT LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37d8tpfapv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Mar 2021 13:28:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 62E0B100034;
        Tue, 23 Mar 2021 13:28:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C608824CF45;
        Tue, 23 Mar 2021 13:28:17 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 23 Mar 2021 13:28:16
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 0/7] Restructure the rpmsg char and introduce the rpmsg-raw channel
Date:   Tue, 23 Mar 2021 13:27:30 +0100
Message-ID: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-23_06:2021-03-22,2021-03-23 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series is the second step in the division of the series [1]: 
"Introducing a Generic IOCTL Interface for RPMsg Channel Management".

The purpose of this patchset is to:
- split the control code related to the control
  and the endpoint. 
- define the rpmsg-raw channel, associated with the rpmsg char device to
  allow it to be instantiated using a name service announcement.
    
An important point to keep in mind for this patchset is that the concept of
channel is associated with a default endpoint. To facilitate communication
with the remote side, this default endpoint must have a fixed address.

Consequently, for this series, I made a design choice to fix the endpoint
on the "rpmsg-raw" channel probe, and not allow to create/destroy an endpoint
on FS open/close.

This is only applicable for channels probed by the rpmsg bus. The behavior,
using the RPMSG_CREATE_EPT_IOCTL and RPMSG_DESTROY_EPT_IOCTL controls, is
preserved.
  
The next steps should be to correct this:
Introduce the IOCTLs RPMSG_CREATE_DEV_IOCTL and RPMSG_DESTROY_DEV_IOCTL
to instantiate the rpmsg devices

[1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523

Arnaud Pouliquen (7):
  rpmsg: char: Export eptdev create an destroy functions
  rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
  rpmsg: Update rpmsg_chrdev_register_device function
  rpmsg: char: Introduce __rpmsg_chrdev_create_eptdev function
  rpmsg: char: Introduce a rpmsg driver for the rpmsg char device
  rpmsg: char: No dynamic endpoint management for the default one
  rpmsg: char: Return error if user try to destroy a default endpoint.

 drivers/rpmsg/Kconfig             |   9 ++
 drivers/rpmsg/Makefile            |   1 +
 drivers/rpmsg/qcom_glink_native.c |   2 +-
 drivers/rpmsg/qcom_smd.c          |   2 +-
 drivers/rpmsg/rpmsg_char.c        | 221 +++++++++-------------------
 drivers/rpmsg/rpmsg_char.h        |  50 +++++++
 drivers/rpmsg/rpmsg_ctrl.c        | 233 ++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |   8 +-
 drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
 9 files changed, 368 insertions(+), 160 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.h
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

-- 
2.17.1

