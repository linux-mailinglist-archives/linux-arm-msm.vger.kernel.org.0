Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4E825659C4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 17:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234338AbiGDP15 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 11:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234090AbiGDP1v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 11:27:51 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D06DEF0
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 08:27:48 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g11so1115323lfb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 08:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NaEf/yojdWUVoM4DyM+sfk4+GZRJzUjUlgOlA6lEjGY=;
        b=Mrwu36MjgDN58NqnTz2jyWdQ0tYqB+tjcSqgQ2zBdWDsXZEAPL79lO8VAVy+b/PkiW
         p02aRoNSBDFXJfqv7d0V6wqIzLUQIvviU8mq+yBCQP9EF25TbnxPxpqTKfJNRNQW1XiB
         c4IcTiWto1598x2XuGxylMBRlRX5jKtZ82cATD7Oo7Pmetv8EUk/Tf2aJX7jTX92hlUT
         M68IurH93s3mO5eES2bwr8uI77YKm7DWEYKAXnqIAjrZJVSZ7g+UeV3UrLfs2drWkkiz
         /1CpRmm/Qw30sK/P7f+HlFOSgUdaUIxo3F9bSWMxikGONc/kdkHSQUlgMYjIsXfqDQMt
         23uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NaEf/yojdWUVoM4DyM+sfk4+GZRJzUjUlgOlA6lEjGY=;
        b=Gmy2WOj0hV0wdPgmS0ees4U4TIeoG8DDZvBculOBV2bJ9l5SZRdS5vOdlh4TDOk2qk
         usaNBODx43/R9VO0jfdQChSdIk+AV+E10tuHBqIE5VWnfG9xiqc3i6KJrqS0ML9zyNk+
         Hffl6/NbM2SPX2J46eNLwlUTgNyusNEfC/6iqgSbTFy6QXdCMnz3rFf7OcXkK0NGEafq
         S5smancrvOpwwM7pNgkkxhaHU0BytEyPLo2W1w5Jp6tYP1b0I62aDhpk5fG95MELutzw
         pMWPk1WFSwv9EQpWt7lbpjj+uAR4owNpkN3Fxew7hoaTuJhgS5Wpsut2YL5sDICLcdbo
         J/pw==
X-Gm-Message-State: AJIora+SzOx7N/1fp0MQd0lofoToVGEvuXh2qMgNBbG0p1+AyPgmmMZx
        1aZ7q1lGAdKsmhfxmzCbQjLW7w==
X-Google-Smtp-Source: AGRyM1v17OicmD9S3ypvvtIziLorNT2p/J195EKs+S3PRcHVPoRFWRQsPq7dCCBW/uWSrt+QzVBrxg==
X-Received: by 2002:a05:6512:ea4:b0:482:9f6b:ed1f with SMTP id bi36-20020a0565120ea400b004829f6bed1fmr9134162lfb.383.1656948467168;
        Mon, 04 Jul 2022 08:27:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h14-20020a056512220e00b004786eb19049sm5175820lfu.24.2022.07.04.08.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 08:27:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v16 0/6] PCI: dwc: Fix higher MSI vectors handling
Date:   Mon,  4 Jul 2022 18:27:40 +0300
Message-Id: <20220704152746.807550-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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

Changes since v15:
 - Rebased on top of linux-next to take care of the conflict with the
   comit 27235cd867cf ("PCI: dwc: Fix MSI msi_msg DMA mapping").

Changes since v14:
 - Fixed the dtschema warnings in qcom,pcie.yaml (reported by Rob
   Herring)

Changes since v13:
 - Changed msiX from pointer to the char array (reported by Johan).

Changes since v12:
 - Dropped split_msi_names array in favour of generating the msi_name on
   the fly (Rob),
 - Dropped separate split MSI ISR as requested by Rob,
 - Many small syntax & spelling changes as suggested by Johan and Rob,
 - Moved a revert to be a last patch, as it is now a reminder to
   Lorenzo,
 - Renamed series to name dwc rather than qcom, as the are no more
   actual changes to the qcom PCIe driver (Johan thanks for all
   suggestions for making the code to work as is).

Changes since v11 (suggested by Johan):
 - Added back reporting errors for the "msi0" interrupt,
 - Stopped overriding num_vectors field if it is less than the amount of
   MSI vectors deduced from interrupt list,
 - Added a warning (and an override) if the host specifies more MSI
   vectors than available,
 - Moved has_split_msi_irq variable to the patch where it is used.

Changes since v10:
 - Remove has_split_msi_irqs flag. Trust DT and use split MSI IRQs if
   they are described in the DT. This removes the need for the
   pcie-qcom.c changes (everything is handled by the core (suggested by
   Johan).
 - Rebased on top of Lorenzo's DWC branch

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

Dmitry Baryshkov (6):
  PCI: dwc: Correct msi_irq condition in dw_pcie_free_msi()
  PCI: dwc: Convert msi_irq to the array
  PCI: dwc: split MSI IRQ parsing/allocation to a separate function
  PCI: dwc: Handle MSIs routed to multiple GIC interrupts
  dt-bindings: PCI: qcom: Support additional MSI interrupts
  arm64: dts: qcom: sm8250: provide additional MSI interrupts

 .../devicetree/bindings/pci/qcom,pcie.yaml    |  51 +++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  12 +-
 drivers/pci/controller/dwc/pci-dra7xx.c       |   2 +-
 drivers/pci/controller/dwc/pci-exynos.c       |   2 +-
 .../pci/controller/dwc/pcie-designware-host.c | 162 +++++++++++++-----
 drivers/pci/controller/dwc/pcie-designware.h  |   2 +-
 drivers/pci/controller/dwc/pcie-keembay.c     |   2 +-
 drivers/pci/controller/dwc/pcie-spear13xx.c   |   2 +-
 drivers/pci/controller/dwc/pcie-tegra194.c    |   2 +-
 9 files changed, 183 insertions(+), 54 deletions(-)

-- 
2.35.1

