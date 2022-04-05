Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8274F4BA2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 03:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbiDEXD5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 19:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443697AbiDEPkK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 11:40:10 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BAD184611
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 06:58:03 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id h23-20020a17090a051700b001c9c1dd3acbso2724237pjh.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 06:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f3cL3OuTxYyFqr6M8zOEW/P2Lw33dyUhakN8IC6Qe50=;
        b=VQ73E+kKcHlJW9Hvkiv89i7Nj5O6bVk5SsgiOeDhmrBkhCVwqMH/mroJ9i2JH0uLHd
         rpiQ9auQdbMl26GbkI381Z8lbbDkyDRX269g4lGoCvJJqEO7P83Z+vHGV+bLoQ3YI5uU
         F0YWqBHdLYDwx1XhXP50Cw68ifVpckPxZnP50PpJoYUlvw5irws0kHfdBaa92e1Kk42A
         JVgVOqiOSZD/7G3+6TYp17Wwy/FqnLr5NrJcSH639tiiKdNCICoF+gMTxlbVlqlGMMuk
         M0bnKoPbpKOAzBMKk92NeS2MCz9zpjBFhTYhfZ5jMiAnxV9ECCe9JE766NXmxeAb5JJ2
         PgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f3cL3OuTxYyFqr6M8zOEW/P2Lw33dyUhakN8IC6Qe50=;
        b=sfRjLCoM1C9w0m/L6d0ECadpBicFNn2fzsd9iJrJR4+6YdlfIV266HNMklYqRdhLN3
         uDFO/zo+ntM38kpU17TSajy2C7tl7d0w3a4NLesW4lVrRsu4aaOVd/U/r9xerdYTh+JZ
         H70n5dg+Ga4Za0XI8esyvO+zzomZaSTnO+GPo0Moa8SJVwK8n1J7sWhR677yWjUWugLA
         dw2qOMrGKy+c8DL0nXNKvg0a9hRfQ1hs/ep0caQjDCiLTIXtNJBY+ksNMTATWJZFBqxy
         KjrbV5QwDPeIUDD87K+vTxkHYKjQbdmNEa9GmJVEKBZlXE4AccyW37OJQCFzP9cjhdav
         dQ0w==
X-Gm-Message-State: AOAM531E9/nqW0msTjYfeKzEj/o/0gSwyFehO7UnAaJ22EFMJFZ4yBD7
        m6d3H1MD8UwhJ4Z2m+8b4F/w
X-Google-Smtp-Source: ABdhPJw4F46YOXIn0VllY276bZ3TuPstSS35cX0TBQamRYSIfV9lCLK/lb04s9DDZOlNSZEmp9lY/w==
X-Received: by 2002:a17:90a:ce:b0:1ca:308:977f with SMTP id v14-20020a17090a00ce00b001ca0308977fmr4302606pjd.195.1649167083214;
        Tue, 05 Apr 2022 06:58:03 -0700 (PDT)
Received: from localhost.localdomain ([59.92.98.98])
        by smtp.gmail.com with ESMTPSA id u14-20020a056a00124e00b004fab8f3245fsm16785402pfi.149.2022.04.05.06.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 06:58:02 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        elder@linaro.org, mhi@lists.linux.dev, quic_hemantk@quicinc.com,
        quic_bbhatt@quicinc.com, quic_jhugo@quicinc.com,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/18] Add initial support for MHI endpoint stack
Date:   Tue,  5 Apr 2022 19:27:36 +0530
Message-Id: <20220405135754.6622-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here is the series for adding the initial support for the MHI bus
implementation in Endpoint devices (EP) like PCIe based SDX55 modems from
Qualcomm. This MHI EP stack runs on the modem itself and communicates with
the host MHI stack [1] over a physical bus like PCIe. The usecase of this
stack is to carry the data packets from modem DSP to provide data
connectivity to the host machine.

All these patches were submitted to mhi-list previously and reviewed by the
developers from Linaro and Qualcomm. Please find the summary below:

---

This series adds initial support for the Qualcomm specific Modem Host Interface
(MHI) bus in endpoint devices like SDX55 modems. The MHI bus in endpoint devices
communicates with the MHI bus in host machines like x86 over any physical bus
like PCIe. The MHI host support is already in mainline [1] and been used to get
data connectivity from PCIe based modems and WLAN devices running vendor code
(downstream). This effort is to upstream the software stack that runs on the
modem itself.

Overview
========

This series aims at adding the MHI support in the endpoint devices with the goal
of getting data connectivity using the mainline kernel running on the modems.
Modems here refer to the combination of an APPS processor (Cortex A grade) and
a baseband processor (DSP). The MHI bus is located in the APPS processor and it
transfers data packets from the baseband processor to the host machine.

