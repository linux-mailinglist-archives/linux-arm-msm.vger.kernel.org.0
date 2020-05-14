Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 511F51D3230
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbgENOI0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:08:26 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:51809 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727844AbgENOI0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:08:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589465304; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=EaELdwL72LZARJzVfGD8REWhV4zJCeKpDmgE+q22Ucs=; b=eD1diURtJkS1WJJTsEOoKdEadXMmtfe7I9dLhHb+HPsKZDxP3PlNS3kWJ+wbWmVBLfjVW3tL
 a9xqusc00wEieqH0NAU3UY/DVrs7x65+mnKzerkS4n70cGR3ibsDjrO5bshhuzIvORS8JDpO
 F1EDbgsNnq2f4wnlnBrf9qzPPpM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd50c3.7f4d2b1e1688-smtp-out-n01;
 Thu, 14 May 2020 14:08:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8871AC432C2; Thu, 14 May 2020 14:08:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2EF1BC433D2;
        Thu, 14 May 2020 14:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2EF1BC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     manivannan.sadhasivam@linaro.org, bjorn.andersson@linaro.org,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
Date:   Thu, 14 May 2020 08:07:38 -0600
Message-Id: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduction:
Qualcomm Cloud AI 100 is a PCIe adapter card which contains a dedicated
SoC ASIC for the purpose of efficently running Deep Learning inference
workloads in a data center environment.

The offical press release can be found at -
https://www.qualcomm.com/news/releases/2019/04/09/qualcomm-brings-power-efficient-artificial-intelligence-inference

The offical product website is -
https://www.qualcomm.com/products/datacenter-artificial-intelligence

At the time of the offical press release, numerious technology news sites
also covered the product.  Doing a search of your favorite site is likely
to find their coverage of it.

It is our goal to have the kernel driver for the product fully upstream.
The purpose of this RFC is to start that process.  We are still doing
development (see below), and thus not quite looking to gain acceptance quite
yet, but now that we have a working driver we beleive we are at the stage
where meaningful conversation with the community can occur.

Design:

+--------------------------------+
|       AI application           |
|       (userspace)              |
+-------------+------------------+
              |
              | Char dev interface
              |
              |
+-------------+------------------+
|       QAIC driver              |
|       (kernel space)           |
|                                |
+----+------------------+--------+
     |                  |
     |                  |
     |                  |
     |                  |
     |Control path      | Data path
     |(MHI bus)         |
     |                  |
     |                  |
     |                  |
     |                  |
+--------------------------------+
| +--------+      +------------+ |
| | MHI HW |      |DMA Bridge  | |
| +--------+      |(DMA engine)| |
|                 +------------+ |
|                                |
|                                |
|                                |
|  Qualcomm Cloud AI 100 device  |
|                                |
|                                |
+--------------------------------+

A Qualcomm Cloud AI 100 device (QAIC device from here on) is a PCIe hardware
accelerator for AI inference workloads.  Over the PCIe bus fabric, a QAIC
device exposes two interfaces via PCI BARs - a MHI hardware region and a
DMA engine hardware region.

Before workloads can be run, a QAIC device needs to be initialized.  Similar
to other Qualcomm products with incorperate MHI, device firmware needs to be
loaded onto the device from the host.  This occurs in two stages.  First,
a secondary bootloader (SBL) needs to be loaded onto the device.  This occurs
via the BHI protocol, and is handled by the MHI bus.  Once the SBL loaded
and running, it activates the Sahara protocol.  The Sahara protocol is used
with a userspace application to load and initialize the remaining firmware.
The Sahara protocol and associated userspace application are outside the
scope of this series as they have no direct interaction with the QAIC driver.

Once a QAIC device is fully initialized, workloads can be sent to the device
and run.  This involves a per-device instance char dev that the QAIC driver
exposes to userspace.  Running a workload involves two phases - configuring the
device, and interacting with the workload.

