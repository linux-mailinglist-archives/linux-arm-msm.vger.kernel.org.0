Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBF292E091A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 11:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgLVK6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 05:58:47 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:7242 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725785AbgLVK6q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 05:58:46 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BMAvIsl004047;
        Tue, 22 Dec 2020 11:57:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=udCeyTxsbq23gfM8tPSsY63UuxyyFwwhHocq4F3kNCU=;
 b=s/qo5F1LSfov3N6KiW7oLo+tngFJCqliBam3XojjcsJNelPXI++XReLYrh2S+tuk7tR0
 HhmXNUVDiXK8woiBTEdPDQ9pdmWUX7Ic8OJTGR9x048/YQ6xW1Iw22aGh4g0uAamnazh
 WzAEylJnd6dOtKUfzjIok/gYbSJQea3fy5EStc6bArzVkAiadmG5m2ws7qsH47e667RU
 F77uPo33yqJshZxx1NA5CHBna8R4wbBVbGV5/qasradtL9UFvkb2sk82ewJ/XVg5yr8M
 zqGxNup3SJF99kXZ6C3A3ojZvf5LibGv26MD2DbdaCvkSucRTAmP1RnKnqfhtvtfpsYF MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35k0d1bjtd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Dec 2020 11:57:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A4F710002A;
        Tue, 22 Dec 2020 11:57:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E36EB231602;
        Tue, 22 Dec 2020 11:57:58 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Dec 2020 11:57:58
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 00/16] introduce generic IOCTL interface for RPMsg channels management
Date:   Tue, 22 Dec 2020 11:57:10 +0100
Message-ID: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-22_04:2020-12-21,2020-12-22 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series is a restructuring of the RPMsg char driver, to create a generic
RPMsg ioctl interface for all rpmsg services.

The RPMsg char driver provides interfaces that:
- expose a char RPMsg device for communication with the remote processor,
- expose controls interface for applications to create and release endpoints.

The objective of this series is to decorrelate the two interfaces:
  - Provide a char device for a RPMsg raw service in the rpmsg_char that can be
    probed by a RPMsg bus on a ns announcement.
  - Generalize the use of the ioctl for all RPMsg services by creating the
    rpmsg_ctrl, but keep it compatibile with the legacy.

If the V1 create a new rpmsg_raw driver in addition to the rpmsg_ctrl this
version try to reuse the rpmsg_char driver by addapting QCOM GLINK and SMD
drivers.
So a goal of this version is to help to determine the best strategy to move
forward:
  - reuse rpmsg_char.
  - introduce a new driver and keep rpmsg_char as a legacy driver for a while.

Notice that SMD and GLINK patches have to be tested, only build has been tested.

1) RPMsg control driver: rpmsg_ctrl.c
  This driver is based on the control part of the RPMsg_char driver. 
  On probe a /dev/rpmsg_ctrl<X> interface is created to allow to manage the
  channels.
  The principles are the following:
  - The RPMsg service driver registers it's name and the associated service
    using the rpmsg_ctrl_unregister_ctl API. The list of supported services
    is defined in  include/uapi/linux/rpmsg.h and exposed to the
    application thanks to a new field in rpmsg_endpoint_info struct.
  - On the RPMsg bus probe(e.g virtio bus) an rpmsg_ctrl device is
    registered that creates the control interface.
  - The application can then create or release a channel by specifying:
       - the name service
       - the source address.
       - the destination address.
  - The rpmsg_ctrl uses the same interface than the ns announcement to
    create and release the associated channel but using the driver_override
    field to force the service name.
    The  "driver_override" allows to force the name service associated to
    an RPMsg driver, bypassing the rpmsg_device_id based match check.
  - At least for virtio bus, an associated ns announcement is sent to the
    remote side.  

2) rpmsg char driver: rpmsg_char.c
    - The rpmsg class has not been removed. The associated attributes
      are already available in /sys/bus/rpmsg/.
    - The eptdev device is now an RPMsg device probed by a RPMsg bus driver
      (probed only by the ioctl in rpmsg_char driver).

Know current Limitations:
- Tested only with virtio RPMsg bus and for one vdev instance.
- The glink and smd drivers adaptations have not been tested (not able to test).
- To limit commit and not update the IOCT interface some features have been not
  implemented in this first step:
    - the NS announcement as not been updated, it is not possible to create an
      endpoint with a destibnation address set to RPMSG_ADDR_ANY (-1),
    - not possible to destroy the channel,
    - only the "rpmsg-raw" service is supported.

This series can be applied in Bjorn's rpmsg-next branch on top of the
RPMsg_ns series(4c0943255805).

This series can be tested using rpmsgexport tools available here:
https://github.com/andersson/rpmsgexport.
---
new from V1[1]:
- In V1 the rpmsg_char.c was not impacted, a rpmsg_raw.c has been created
  instead.
- IOCTL interface as not been updated (to go by steps).
- smd and glink drivers has been updated to support channels creation and
  release.

[1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=327277

Arnaud Pouliquen (16):
  rpmsg: introduce RPMsg control driver for channel creation
  rpmsg: add RPMsg control API to register service
  rpmsg: add override field in channel info
  rpmsg: ctrl: implement the ioctl function to create device
  rpmsg: ns: initialize channel info override field
  rpmsg: add helper to register the rpmsg ctrl device
  rpmsg: char: clean up rpmsg class
  rpmsg: char: make char rpmsg a rpmsg device without the control part
  rpmsg: char: register RPMsg raw service to the ioctl interface.
  rpmsg: char: allow only one endpoint per device
  rpmsg: char: check destination address is not null
  rpmsg: virtio: use the driver_override in channel creation ops
  rpmsg: virtio: probe the rpmsg_ctl device
  rpmsg: glink: add create and release rpmsg channel ops
  rpmsg: smd: add create and release rpmsg channel ops
  rpmsg: replace rpmsg_chrdev_register_device use

 drivers/rpmsg/Kconfig             |   8 +
 drivers/rpmsg/Makefile            |   1 +
 drivers/rpmsg/qcom_glink_native.c |  96 +++++++--
 drivers/rpmsg/qcom_smd.c          |  59 +++++-
 drivers/rpmsg/rpmsg_char.c        | 246 ++++++-----------------
 drivers/rpmsg/rpmsg_ctrl.c        | 320 ++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |  14 --
 drivers/rpmsg/rpmsg_ns.c          |   1 +
 drivers/rpmsg/virtio_rpmsg_bus.c  |  38 +++-
 include/linux/rpmsg.h             |  40 ++++
 include/uapi/linux/rpmsg.h        |  14 ++
 11 files changed, 606 insertions(+), 231 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

-- 
2.17.1

