Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 282B935B1DB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Apr 2021 07:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhDKF4X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Apr 2021 01:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbhDKF4W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Apr 2021 01:56:22 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56FD6C06138C
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Apr 2021 22:56:06 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id mj7-20020a17090b3687b029014d162a65b6so7011156pjb.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Apr 2021 22:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=47LAm/7nJvsrQPJk4C7Ih4f1i+BgMIeGRCBMkiUmnX4=;
        b=yi53V2JDvrURz5jGwTbhufezF4Tc2j2G3SWaCJa076RtUd6afzMHrWq4Xq/y20ki9R
         4viLKX7FI3NUBa0Z2fwgZNfALH07fl5JdtxlghUiXbOrsEpzUnCaGstSmoOwsxDsPy1m
         XcGb4ogNAmnR+eHrkuop/U4YifZc3mV8HqcVq9jUk80BHPy/8nbTZ6jeWxgOBEda2iwd
         1Wr5mrX6hscztJS5zgwtoDpCyTdgIEJHgEYA9CF3e4BSvcLYQ3We+khx9tP3wMQCZumw
         Od3eIbo4Hpp/LGRXqa0TNB9aK33xbPRqsBM7k/zGAAFgNTlJM5Ym3VAHLqV4ZdpYo50D
         1Esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=47LAm/7nJvsrQPJk4C7Ih4f1i+BgMIeGRCBMkiUmnX4=;
        b=ck9D4fKnN2TBoZ57HBTdb8/lqUIrC04bLRDXUI2RyHxKFxHauTbsokzODjXMoSL312
         DqXzy3u/2iFdKO/mj+Hk7g/qJvjeEJLL7tUo+DS7McaGeNUu+4sKH1uEEbhCwDRwdENI
         Npsv7DEOt7AgpjTpe/2dJBLxo8exB1WTfkIK8nT0x/7a4I/KF/j+jMdNQpvcOGasmw6p
         TNoHUVp1UVGkugd/6bDvjAUjZcBBovFHSh2EsA741+kfx9dp9w7UYX9/qOyKRKywEkmu
         wMquCG/zR3SWRG/GBymdydar3n15c+YPEHcfUgsbU7Yy5fiHtUYzKLaP7NeyrvMt3l2s
         qbmg==
X-Gm-Message-State: AOAM5318zBA/4w3JhJWthBusDuRXA2sUFjd3Kc0/2/R/aRKIGkKg99VP
        LWDqPCnbuYBzAkOY/L+DAoUMpftlM+o2
X-Google-Smtp-Source: ABdhPJxvo1xnUAWMhyv6R0S0hDuAv5tCn7GxQg3tlO3qYxRDrF2qRP5MKcawJPUklrhKRx3YYfLjiQ==
X-Received: by 2002:a17:90b:e87:: with SMTP id fv7mr22029932pjb.27.1618120565642;
        Sat, 10 Apr 2021 22:56:05 -0700 (PDT)
Received: from thinkpad ([2409:4072:813:9a91:9cf0:36d8:f992:2089])
        by smtp.gmail.com with ESMTPSA id g5sm6720022pfb.77.2021.04.10.22.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 22:56:04 -0700 (PDT)
Date:   Sun, 11 Apr 2021 11:25:59 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, jarvis.w.jiang@gmail.com,
        loic.poulain@linaro.org
Subject: MHI changes for v5.13
Message-ID: <20210411055559.GA2068@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here is the MHI Pull request for the v5.13 cycle. I stayed with the PR as the
number patches got increased.

Details are in the signed tag, please consider merging!

Thanks,
Mani

---

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v5.13

for you to fetch changes up to a503d1628c9c341dc5e1a26272e38182dca3e823:

  bus: mhi: fix typo in comments for struct mhi_channel_config (2021-04-09 18:48:22 +0530)

----------------------------------------------------------------
MHI changes for v5.13

core:

- Added support for Flash Programmer execution environment which allows the
  host machine (like x86) to flash the modem firmware to NAND or eMMC in the
  modem. The MHI bus will expose EDL channels (34, 35) and then the opensource
  QDL tool [1] can be used to flash the firmware from the host.
- Added an internal helper for polling the MHI registers with a retry interval.
  This helper is used now to poll for the MHI ready state in MHI STATUS
  register.
- Various fixes for issues found during the bringup of SDX24/SDX55 based Quectel
  and Telit modems.
- Updates to the Execution environment handling for proper downloading of the
  AMSS image from SBL (Secondary Bootloader) mode.
- Added support for sending STOP channel command to the MHI device and also made
  changes to the MHI core for proper handling of stop and restart.
