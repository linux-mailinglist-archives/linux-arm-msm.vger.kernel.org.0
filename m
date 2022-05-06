Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6921D51DBC6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 17:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442760AbiEFPYz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 11:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347956AbiEFPYz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 11:24:55 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE6C86D187
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 08:21:10 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id b32so1413197ljf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 08:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I55ZRoAdfLKVNaKBbEHKhxBfOeVaGDwGP7LdCu0kpbI=;
        b=TBBjnnqHN+rda3+SbI4xPAMCxwqjpEU5eHa/MnEV5xbJwL36SKZ5Npr2seshsd5kWg
         YTEQY3+LgRQfMOQCVw7kPwF3FEW2GVCTMvnxHfKEHI1jxQq1WiV4QnvRL6no0G1G+GLp
         g5xpw0TXVpVz4GMb24Dy5WQeWapifBQe8MrQSi5U9qsdfyQHx6hJSdyYoBNMb2RTszt/
         IIKq5ZYPrHSWnsZDAvi/k3xIuly3v3ntlHOEDry2uQJ9XRGQpbxaTxuoAVuXYaoTw1ku
         h4cDOdqZvnD70WmfymcJHkKNefA38eTrCpH4XKgyfebP6nd4Lo3MfrdoROu4N47Mz92w
         jJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I55ZRoAdfLKVNaKBbEHKhxBfOeVaGDwGP7LdCu0kpbI=;
        b=Xn+djZUiF9ClFwwCanytdyqPcjnLbeqy2G6gyX1Lzjp1NclzUD/iJj6ePtm36b0P3c
         kFqh8pOnjK64PDDSfVXWszLnBYxxbma67zx8+5OY6suTrAKEafpFHzBcNRJyPGDJVuhV
         ofqvx/xseM7PbLQB1c2EwZNcqnYLW9aEkqh0/C1tPOog2KzR4pa08mMpp289RHZYA0Wj
         9XrZ/4WOgv3locJ3Rx6/dOK96gO6kLB9VWaDjouEJPkNjBVIh9xrAk49kU5eBPAneVmP
         wl/wxBSLdl1cOaueUwWCivd8mNyEUWm0GINvr31YPHyS8AH4f7aoWG5bhhpMnHzKH768
         fSCA==
X-Gm-Message-State: AOAM5305e0fQB8sixZ2voqKCfAkqU3dWOeyUYGFx8iKpHijrSYInjQxL
        kbMiVdQ1JqCuQ+Jc9G3LEmMrrQ==
X-Google-Smtp-Source: ABdhPJw9UHCPNY2DyVm4gg4MEluyi+wNK+Qmmr9vuB6nhdv+qxm1OICdX98ORMkCYczlryjt5TSeSA==
X-Received: by 2002:a2e:bd85:0:b0:250:9bf2:8e27 with SMTP id o5-20020a2ebd85000000b002509bf28e27mr2307306ljq.177.1651850469086;
        Fri, 06 May 2022 08:21:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k16-20020a05651239d000b0047255d211e6sm716757lfu.277.2022.05.06.08.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 08:21:08 -0700 (PDT)
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
Subject: [PATCH v6 0/8] dt-bindings: YAMLify pci/qcom,pcie schema
Date:   Fri,  6 May 2022 18:20:59 +0300
Message-Id: <20220506152107.1527552-1-dmitry.baryshkov@linaro.org>
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

Convert pci/qcom,pcie schema to YAML description. The first patch
introduces several warnings which are fixed by the other patches in the
series.

Note regarding the snps,dw-pcie compatibility. The Qualcomm PCIe
controller uses Synopsys PCIe IP core. However it is not just fused to
the address space. Accessing PCIe registers requires several clocks and
regulators to be powered up. Thus it can be assumed that the qcom,pcie
bindings are not fully compatible with the snps,dw-pcie schema.

Changes since v5:
 - s/stance/stanza (pointed out by Bjorn Helgaas)

Changes since v4:
 - Change subjects to follow convention (suggested by Bjorn Helgaas)

Changes since v3:
 - Rebase on linux-next to include sm8150 patches

Changes since v2 (still kudos to Krzyshtof):
 - Readded reg-names conversion patch
 - Mention wake-gpio update in the commit message
 - Remove extra quotes in the schema

Changes since v1 (all kudos to Krzyshtof):
 - Dropped the reg-names patch. It will be handled separately
 - Squashed the snps,dw-pcie removal (from schema) into the first patch
 - Replaced deprecated perst-gpio and wake-gpio with perst-gpios and
   wake-gpios in the examples and in DT files
 - Moved common clocks/clock-names, resets/reset-names and power-domains
   properties to the top level of the schema, leaving only platform
   specifics in the conditional branches
 - Dropped iommu-map/iommu-map-mask for now
 - Added (missed) interrupt-cells, clocks, clock-names, resets,
   reset-names properties to the required list (resets/reset-names are
   removed in the next patch, as they are not used on msm8996)
 - Fixed IRQ flags in the examples
 - Merged apq8064/ipq8064 into the single condition statement
 - Added extra empty lines

Dmitry Baryshkov (8):
  dt-bindings: PCI: qcom: Convert to YAML
  dt-bindings: PCI: qcom: Do not require resets on msm8996 platforms
  dt-bindings: PCI: qcom: Specify reg-names explicitly
  dt-bindings: PCI: qcom: Add schema for sc7280 chipset
  arm64: dts: qcom: stop using snps,dw-pcie falback
  arm: dts: qcom: stop using snps,dw-pcie falback
  arm: dts: qcom-*: replace deprecated perst-gpio with perst-gpios
  arm64: dts: qcom: replace deprecated perst-gpio with perst-gpios

 .../devicetree/bindings/pci/qcom,pcie.txt     | 398 ----------
 .../devicetree/bindings/pci/qcom,pcie.yaml    | 714 ++++++++++++++++++
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts   |   2 +-
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts    |   2 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi           |   2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi |   2 +-
 .../boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts    |   2 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi           |   2 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi           |   6 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts   |   6 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts     |   4 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi    |   4 +-
 .../dts/qcom/msm8996-sony-xperia-tone.dtsi    |   4 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   6 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi      |   2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |   2 +-
 .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi |   2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      |   2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |   4 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   4 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |   6 +-
 21 files changed, 746 insertions(+), 430 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie.yaml

-- 
2.35.1

