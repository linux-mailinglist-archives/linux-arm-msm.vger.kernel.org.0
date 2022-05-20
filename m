Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F69C52F2BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 20:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347645AbiETSb2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 14:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352682AbiETSbY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 14:31:24 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7507B15FEF
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 11:31:19 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id h8so10558234ljb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 11:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hDT3nE7POQURLYb/miDqjuNBp0Vc/zU4W1xKS1Zir10=;
        b=LQ1X2o0jTjruEDLpF1w4Gik2FAdbNKxSzQ/KAdqMlUK0G6rXO0Hi4DMd1PQT0UFBlY
         F9YwD9XzOvqc5TDVg0oVa2+fg6PVz6dk+uPsAYSa4zl+41CrBZDk/H3UEnwft3jChAdo
         f2PWYXchJF4b0PfzPNqpjaJsPdbNi2OSAub37pexmDkEAJx7TfXlLBXX8EYt5o8OEpKV
         w8iej8a3PgmlCIkKI0naeE4vqeVWUgThZJw2AfZ9AoByV5qx/hUKwhwvS008142BXgQx
         grQbClcMvp7Qz/wsAaskcK9VCuSXB5eVIXAcnY+9fcASn8Y79Oa1osTfn3fKIUbX+Naa
         85hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hDT3nE7POQURLYb/miDqjuNBp0Vc/zU4W1xKS1Zir10=;
        b=yWNuvTh6n1Dg51i15Lk4DQ04WTpzOPcKWvYF1qYn4OSNxW0Lf1CB5iv6++xMeRGAWA
         TxhaFOjV0cCwTRBjay+toeqyrrUxhRCJkRwY5Z2BjZ4s3ugnX+Ss7vReFQlzF1dJPffW
         RdDgkIzpTA/GNI/02ozf4jkJ0e1spfPrBWmd6hEdJ6HWrpAFh/6czIs2xRsOUcfVtABB
         1K3fiLGmn05xiFiQI0HA232Ej43Mrn2QPCBYgysmHtklsVKcd8vRiHuOWd+uUhMegCzW
         VTWJIjzf9LjUswZrk+JT5VI9uvptwvfCvO/fn+oo+QAhF21oA6g7kewcoI0w916OKHn7
         UfAA==
X-Gm-Message-State: AOAM532v/nxv3f5ckLm41XIYqksROpv1fhC/m3azXBQ9jsaDHyvWdkaJ
        EKxoP44dxer8PSqd1r9N3+UrZA==
X-Google-Smtp-Source: ABdhPJzFFnEQGQE1vC/TeRle4tr3ZvGGEAyFLHWCb74mFvPQQE4i9F3W0lIy3u4FYLNagiENGn8BnA==
X-Received: by 2002:a05:651c:1a0f:b0:253:de1a:f486 with SMTP id by15-20020a05651c1a0f00b00253de1af486mr2397668ljb.29.1653071477481;
        Fri, 20 May 2022 11:31:17 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9556000000b0024f3d1daef4sm392951ljh.124.2022.05.20.11.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 11:31:16 -0700 (PDT)
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
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v11 0/7] PCI: qcom: Fix higher MSI vectors handling
Date:   Fri, 20 May 2022 21:31:07 +0300
Message-Id: <20220520183114.1356599-1-dmitry.baryshkov@linaro.org>
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

I have replied with my Tested-by to the patch at [2], which has landed
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

Changes since v10:
 - Remove has_split_msi_irqs flag. Trust DT and use split MSI IRQs if
   they are described in the DT. This removes the need for the
   pcie-qcom.c changes (everything is handled by the core (suggested by
   Johan).

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


Dmitry Baryshkov (7):
  PCI: dwc: Convert msi_irq to the array
  PCI: dwc: split MSI IRQ parsing/allocation to a separate function
  PCI: dwc: Handle MSIs routed to multiple GIC interrupts
  PCI: dwc: Implement special ISR handler for split MSI IRQ setup
  dt-bindings: PCI: qcom: Support additional MSI interrupts
  arm64: dts: qcom: sm8250: provide additional MSI interrupts
  dt-bindings: mfd: qcom,qca639x: add binding for QCA639x defvice

 .../devicetree/bindings/mfd/qcom,qca639x.yaml |  84 ++++++
 .../devicetree/bindings/pci/qcom,pcie.yaml    |  53 +++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  12 +-
 drivers/pci/controller/dwc/pci-dra7xx.c       |   2 +-
 drivers/pci/controller/dwc/pci-exynos.c       |   2 +-
 .../pci/controller/dwc/pcie-designware-host.c | 239 +++++++++++++-----
 drivers/pci/controller/dwc/pcie-designware.h  |   2 +-
 drivers/pci/controller/dwc/pcie-keembay.c     |   2 +-
 drivers/pci/controller/dwc/pcie-spear13xx.c   |   2 +-
 drivers/pci/controller/dwc/pcie-tegra194.c    |   2 +-
 10 files changed, 326 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml

-- 
2.35.1

