Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B721C3B434F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 14:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhFYMgd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 08:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhFYMgc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 08:36:32 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0FDC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 05:34:11 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id g4so5411508pjk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 05:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yqbRAsIckLoW6b0dakH7bBbGKt7Cg1eluPqhcnN57gw=;
        b=dhVlsc/ljuoucKFQObIMvGi4N9BRypj7rd1h270vPPAsjKdaiEyd8CKk8YfONdCo5/
         ta1VsI7c3apQblocoZVo65P+H/IOi4qSYUOepqsvSsqS0MTdr46ICANapmtnLtfmJcLA
         yDriRu6c6tkrcLIfjj+qiWprpTC5fTnR/kB3yxpFBT29pwtyZ9eQZuZRVHfgz/4veg2K
         mX4oXr9ASyfS0CgztLWeT3QCm8Jkp684KHQxoCEIjDOavyE0dxa+DMxa8RjdB8qt575+
         JGPUI71OEyzz9igMk6xNL1iS73ynRAb8NPsYM3X1+5I68zDFoBT+r25+8JJqs8U8EYZg
         u3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yqbRAsIckLoW6b0dakH7bBbGKt7Cg1eluPqhcnN57gw=;
        b=W2FL0QGBG12Bo5Zko9GMD2bYFRDu7K7+lnb/J6ZpcdjTR5CAfFFC73m7+2uPrzA8Gd
         BjDokB/cTcdq9ks12gqqmc96mgW+HmhzfSD/GL+IgfzEbUFzRs6omt4jQtISuKfcWhdJ
         +I4UGsEAVQ9YVcUwm2+seUR7EjhfaSsOCkxkkaWMhEXywDx4hloI98eMFA7aTR1Du3gn
         5IZBA5lMFI5VEh2rYO5j39jkGBvqXVQK9IR8HQuHQjbU30hHnGbKxH98aRm/kwn2YCG/
         hqEnVxAR3eU9ZpPPy6NfNB2HWpgOzjGkDOxs+2+w1JkFRZeLQ4ccekexE3/pZSft9pPF
         XnuQ==
X-Gm-Message-State: AOAM531Gm6xua77S7YzxN5sQDb5Xp2UBrp8ko33uRnrXE6l6cUHkS/2i
        l6sBO2Ls+9Fur7jBUpOopnHq
X-Google-Smtp-Source: ABdhPJw+l8JSNeta/sJi33j+3wIJXKfqmlNJoPARSzZG5wE2/iYdIu5ndavbgjRwIEDjBM/T85YTLw==
X-Received: by 2002:a17:90a:16cf:: with SMTP id y15mr3106911pje.219.1624624450861;
        Fri, 25 Jun 2021 05:34:10 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:600b:2a0:ed5d:53e7:c64e:1bac])
        by smtp.gmail.com with ESMTPSA id y7sm6077780pfy.153.2021.06.25.05.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 05:34:09 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, ath11k@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 00/10] MHI patches for v5.14 - Take 2
Date:   Fri, 25 Jun 2021 18:03:45 +0530
Message-Id: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Please find the remaining MHI patches for v5.14. This series has the left over
patches from the previous patchset and one new series that was reviewed a
while ago and put on hold for Ack from Kalle Valo for ath11k.

Summary:

1. Added validation for the channel ID read from event ring. If we get events
from an invalid channel, we throw an error message and skip the event.

2. Fixed the MHI wake routines used for the newer modems such as SDX55 and
SDX65 by using no-op routines only for the older modems and then relying on
the default routines provided by MHI stack for newer ones.

3. Added support for processing the events based on the priorities. Earlier
a fixed priority was used for all events.

4. Added a dedicated flag to the MHI client transfer APIs for inbound
buffer allocation by the MHI stack. Since this patch modifies the MHI
client drivers under "net/", Ack has been collected from the netdev
maintainer.

5. Added support for Cinterion MV31-W modem in pci_generic controller:
https://www.thalesgroup.com/en/markets/digital-identity-and-security/iot/iot-connectivity/products/iot-products/mv31-w-ultra-high

6. Rearranged the setting of BHI/BHIe offsets for better validation of the
register values read from MMIO

7. Cleanup of the BHI/BHIe pointers by setting them to NULL to prevent access
after power down.

8. Added support for getting the MMIO register length from the controller
drivers. This helps in validation of the read offsets from MMIO registers.
Since this patch touches ath11k, Ack has been collected from Kalle Valo.

9. With the help of above register length, added check for BHI/BHIe offsets.

Thanks,
Mani

Bhaumik Bhatt (8):
  bus: mhi: pci_generic: Apply no-op for wake using sideband wake
    boolean
  bus: mhi: core: Validate channel ID when processing command
    completions
  bus: mhi: core: Set BHI/BHIe offsets on power up preparation
  bus: mhi: core: Set BHI and BHIe pointers to NULL in clean-up
  bus: mhi: Add MMIO region length to controller structure
  ath11k: set register access length for MHI driver
  bus: mhi: pci_generic: Set register access length for MHI driver
  bus: mhi: core: Add range checks for BHI and BHIe

Loic Poulain (1):
  bus: mhi: Add inbound buffers allocation flag

ULRICH Thomas (1):
  bus: mhi: pci_generic: Add Cinterion MV31-W PCIe to MHI

 drivers/bus/mhi/core/init.c           | 61 +++++++++++++++++--------
 drivers/bus/mhi/core/internal.h       |  2 +-
 drivers/bus/mhi/core/main.c           | 26 +++++++----
 drivers/bus/mhi/core/pm.c             | 28 ++----------
 drivers/bus/mhi/pci_generic.c         | 65 +++++++++++++++++++++++----
 drivers/net/mhi/net.c                 |  2 +-
 drivers/net/wireless/ath/ath11k/mhi.c |  1 +
 drivers/net/wwan/mhi_wwan_ctrl.c      |  2 +-
 include/linux/mhi.h                   |  9 +++-
 net/qrtr/mhi.c                        |  2 +-
 10 files changed, 134 insertions(+), 64 deletions(-)

-- 
2.25.1

