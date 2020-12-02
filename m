Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 666652CC2C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 17:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbgLBQv3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 11:51:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgLBQv3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 11:51:29 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7700AC0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 08:50:49 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id e23so1405406pgk.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 08:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=feImpssPWUbfU8stpcwf/DzW88O+SodsSpT27Ehwdio=;
        b=qH5x5r1r40YrVG+ZBNQX1Rben9WTXlo9pDKQiloMce/rpeBLVkVcMYnmX5ZXJkgFuH
         wrmyTXWuvbYiL87t3ER8fFlkgABtCBP6GgLUCFJKZSGR/2u0mPNMJ8TRb8VE7DKWu3yS
         83ADppMlQOoJ5wimnz9XlLsRPPDzIL27Aaasp2wSOs18dFynGogSsjFZhTGE/iOU7YgI
         /njB9XX31Xy/PL3D/GDdQaMQcp8xiQ35/7Y3fQYs1rmHJhqxlA5UPsNdLiASMwfyYG8n
         7FdzON25IgKQkFX1wTr2t2pbA9yGDsI9BrXfRT29sW9HSS7fRzrw0k3K1naLIf+Q7hI2
         nw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=feImpssPWUbfU8stpcwf/DzW88O+SodsSpT27Ehwdio=;
        b=b1K6ZBqXvorw8UVMSMdsFv4RP1+/nmb/cPA43ym+lbiGSGeujFg5WBsKM3ZPiXA5qP
         HjnyvlUjssJthDOapOTe5qpXfdlZPvByX6EKjjCyLyFOTXph8Mj5YgGGyBse5YUpJiQO
         0Sg1PHd5t5W2jV35DybHLEuRqu9WQFriwIP6uNTXLUxDHOLvFGYuPMhBB5gn+3ROpuYX
         Cn0wl62Ue6Fp0JPqke00u9yG5UefoYOVIKh3lUtwfNaUJ3VJ85oIr8gW4Rkq26K4S7KI
         xyhpzVr3QRs02Eg7eJAiQXBnUahusL/X3MYNg/UGVY/EhtCld6uXVAQldWyFDaGs2SSt
         aGXA==
X-Gm-Message-State: AOAM532t8AyKJPkYLsR4ZE8YYdKOvBhj9LHsT4jYWFc84BtInB8rKC7t
        PQFW7gEQpTBZTf5JdRchBoRF
X-Google-Smtp-Source: ABdhPJx/KDmjglpN+tKSiKunsMr0GeDS0d4s1yyJ9InNXBjN9oYGX8Q8Ku5skEWzm9GWmgj14/SHZA==
X-Received: by 2002:a65:684d:: with SMTP id q13mr656279pgt.372.1606927848642;
        Wed, 02 Dec 2020 08:50:48 -0800 (PST)
Received: from thinkpad ([2409:4072:100:69b9:b5fe:d7f9:67a:4196])
        by smtp.gmail.com with ESMTPSA id k4sm331423pfg.174.2020.12.02.08.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 08:50:47 -0800 (PST)
Date:   Wed, 2 Dec 2020 22:20:40 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Kalle Valo <kvalo@codeaurora.org>
Subject: [GIT PULL] MHI changes for v5.11
Message-ID: <20201202165040.GC3033@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here is the MHI pull request for v5.11 cycle. The reason for doing pull request
this time is because of the immutable branch which gets merged for handling
networking and MHI changes.

Details are in the signed tag, please consider merging!

Thanks,
Mani

---

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v5.11

for you to fetch changes up to 4ea6fa2cb921cb17812501a27c3761037d64a217:

  mhi: pci_generic: Fix implicit conversion warning (2020-12-02 14:29:17 +0530)

----------------------------------------------------------------
MHI patches for v5.11

Here is the MHI patch set for v5.11. Most of the patches are cleanups and fixes
but there are some noticeable changes too:

1. Loic finally removed the auto-start option from the channel parameters of the
MHI controller. It is the duty of the client drivers like qrtr to start/stop the
channels when required, so we decided to remove this option. As a side effect,
we changed the qrtr driver to start the channels during its probe and removed
the auto-start option from ath11k controller.

