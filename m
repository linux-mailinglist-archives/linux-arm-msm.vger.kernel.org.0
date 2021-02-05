Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8B2311621
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 23:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbhBEWvp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 17:51:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbhBENCp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 08:02:45 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B013C06178A
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 05:01:50 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id r38so4465742pgk.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 05:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=nGeMDckkLWCC40p3zLt6eORZusUAfTVspeKPwP+7SUY=;
        b=OabTUYnxjQvIIHYtviRH6WllUaGPW3oQ+UBGLnix/ZL/Mn9uMBh/dhF1X+PmMz3UOv
         D65C05oc1MUg6uLv5DUyWl9VP666javRUNId5bRF4gO3b8CPhFe/pZGcfoDrC/66xyD8
         jhIAJsDVnX96j6S5pS98ah5yviHIrbEKBL9a4pjixd0bReTIZXSClPCO3FXElyyznGVY
         6YT0qCn2dLDVFCzi7acKuYDeJxT+/925zkJfrwXYgSSWtDXXmfzaxpohqZhHbeU3hD+y
         EJXa6t8gpLcujGuPWtL1mfVqZJ5ChcsXNqPglnrt0HrxHxRcX22CETEXIUJmLkzLhMew
         SsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=nGeMDckkLWCC40p3zLt6eORZusUAfTVspeKPwP+7SUY=;
        b=CWQ+lS1OEIWAc1b7UxqIuMMkJMOiE0HV2K1Swp16VLrVAMg87Xo0N50AsGeIbQK9Nf
         1hTxUSXLQy48EXbnyiD7qa97c7SlBd9/QuM7Da8Zu+STovnK/jEX5EF33nr9smiv16z5
         iLBvQEntkiAYVTrJwH1dpcHFjv5krNDgbRlD+KdqXY9imW+APiPBT2bHEL4CNQJIxtHQ
         xjPNFhi6fDwdAD4BnKTBeeqAqfJ8gtQkEy2nR+iQHCKBJIQKX8Ock8fz0Grv9lCoTnEy
         dAruvIFXUtY24FxBOJarKEwHnnOhs2I5n9u9iQkhwrJsPO5Mob5AGozDwMpKfIGik/01
         vUEA==
X-Gm-Message-State: AOAM531pEXQXKi+TM3l7vRamBnOA+I5GMc59RBwC/KPjsVXPtvmF+EyR
        WDlPKyz2Ky2nytwkUH64JIAw
X-Google-Smtp-Source: ABdhPJw03aj65fZ+DijctHrGCUKSUeSMIEUA0SQ3MTk0eWdo5sybCYHMQ2IbIu2fxS3YfcUGZH5h8A==
X-Received: by 2002:a63:181e:: with SMTP id y30mr4107842pgl.324.1612530109921;
        Fri, 05 Feb 2021 05:01:49 -0800 (PST)
Received: from thinkpad ([2409:4072:6419:ab3e:3106:54ac:6216:6b24])
        by smtp.gmail.com with ESMTPSA id 124sm9339596pfd.59.2021.02.05.05.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 05:01:49 -0800 (PST)
Date:   Fri, 5 Feb 2021 18:31:41 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Kalle Valo <kvalo@codeaurora.org>, cjhuang@codeaurora.org,
        ath11k@lists.infradead.org
Subject: [GIT PULL] MHI changes for v5.12
Message-ID: <20210205130141.GE3221@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here is the MHI Pull request for the v5.12 cycle. As like last time, I needed to
do PR this time due to the immutable branches with net-next and ath11k-next.

Patch details are in the signed tag, please consider merging!

Thanks,
Mani

---

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-v5.12

for you to fetch changes up to 026c5b1ec29cb9904406c7b3090eaf54e345e7f2:

  bus: mhi: pci_generic: Increase num of elements in hw event ring (2021-02-05 17:59:29 +0530)

----------------------------------------------------------------
MHI changes for v5.12

Loic improved the MHI PCI generic controller by adding support for DIAG channel,
PCI error handling, suspend/recovery/resume, and health check. Loic also added
support for resetting the MHI device as per the MHI specification. This includes
writing to a specific register for default cases and looking for controller
specific callback when provided.

Along with this Loic, also added a new API which gets the number for free TREs
(Transfer Ring Elements) from the MHI core. The client drivers can make use of
this API and the current consumer is the "mhi-net" driver. For taking both the
"mhi-net" driver change and the API change, we created "mhi-net-immutable"
branch for this patch and merged the same into net-next and mhi-next.

Carl added a patch which lets the controller driver to pass the custom IRQ
flags for BHI and MHI event interrupts to the MHI core. The current consumer of
this feature is the ath11k MHI controller driver. For taking both the changes,
we created "mhi-ath11k-immutable" branch for this patch and merged into
ath11k-next and mhi-next.

Finally, Loic cleaned up the MHI queue APIs and fixed the shared MSI vector
support.

----------------------------------------------------------------
Carl Huang (1):
      mhi: use irq_flags if controller driver configures it

Hemant Kumar (1):
      bus: mhi: core: Add helper API to return number of free TREs

Loic Poulain (16):
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
      bus: mhi: Ensure correct ring update ordering with memory barrier
      mhi: unconstify mhi_event_config
      mhi: pci_generic: Fix shared MSI vector support
      mhi: core: Factorize mhi queuing
      mhi: pci_generic: Print warning in case of firmware crash
      bus: mhi: pci_generic: Increase num of elements in hw event ring

Manivannan Sadhasivam (2):
      Merge branch 'mhi-ath11k-immutable' into mhi-next
      Merge branch 'mhi-net-immutable' into mhi-next

 drivers/bus/mhi/core/init.c   |   9 ++-
 drivers/bus/mhi/core/main.c   | 194 +++++++++++++++++++++++------------------------------------
 drivers/bus/mhi/pci_generic.c | 381 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
 include/linux/mhi.h           |  22 ++++++-
 4 files changed, 461 insertions(+), 145 deletions(-)
