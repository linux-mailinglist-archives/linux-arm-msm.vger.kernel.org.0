Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D7827A61F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 06:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgI1EKb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 00:10:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725287AbgI1EKb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 00:10:31 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C10CC0613CE
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:10:31 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id b17so2785350pji.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 21:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=OHdB/lQSZ51PriON1YnzhLSGGjk5yXlBwN7F9gXnLRk=;
        b=eTjt/mfpH5f2ibLKAUl28AUwGSYqFAPi7JON1aflRzrzYfHYr3oUXd+LnqOBvOmQ4d
         aSHV3gDOl4id8ASR47jc/kGGabiipe2oao3t+27FsxnQoCJ9aNVqcM9UxmSNlx6A3u4H
         9V01syle6eOS3uBo1FbtStxptSJuCZtxet5tY6H6NZcWM02t3toRwMRPNDWKITOYpGk3
         vnKCd7m3sHFPseU2hIgQvioWia7sb40QOW4Jf1VXD2DkyELg8nmaqB53biZluWhyepVF
         s/41CgLhh9pSf6iOgxg19Zag0ThO6g5kR1qN+mRTY7NM5fc5hD8d7sostRutHwIQtXbs
         ftuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OHdB/lQSZ51PriON1YnzhLSGGjk5yXlBwN7F9gXnLRk=;
        b=NQg4rHmQtFLLcbSkjvOT/z3XJ8bWy3LnjqJ0Jyb/h97MV9xDBdUWsDEvDoeeTujqGA
         2orqJYjqiNDa8GUOofxCY9ZoYQg1Feg6y9VNQroP7gg0ilL7k9whioS2OT6E9pq/8DGO
         OQeooBIjcQY3NcmbuwuceLoCezrk8jJsr39XoQ/SAm7EKhd2c0xTsBoD2ol3u2YgvYu7
         GzbtwxgohlLWQpryPOCP3/Yx6pJs2DhliynvpQRgdya1gfh3FjBvnkeArelPVi5re07s
         w5z4cnBilKRmAqbNlMI094wiYXLLGBBPVgmRJyFVLSgSs9aJ6C/lshEp4+LXQP84FCPJ
         75NQ==
X-Gm-Message-State: AOAM532Pq70Wbf1s+nAeVZZKSBUNszK1Euf70W8jwJtrxqfF4yXwj8AA
        ftzAHua90mgP0W+O+QodTLLX
X-Google-Smtp-Source: ABdhPJzzIuqsDYeYYR2zSnPBXcbi35TE22v/zVexAdbo8tvy/P3qVRTqkCHXpekSuL9qWSRYjN+SDQ==
X-Received: by 2002:a17:90a:f098:: with SMTP id cn24mr7716592pjb.158.1601266230371;
        Sun, 27 Sep 2020 21:10:30 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6003:40df:7c40:5a87:eb86:87b0])
        by smtp.gmail.com with ESMTPSA id n21sm8306322pgl.7.2020.09.27.21.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 21:10:29 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 00/21] MHI changes for v5.10
Date:   Mon, 28 Sep 2020 09:39:30 +0530
Message-Id: <20200928040951.18207-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here is the MHI series for v5.10 cycle. Most of the patches are cleanups
in the MHI stack. Notable changes are below:

* Saving the client device hardware information obtained through the BHI
  protocol. This information will be exposed through sysfs to make use in
  the userland applications.
* Introduce sysfs entries to read the serial number and OEM PK hash values
  of the client device obtained from BHI protocol. Relevant API documentation
  is also added.
* Introduce debugfs entries to show MHI states, events, channels, register
  state etc... to aid debug.
* Remove the channel name from MHI device name as the device is not specific
  to channels. Used generic names instead!
* Fix the warning reported by Kbuild bot by using append (+=) Kbuild rule
  to the mhi/core Makefile.
* Introduce APIs to allocate and free MHI controllers. This is done to make
  sure that the allocated structs are initialized to NULL before passing to
  the MHI core.
* Remove the requirement to have a dedicated IRQ for each event ring.
  The MHI controllers can now use a single IRQ for all event rings.
* Remove the auto-start option for MHI channels. This is done to avoid
  receiving spurious uplink from MHI client device when the client driver
  is not up. The corresponding qrtr change is also included with Dave's ACK.

Please consider merging!

Thanks,
Mani

Changes in v2:

* Clubbed both series (take one and two) onto a single one
* Used dev_groups to manage sysfs attributes
* Merged the debugfs fix patch with the debugfs patch
* Dropped MAX_MTU patch for now

Bhaumik Bhatt (12):
  bus: mhi: core: Remove double occurrence for mhi_ctrl_ev_task()
    declaration
  bus: mhi: core: Abort suspends due to outgoing pending packets
  bus: mhi: core: Use helper API to trigger a non-blocking host resume
  bus: mhi: core: Trigger host resume if suspended during
    mhi_device_get()
  bus: mhi: core: Use generic name field for an MHI device
  bus: mhi: core: Introduce helper function to check device state
  bus: mhi: core: Introduce counters to track MHI device state
    transitions
  bus: mhi: core: Read and save device hardware information from BHI
  bus: mhi: core: Introduce APIs to allocate and free the MHI controller
  bus: mhi: Fix entries based on Kconfig coding style
  bus: mhi: core: Introduce debugfs entries for MHI
  bus: mhi: core: Introduce sysfs entries for MHI

Clark Williams (1):
  bus: mhi: Remove include of rwlock_types.h

Hemant Kumar (1):
  bus: mhi: core: Add const qualifier to MHI config information

Loic Poulain (5):
  bus: mhi: core: Allow shared IRQ for event rings
  bus: mhi: Remove unused nr_irqs_req variable
  bus: mhi: debugfs: Print channel context read-pointer
  bus: mhi: Remove auto-start option
  net: qrtr: Start MHI channels during init

Manivannan Sadhasivam (1):
  bus: mhi: core: Fix the building of MHI module

Randy Dunlap (1):
  bus: mhi: fix doubled words and struct image_info kernel-doc

 Documentation/ABI/stable/sysfs-bus-mhi |  21 ++
 MAINTAINERS                            |   1 +
 drivers/bus/mhi/Kconfig                |  20 +-
 drivers/bus/mhi/core/Makefile          |   3 +-
 drivers/bus/mhi/core/boot.c            |  17 +-
 drivers/bus/mhi/core/debugfs.c         | 411 +++++++++++++++++++++++++
 drivers/bus/mhi/core/init.c            |  96 ++++--
 drivers/bus/mhi/core/internal.h        |  38 ++-
 drivers/bus/mhi/core/main.c            |  27 +-
 drivers/bus/mhi/core/pm.c              |  28 +-
 include/linux/mhi.h                    |  53 +++-
 net/qrtr/mhi.c                         |   5 +
 12 files changed, 644 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi
 create mode 100644 drivers/bus/mhi/core/debugfs.c

-- 
2.17.1

