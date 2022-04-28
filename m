Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1DA351333C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Apr 2022 14:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238153AbiD1MCw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 08:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbiD1MCw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 08:02:52 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B2E972EA
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 04:59:37 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id h29so925907lfj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 04:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B5+zPIoSBjlgURgVp9wtOYZR1bJTq6eewKu1uVP6YhU=;
        b=c/VJanwMlti5J5yVKfOURvmGJ7fdqY4Omar4Wc9K2ajzGa3ZaIgqtJFsI4ZEfH3NZH
         fOx1TizjiY2ceK/3N1pgDwAtNvNDdoanrJFnzzlA6MeF5WDNuqWBrxaeJ2ENT5KqtOeh
         7O1jw9bFWst4+41jSjZPVaxfj+jtPVV6620KXi2qnfARLD4UMJog7IsUMe9lHAIA73XW
         XgbafcfLxAH6Q6DfQbjTMFeeLd4Os9UkqwGkoC3p6b7sQRPKgim/W5tDJ9v4ePlY8S7k
         l8ACpRoUewJdwuTf2gMKfzYmPUrcyjyWObBb5a9ZZfpBXOOfnqbYMxcC6hWugLsB5i7o
         +jIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B5+zPIoSBjlgURgVp9wtOYZR1bJTq6eewKu1uVP6YhU=;
        b=wYnPZKceRlvew844DMjZShiAE527epq9XR/x95dTed1Sh2gBPL0bS6eZ62CQhA9/kv
         qMQKEej90bh4jzq1f7WFDNu6KhSoHom9XeY1jDifnSY+9ItHwfEys5WuihOSuBhIuTkW
         Oo0+auX0V8Jh/1t8QyolU01Jbr/vJa4kuFbCzpLc8N9myX6M/8SxXsEc7hxML85rtch2
         12D7sROqRlx7Xl38i83P1R2tAvmxrjRBb7hYLQpNMZ03UOhV/qRQYRaLJofAnA11Y4UZ
         YYVzHqlfBn+g9llsRGSzl+M/dGm1luvT0psoK2EK/PaZcoN/L+6XMg4UpavnpSTng69I
         sr5g==
X-Gm-Message-State: AOAM5315Q3SerTCa0+pBSobQzvmRwWmRhF4uaUjITvCfYUBWvYQe1pi8
        lJSxh9xggO+JtEFdi86aMzeKct/utIZUhQ==
X-Google-Smtp-Source: ABdhPJxWluFAEwayYWdZ18Igbd7n13o+2+04LTbINdT9ndVp5iJRzsIn9nW0A4Uo+Fjj+zJ08Qvr6Q==
X-Received: by 2002:a05:6512:320c:b0:472:1060:ca29 with SMTP id d12-20020a056512320c00b004721060ca29mr12011273lfe.280.1651147175742;
        Thu, 28 Apr 2022 04:59:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f1-20020a2e1f01000000b0024602522b5dsm2069137ljf.120.2022.04.28.04.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 04:59:35 -0700 (PDT)
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
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 0/7] PCI: qcom: Fix higher MSI vectors handling
Date:   Thu, 28 Apr 2022 14:59:27 +0300
Message-Id: <20220428115934.3414641-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

Patchseries dependecies: [2] (landed in pci-next) and [3] (for the
schema change).

Since we can not expect that other platforms will use multi-IRQ scheme
for MSI mapping (e.g. iMX and Tegra map all 256 MSI interrupts to single
IRQ), it's support is implemented directly in pcie-qcom rather than in
the core driver.

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
  PCI: qcom: Revert "PCI: qcom: Add support for handling MSIs from 8
    endpoints"
  PCI: dwc: Correct msi_irq condition in dw_pcie_free_msi()
  PCI: dwc: Add msi_host_deinit callback
  PCI: dwc: Export several functions useful for MSI implentations
  PCI: qcom: Handle MSI IRQs properly
  dt-bindings: pci/qcom,pcie: support additional MSI interrupts
  arm64: dts: qcom: sm8250: provide additional MSI interrupts

 .../devicetree/bindings/pci/qcom,pcie.yaml    |  51 ++++++-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  11 +-
 .../pci/controller/dwc/pcie-designware-host.c |  72 +++++----
 drivers/pci/controller/dwc/pcie-designware.h  |  12 ++
 drivers/pci/controller/dwc/pcie-qcom.c        | 138 +++++++++++++++++-
 5 files changed, 252 insertions(+), 32 deletions(-)

-- 
2.35.1

