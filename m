Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E847E2E9631
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 14:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbhADNmu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 08:42:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbhADNmt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 08:42:49 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32AF8C061793
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 05:42:09 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d26so32152941wrb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 05:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=TsXzaolPG+4/DxFQ+wNyy6vTkUtk6EMcg+O9G8FFv24=;
        b=j+O67jSY2wQccURwFAp0tJ7XhBcsjGoFICS7S15QHlBE0C+n7bPIh+wTkljj18+yhK
         lTas3DfDAiKkV8TXncLmGyJfXcDAiMCaBjltuZ0YShLWugJV4fyhDqd7FmdcqMfwsUsK
         N/250VRZNs8+QTOd5J608QCp3ywAlA8G8BoPvHixsNejBKNZnxjNRnAF6gE4wp6FObGJ
         06NuBKgpU7HJFETxZQHPnFTaidm6ZilvVgKGUYVeE7+F0Oqv/kv6oTKAxrWNE+7uUXAy
         y/zbHqBIlROst8jXxE0XGGuj+Ymxm8RCCAApaCTnD+CgMTdiLGtpci+NtPvqrnOMgO3j
         zm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TsXzaolPG+4/DxFQ+wNyy6vTkUtk6EMcg+O9G8FFv24=;
        b=ELSnp/Y8Feg40UnW4nHMaE7DJJ1s3k5PCU6ceAAntgfDLG/xeJh1iYQANBZM9R/61d
         hU4neJYIKzS0LqUteaBw+u6/6/IR80zJgtHt+pAMA7I/axUYWYSFRtVh3sR3dIS/J4CX
         DYU/KaWbQ5YQS4Vw3RXwlWaXe0VMQSA1pa7D1KbojdM79E/XrmR8P9fh3KHtUWUMZcQN
         apAkaKkCpu9/acH7gqSJXnD2+tgbvM4eoWhmOKGSd5qcCzPcmQTr5NCh9fYfeoux0Lck
         J04IsG4ltXHaNRSGlBdpamB5aGJjAe0T1urYEBltkiVhJeecoMboDsHMzxPRz0NhnRc3
         rR2g==
X-Gm-Message-State: AOAM531Ze6o/tP8hiwoVfoxO6tR6amR6GoWwbgkRrbY4GpPwt9VK+xql
        2GcjYUFoUbd7bn09VBUdQHnhXe3/cHsB5UPd
X-Google-Smtp-Source: ABdhPJy23s6mjSzpI2fiMl7wjzi6Y5FCg4ZaetuHGw4VUxFWq1oX8rF2BGDL7YXI4WSk/oBC71WSqQ==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr80067717wrr.61.1609767727917;
        Mon, 04 Jan 2021 05:42:07 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id w4sm34042968wmc.13.2021.01.04.05.42.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 05:42:07 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v7 00/10] mhi: pci_generic: Misc improvements
Date:   Mon,  4 Jan 2021 14:49:29 +0100
Message-Id: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adjust some configuration values to ensure stability and
robustness of mhi pci devices (timeout, number of events, burst mode).

It also includes support for system sleep as well as a recovery procedure
that can be triggered when a PCI error is reported, either by PCI AER or by
the new health-check mechanism.

All these changes have been tested with Telit FN980m module

v2:
  - Cancel recovery work on suspend
v3:
  - enable doorbell_mode_switch for burst channel (HW)
  - Add mhi_initialize_controller helper patch
v4:
  - Delete hard reset on module unload, MHI reset is enough (Jeffrey)
  - Move soc reset support in MHI core (Jeffrey)
  - burst mode: enable doorbell_mode_switch for HW channels (Bhaumik)
  - Add diag channels
v5:
  - Remove useless call to mhi_initialize_controller in alloc_controller (hemant)
  - Add define for post reset timeout (hemant)
  - Fix static misses (hemant)
v6:
  - Add debug print in case of recovery success (Mani)
  - Return error code in case of resume failure (Mani)
v7:
  - Removed mhi_initialize_controller API (Mani)
  - Added controller specific reset callback (Mani)
  - Reworked error handling using reset_prepare/done (Mani)

Loic Poulain (10):
  bus: mhi: core: Add device hardware reset support
  mhi: pci-generic: Increase number of hardware events
  mhi: pci_generic: Enable burst mode for hardware channels
  mhi: pci_generic: Add support for reset
  mhi: pci_generic: Add suspend/resume/recovery procedure
  mhi: pci_generic: Add PCI error handlers
  mhi: pci_generic: Add health-check
  mhi: pci_generic: Increase controller timeout value
  mhi: pci_generic: Add diag channels
  mhi: pci_generic: Set irq moderation value to 1ms for hw channels

 drivers/bus/mhi/core/main.c   |  13 ++
 drivers/bus/mhi/pci_generic.c | 359 +++++++++++++++++++++++++++++++++++++++---
 include/linux/mhi.h           |   9 ++
 3 files changed, 361 insertions(+), 20 deletions(-)

-- 
2.7.4

