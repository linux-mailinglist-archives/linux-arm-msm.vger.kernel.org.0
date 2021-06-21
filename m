Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 780193AED3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 18:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbhFUQSp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 12:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbhFUQSp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 12:18:45 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6840C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 09:16:30 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so309894pjo.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 09:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vZ6M1C8kjFrNWeEQ54ia2N/MPK1KiEtVeH/B6b0MYiY=;
        b=RC+agFTXIJZf1Zf/lTvTPnD/2Trfq55375aHRE0UWajIGX+kX2/FiW/TgTI/MaIyoM
         FXTCTM3oyYH6XvFBRbi3fZx+PI6Pwr26TjbBipTmZjR01rMyjC10N4yA0QjenuM3Xy+y
         4pLxiwe+Vf57APOczDXdJFcOTOa9LRV+UcBLlb6YdbpDGw2Gci5vVfPaVJ2oRTKf1Z2B
         vWsAwUWHkbp7vT7+BQyIvHtfFdj3az1FqHCTs0EN2f99tkwRnbNMlr3ykVwWqZiMXmp7
         +AiQfN5CSBLG1EN8QCdFno73wqLUfM2iCLgs0NP8zEqVXJJ2aLIeQGbJlKIWW0ziJzJV
         /o0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vZ6M1C8kjFrNWeEQ54ia2N/MPK1KiEtVeH/B6b0MYiY=;
        b=qnzX4ItVfWZe1vjNDu3Bakk/rw28/V6pD15r7Mj3a3cRTsSpTz2c3rOk3EUnvepOiV
         12+RTm5Y1IOxMqC20MyZ9UtcDx25PqocC6dYfhQt/xms5SPx5k8tqEl+w6oj4G5nFUiT
         6nB5825Fs13kdS2PM2TkssS3uhqYOpyivkJNWcfFxjAstuANSTRe9O4QMxCj848b0mOP
         KYTbhwG1+RtcNMLefZtmwXTJTZ3ncldJSCPQ2fUS7OnYBqdgJXF04irqINlxLE/x4kKX
         MvTfXuB1aToht7tLJlku/JZYjnQ42Qo/vbU2+k1ONlnGSLLcWelMpBrBDnOTCBIr7mOa
         NTgw==
X-Gm-Message-State: AOAM531ayhs5ddHaKc6ukGYRzybblBLbN+hc/kqEzL15MRtlO32TW7Ss
        yIewvAv6PBelDemTpcKmwgQv
X-Google-Smtp-Source: ABdhPJyhxLKvAQdSrC6c/UVELOSiUvJZ4yzk8B5MWich35+9Vl75ehj0wwZLEPJ/SJFdgmGHjh6UPg==
X-Received: by 2002:a17:902:da84:b029:11b:3110:a42b with SMTP id j4-20020a170902da84b029011b3110a42bmr18660615plx.44.1624292190183;
        Mon, 21 Jun 2021 09:16:30 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.116])
        by smtp.gmail.com with ESMTPSA id k88sm10734730pjk.15.2021.06.21.09.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 09:16:29 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/8] MHI patches for v5.14
Date:   Mon, 21 Jun 2021 21:46:08 +0530
Message-Id: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

Here is the MHI patch series for v5.14.

Summary of the patches:

1. Fixed an issue observed during the system resume where the host timesout
waiting for the M0 state. This has been fixed by adding M2 as the valid
resume state.

2. Added validation for the channel ID read from event ring.

3. Fixed the MHI wake routines used for the newer modems such as SDX55 and
SDX65 by using no-op routines only for the older modems and then relying on
the default routines provided by MHI stack for newer ones.

4. Added the missing "pci_disable_pcie_error_reporting()" call in
pci_generic controller error path.

5. Added support for processing the events based on the priorities. Earlier
a fixed priority was used for all events.

6. Fixed the power down latency by polling the device reset register
instead of waiting for the state change event.

7. Added a dedicated flag to the MHI client transfer APIs for inbound
buffer allocation by the MHI stack. Since this patch modifies the MHI
client drivers under "net/", Ack has been collected from the netdev
maintainer.

8. Added support for Cinterion MV31-W modem in pci_generic controller:
https://www.thalesgroup.com/en/markets/digital-identity-and-security/iot/iot-connectivity/products/iot-products/mv31-w-ultra-high

Thanks,
Mani

Baochen Qiang (1):
  bus: mhi: Wait for M2 state during system resume

Bhaumik Bhatt (2):
  bus: mhi: core: Validate channel ID when processing command
    completions
  bus: mhi: pci_generic: Apply no-op for wake using sideband wake
    boolean

Christophe JAILLET (1):
  bus: mhi: pci-generic: Add missing
    'pci_disable_pcie_error_reporting()' calls

Hemant Kumar (1):
  bus: mhi: core: Add support for processing priority of event ring

Loic Poulain (2):
  bus: mhi: core: Fix power down latency
  bus: mhi: Add inbound buffers allocation flag

ULRICH Thomas (1):
  bus: mhi: pci_generic: Add Cinterion MV31-W PCIe to MHI

 drivers/bus/mhi/core/init.c      |  3 +-
 drivers/bus/mhi/core/internal.h  |  2 +-
 drivers/bus/mhi/core/main.c      | 35 ++++++++++++-----
 drivers/bus/mhi/core/pm.c        | 19 +++------
 drivers/bus/mhi/pci_generic.c    | 67 ++++++++++++++++++++++++++++----
 drivers/net/mhi/net.c            |  2 +-
 drivers/net/wwan/mhi_wwan_ctrl.c |  2 +-
 include/linux/mhi.h              | 14 ++++++-
 net/qrtr/mhi.c                   |  2 +-
 9 files changed, 107 insertions(+), 39 deletions(-)

-- 
2.25.1

