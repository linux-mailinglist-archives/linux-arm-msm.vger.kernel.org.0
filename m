Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AAD0526848
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 19:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382982AbiEMR02 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 13:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378250AbiEMR01 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 13:26:27 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D87F6FA35
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 10:26:25 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id t25so15663061lfg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 10:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pbko96crE4TzzX/Ak0XuHEKRtxla1hBVnyQSgu2Jr0A=;
        b=bNyrZ27wp+y18TJWzKJz+8icZvv5URoY2m/R90LErO+4SfNUpr5jaiCJGPqVVr4shO
         VBhlBjIKYJDRDWYqyWpACBj53NryvcmURxIVUvpoHmjdNS136kbhc07APw4PAatMJIQE
         FVnpO+KuLSzzd2OEm/0MrlnrjROIowfDH6/kLzIuULP0vJN+n8Cud2zryj6znEXcKN+3
         7DyV55NxkFUAaHszt2wGm3tm2NU/PZobrxno2DMX4hx8WlLA4rqewKKtg3JPY6qsJAsw
         qOwh29OLJt1ouHKWT8PMXCYFlVwFHa4fB7uVQSvCmXbYWYSE8J1Tgw0Lw+jkwgj03i+H
         oPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pbko96crE4TzzX/Ak0XuHEKRtxla1hBVnyQSgu2Jr0A=;
        b=wvhs7aLJ6tQPR07fqibJYseO1Eh0/o8AIhw62UZXVVcD4xL3ckDgDOaVOOxKESAj0A
         tHU7xmNgSHmKnQkFhG0RPewmj/QfY1IDpMKeL62sJ93Hh2OQAIKH5EQLUzPzXjM3WRBL
         R3NQY+HFcTNMvs23uapHsVcrfs2EfHWxeOjQHYEm8yAye27rtDYBTzHQX8kGvp05rtHK
         XpVswUKK3a5Tfam5eEf3JR5senYI0XhqpRjDvxNFlD1eW48nl5QdL3OyIhbXqDpIAztj
         +yr1wQ0xyx+eHGiZUAxcRNa0qshXwtXbpNV+7VWgBsqUqpQwygd7LVbI83kVRlT0uCp0
         yYCQ==
X-Gm-Message-State: AOAM531RgW3Ay+oItz+801DTDq2C2rEuoH1zJaTKKud82bjhmS28+vQf
        E2SzG3nJ6lIiN3RczmpFBD4Qug==
X-Google-Smtp-Source: ABdhPJzuQGBiIe3LyTOZcj9QUZq8ieO+lVchyXImkwrPqp0TvLrK71NHUMBFMStgVzdK2Ly1V24trA==
X-Received: by 2002:ac2:561b:0:b0:472:586b:3209 with SMTP id v27-20020ac2561b000000b00472586b3209mr4098779lfd.234.1652462783510;
        Fri, 13 May 2022 10:26:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e3-20020a2e8183000000b0024f3d1daec0sm511157ljg.72.2022.05.13.10.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 10:26:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Johan Hovold <johan@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v10 00/10] PCI: qcom: Fix higher MSI vectors handling
Date:   Fri, 13 May 2022 20:26:12 +0300
Message-Id: <20220513172622.2968887-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

 have replied with my Tested-by to the patch at [2], which has landed
in the linux-next as the commit 20f1bfb8dd62 ("PCI: qcom:
Add support for handling MSIs from 8 endpoints"). However lately I
noticed that during the tests I still had 'pcie_pme=nomsi', so the
device was not forced to use higher MSI vectors.

After removing this option I noticed that hight MSI vectors are not
delivered on tested platforms. After additional research I stumbled upon
a patch in msm-4.14 ([1]), which describes that each group of MSI
vectors is mapped to the separate interrupt. Implement corresponding
mapping.

The first patch in the series is a revert of  [2] (landed in pci-next).
Either both patches should be applied or both should be dropped.

Patchseries dependecies: [3] (for the schema change).

Changes since v9:
 - Relax requirements and stop validating the DT. If the has_split_msi
   was specified, parse as many msiN irqs as specified in DT. If there
   are none, fallback to the single "msi" IRQ.

Changes since v8:
 - Fix typos noted by Bjorn Helgaas
 - Add missing links to the patch 1 (revert)
 - Fix sm8250 interrupt-names (Johan)
 - Specify num_vectors in qcom configuration data (Johan)
 - Rework parsing of MSI IRQs (Johan)

Changes since v7:
 - Move code back to the dwc core driver (as required by Rob),
 - Change dt schema to require either a single "msi" interrupt or an
   array of "msi0", "msi1", ... "msi7" IRQs. Disallow specifying a
   part of the array (the DT should specify the exact amount of MSI IRQs
   allowing fallback to a single "msi" IRQ),
 - Fix in the DWC init code for the dma_mapping_error() return value.

Changes since v6:
 - Fix indentation of the arguments as requested by Stanimir

Changes since v5:
 - Fixed commit subject and in-comment code according to Bjorn's
   suggestion,
 - Changed variable idx to i to follow dw_handle_msi_irq() style.

Changes since v4:
 - Fix the minItems/maxItems properties in the YAML schema.

Changes since v3:
 - Reimplement MSI handling scheme in the Qualcomm host controller
   driver.

Changes since v2:
 - Fix and rephrase commit message for patch 2.

Changes since v1:
 - Split a huge patch into three patches as suggested by Bjorn Helgaas
 - snps,dw-pcie removal is now part of [3]

[1] https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/commit/671a3d5f129f4bfe477152292ada2194c8440d22
[2] https://lore.kernel.org/linux-arm-msm/20211214101319.25258-1-manivannan.sadhasivam@linaro.org/
[3] https://lore.kernel.org/linux-arm-msm/20220422211002.2012070-1-dmitry.baryshkov@linaro.org/

Dmitry Baryshkov (10):
  PCI: qcom: Revert "PCI: qcom: Add support for handling MSIs from 8
    endpoints"
  PCI: dwc: Propagate error from dma_mapping_error()
  PCI: dwc: Correct msi_irq condition in dw_pcie_free_msi()
  PCI: dwc: Convert msi_irq to the array
  PCI: dwc: split MSI IRQ parsing/allocation to a separate function
  PCI: dwc: Handle MSIs routed to multiple GIC interrupts
  PCI: dwc: Implement special ISR handler for split MSI IRQ setup
  PCI: qcom: Handle MSIs routed to multiple GIC interrupts
  dt-bindings: PCI: qcom: Support additional MSI interrupts
  arm64: dts: qcom: sm8250: provide additional MSI interrupts

 .../devicetree/bindings/pci/qcom,pcie.yaml    |  53 ++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  12 +-
 drivers/pci/controller/dwc/pci-dra7xx.c       |   2 +-
 drivers/pci/controller/dwc/pci-exynos.c       |   2 +-
 .../pci/controller/dwc/pcie-designware-host.c | 220 +++++++++++++-----
 drivers/pci/controller/dwc/pcie-designware.h  |   3 +-
 drivers/pci/controller/dwc/pcie-keembay.c     |   2 +-
 drivers/pci/controller/dwc/pcie-qcom.c        |  13 +-
 drivers/pci/controller/dwc/pcie-spear13xx.c   |   2 +-
 drivers/pci/controller/dwc/pcie-tegra194.c    |   2 +-
 10 files changed, 238 insertions(+), 73 deletions(-)

-- 
2.35.1

