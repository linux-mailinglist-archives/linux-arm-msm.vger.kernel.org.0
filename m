Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49DCB30EED4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 09:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235019AbhBDIqk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 03:46:40 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:35964 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234513AbhBDIqj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 03:46:39 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1148gaIh023708;
        Thu, 4 Feb 2021 09:45:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=SiG0MEvppxF8b3fsC1wVaBISBrWxyUvXbIRF7rDxtnc=;
 b=GKH+4aY+M5KIXR8/KFRP5UqTT2hBQXC2equxanAAhkdT3MmFKVkQMXjpWW9tcMu/XUT+
 3vju/cpcpqO7Te3eYMPZkom0Dv+uBuL1ggJcEt9qj8WDkFUtTo/yx9fgi+MeMYxDOf8/
 APrtDw0O8dk14lvWf57TumAVuQWrmUfsRbZjWO5iCP4aRvpqtqzSd1Y4XG/PwOwbpEuS
 sHCHLvZ5r+LH9FGgBsEQ0CVavjvlE/GnZ632ySHokpGf/XVnrujkBNPEtSa828iEpaKk
 +w3/hq/IoKvnucsYZSLwfy+iMaeFig2Jur0XP9v6QKY1vZEezw9SAW58X6l5CnjXRs0Z 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36ey7h7fv2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 04 Feb 2021 09:45:50 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 69F66100034;
        Thu,  4 Feb 2021 09:45:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C1E6D22AE42;
        Thu,  4 Feb 2021 09:45:49 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Feb 2021 09:45:49
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v3 00/15] introduce a generic IOCTL interface for RPMsg channels management
Date:   Thu, 4 Feb 2021 09:45:19 +0100
Message-ID: <20210204084534.10516-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-04_03:2021-02-04,2021-02-04 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series restructures the RPMsg char driver to decorrelate the control part and to
create a generic RPMsg ioctl interface compatible with other RPMsg services.

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
  - Extract the control part of the char dev and create the rpmsg_ctrl.c file (patches 1 to 5)
  - Enable the use of the chardev with the virtio backend (patches 6 to 10)
  - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL to instantiate RPMsg devices (patch 11)
    The application can then create or release a channel by specifying:
       - the name service of the device to instantiate.   
       - the source address.
       - the destination address.
  - Instantiate the /dev/rpmsg interface on remote NS announcement (patches 12 to 15)

In this revision, I do not divide the series into several parts in order to show a complete
picture of the proposed evolution. To simplify the review, as a next step, I can send it in
several steps listed above.

Known current Limitations:
- Tested only with virtio RPMsg bus. The glink and smd drivers adaptations have not been tested
  (not able to test it).
- For the virtio backend: No NS announcement is sent to the remote processor if the source
  address is set to RPMSG_ADDR_ANY.
- For the virtio backend: the existing RPMSG_CREATE_EPT_IOCTL is working but the endpoints are
  not attached to an exiting channel.

This series can be tested on top of the v5.11-rc5 (6ee1d745b7c9).

This series can be tested using rpmsgexport, rpmsgcreatedev and ping tools available here:
https://github.com/arnopo/rpmsgexport.git

Reference to the V2 discussion thread: https://lkml.org/lkml/2020/12/22/207

Arnaud Pouliquen (15):
  rpmsg: char: rename rpmsg_char_init to rpmsg_chrdev_init
  rpmsg: move RPMSG_ADDR_ANY in user API and document the API
  rpmsg: char: export eptdev create an destroy functions
  rpmsg: char: dissociate the control device from the rpmsg class
  rpmsg: move the rpmsg control device from rpmsg_char to rpmsg_ctrl
  rpmsg: update rpmsg_chrdev_register_device function
  rpmsg: virtio: probe the rpmsg_ctrl device
  rpmsg: glink: add sendto and trysendto ops
  rpmsg: smd: add sendto and trysendto ops
  rpmsg: char: use sendto to specify the message destination address
  rpmsg: ctrl: introduce RPMSG_CREATE_DEV_IOCTL
  rpmsg: char: introduce __rpmsg_chrdev_create_eptdev function
  rpmsg: char: introduce a RPMsg driver for the RPmsg char device
  rpmsg: char: no dynamic endpoint management for the default one
  rpmsg: char: return an error if device already open

 drivers/rpmsg/Kconfig             |   9 ++
 drivers/rpmsg/Makefile            |   1 +
 drivers/rpmsg/qcom_glink_native.c |  18 ++-
 drivers/rpmsg/qcom_smd.c          |  18 ++-
 drivers/rpmsg/rpmsg_char.c        | 237 +++++++++++-----------------
 drivers/rpmsg/rpmsg_char.h        |  51 ++++++
 drivers/rpmsg/rpmsg_ctrl.c        | 247 ++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |  10 +-
 drivers/rpmsg/virtio_rpmsg_bus.c  |  37 ++++-
 include/linux/rpmsg.h             |   3 +-
 include/uapi/linux/rpmsg.h        |  18 ++-
 11 files changed, 483 insertions(+), 166 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.h
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

-- 
2.17.1

