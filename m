Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F4B1CB71A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 20:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgEHS1V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 14:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726636AbgEHS1V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 14:27:21 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88E78C05BD0A
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 11:27:20 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id z6so1092276plk.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 11:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ga/qNfK8qaYIuHphyvcsQekOQ1uu5eR07ZODaD6ZS2c=;
        b=snHrOFI3dZfBSVsw8yrMRHUktU3g+703SMyWNlei8TVfJqoiTewyN4bHs7Y7eRI3/e
         0MLcZNDTfHVR6J3gc7VTj47Y4xa4XDoIR/oQ056edpED21jcYAJDK4A/gxOwXs4hhSgY
         0DVK0hEJKGBXyzhaTsl+4CgOA97Z2a67JHy0Oy+l0w11QSyTPQ05hG7EduNjpRVnGFlZ
         0mIwqrSrzFto6eOKXsrT/XUb0DFo5QO2vsUMWxHizrOh4TLvkK9zfv8orTe70/MfImHI
         yoPH6FwHGILyo/ggT4Gp0gtcqCd9IGxdz09MHuGe6Itm3XPaxa1K2tLESAz737Mycx8p
         Ijxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ga/qNfK8qaYIuHphyvcsQekOQ1uu5eR07ZODaD6ZS2c=;
        b=IB0TTKMwvgZ6KlJj4hu+MSbqhtqbp2mVWsDGkLzpVOog64G+W3kwfBYpjKgTpugkCU
         bsGHK1Sml+Bmrq8O6uz1ctlv+qb7Xv1Vdy4MT6CiA2bcGOhfS3xUKzn+BF8uLpCFMgbF
         6drH5pOFvxtCh+LBurdfm4j9d2YZ1/PtJcyn54SmaAQmSjaVZ5SaX5HI8MaLRQWMMi1Y
         AZ2b/pRLXKApVjg6mlvApVyscQOzMiTVuRy8mwbB0Rb0nDix4NQobUEWebnpYfnk1twQ
         ai90hmJ4XM4mkipQh7WBQGkvbiwmPWiJqHJFqoZqy7fUOAZloAo27KAQFSDEdTYDiLOX
         zOVw==
X-Gm-Message-State: AGi0Pub5Tfdc69oapJw610dHihk3ra+ZbAdQrseRQvDJQH8TfzS9+71E
        2N94eroscglJUprp6KGd377k
X-Google-Smtp-Source: APiQypKRBb0cUNG9crvGty4AlyLXkEh/rGAGhwEozwfRy3MUySHBpJn78TRWQL4fcOsI5c1tdcGLTw==
X-Received: by 2002:a17:90a:8a09:: with SMTP id w9mr7085692pjn.95.1588962439483;
        Fri, 08 May 2020 11:27:19 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:9e:e39a:a052:f8c0:a37b:3255])
        by smtp.gmail.com with ESMTPSA id y24sm2248379pfn.211.2020.05.08.11.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 11:27:18 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     jassisinghbrar@gmail.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/3] Add Qualcomm IPCC driver support
Date:   Fri,  8 May 2020 23:57:00 +0530
Message-Id: <20200508182703.29021-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series adds mailbox driver support for Qualcomm Inter Processor
Communications Controller (IPCC) block found in MSM chipsets. This block
is used to route interrupts between modems, DSPs and APSS (Application
Processor Subsystem).

The driver is modeled as a mailbox+irqchip driver. The irqchip part helps
in receiving the interrupts from the IPCC clients such as modems, DSPs,
PCI-E etc... and forwards them to respective entities in APSS.
    
On the other hand, the mailbox part is used to send interrupts to the IPCC
clients from the entities of APSS.

This series is tested on SM8250-MTP board.

Thanks,
Mani

Changes in v2:

* Moved from soc/ to mailbox/
* Switched to static mbox channels
* Some misc cleanups

Manivannan Sadhasivam (3):
  dt-bindings: mailbox: Add devicetree binding for Qcom IPCC
  mailbox: Add support for Qualcomm IPCC
  MAINTAINERS: Add entry for Qualcomm IPCC driver

 .../bindings/mailbox/qcom-ipcc.yaml           |  77 +++++
 MAINTAINERS                                   |   8 +
 drivers/mailbox/Kconfig                       |  10 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/qcom-ipcc.c                   | 286 ++++++++++++++++++
 include/dt-bindings/mailbox/qcom-ipcc.h       |  33 ++
 6 files changed, 416 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
 create mode 100644 drivers/mailbox/qcom-ipcc.c
 create mode 100644 include/dt-bindings/mailbox/qcom-ipcc.h

-- 
2.17.1

