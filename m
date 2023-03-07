Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6E856AE441
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 16:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjCGPRl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 10:17:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjCGPR0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 10:17:26 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156E574DD5
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 07:14:25 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id i3so14409675plg.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 07:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678202064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LqmFNKWByCqJbPc1emmBvQnrjWKD9WeXgWA3mO4LgXA=;
        b=eJNN+L1QyFr8/aPosDFOsZAZewkHLl9B0giInwtXhhcgSiq5wZDk+VeDfqsZIpAv8K
         BYx3t8fWTA58WWqemhyuUJgncbMXdN8QB4MF9/SLP16gtoyiDWFYb9YU4kx8LL6vc+/E
         IyxMMIRP8o+t1KEoSxtZaYAyiScQS1qgssHLjdSgGsg/jTen01mYNEUwhgT3gqYnzo1v
         ixYpDgPj9Wy8BZHarDeOBJ63fxJC5yOUp0V/W90lofYoTPm/PweKzea4HMFjhKon8Xy8
         JwkoqvzNLBWPzYfUNAOwnWTlKlHNqB5Sh44o/lIl5VwKcv380KcdF4mE/suryomXPLy7
         2aZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678202064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqmFNKWByCqJbPc1emmBvQnrjWKD9WeXgWA3mO4LgXA=;
        b=gh0/VmGM9m0dOMPds7PrnoOl50j7E63+X8K8N5+1UiMvxyvj4UvyrWyzaWIBuNYzN9
         puG6VbuqgDnk4QGQQx711QEegGsW7GMOxg6s5EgqhxwE0JIaSTlzP9+VcolPtcLh8ZjB
         MzqOeadB6lM5WXt6grqM9xLdPBNkM8sCBmhlqVCGWIwQLc/PP7213bNv5J2jOR5DXvWm
         JzmWfaOXrHEZrAF3RyXB/8JEcE6BydOZYiKjjTl0XVndPYlQ/JYHcS+wu1+wmsTL7h3o
         TVIPe7kBHP0CYq6b+qnjHiRBVtjkwfKtGRSKdGXggJjseoKmg8yjB/iDRtryCYFez1/w
         kBxA==
X-Gm-Message-State: AO0yUKXR7J4ZVQgoPjavHMGY4x+Hs54wpjHcLc+dAg26R2r402KZoXJo
        YFC0WGsQTGmpy+0b73uLxeIdqtbb4IveyDXKwQ==
X-Google-Smtp-Source: AK7set8urN+ikv9lro4xI0oiCwl+HYfqV8TWEl87tn/XKPw8aAruKXJje5F1qn06uQtTTYTSKqvmKg==
X-Received: by 2002:a17:903:187:b0:19d:16fa:ba48 with SMTP id z7-20020a170903018700b0019d16faba48mr17970574plg.28.1678202064462;
        Tue, 07 Mar 2023 07:14:24 -0800 (PST)
Received: from localhost.localdomain ([59.97.52.140])
        by smtp.gmail.com with ESMTPSA id t8-20020a17090340c800b0019c2cf12d15sm8549332pld.116.2023.03.07.07.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 07:14:23 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com
Cc:     kishon@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/7] Add support for MHI Endpoint function driver
Date:   Tue,  7 Mar 2023 20:44:09 +0530
Message-Id: <20230307151416.176595-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series adds support for Modem Host Interface (MHI) Endpoint function
driver and few updates to the PCI endpoint core.

MHI
===

MHI is the communication protocol used by the host machines to control and
communicate with the Qualcomm modems/WLAN devices over any high speed physical
bus like PCIe. In Linux kernel, MHI is modeled as a bus driver [1] and there
are two instances of MHI used in a typical setup.

1. MHI host - MHI implementation for the host machines like x86/ARM64.
2. MHI Endpoint - MHI implementation for the endpoint devices like modems.

MHI EPF
=======

The MHI Endpoint function driver (MHI EPF) is used on the MHI endpoint devices
like modems. The MHI EPF driver sits in between the PCIe EP and MHI EP bus and
carries out all of the PCIe related activities like BAR config, PCIe Event
handling, MMIO read/write etc,... for the MHI EP bus.

Below is the simple representation of the setup:


                 +----------------------------------------------------+
                 |                  Endpoint CPU                      |                   
                 |                                                    |
+------------+   |   +------------+   +-----------+   +-----------+   |
|            |   |   |            |   |           |   |           |   |
|            |   |   |   MHI EP   |   |           |   |           |   | PCIe Bus
|  Modem DSP +---+---+    Bus     +---+  MHI EPF  +---+  PCIe EP  +---+---------
|            |   |   |            |   |           |   |           |   |
|            |   |   |            |   |           |   |           |   |
+------------+   |   +------------+   +-----------+   +-----------+   |
                 |                                                    |
                 |                                                    |
                 +----------------------------------------------------+

The data packets will be read from the Modem DSP by the MHI stack and will be
transmitted to the host machine over PCIe bus with the help of MHI EPF driver.

Test setup
==========

This series has been tested on Snapdragon X55 modem a.k.a SDX55 connected to
the ARM64 host machine.

Thanks,
Mani

[1] https://www.kernel.org/doc/html/latest/mhi/mhi.html

Changes in v2:

* Rebased on top of v6.3-rc1
* Switched to the new callback interface for passing events from EPC to EPF
* Dropped one patch related to notifier

Manivannan Sadhasivam (7):
  PCI: endpoint: Pass EPF device ID to the probe function
  PCI: endpoint: Warn and return if EPC is started/stopped multiple
    times
  PCI: endpoint: Add linkdown notifier support
  PCI: endpoint: Add BME notifier support
  PCI: qcom-ep: Add support for Link down notification
  PCI: qcom-ep: Add support for BME notification
  PCI: endpoint: Add PCI Endpoint function driver for MHI bus

 drivers/pci/controller/dwc/pcie-qcom-ep.c     |   2 +
 drivers/pci/endpoint/functions/Kconfig        |  10 +
 drivers/pci/endpoint/functions/Makefile       |   1 +
 drivers/pci/endpoint/functions/pci-epf-mhi.c  | 454 ++++++++++++++++++
 drivers/pci/endpoint/functions/pci-epf-ntb.c  |   3 +-
 drivers/pci/endpoint/functions/pci-epf-test.c |   2 +-
 drivers/pci/endpoint/pci-ep-cfs.c             |   3 +
 drivers/pci/endpoint/pci-epc-core.c           |  52 ++
 drivers/pci/endpoint/pci-epf-core.c           |   8 +-
 include/linux/pci-epc.h                       |   2 +
 include/linux/pci-epf.h                       |   8 +-
 11 files changed, 539 insertions(+), 6 deletions(-)
 create mode 100644 drivers/pci/endpoint/functions/pci-epf-mhi.c

-- 
2.25.1

