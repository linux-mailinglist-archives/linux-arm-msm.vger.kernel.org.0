Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAE214667A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 12:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgAWLSr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 06:18:47 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39182 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgAWLSq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 06:18:46 -0500
Received: by mail-pg1-f194.google.com with SMTP id 4so1224060pgd.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 03:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=14Cy2AtRziplQARjpP+FrR2VzeYvgJNHCuR6KyfvDnc=;
        b=c1uwStnI3pw+CyVU02GmTzCb6/Sk3dbPOf6YRPUAkeLihhwCTvNjdH7DXdOPgI+33h
         miBhW0Rx5MNNHmg0hiOxZP7LE++pRraXLcRppWE0jX8+U1defSmSW6nMHCQmU6bXo97D
         TC9Z88VXbUl+2Hy3YP8YTtQBGbaAjjc8yvQ+h5ylyJGP8AGr5AqsGnCxZ2uoEROZVVVC
         mdOPtlCXbgmxAqsctTIFapJ1aLuBI1AAngLGPNSKeROfZr7p4PmqVwZWW+WQHnmSS2bW
         4iOaBiAg058GXdF88KmFm2wphA7hQIa2txufi7moWKbn7TRu8Xv6K13sjjVtkcgFK6Ss
         O5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=14Cy2AtRziplQARjpP+FrR2VzeYvgJNHCuR6KyfvDnc=;
        b=dVqCnqS6bizloVY0mk7cjowTFpCP+xbu40hMMXITR8BgbSXhoVQerlukNU0FRcHcPT
         +L9POcRUpQHcIE/MPjB0WDg1w5YY+56KSwEzi5sqb+qMyDSrMuAy2gWc673hfBcLjzOq
         /xM0M4YxlNXhTKQiGP7am4v7x3SaCjN1bt2g7XVVqbvkPDuW4S1rkTuI63g77qHuGQH7
         f4fiCbDH7FX/RJ1lB/WdSa0lGzsb9t3RQgqRoJZzJ8d9BTf4hQ4dJMaW9TWuFlSiI1bk
         55wGXTjQb4A6SdR2K0Gb2DOVDM4AThICQhCleyKMboJHmQONAfj1cPgIXwCkgVaVfUDw
         k4DA==
X-Gm-Message-State: APjAAAVmMCvXhMUw9x8ixnLwHLfOrZUKK7Vcf4ESlZXfKot2Ssm4iqeR
        UJGr3Fuv0CiuONAtYbD9rUPz
X-Google-Smtp-Source: APXvYqyqC3eUfkfrQEUKQvNcDTgCszFR5IkBKoptYJBKRY6DV0EUkpI0hVPoIO4AJQtL2ne3pmGomw==
X-Received: by 2002:a63:213:: with SMTP id 19mr3436961pgc.160.1579778325593;
        Thu, 23 Jan 2020 03:18:45 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id y6sm2627559pgc.10.2020.01.23.03.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 03:18:44 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/16] Add MHI bus support
Date:   Thu, 23 Jan 2020 16:48:20 +0530
Message-Id: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
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

Following developers deserve explicit acknowledgements for their
contributions to the MHI code:

Sujeev Dias
Siddartha Mohanadoss
Hemant Kumar
Jeff Hugo

Thanks,
Mani

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
 MAINTAINERS                       |    9 +
 drivers/bus/Kconfig               |    1 +
 drivers/bus/Makefile              |    3 +
 drivers/bus/mhi/Kconfig           |   14 +
 drivers/bus/mhi/Makefile          |    2 +
 drivers/bus/mhi/core/Makefile     |    3 +
 drivers/bus/mhi/core/boot.c       |  510 ++++++++++
 drivers/bus/mhi/core/init.c       | 1283 +++++++++++++++++++++++
 drivers/bus/mhi/core/internal.h   |  703 +++++++++++++
 drivers/bus/mhi/core/main.c       | 1581 +++++++++++++++++++++++++++++
 drivers/bus/mhi/core/pm.c         |  974 ++++++++++++++++++
 drivers/soc/qcom/Kconfig          |    1 -
 include/linux/mhi.h               |  680 +++++++++++++
 include/linux/mod_devicetable.h   |   13 +
 net/qrtr/Kconfig                  |    8 +-
 net/qrtr/Makefile                 |    2 +
 net/qrtr/mhi.c                    |  207 ++++
 scripts/mod/devicetable-offsets.c |    3 +
 scripts/mod/file2alias.c          |   10 +
 23 files changed, 6302 insertions(+), 2 deletions(-)
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

