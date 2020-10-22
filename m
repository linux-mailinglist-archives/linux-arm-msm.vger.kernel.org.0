Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCFE295A2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 10:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895365AbgJVIWs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 04:22:48 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:54440 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895343AbgJVIWr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 04:22:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603354966; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=nz+6blzchbpU+rQzWL3pFAXSYM5FumNzY2VE8GR66fU=; b=nnD8YqongJPL+SRQN26qxiieqyj4sKfjpG4Gvy4g3VQxJpy/YhoJ32F65tFTvakEB9cShCwP
 ANmrKVyoS9Voedco1Nuj5AGguoqtHCg4Uodn0Z9iLNmW79B7FFQGzvfjI37QGzG2DVLT+oXL
 NpSBMvcBsiFpovXFyzeQr8lF0tE=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f914156a03b63d673593960 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Oct 2020 08:22:46
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2D319C43391; Thu, 22 Oct 2020 08:22:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3497BC433C9;
        Thu, 22 Oct 2020 08:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3497BC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v8 0/4] userspace MHI client interface driver
Date:   Thu, 22 Oct 2020 01:22:34 -0700
Message-Id: <1603354958-24025-1-git-send-email-hemantk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for UCI driver. UCI driver enables userspace
clients to communicate to external MHI devices like modem and WLAN. UCI driver
probe creates standard character device file nodes for userspace clients to
perform open, read, write, poll and release file operations. These file
operations call MHI core layer APIs to perform data transfer using MHI bus
to communicate with MHI device. Patch is tested using arm64 based platform.

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

V2: Added mutex lock to prevent multiple readers to access same
mhi buffer which can result into use after free.
Hemant Kumar (4):
  bus: mhi: core: Add helper API to return number of free TREs
  bus: mhi: core: Move MHI_MAX_MTU to external header file
  docs: Add documentation for userspace client interface
  bus: mhi: Add userspace client interface driver

 Documentation/mhi/index.rst     |   1 +
 Documentation/mhi/uci.rst       |  83 +++++
 drivers/bus/mhi/Kconfig         |  13 +
 drivers/bus/mhi/Makefile        |   4 +
 drivers/bus/mhi/core/internal.h |   1 -
 drivers/bus/mhi/core/main.c     |  12 +
 drivers/bus/mhi/uci.c           | 657 ++++++++++++++++++++++++++++++++++++++++
 include/linux/mhi.h             |  12 +
 8 files changed, 782 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/mhi/uci.rst
 create mode 100644 drivers/bus/mhi/uci.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

