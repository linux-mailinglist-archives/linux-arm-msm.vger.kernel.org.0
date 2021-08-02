Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE383DCFEA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 07:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbhHBFN1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 01:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhHBFN1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 01:13:27 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC62C0613D5
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Aug 2021 22:13:15 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id u16so9841079ple.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Aug 2021 22:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H7wErfJnemqmkpSnND/NJjt/B433jaaKWUYaUIOjwmY=;
        b=aByg+Q6kxHiBgEbKANwF6Aya22K0vI9SyTfdy0oTMbn1b8a6VooO9j4J8rw/Vtz6Pr
         dO1hI2FN/Bbi64ocPmV0G/e5+riudr2VIdougShkvoMEnAt/+yhBAIxA3fezDIdOdttK
         NZEuAVxZRoQJPr1lWqGGUag22Lt/yntSBMLOidWps7aEnkgdReTnTdE5grtQZZT6dKEl
         FPlC5UHuFrD6sg4NwvdUR88SN9myXpmcOX+ZUNBXuVFIXl3bTsBJWqouKasFGoAGdB3K
         bTD4rest4GpoWDv5qZX+LiypClA2CbGseOSgjCOxN2dbPByP0Sf7yK+Udrs08iomUj2x
         kLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H7wErfJnemqmkpSnND/NJjt/B433jaaKWUYaUIOjwmY=;
        b=ZgmGxQBO2q13xUU6UEIVbpQnHLV3FKu0lJhGkoHhOxRqRea+aQ61BFEgAhLWQq+rwE
         HlZBP/4qHC1eFn3plJ0P5SsX0hmnUAC3qwGVkQrtaaImmWkxr9wxdpha+aGVufnVefTn
         g7KtB1LMxdh1o9ue8L3q3H8t9J6oAs2qghOiVvqKQO+ISHcEweQm++jJSyAuJdckzy7b
         bi7fCiZzQJOa91D7EgNl5d5PsJ6ng0ONpYbykNNgGzaSn1n1y74sVkAhpik8N+zxj/2P
         B9dTmdvchlG82J+zeTymUUcnHOq7z8Um9akPXBKIglLnAi8vITwc7xefxaIFPwscELnp
         e59A==
X-Gm-Message-State: AOAM531E+YEGnEnGFKzkcYNd6mSzGgOTULde1VBP8p83Hh0WFjwJYqfx
        NAxtBkJXW9/vQidyrsjXJdIz
X-Google-Smtp-Source: ABdhPJyKbd2Yb3EMs9dE6dhoEizbQf3cMD3KGaacxcVEHi64txBJQY703z9mg1T953pzrJAz6d8iVg==
X-Received: by 2002:a17:90b:3704:: with SMTP id mg4mr15049978pjb.201.1627881194992;
        Sun, 01 Aug 2021 22:13:14 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6e99:242f:6391:b1b4:1ad8:fbdf])
        by smtp.gmail.com with ESMTPSA id x26sm9947000pfm.77.2021.08.01.22.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 22:13:13 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/10] MHI patches for v5.15 - Take 1
Date:   Mon,  2 Aug 2021 10:42:45 +0530
Message-Id: <20210802051255.5771-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here is the first round of MHI patches for v5.15. Most of the patches missed
v5.14 due to late submission, so sending them early now.

Summary:

1. Added a dedicated flag to the MHI client transfer APIs for inbound
buffer allocation by the MHI stack. This is required for some downlink
channels like QRTR that depends on pre-allocated buffers. Since the patch
modifies the MHI client drivers under "net/", Ack has been collected from
the netdev maintainer.

2. Added support for Cinterion MV31-W modem in pci_generic controller:
https://www.thalesgroup.com/en/markets/digital-identity-and-security/iot/iot-connectivity/products/iot-products/mv31-w-ultra-high

3. Rearranged the setting of BHI/BHIe offsets for better validation of the
register values read from MMIO.

4. Cleanup of the BHI/BHIe pointers by setting them to NULL to prevent access
after power down.

5. Added support for getting the MMIO register length from the controller
drivers. This helps in validation of the read offsets from MMIO registers
in the MHI stack.

6. Added the MMIO register length support in the controller drivers and
collected Acks from the maintainers.

7. With the help of above register length, added check for BHI/BHIe offsets
in the MHI core.

8. Used the DMA allocation APIs directly instead of using MHI specific APIs,
mhi_alloc_coherent() and mhi_free_coherent(). They were not doing anything
special other than calling the DMA allocation APIs.

9. Finally, a patch to improve the debug messages for the power up operation
by showing the current EE states.

Please consider merging!

Thanks,
Mani

Bhaumik Bhatt (8):
  bus: mhi: core: Set BHI/BHIe offsets on power up preparation
  bus: mhi: core: Set BHI and BHIe pointers to NULL in clean-up
  bus: mhi: Add MMIO region length to controller structure
  ath11k: set register access length for MHI driver
  bus: mhi: pci_generic: Set register access length for MHI driver
  bus: mhi: core: Add range checks for BHI and BHIe
  bus: mhi: core: Replace DMA allocation wrappers with original APIs
  bus: mhi: core: Improve debug messages for power up

Loic Poulain (1):
  bus: mhi: Add inbound buffers allocation flag

ULRICH Thomas (1):
  bus: mhi: pci_generic: Add Cinterion MV31-W PCIe to MHI

 drivers/bus/mhi/core/boot.c           | 17 ++---
 drivers/bus/mhi/core/init.c           | 93 +++++++++++++++++----------
 drivers/bus/mhi/core/internal.h       | 22 +------
 drivers/bus/mhi/core/main.c           | 15 +++--
 drivers/bus/mhi/core/pm.c             | 34 +++-------
 drivers/bus/mhi/pci_generic.c         | 38 +++++++++++
 drivers/net/mhi/net.c                 |  2 +-
 drivers/net/wireless/ath/ath11k/mhi.c |  1 +
 drivers/net/wwan/mhi_wwan_ctrl.c      |  2 +-
 include/linux/mhi.h                   |  9 ++-
 net/qrtr/mhi.c                        |  2 +-
 11 files changed, 136 insertions(+), 99 deletions(-)

-- 
2.25.1