To configure the device, commands are sent via a MHI channel.  This is referred
to as the control path.  A command is a single message.  A message contains
one or more transactions.  Transactions are operations that the device
is requested to perform.  Most commands are opaque to the kernel driver, however
some are not.  For example, if the user application wishes to DMA data to the
device, it requires the assistance of the kernel driver to translate the data
addresses to an address space that the device can understand.  In this instance
the transaction for DMAing the data is visible to the kernel driver, and the
driver will do the required transformation when encoding the message.

To interact with the workload, the workload is assigned a DMA Bridge Channel
(dbc).  This is dedicated hardware within the DMA engine.  Interacting with the
workload consists of sending it input data, and receiving output data.  The
user application requests appropiate buffers from the kernel driver, prepares
the buffers, and directs the kernel driver to queue them to the hardware.

The kernel driver is required to support multiple QAIC devices, and also N
users per device.

Status:
This series introduces the driver for QAIC devices, and builds up the minimum
functionality for running workloads.  Several features which have been omitted
or are still planned are indicated in the future work section.

Before exiting the RFC phase, and attempting full acceptance, we wish to
complete two features which are currently under development as we expect there
to be userspace interface changes as a result.

The first feature is a variable length control message between the kernel driver
and the device.  This allows us to support the total number of DMA transactions
we require for certain platforms, while minimizing memory usage.  The interface
impact of this would be to allow us to drop the size of the manage buffer
between userspace and the kernel driver from the current 16k, much of which is
wasted.

The second feature is an optimization and extension of the data path interface.
We plan to move the bulk of the data in the qaic_execute structure to the
qaic_mem_req structure, which optimized our critical path processing.  We also
plan to extend the qaic_execute structure to allow for a batch submit of
multiple buffers as an optimization and convenience for userspace.  

Future work:
For simplicity, we have omitted work related to the following features, and
intend to submit in future series:

-debugfs
-trace points
-hwmon (device telemetry)

We are also investigating what it might mean to support dma_bufs.  We expect
that such support would come as an extension of the interface.

Jeffrey Hugo (8):
  qaic: Add skeleton driver
  qaic: Add and init a basic mhi controller
  qaic: Create char dev
  qaic: Implement control path
  qaic: Implement data path
  qaic: Implement PCI link status error handlers
  qaic: Implement MHI error status handler
  MAINTAINERS: Add entry for QAIC driver

 MAINTAINERS                        |    7 +
 drivers/misc/Kconfig               |    1 +
 drivers/misc/Makefile              |    1 +
 drivers/misc/qaic/Kconfig          |   20 +
 drivers/misc/qaic/Makefile         |   12 +
 drivers/misc/qaic/mhi_controller.c |  538 +++++++++++++++++++
 drivers/misc/qaic/mhi_controller.h |   20 +
 drivers/misc/qaic/qaic.h           |  111 ++++
 drivers/misc/qaic/qaic_control.c   | 1015 ++++++++++++++++++++++++++++++++++++
 drivers/misc/qaic/qaic_data.c      |  952 +++++++++++++++++++++++++++++++++
 drivers/misc/qaic/qaic_drv.c       |  699 +++++++++++++++++++++++++
 include/uapi/misc/qaic.h           |  246 +++++++++
 12 files changed, 3622 insertions(+)
 create mode 100644 drivers/misc/qaic/Kconfig
 create mode 100644 drivers/misc/qaic/Makefile
 create mode 100644 drivers/misc/qaic/mhi_controller.c
 create mode 100644 drivers/misc/qaic/mhi_controller.h
 create mode 100644 drivers/misc/qaic/qaic.h
 create mode 100644 drivers/misc/qaic/qaic_control.c
 create mode 100644 drivers/misc/qaic/qaic_data.c
 create mode 100644 drivers/misc/qaic/qaic_drv.c
 create mode 100644 include/uapi/misc/qaic.h

-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