**NOTE** Since these changes spawns both MHI and networking trees, the patches
are maintained in an immutable branch [1] and pulled into both mhi-next and
ath11k-next branches. The networking patches got acks from ath11k and networking
maintainers as well.

2. Loic added a generic MHI pci controller driver. This driver will be used by
the PCI based Qualcomm modems like SDX55 and exposes channels such as QMI,
IP_HW0, IPCR etc...

3. Loic fixed the MHI device hierarchy by maintaining the correct parent child
relationships. Earlier all MHI devices lived in the same level under the parent
device like PCIe. But now, the MHI devices belonging to channels will become the
children of controller MHI device.

4. Finally Loic also improved the MHI device naming by using indexed names such
as mhi0, mhi1, etc... This will break the userspace applications depending on
the old naming convention but since the only one user so far is Jeff Hugo's AI
accelerator apps, we decided to make this change now itself with his agreement.

5. Bhaumik fixed the qrtr driver by stopping the channels during remove. This
patch also got ack from networking maintainer and we decided to take it through
MHI tree (via immutable branch) since we already had a qrtr change.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/log/?h=mhi-ath11k-immutable

----------------------------------------------------------------
Bhaumik Bhatt (20):
      bus: mhi: core: Remove double locking from mhi_driver_remove()
      bus: mhi: core: Remove unnecessary counter from mhi_firmware_copy()
      bus: mhi: core: Add missing EXPORT_SYMBOL for mhi_get_mhi_state()
      bus: mhi: core: Expose mhi_get_exec_env() API for controllers
      bus: mhi: core: Remove unused mhi_fw_load_worker() declaration
      bus: mhi: core: Rename RDDM download function to use proper words
      bus: mhi: core: Skip RDDM download for unknown execution environment
      bus: mhi: core: Use appropriate names for firmware load functions
      bus: mhi: core: Move to using high priority workqueue
      bus: mhi: core: Skip device wake in error or shutdown states
      bus: mhi: core: Move to SYS_ERROR regardless of RDDM capability
      bus: mhi: core: Prevent sending multiple RDDM entry callbacks
      bus: mhi: core: Move to an error state on any firmware load failure
      bus: mhi: core: Use appropriate label in firmware load handler API
      bus: mhi: core: Move to an error state on mission mode failure
      bus: mhi: core: Check for IRQ availability during registration
      bus: mhi: core: Separate system error and power down handling
      bus: mhi: core: Mark and maintain device states early on after power down
      bus: mhi: core: Remove MHI event ring IRQ handlers when powering down
      net: qrtr: Unprepare MHI channels during remove

Carl Yin (1):
      bus: mhi: core: Fix null pointer access when parsing MHI configuration

Dan Carpenter (1):
      bus: mhi: core: Fix error handling in mhi_register_controller()

Jeffrey Hugo (1):
      bus: mhi: core: fix potential operator-precedence with BHI macros

Loic Poulain (7):
      bus: mhi: Remove auto-start option
      net: qrtr: Start MHI channels during init
      bus: mhi: Add MHI PCI support for WWAN modems
      bus: mhi: Fix channel close issue on driver remove
      bus: mhi: core: Indexed MHI controller name
      bus: mhi: core: Fix device hierarchy
      mhi: pci_generic: Fix implicit conversion warning

Manivannan Sadhasivam (1):
      Merge branch 'mhi-ath11k-immutable' into mhi-next

 drivers/bus/mhi/Kconfig               |   9 ++
 drivers/bus/mhi/Makefile              |   4 +
 drivers/bus/mhi/core/boot.c           |  75 ++++++++-------
 drivers/bus/mhi/core/debugfs.c        |   4 +-
 drivers/bus/mhi/core/init.c           |  73 +++++++++------
 drivers/bus/mhi/core/internal.h       |   7 +-
 drivers/bus/mhi/core/main.c           |  16 ++--
 drivers/bus/mhi/core/pm.c             | 238 ++++++++++++++++++++++++++++++++++-------------
 drivers/bus/mhi/pci_generic.c         | 345 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/mhi.c |   4 -
 include/linux/mhi.h                   |  18 +++-
 net/qrtr/mhi.c                        |   6 ++
 12 files changed, 653 insertions(+), 146 deletions(-)
 create mode 100644 drivers/bus/mhi/pci_generic.c
