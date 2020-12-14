Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25CF82D99A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 15:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390284AbgLNOTY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 09:19:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439156AbgLNOTJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 09:19:09 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEACC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:28 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id 91so16571806wrj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=xavHU57vKOrjMtue7GRYsWoOSdjY1ktr5LIlTj1Z3v4=;
        b=LB0J9+8udi/Fq6GMSeOvMKoPM/q36luQ06uQ/mna5yXGtndPNEEylNCkW0LZCxL9j5
         oUHXN6azdWnoYR7YVxKhiZ6yc39AwoH3aPcsC+TV+YgCJNj1fqdfCaUSCBPgeEljdKeK
         9BCDTRGY7QEoNmlC+6JTCTXx/eWkZz/9mLr9uM7qsx7tBUZ63LK/Si/JR2PTNG8i9GmP
         qfhGcSJbke+OZXJ0tM7xE6a8aziz+t4zsnLbDo2KA3H7pmZRgk/lUwShv9c6xJopjWYS
         odqr5dU9A23Xr2iJx1TiP7wO/dFgrwgGN9b/2uf/XJdNgJnm3aa3qf6hbzwbl4tvBPKK
         5JNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xavHU57vKOrjMtue7GRYsWoOSdjY1ktr5LIlTj1Z3v4=;
        b=olJsufyRaDLbpyftk5JCXJYa6eBIKN0ZV3RluAiAQE07aczcEber7k9ueAllKcVk77
         nlY+PqEBa/PSMrmt3YgBe8aBrHjxmQz4Ib96cTgI1Vefrqlo/Ea97KSTaGjl+ejQ5VlY
         oul7DL0d2pOwuEWi1/IYuLC4hrhQE4gb4x2/RyfuFDVYUGEz88UmJ//qEQ2aYnVIDgap
         qOU9bajtr1G/zl+mUoYR7/mwob76kmYwtv91XQBx39g6SPM/mz2bGP3qTiQ1rFsQYguJ
         1nqn3SmkG6YOgw30NAxD8b2nKqTyap0ZfSIrRWXRHSh9HeU6o4BqNz1heGyquR2bRcn3
         Wi1Q==
X-Gm-Message-State: AOAM532h8PUboS7okllZXs24l4iZjh919I6P94hUB9vzEAXiVwzTmCha
        yp/IRDCoSoSYwozHxEQpV09U2g==
X-Google-Smtp-Source: ABdhPJz1G9CFXFgKAn7VzQk/h+Uw+Cy8VJfrSXNxPA4hFdQq7L7aLYkcNjOhN3lWaWzzj/odrQqOCw==
X-Received: by 2002:adf:9b91:: with SMTP id d17mr28943453wrc.32.1607955507661;
        Mon, 14 Dec 2020 06:18:27 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f2e4:25b3:2b53:52cd])
        by smtp.gmail.com with ESMTPSA id h5sm34126285wrp.56.2020.12.14.06.18.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Dec 2020 06:18:27 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 00/10] mhi: pci_generic: Misc improvements
Date:   Mon, 14 Dec 2020 15:25:27 +0100
Message-Id: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
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

Loic Poulain (10):
  mhi: Add mhi_controller_initialize helper
  bus: mhi: core: Add device hardware reset support
  mhi: pci-generic: Increase number of hardware events
  mhi: pci_generic: Enable burst mode for hardware channels
  mhi: pci_generic: Add support for reset
  mhi: pci_generic: Add suspend/resume/recovery procedure
  mhi: pci_generic: Add PCI error handlers
  mhi: pci_generic: Add health-check
  mhi: pci_generic: Increase controller timeout value
  mhi: pci_generic: Add diag channels

 drivers/bus/mhi/core/init.c   |   6 +
 drivers/bus/mhi/core/main.c   |   7 +
 drivers/bus/mhi/pci_generic.c | 354 +++++++++++++++++++++++++++++++++++++++---
 include/linux/mhi.h           |  13 ++
 4 files changed, 361 insertions(+), 19 deletions(-)

-- 
2.7.4

