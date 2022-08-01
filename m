Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24E465872C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Aug 2022 23:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234706AbiHAVN6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Aug 2022 17:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232288AbiHAVN5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Aug 2022 17:13:57 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78C317E09;
        Mon,  1 Aug 2022 14:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659388436; x=1690924436;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7/tWAflxyqIo678fOHVIkwOsMaWGqaeFe9w4NSliGMs=;
  b=f13btQkwxC9HuCsiqHS0B6r2hSpPaNGroQIIiZH72EfkYdIq51YkMPNJ
   wcoYCP9kW1xeqHd66WycVofxbXmS535XiHa5IT09O+8xZmX04bNWQyQ/L
   jQHWbPVrDx+Brq/JbbUGCVnzMtA2o/qx8WPjpoYXq1RdOL+Ju+lYLBUui
   A=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Aug 2022 14:13:56 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 14:13:55 -0700
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 1 Aug 2022 14:13:54 -0700
From:   Elliot Berman <quic_eberman@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Elliot Berman <quic_eberman@quicinc.com>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Srivatsa Vaddagiri" <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Marc Zyngier" <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 00/11] Drivers for gunyah hypervisor
Date:   Mon, 1 Aug 2022 14:12:29 -0700
Message-ID: <20220801211240.597859-1-quic_eberman@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Gunyah is a Type-1 hypervisor independent of any
high-level OS kernel, and runs in a higher CPU privilege level. It does
not depend on any lower-privileged OS kernel/code for its core
functionality. This increases its security and can support a much smaller
trusted computing base than a Type-2 hypervisor.

Gunyah is an open source hypervisor. The source repo is available at
https://github.com/quic/gunyah-hypervisor.

The diagram below shows the architecture.

::

        Primary VM           Secondary VMs
     +-----+ +-----+  | +-----+ +-----+ +-----+
     |     | |     |  | |     | |     | |     |
 EL0 | APP | | APP |  | | APP | | APP | | APP |
     |     | |     |  | |     | |     | |     |
     +-----+ +-----+  | +-----+ +-----+ +-----+
 ---------------------|-------------------------
     +--------------+ | +----------------------+
     |              | | |                      |
 EL1 | Linux Kernel | | |Linux kernel/Other OS |   ...
     |              | | |                      |
     +--------------+ | +----------------------+
 --------hvc/smc------|------hvc/smc------------
     +----------------------------------------+
     |                                        |
 EL2 |            Gunyah Hypervisor           |
     |                                        |
     +----------------------------------------+

Gunyah provides these following features.

- Threads and Scheduling: The scheduler schedules virtual CPUs (VCPUs) on
physical CPUs and enables time-sharing of the CPUs.
- Memory Management: Gunyah tracks memory ownership and use of all memory
under its control. Memory partitioning between VMs is a fundamental
security feature.
- Interrupt Virtualization: All interrupts are handled in the hypervisor
and routed to the assigned VM.
- Inter-VM Communication: There are several different mechanisms provided
for communicating between VMs.
- Device Virtualization: Para-virtualization of devices is supported using
inter-VM communication. Low level system features and devices such as
interrupt controllers are supported with emulation where required.

Elliot Berman (11):
  docs: gunyah: Introduce Gunyah Hypervisor
  dt-bindings: Add binding for gunyah hypervisor
  arm64: gunyah: Add Gunyah hypercalls ABI
  gunyah: Common types and error codes for Gunyah hypercalls
  virt: gunyah: Add sysfs nodes
  virt: gunyah: Add capabilities bus and devices
  gunyah: msgq: Add Gunyah message queues
  gunyah: rsc_mgr: Add resource manager RPC core
  gunyah: rsc_mgr: Add auxiliary devices for console
  gunyah: rsc_mgr: Add RPC for console services
  gunyah: Add tty console driver for RM Console Serivces

 .../ABI/testing/sysfs-hypervisor-gunyah       |  37 +
 .../bindings/firmware/gunyah-hypervisor.yaml  |  84 +++
 Documentation/virt/gunyah/index.rst           |  99 +++
 Documentation/virt/gunyah/message-queue.rst   |  52 ++
 Documentation/virt/index.rst                  |   1 +
 MAINTAINERS                                   |  12 +
 arch/arm64/include/asm/gunyah.h               | 142 ++++
 drivers/virt/Kconfig                          |   1 +
 drivers/virt/Makefile                         |   1 +
 drivers/virt/gunyah/Kconfig                   |  24 +
 drivers/virt/gunyah/Makefile                  |   8 +
 drivers/virt/gunyah/device.c                  | 108 +++
 drivers/virt/gunyah/gunyah_private.h          |  18 +
 drivers/virt/gunyah/msgq.c                    | 223 ++++++
 drivers/virt/gunyah/rsc_mgr.c                 | 682 ++++++++++++++++++
 drivers/virt/gunyah/rsc_mgr.h                 |  56 ++
 drivers/virt/gunyah/rsc_mgr_console.c         | 405 +++++++++++
 drivers/virt/gunyah/rsc_mgr_rpc.c             | 151 ++++
 drivers/virt/gunyah/sysfs.c                   | 176 +++++
 include/linux/gunyah.h                        | 133 ++++
 include/linux/gunyah_rsc_mgr.h                |  45 ++
 21 files changed, 2458 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-hypervisor-gunyah
 create mode 100644 Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
 create mode 100644 Documentation/virt/gunyah/index.rst
 create mode 100644 Documentation/virt/gunyah/message-queue.rst
 create mode 100644 arch/arm64/include/asm/gunyah.h
 create mode 100644 drivers/virt/gunyah/Kconfig
 create mode 100644 drivers/virt/gunyah/Makefile
 create mode 100644 drivers/virt/gunyah/device.c
 create mode 100644 drivers/virt/gunyah/gunyah_private.h
 create mode 100644 drivers/virt/gunyah/msgq.c
 create mode 100644 drivers/virt/gunyah/rsc_mgr.c
 create mode 100644 drivers/virt/gunyah/rsc_mgr.h
 create mode 100644 drivers/virt/gunyah/rsc_mgr_console.c
 create mode 100644 drivers/virt/gunyah/rsc_mgr_rpc.c
 create mode 100644 drivers/virt/gunyah/sysfs.c
 create mode 100644 include/linux/gunyah.h
 create mode 100644 include/linux/gunyah_rsc_mgr.h

-- 
2.25.1

