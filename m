Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD89327EBDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 17:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgI3PJp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 11:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbgI3PJp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 11:09:45 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5C8C061755
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2020 08:09:45 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d23so1209223pll.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2020 08:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Om10yAB3QUkq2FUUZylEInes0EqFhXB8HTZobg+GBGk=;
        b=kflbF4NlTnp2PESdD8BUBhu3JL0K8pD4BA1XjDG4/f9HDlZ/OYZTv9aR7ROzSGYq4J
         /I79gOi98pcQdXq0FBwC/lmIdkUP3k245R+Hgbqq/pYwRdJwLzbbEx5jm1uC7XqalOQD
         yC3LvtiQch5RACmPxHMSumm4tfKCvXlZ53QU8ELr794bGUPli/10pHrmStU0Vm7DWTWe
         l15uvk+qZV6En/MqpXEEenV2vjZL7HC6OFN6F5JXNsM6+JHwYupS2SOfwD6XkR6/REUy
         8ddmUS5IXf2Fmh7SM2NxWaaw6oQKhgtpuFb3aiqUNYMoR3EqqOQqXPVcS/LB3OBQBIUk
         rLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Om10yAB3QUkq2FUUZylEInes0EqFhXB8HTZobg+GBGk=;
        b=BQOffdw264XhdZUOSTfHiB+TfnW3dJJvrJG2gjPmkfnY+wq3+PGMkpjNuXPPoCfqU4
         cWMw7Y4Fw7Sj/jMm+DNYWdn8cLwQEIiMTCSYpt6KkKtN6t/FV92NOfhmjaxnWzQX3rwc
         Sc0SLH1s+LwVJtmYaZ+MowGZhuF8NVSjRXXor7fSIHQLOiKTXp+wQ4BvZzFshvzY3Myw
         8zVCjQLAmUaryg90dO60XsjnfUPaCUri6KS+6sV+kX3Wg/GBZ7nbG6qqA0mb9eTLcD7Y
         CM1KB2O+mQpF1XH6AiemwnIv0UeeVbV6VNTdxeKSFi/JQZ8jpSyd7iLbDY6tmEC8ov+s
         PtkA==
X-Gm-Message-State: AOAM532YO1DEVshzqWLwhAQQnpKr8ffWNsJ7pGXw7zeHN0aCDrL+TScl
        hTUrf+LpQVCTP/12uIe3tqt2
X-Google-Smtp-Source: ABdhPJzcIp8YPAQDmYH08930pKSOfi/FEiM64kLEHn3u/y2tRfdrMwV6Qb9siEXkYcxTArKn70EnmQ==
X-Received: by 2002:a17:902:ee93:b029:d2:1425:7c90 with SMTP id a19-20020a170902ee93b02900d214257c90mr2630408pld.30.1601478584438;
        Wed, 30 Sep 2020 08:09:44 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6004:2356:f1f4:5bc8:894a:8c50])
        by smtp.gmail.com with ESMTPSA id o6sm2456444pjp.33.2020.09.30.08.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 08:09:43 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        vkoul@kernel.org, robh@kernel.org
Cc:     svarbanov@mm-sol.com, bhelgaas@google.com,
        lorenzo.pieralisi@arm.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        mgautam@codeaurora.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/5] Add PCIe support for SM8250 SoC
Date:   Wed, 30 Sep 2020 20:39:20 +0530
Message-Id: <20200930150925.31921-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series adds PCIe support for Qualcomm SM8250 SoC with relevant PHYs.
There are 3 PCIe instances on this SoC each with different PHYs. The PCIe
controller and PHYs are mostly comaptible with the ones found on SDM845
SoC, hence the old drivers are modified to add the support.

This series has been tested on RB5 board with QCA6390 chipset connected
onboard.

NOTE: This series functionally depends on the following patch:
https://lore.kernel.org/linux-arm-kernel/1599814203-14441-3-git-send-email-hayashi.kunihiko@socionext.com/

I've dropped a similar patch in v2.

Thanks,
Mani

Changes in v2:

* Fixed the PHY and PCIe bindings
* Introduced secondary table in PHY driver to abstract out the common configs.
* Used a more generic way of configuring BDF to SID mapping
* Dropped ATU change in favor of a patch spotted by Rob

Manivannan Sadhasivam (5):
  dt-bindings: phy: qcom,qmp: Add SM8250 PCIe PHY bindings
  phy: qcom-qmp: Add SM8250 PCIe QMP PHYs
  dt-bindings: pci: qcom: Document PCIe bindings for SM8250 SoC
  PCI: qcom: Add SM8250 SoC support
  PCI: qcom: Add support for configuring BDF to SID mapping for SM8250

 .../devicetree/bindings/pci/qcom,pcie.txt     |   6 +-
 .../devicetree/bindings/phy/qcom,qmp-phy.yaml |   6 +
 drivers/pci/controller/dwc/Kconfig            |   1 +
 drivers/pci/controller/dwc/pcie-qcom.c        | 149 ++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 278 +++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp.h           |  18 ++
 6 files changed, 454 insertions(+), 4 deletions(-)

-- 
2.17.1

