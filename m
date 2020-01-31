Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 556E714EDD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 14:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728683AbgAaNuT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 08:50:19 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:55032 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728500AbgAaNuT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 08:50:19 -0500
Received: by mail-pj1-f65.google.com with SMTP id dw13so2849774pjb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 05:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=juqgOO2FL60raSBrCGSqEUGB0rKVEh3eeYHpqpHB/eU=;
        b=s5ARJ9CROh+uPH+LpnaPq04a3AKX183oEk1aHAqV044nv5oq4gkZP3SJPiaQu6FKEV
         RY95MNXwujsxWQ1Hs3pUSWPGtKLJj2OPxWlKcMLU36fkCTlxloTvPFuSfz1TZLTYKGfg
         Uo7TWRmJIHs8dNdw0NA6rcjroWvpgUptSbY2E9DKQ0BpJ5aN5R6SxMQ0UaFIL+xBbOSb
         PZmr+r5xlURUYBhI3ykB/bWWtRqljNdoC/ACSf8uXvcqJvSoyZ6yAPg7kcpS/amwyB6e
         I9xvGciuu/O4+ZVmVmwwDuC5vgnZ8Nkwx/+HdDv+12/UCr/wucVqj95fH7BdN9sCW6GH
         Es0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=juqgOO2FL60raSBrCGSqEUGB0rKVEh3eeYHpqpHB/eU=;
        b=eI8rPJupXChexO6brB9TohhTD1b6Sgp7is1ZrLlBTpSm8v5zkvhbw4JEZMe7NsIA7z
         hqUPLOi5WyAHIjm4iUc60bKIsylmvdV1+A5GRCcP4awfjp07MD+02atek1iAqZi4wMRD
         34Gn4UhRl8JAbcpmzbrdzTr52Zw0IigNyyjK24CAKE2t6GLnP7bbXXHDReaa2dqtPJo4
         yy0IaXKh/kDxk2eOMMqZkujSVZSIaMyjYU5fe1JStMOhaThaLrXJ0GMBVxvO1eA2UTIf
         ux0spUoz7tnctHiCQJtOlHgo1YI99pWhRS63YyhcEvQW0v5AImDVpdrvtE+AqBnOgPqV
         mCVA==
X-Gm-Message-State: APjAAAWtivSq80KgaKeL5ZXH5X6fSuFGuhXvdafSbHWuYCPjnz6Mkbsy
        hiyTUOqtNM+Jp3ZWdBK7yCgiUQUP6Z7U
X-Google-Smtp-Source: APXvYqw3EYs11DXI0HUsb1OWhGJCrOfXuIxlhqTyTsaQA7mAoTeMiD9UttuANRhz6VzuDOlO3NO1UQ==
X-Received: by 2002:a17:90a:bd97:: with SMTP id z23mr5184198pjr.19.1580478618523;
        Fri, 31 Jan 2020 05:50:18 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id p3sm10625632pfg.184.2020.01.31.05.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 05:50:17 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 00/16] Add MHI bus support
Date:   Fri, 31 Jan 2020 19:19:53 +0530
Message-Id: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This is the second attempt at adding the MHI (Modem Host Interface) bus
interface to Linux kernel. MHI is a communication protocol used by the
host processors to control and communicate with modems over a high
speed peripheral bus or shared memory. The MHI protocol has been
designed and developed by Qualcomm Innovation Center, Inc., for use
in their modems.

The first submission was made by Sujeev Dias of Qualcomm:

https://lkml.org/lkml/2018/4/26/1159
https://lkml.org/lkml/2018/7/9/987

This series addresses most of the review comments by Greg and Arnd for
the initial patchset. Furthermore, in order to ease the review process
I've splitted the patches logically and dropped few of them which were
not required for this initial submission.

Below is the high level changelog:

1. Removed all DT related code
2. Got rid of pci specific struct members from top level mhi structs
3. Moved device specific callbacks like ul_xfer() to driver struct. It
   doesn’t make sense to have callbacks in device struct as suggested by
   Greg
4. Used priv data of `struct device` instead of own priv data in
   `mhi_device` as suggested by Greg. This will allow us to use
    dev_set{get}_drvdata() APIs in client drivers
5. Removed all debugfs related code
6. Changes to the APIs to look uniform
7. Converted the documentation to .rst and placed in its own subdirectory
8. Changes to the MHI device naming
9. Converted all uppercase variable names to appropriate lowercase ones
10. Removed custom debug code and used the dev_* ones where applicable
11. Dropped timesync, DTR, UCI, and Qcom controller related codes
12. Added QRTR client driver patch
13. Added modalias support for the MHI stack as well as client driver for
    autoloading of modules (client drivers) by udev once the MHI devices
    are created

