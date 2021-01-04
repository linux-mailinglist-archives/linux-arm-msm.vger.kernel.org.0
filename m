Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F702E9A78
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 17:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728588AbhADQKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 11:10:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729388AbhADQIJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 11:08:09 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4AEC061574
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 08:07:29 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id a6so18931657wmc.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 08:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=lY/py5qSWE1RT0mHDwHx9Cj2QlUD9eZrpjO4Q55GpuQ=;
        b=hPUcDYdSAgtkrIlWHzRUDDFdhHAbruRYzjutPeX3r8BInv6QSeRN28W+NIqBd4xqaN
         kS0FMIuDKthAKx+e1Kc4seCpNk3ltcIjXOcUTI46uToRbt3vmUW9HVHTFkvp69nceYQW
         bCR6xZoJmCCr4NioCrrPud9DahHV8TPWoTDuEB3yWdBS/hXSYD3KXAZm92/LngNDsCrl
         N94UGfAN+25hjdOFDKIPfFIl4IYon0ldCeICYbI2WoHzXXF+vHiA1wrTt+sRHQ+IYaKi
         FsGzt/inqc7unB69YM2oFStyHxDN21O1k9JZP6MpuMo4w3TVmGm4b1s+lCaiquPYyMFn
         XBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lY/py5qSWE1RT0mHDwHx9Cj2QlUD9eZrpjO4Q55GpuQ=;
        b=mn/nagPx9HIYTRRkLkjF5s8vDRAznja+qnEY5gHbissvevRGJ73/FwZ44aEsUoQcNN
         Ocrnneg8qvzcJfD+KooksukiTqhenTC5DqO6aSzydtNDbeBwdp/rzFQnqMDtZnLj4hOP
         jIfw+TNcFPzA38k4K8UY4yrpb6nRn67Q3MDtZ7+6xK6/1ysbCY9gvRw45yZq54L/d7iC
         ARRqQzT+sCPiPeeEiJVmhygrrB6VoIRfdtTgIebPjHsQZrW45n+CH0umerMj0NVk5eCR
         Uoj3/POBHXZ/qXvWXwnLjY74vtTrk6OfClWEraQyU2cLQehRknFhybhiGU/G6DhAGwML
         WSpQ==
X-Gm-Message-State: AOAM532ZydR5BDayLchmOwaRjvZ1qgmGj7f4gfH8ntGviIs/L42Z9zhM
        /thUV3gaZREUGrW+vswLJEM0ng==
X-Google-Smtp-Source: ABdhPJzs+ly0atEgtqZ96Rn+RzSNHJqXFJBqlQ3+r467rx2zwDU7+4vbmYwo2nhVBc+/p1F/jui2aA==
X-Received: by 2002:a1c:3cd5:: with SMTP id j204mr27031000wma.53.1609776447713;
        Mon, 04 Jan 2021 08:07:27 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id h9sm89278049wre.24.2021.01.04.08.07.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 08:07:27 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v8 00/10] mhi: pci_generic: Misc improvements 
Date:   Mon,  4 Jan 2021 17:14:49 +0100
Message-Id: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
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
v8:
  - Rebased on v5.11-rc1

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