- Fixed the runtime_pm handling in the core by forcing the device to be in wake
  mode until TX completion and allowing it to suspend for RX.
- Added sanity checks for values read from the device to avoid crash if those
  are corrupted somehow.
- Fixed warnings generated by sparse (W=2)
- Couple of kernel doc cleanups in mhi.h

pci_generic:

- Added support for runtime PM and generic PM
- Added Firehose channels for flashing the firmware
- Added support for modems such as Quectel EM1XXGR-L, SDX24, SDX65, Foxconn
  T99W175 exposing relevant channels.

[1] https://git.linaro.org/landing-teams/working/qualcomm/qdl.git

----------------------------------------------------------------
Bhaumik Bhatt (25):
      bus: mhi: core: Add missing checks for MMIO register entries
      bus: mhi: core: Destroy SBL devices when moving to mission mode
      bus: mhi: core: Download AMSS image from appropriate function
      bus: mhi: core: Process execution environment changes serially
      bus: mhi: core: Update debug prints to include local device state
      bus: mhi: Make firmware image optional for controller
      bus: mhi: core: Rely on accurate method to determine EDL mode
      bus: mhi: core: Wait for ready after an EDL firmware download
      bus: mhi: core: Handle EDL mode entry appropriately
      bus: mhi: core: Identify Flash Programmer as a mission mode use case
      bus: mhi: core: Wait for MHI READY state in most scenarios
      bus: mhi: core: Improve state strings for debug messages
      bus: mhi: core: Introduce internal register poll helper function
      bus: mhi: core: Move to polling method to wait for MHI ready
      bus: mhi: core: Remove pre_init flag used for power purposes
      bus: mhi: pci_generic: Add SDX65 based modem support
      bus: mhi: core: Allow sending the STOP channel command
      bus: mhi: core: Clear context for stopped channels from remove()
      bus: mhi: core: Improvements to the channel handling state machine
      bus: mhi: core: Update debug messages to use client device
      bus: mhi: core: Hold device wake for channel update commands
      bus: mhi: core: Clear configuration from channel context during reset
      bus: mhi: core: Check channel execution environment before issuing reset
      bus: mhi: core: Remove __ prefix for MHI channel unprepare function
      bus: mhi: Improve documentation on channel transfer setup APIs

Carl Yin (1):
      bus: mhi: core: Add support for Flash Programmer execution environment

Colin Ian King (1):
      bus: mhi: core: remove redundant initialization of variables state and ee

Fan Wu (1):
      bus: mhi: core: Return EAGAIN if MHI ring is full

Jarvis Jiang (2):
      bus: mhi: pci_generic: Introduce Foxconn T99W175 support
      bus: mhi: fix typo in comments for struct mhi_channel_config

Jeffrey Hugo (3):
      bus: mhi: core: Fix check for syserr at power_up
      bus: mhi: core: Check state before processing power_down
      bus: mhi: core: Sanity check values from remote device before use

Loic Poulain (14):
      bus: mhi: pci_generic: Parametrable element count for events
      bus: mhi: pci_generic: Introduce quectel EM1XXGR-L support
      bus: mhi: pci_generic: Add SDX24 based modem support
      bus: mhi: pci_generic: No-Op for device_wake operations
      bus: mhi: pci_generic: Use generic PCI power management
      bus: mhi: pci_generic: Add support for runtime PM
      bus: mhi: pci_generic: Remove WQ_MEM_RECLAIM flag from state workqueue
      bus: mhi: core: Fix invalid error returning in mhi_queue
      bus: mhi: core: Rename debugfs directory name
      bus: mhi: Early MHI resume failure in non M3 state
      bus: mhi: core: Fix MHI runtime_pm behavior
      bus: mhi: pm: reduce PM state change verbosity
      bus: mhi: pci_generic: Implement PCI shutdown callback
      bus: mhi: pci_generic: Add FIREHOSE channels

Manivannan Sadhasivam (2):
      bus: mhi: pci_generic: Constify mhi_controller_config struct definitions
      bus: mhi: core: Fix shadow declarations

 drivers/bus/mhi/core/boot.c     |  64 ++++++------
 drivers/bus/mhi/core/debugfs.c  |   2 +-
 drivers/bus/mhi/core/init.c     |  72 +++++++------
 drivers/bus/mhi/core/internal.h |  20 +++-
 drivers/bus/mhi/core/main.c     | 416 +++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------
 drivers/bus/mhi/core/pm.c       | 119 ++++++++++++---------
 drivers/bus/mhi/pci_generic.c   | 330 +++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 include/linux/mhi.h             |  28 +++--
 8 files changed, 775 insertions(+), 276 deletions(-)