This series includes the MHI stack as well as the QRTR client driver which
falls under the networking subsystem.

The reference controller implementation is here:
https://git.linaro.org/people/manivannan.sadhasivam/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=ath11k-qca6390-mhi
It will be submitted later along with ath11k patches.

Following developers deserve explicit acknowledgements for their
contributions to the MHI code:

Sujeev Dias
Siddartha Mohanadoss
Hemant Kumar
Jeff Hugo

Thanks,
Mani

Changes in v2:

* Added put_device to mhi_dealloc_device
* Removed unused members from struct mhi_controller
* Removed the atomicity of dev_wake in struct mhi_device as it is not required
* Reordered MHI structs to avoid holes
* Used struct device name for the controller device
* Marked the required and optional mhi_controller members for helping the
  controller driver implementation
* Cleanups to the MHI doc
* Removed _relaxed variants and used readl/writel
* Added comments for MHI specific acronyms
* Removed the usage of bitfields and used bitmasks for mhi_event_ctxt and
  mhi_chan_ctxt
* Used __64/__u32 types for structures representing hw states
* Added Hemant as a co-maintainer of MHI bus. He is from the MHI team of
  Qualcomm and he will take up reviews and if possible, maintainership
  in future.

Manivannan Sadhasivam (16):
  docs: Add documentation for MHI bus
  bus: mhi: core: Add support for registering MHI controllers
  bus: mhi: core: Add support for registering MHI client drivers
  bus: mhi: core: Add support for creating and destroying MHI devices
  bus: mhi: core: Add support for ringing channel/event ring doorbells
  bus: mhi: core: Add support for PM state transitions
  bus: mhi: core: Add support for basic PM operations
  bus: mhi: core: Add support for downloading firmware over BHIe
  bus: mhi: core: Add support for downloading RDDM image during panic
  bus: mhi: core: Add support for processing events from client device
  bus: mhi: core: Add support for data transfer
  bus: mhi: core: Add uevent support for module autoloading
  MAINTAINERS: Add entry for MHI bus
  net: qrtr: Add MHI transport layer
  net: qrtr: Do not depend on ARCH_QCOM
  soc: qcom: Do not depend on ARCH_QCOM for QMI helpers

 Documentation/index.rst           |    1 +
 Documentation/mhi/index.rst       |   18 +
 Documentation/mhi/mhi.rst         |  218 ++++
 Documentation/mhi/topology.rst    |   60 ++
 MAINTAINERS                       |   10 +
 drivers/bus/Kconfig               |    1 +
 drivers/bus/Makefile              |    3 +
 drivers/bus/mhi/Kconfig           |   14 +
 drivers/bus/mhi/Makefile          |    2 +
 drivers/bus/mhi/core/Makefile     |    3 +
 drivers/bus/mhi/core/boot.c       |  508 ++++++++++
 drivers/bus/mhi/core/init.c       | 1301 ++++++++++++++++++++++++
 drivers/bus/mhi/core/internal.h   |  699 +++++++++++++
 drivers/bus/mhi/core/main.c       | 1576 +++++++++++++++++++++++++++++
 drivers/bus/mhi/core/pm.c         |  967 ++++++++++++++++++
 drivers/soc/qcom/Kconfig          |    1 -
 include/linux/mhi.h               |  661 ++++++++++++
 include/linux/mod_devicetable.h   |   13 +
 net/qrtr/Kconfig                  |    8 +-
 net/qrtr/Makefile                 |    2 +
 net/qrtr/mhi.c                    |  207 ++++
 scripts/mod/devicetable-offsets.c |    3 +
 scripts/mod/file2alias.c          |   10 +
 23 files changed, 6284 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/mhi/index.rst
 create mode 100644 Documentation/mhi/mhi.rst
 create mode 100644 Documentation/mhi/topology.rst
 create mode 100644 drivers/bus/mhi/Kconfig
 create mode 100644 drivers/bus/mhi/Makefile
 create mode 100644 drivers/bus/mhi/core/Makefile
 create mode 100644 drivers/bus/mhi/core/boot.c
 create mode 100644 drivers/bus/mhi/core/init.c
 create mode 100644 drivers/bus/mhi/core/internal.h
 create mode 100644 drivers/bus/mhi/core/main.c
 create mode 100644 drivers/bus/mhi/core/pm.c
 create mode 100644 include/linux/mhi.h
 create mode 100644 net/qrtr/mhi.c

-- 
2.17.1

