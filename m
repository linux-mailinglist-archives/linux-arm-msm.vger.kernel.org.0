Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97522CE5CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 03:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725979AbgLDCmq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 21:42:46 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:61677 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbgLDCmq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 21:42:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607049746; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UlnuFDZEr4coK9LP683YsaRoIhNC5rjOBPyID5rEGHQ=; b=W2I8SSFCs9EElWY/kdgnOrj4L67XOyQrVCA72ZprSYrnarC5KmcDcBFmddP8h+WE0vHPSKAt
 8oTnAwKICQV8OwEYba4oFC84mZ6xA5dSnWrUDUj6uxQveV9919PWAaTivBuFnvbkNcSlF70r
 2XxbWx4QYEqqXasmCwCFSE4J7QI=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fc9a1f7b50fb3818af4d882 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Dec 2020 02:41:59
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BB0B6C43466; Fri,  4 Dec 2020 02:41:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 58EDEC433C6;
        Fri,  4 Dec 2020 02:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 58EDEC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, netdev@vger.kernel.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [RESEND v15 0/4] userspace MHI client interface driver
Date:   Thu,  3 Dec 2020 18:41:47 -0800
Message-Id: <1607049711-31776-1-git-send-email-hemantk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for UCI driver. UCI driver enables userspace
clients to communicate to external MHI devices like modem and WLAN. UCI driver
probe creates standard character device file nodes for userspace clients to
perform open, read, write, poll and release file operations. These file
operations call MHI core layer APIs to perform data transfer using MHI bus
to communicate with MHI device. Patch is tested using arm64 and x86 based
platform.

v15:
- Updated documentation related to poll and release operations.

V14:
- Fixed device file node format to /dev/<mhi_dev_name> instead of
  /dev/mhi_<mhi_dev_name> because "mhi" is already part of mhi device name.
  For example old format: /dev/mhi_mhi0_QMI new format: /dev/mhi0_QMI.
- Updated MHI documentation to reflect index mhi controller name in
  QMI usage example.

V13:
- Removed LOOPBACK channel from mhi_device_id table from this patch series.
  Pushing a new patch series to add support for LOOPBACK channel and the user
  space test application. Also removed the description from kernel documentation.
- Added QMI channel to mhi_device_id table. QMI channel has existing libqmi
  support from user space.
- Updated kernel Documentation for QMI channel and provided external reference
  for libqmi.
- Updated device file node name by appending mhi device name only, which already
  includes mhi controller device name.

V12:
- Added loopback test driver under selftest/drivers/mhi. Updated kernel
  documentation for the usage of the loopback test application.
- Addressed review comments for renaming variable names, updated inline
  comments and removed two redundant dev_dbg.

V11:
- Fixed review comments for UCI documentation by expanding TLAs and rewording
  some sentences.

V10:
- Replaced mutex_lock with mutex_lock_interruptible in read() and write() file
  ops call back.

V9:
- Renamed dl_lock to dl_pending _lock and pending list to dl_pending for
  clarity.
- Used read lock to protect cur_buf.
- Change transfer status check logic and only consider 0 and -EOVERFLOW as
  only success.
- Added __int to module init function.
- Print channel name instead of minor number upon successful probe.

V8:
- Fixed kernel test robot compilation error by changing %lu to %zu for
  size_t.
- Replaced uci with UCI in Kconfig, commit text, and comments in driver
  code.
- Fixed minor style related comments.

V7:
- Decoupled uci device and uci channel objects. uci device is
  associated with device file node. uci channel is associated
  with MHI channels. uci device refers to uci channel to perform
  MHI channel operations for device file operations like read()
  and write(). uci device increments its reference count for
  every open(). uci device calls mhi_uci_dev_start_chan() to start
  the MHI channel. uci channel object is tracking number of times
  MHI channel is referred. This allows to keep the MHI channel in
  start state until last release() is called. After that uci channel
  reference count goes to 0 and uci channel clean up is performed
  which stops the MHI channel. After the last call to release() if
  driver is removed uci reference count becomes 0 and uci object is
  cleaned up.
- Use separate uci channel read and write lock to fine grain locking
  between reader and writer.
- Use uci device lock to synchronize open, release and driver remove.
- Optimize for downlink only or uplink only UCI device.

V6:
- Moved uci.c to mhi directory.
- Updated Kconfig to add module information.
- Updated Makefile to rename uci object file name as mhi_uci
- Removed kref for open count

V5:
- Removed mhi_uci_drv structure.
- Used idr instead of creating global list of uci devices.
- Used kref instead of local ref counting for uci device and
  open count.
- Removed unlikely macro.

V4:
- Fix locking to protect proper struct members.
- Updated documentation describing uci client driver use cases.
- Fixed uci ref counting in mhi_uci_open for error case.
- Addressed style related review comments.

V3: Added documentation for MHI UCI driver.

V2:
- Added mutex lock to prevent multiple readers to access same
- mhi buffer which can result into use after free.
Hemant Kumar (4):
  bus: mhi: core: Add helper API to return number of free TREs
  bus: mhi: core: Move MHI_MAX_MTU to external header file
  docs: Add documentation for userspace client interface
  bus: mhi: Add userspace client interface driver

 Documentation/mhi/index.rst     |   1 +
 Documentation/mhi/uci.rst       |  95 ++++++
 drivers/bus/mhi/Kconfig         |  13 +
 drivers/bus/mhi/Makefile        |   3 +
 drivers/bus/mhi/core/internal.h |   1 -
 drivers/bus/mhi/core/main.c     |  12 +
 drivers/bus/mhi/uci.c           | 664 ++++++++++++++++++++++++++++++++++++++++
 include/linux/mhi.h             |  12 +
 8 files changed, 800 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/mhi/uci.rst
 create mode 100644 drivers/bus/mhi/uci.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