The MHI Endpoint (MHI EP) stack proposed here is inspired by the downstream
code written by Qualcomm. But the complete stack is mostly re-written to adapt
to the "bus" framework and made it modular so that it can work with the upstream
subsystems like "PCI Endpoint". The code structure of the MHI endpoint stack
follows the MHI host stack to maintain uniformity.

With this initial MHI EP stack (along with few other drivers), we can establish
the network interface between host and endpoint over the MHI software channels
(IP_SW0) and can do things like IP forwarding, SSH, etc...

Stack Organization
==================

The MHI EP stack has the concept of controller and device drivers as like the
MHI host stack. The MHI EP controller driver can be a PCI Endpoint Function
driver and the MHI device driver can be a MHI EP Networking driver or QRTR
driver. The MHI EP controller driver is tied to the PCI Endpoint subsystem and
handles all bus related activities like mapping the host memory, raising IRQ,
passing link specific events etc... The MHI EP networking driver is tied to the
Networking stack and handles all networking related activities like
sending/receiving the SKBs from netdev, statistics collection etc...

This series only contains the MHI EP code, whereas the PCIe EPF driver and MHI
EP Networking drivers are not yet submitted and can be found here [2]. Though
the MHI EP stack doesn't have the build time dependency, it cannot function
without them.

Test setup
==========

This series has been tested on Telit FN980 TLB board powered by Qualcomm SDX55
(a.k.a X55 modem) and Qualcomm SM8450 based dev board.

For testing the stability and performance, networking tools such as iperf, ssh
and ping are used.

Limitations
===========

We are not _yet_ there to get the data packets from the modem as that involves
the Qualcomm IP Accelerator (IPA) integration with MHI endpoint stack. But we
are planning to add support for it in the coming days.

References
==========

MHI bus: https://www.kernel.org/doc/html/latest/mhi/mhi.html
Linaro connect presentation around this topic: https://connect.linaro.org/resources/lvc21f/lvc21f-222/

Thanks,
Mani

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi
[2] https://git.linaro.org/landing-teams/working/qualcomm/kernel.git/log/?h=tracking-qcomlt-sdx55-drivers

Manivannan Sadhasivam (18):
  bus: mhi: ep: Add support for registering MHI endpoint controllers
  bus: mhi: ep: Add support for registering MHI endpoint client drivers
  bus: mhi: ep: Add support for creating and destroying MHI EP devices
  bus: mhi: ep: Add support for managing MMIO registers
  bus: mhi: ep: Add support for ring management
  bus: mhi: ep: Add support for sending events to the host
  bus: mhi: ep: Add support for managing MHI state machine
  bus: mhi: ep: Add support for processing MHI endpoint interrupts
  bus: mhi: ep: Add support for powering up the MHI endpoint stack
  bus: mhi: ep: Add support for powering down the MHI endpoint stack
  bus: mhi: ep: Add support for handling MHI_RESET
  bus: mhi: ep: Add support for handling SYS_ERR condition
  bus: mhi: ep: Add support for processing command rings
  bus: mhi: ep: Add support for reading from the host
  bus: mhi: ep: Add support for processing channel rings
  bus: mhi: ep: Add support for queueing SKBs to the host
  bus: mhi: ep: Add support for suspending and resuming channels
  bus: mhi: ep: Add uevent support for module autoloading

 drivers/bus/mhi/Kconfig         |    1 +
 drivers/bus/mhi/Makefile        |    3 +
 drivers/bus/mhi/common.h        |   22 +
 drivers/bus/mhi/ep/Kconfig      |   10 +
 drivers/bus/mhi/ep/Makefile     |    2 +
 drivers/bus/mhi/ep/internal.h   |  218 +++++
 drivers/bus/mhi/ep/main.c       | 1591 +++++++++++++++++++++++++++++++
 drivers/bus/mhi/ep/mmio.c       |  273 ++++++
 drivers/bus/mhi/ep/ring.c       |  207 ++++
 drivers/bus/mhi/ep/sm.c         |  148 +++
 include/linux/mhi_ep.h          |  277 ++++++
 include/linux/mod_devicetable.h |    2 +
 scripts/mod/file2alias.c        |   10 +
 13 files changed, 2764 insertions(+)
 create mode 100644 drivers/bus/mhi/ep/Kconfig
 create mode 100644 drivers/bus/mhi/ep/Makefile
 create mode 100644 drivers/bus/mhi/ep/internal.h
 create mode 100644 drivers/bus/mhi/ep/main.c
 create mode 100644 drivers/bus/mhi/ep/mmio.c
 create mode 100644 drivers/bus/mhi/ep/ring.c
 create mode 100644 drivers/bus/mhi/ep/sm.c
 create mode 100644 include/linux/mhi_ep.h

-- 
2.25.1

