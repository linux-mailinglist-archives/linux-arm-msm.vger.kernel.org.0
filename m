Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B102931F822
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 12:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhBSLTL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 06:19:11 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:58869 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230239AbhBSLSt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 06:18:49 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11JBCOi5009228;
        Fri, 19 Feb 2021 12:17:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=aNSiq1WuZ5PT7Y3v8+mQF2IY08hpA6ycnBtHBmLuxKI=;
 b=VDjFFxmOTtTMt5hIWGnNdA6OM5xDDe+ivSbjqjy2D88iaBhJc65JNI7gSZ1ztgYQUxws
 cUDe6JeRF+Ep7YgaeRbDRBqcdhSAXJGC7eZjcaPWy4FAkUCqOm+YEO/n8ci7Layw8UnI
 IaTqw51Fm9AbcHasZzgsURnZteIeTOqzG14OZJ0SHGwpQ0lilzgTu4WR4VWesoQly595
 H9UYH6bDmwg5v6CoSAuCBsHPm2misoy86xfwMbx8h6+7Mpq95JIDu9VdZdpLEmDo6cJ2
 h9pzt5BQlDfGbev77iaWkFtcPToixBARNQxGOZKhi2+gdc+F+eGei4LkHJGig3Rhfam6 FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36sqadeymx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Feb 2021 12:17:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D282110002A;
        Fri, 19 Feb 2021 12:17:58 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BEDA82266D7;
        Fri, 19 Feb 2021 12:17:58 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Feb 2021 12:17:58
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v5 00/16] introduce a generic IOCTL interface for RPMsg channels management
Date:   Fri, 19 Feb 2021 12:14:45 +0100
Message-ID: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-19_04:2021-02-18,2021-02-19 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series restructures the RPMsg char driver to decorrelate the control part and to
create a generic RPMsg ioctl interface compatible with other RPMsg services.

The V4 and V5 fix compilation issues reported by the kernel test robot <lkp@intel.com>
and analyzed by Dan Carpenter <dan.carpenter@oracle.com>.

The V3 is based on the guideline proposed by Mathieu Poirier to keep as much as possible
the legacy implementation of the rpmsg_char used by the GLINK and SMD platforms.

Objectives of the series:
- Allow to create a service from Linux user application:
  - with a specific name
  - with or without name service announcement.
- Allow to probe the same service by receiving either a NS announcement from the remote firmware
  or a Linux user application request.
- Use these services independently of the RPMsg transport implementation (e.g be able to use
  RPMSg char with the RPMsg virtio bus).

Steps in the series:
  - Extract the control part of the char dev and create the rpmsg_ctrl.c file (patches 1 to 6)
  - Enable the use of the chardev with the virtio backend (patches 7 to 11)
  - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL to instantiate RPMsg devices (patch 12)
    The application can then create or release a channel by specifying:
       - the name service of the device to instantiate.   
       - the source address.
       - the destination address.
  - Instantiate the /dev/rpmsg interface on remote NS announcement (patches 13 to 16)

In this revision, I do not divide the series into several parts in order to show a complete
picture of the proposed evolution. To simplify the review, if requested, I can send it in
several steps listed above.

Known current Limitations:
- Tested only with virtio RPMsg bus. The glink and smd drivers adaptations have not been tested
  (not able to test it).
- For the virtio backend: No NS announcement is sent to the remote processor if the source
  address is set to RPMSG_ADDR_ANY.
- For the virtio backend: the existing RPMSG_CREATE_EPT_IOCTL is working but the endpoints are
  not attached to an exiting channel.
- to limit patches the pending RPMSG_DESTROY_DEV_IOCTL has not ben implemented. This will be
  proposed in a second step.

This series can be applied on git/andersson/remoteproc.git for-next branch (d9ff3a5789cb).

This series can be tested using rpmsgexport, rpmsgcreatedev and ping tools available here:
https://github.com/arnopo/rpmsgexport.git

Reference to the V4 discussion thread: https://lkml.org/lkml/2021/2/17/384

Arnaud Pouliquen (16):
  rpmsg: char: rename rpmsg_char_init to rpmsg_chrdev_init
  rpmsg: move RPMSG_ADDR_ANY in user API
  rpmsg: add short description of the IOCTL defined in UAPI.
  rpmsg: char: export eptdev create an destroy functions
  rpmsg: char: dissociate the control device from the rpmsg class
  rpmsg: move the rpmsg control device from rpmsg_char to rpmsg_ctrl
  rpmsg: update rpmsg_chrdev_register_device function
  rpmsg: glink: add sendto and trysendto ops
  rpmsg: smd: add sendto and trysendto ops
  rpmsg: char: use sendto to specify the message destination address
  rpmsg: virtio: register the rpmsg_ctrl device
  rpmsg: ctrl: introduce RPMSG_CREATE_DEV_IOCTL
  rpmsg: char: introduce __rpmsg_chrdev_create_eptdev function
  rpmsg: char: introduce a RPMsg driver for the RPMsg char device
  rpmsg: char: no dynamic endpoint management for the default one
  rpmsg: char: return an error if device already open

 drivers/rpmsg/Kconfig             |   9 ++
 drivers/rpmsg/Makefile            |   1 +
 drivers/rpmsg/qcom_glink_native.c |  18 ++-
 drivers/rpmsg/qcom_smd.c          |  18 ++-
 drivers/rpmsg/rpmsg_char.c        | 237 +++++++++++-------------------
 drivers/rpmsg/rpmsg_char.h        |  51 +++++++
 drivers/rpmsg/rpmsg_ctrl.c        | 229 +++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |  10 +-
 drivers/rpmsg/virtio_rpmsg_bus.c  |  57 ++++++-
 include/linux/rpmsg.h             |   3 +-
 include/uapi/linux/rpmsg.h        |  18 ++-
 11 files changed, 485 insertions(+), 166 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.h
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

-- 
2.17.1

