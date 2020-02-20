Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1839165ABB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 10:59:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgBTJ7F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 04:59:05 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:50707 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbgBTJ7E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 04:59:04 -0500
Received: by mail-pj1-f67.google.com with SMTP id r67so674270pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2020 01:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AnTe6KsYAt7hdn53Y5PcRUqdjTL4lw4b9ZC8/N4/PUk=;
        b=N/pRSTMcqWrO3WYCYNgtANPiHF2r2pSF2s/9yROeWAnGxbRWgr/xnj7xNgAF9XXHqm
         7UN3vhnqH84C2cQVZHrPLpK1imhwdQnfjVE76JXPmIg+QG+gQA9tVeWO57ZmYBt2mtFe
         SuWYX/XusnZtF/bLuHhgJmAiVO+3gvU510krdgzk0eAj50wvnQpgpufdRjCJwWWGR7kP
         km2QqzxkJqjSJQQb0A51BUFYfB6OqYf2puxvXR0kbOvcmmVByO6jddaC6REpSCm2g6qf
         0itlbPhd443cCBMQ6ofw4ZO5w+LSVg1YL6SFbdqZ/mmgaQva8gOztPFGr3r+Lx5vgzmA
         hyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AnTe6KsYAt7hdn53Y5PcRUqdjTL4lw4b9ZC8/N4/PUk=;
        b=dfeOSkXXogiA7+X1vTcGWBXqyRFs8rNU4tA3dLoxwaY3oIyvoaQutbSTorhDvOu5an
         L6UbFAiV9ObIy8T0FjYK5nFZgIgxz8vBFsSUDx0Gfv1LAGT5oMOn/RHSkXtd2bw2IVZX
         VCkrTSY/c2Ea6B9WiXC4Ol6kPy0YTamJ5DAVwda1V4IzzTtjkmm0SifJWzNi7REywcfe
         x2VPMFSeLyHuQlDxlyZtozaJzbgbpEFMIamNZKS4XmvyLH2bDi1n/oBW5vwg3wDjLMtc
         J8Y+wt7/LuxqGlZyI5wDmIRI5V4fw6N6ENiSZXoXgs82Rb0z1tZE+AlI2f2XokOcn4ME
         BEQA==
X-Gm-Message-State: APjAAAVeeHbdNN01t7+XFPDMvKP1VGsorfqbTh1aEaCtB2acyn0B3dwS
        AZ3VR5Sth83ae+zVjrxeuS4x
X-Google-Smtp-Source: APXvYqzmjWPsBhB7jzR9hy7JvvVmtBcNfYvpbYuDzhnkHKMzio4gWCgkVSzxB8gA38kUoFxiwVzyDg==
X-Received: by 2002:a17:902:868e:: with SMTP id g14mr30692771plo.87.1582192743190;
        Thu, 20 Feb 2020 01:59:03 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:315:9501:edda:4222:88ae:442f])
        by smtp.gmail.com with ESMTPSA id b3sm2678644pjo.30.2020.02.20.01.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 01:59:02 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 00/16] Add MHI bus support
Date:   Thu, 20 Feb 2020 15:28:38 +0530
Message-Id: <20200220095854.4804-1-manivannan.sadhasivam@linaro.org>
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

Changes in v3:

* Fixed the MHI dev refcounting issue and avoided the use of nullifying the
  mhi_dev pointer in mhi_release_device
* Fixed the kref issue in QRTR MHI client driver
* Renamed mhi_cntrl->dev to mhi_cntrl->cntrl_dev to avoid confusion
* Exposed mhi_queue_* APIs to client drivers and got rid of queue_xfer callback
* Removed mhi_buf_type as it is no longer required
* Misc cleanups in the MHI stack
* Added Jeff's Reviewed-by and Tested-by tags

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
 Documentation/mhi/mhi.rst         |  218 +++++
 Documentation/mhi/topology.rst    |   60 ++
 MAINTAINERS                       |   10 +
 drivers/bus/Kconfig               |    1 +
 drivers/bus/Makefile              |    3 +
 drivers/bus/mhi/Kconfig           |   14 +
 drivers/bus/mhi/Makefile          |    2 +
 drivers/bus/mhi/core/Makefile     |    3 +
 drivers/bus/mhi/core/boot.c       |  507 ++++++++++
 drivers/bus/mhi/core/init.c       | 1264 ++++++++++++++++++++++++
 drivers/bus/mhi/core/internal.h   |  677 +++++++++++++
 drivers/bus/mhi/core/main.c       | 1516 +++++++++++++++++++++++++++++
 drivers/bus/mhi/core/pm.c         |  969 ++++++++++++++++++
 drivers/soc/qcom/Kconfig          |    1 -
 include/linux/mhi.h               |  666 +++++++++++++
 include/linux/mod_devicetable.h   |   13 +
 net/qrtr/Kconfig                  |    8 +-
 net/qrtr/Makefile                 |    2 +
 net/qrtr/mhi.c                    |  209 ++++
 scripts/mod/devicetable-offsets.c |    3 +
 scripts/mod/file2alias.c          |   10 +
 23 files changed, 6173 insertions(+), 2 deletions(-)
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

