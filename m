Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3E067984F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 13:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231510AbjAXMrZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 07:47:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233970AbjAXMrY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 07:47:24 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C233D918
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 04:47:22 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id y1so9268687wru.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 04:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NQY35x77x8kOxBsXweZuI8QRw64wWTJF3dft8bDEqWY=;
        b=PiMMyODDWRQalMesG3gfe5bcjonEYBSCvJw/RQKhDkj8rVDL85SL3V7NUqvU9Tx7mg
         /jjHHUivYBes8xRQhqokxAILXlynP0KUbQEtTYVND0yahLoiHyL3CLqktoQr+Y/NopUX
         mHRTyBITWCcndRFO3zkI2UKFAEi1CwWBHFsWy6+Opp7h9M8nLoXOeuuh6BEqXcKbE3p0
         NNN3ugOyaK/TpA53cLo0F9droSpVeNMnGo0xnmk7yd7LjVYiVMfYC550vflqOhnLpUm8
         P0m4j9boYN5yD3rSOCy0pwlVHipMjULnvDxnMtDMUqcFUmY88DJwyEw9lZLbaGbf59Hn
         8EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQY35x77x8kOxBsXweZuI8QRw64wWTJF3dft8bDEqWY=;
        b=Efsf4OZozEpDqwNw9X6U2rUKskc7XOULwRiF7RuTYfNzbM9VN7znPPQkraBb7DC+Is
         wgwjaNLqDY+u6rOQu+1A6cZJwx4HNqN1HhMDA9xayErXgeXYyjEO/GtX4GvRTs9djQBR
         c2mT13rEP3+CCSJ2w3YXDeLo5YUTWHiQM7QCRLpZLr979UPhIjMH7jyiPMgz0ljIS4fS
         yzk+j5ztEOZQYPkc0mnjaNHVrWunzHc7iCrCyIj4HP7lYnlYBzn3yQT493CXR1NFcMNB
         7gZN3ei0dVPJ1sJ8NNm76ynOCGSPGGkNSennyv/leB0KC6Y42W9DnmVzulPIgc3G+0OK
         P2Vw==
X-Gm-Message-State: AFqh2kqN8vwIfz03QAIY8LPZJC+ZPyvmjibtN2lVkAVW8MuApcT8NjuG
        QSHTiiEIH7dynaqn8Fzo73T9dA==
X-Google-Smtp-Source: AMrXdXv5jJuf7e8t1rbwRrcG+mysui5oKWwSENlk39CSpsFbmdFPiRUPasU4MUTSIxXuNY1nRxqWrg==
X-Received: by 2002:a5d:457a:0:b0:2bb:e993:6c85 with SMTP id a26-20020a5d457a000000b002bbe9936c85mr23682176wrc.35.1674564440879;
        Tue, 24 Jan 2023 04:47:20 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id a5-20020a5d5705000000b002bdbde1d3absm1766840wrv.78.2023.01.24.04.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 04:47:20 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
Subject: [PATCH v5 00/12] sm8550: Add PCIe HC and PHY support
Date:   Tue, 24 Jan 2023 14:47:02 +0200
Message-Id: <20230124124714.3087948-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

For changelogs please look at each patch individually.

Abel Vesa (12):
  dt-bindings: phy: Add QMP PCIe PHY comptible for SM8550
  phy: qcom-qmp: pcs: Add v6 register offsets
  phy: qcom-qmp: pcs: Add v6.20 register offsets
  phy: qcom-qmp: pcs-pcie: Add v6 register offsets
  phy: qcom-qmp: pcs-pcie: Add v6.20 register offsets
  phy: qcom-qmp: qserdes-txrx: Add v6.20 register offsets
  phy: qcom-qmp: qserdes-lane-shared: Add v6 register offsets
  phy: qcom-qmp-pcie: Add support for SM8550 g3x2 and g4x2 PCIEs
  dt-bindings: PCI: qcom: Add SM8550 compatible
  PCI: qcom: Add SM8550 PCIe support
  arm64: dts: qcom: sm8550: Add PCIe PHYs and controllers nodes
  arm64: dts: qcom: sm8550-mtp: Add PCIe PHYs and controllers nodes

 .../devicetree/bindings/pci/qcom,pcie.yaml    |  44 +++
 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       |  30 +-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts       |  37 ++
 arch/arm64/boot/dts/qcom/sm8550.dtsi          | 203 +++++++++-
 drivers/pci/controller/dwc/pcie-qcom.c        |  25 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 369 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h   |  15 +
 .../qualcomm/phy-qcom-qmp-pcs-pcie-v6_20.h    |  23 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h    |  16 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_20.h |  18 +
 .../phy-qcom-qmp-qserdes-ln-shrd-v6.h         |  32 ++
 .../phy-qcom-qmp-qserdes-txrx-v6_20.h         |  45 +++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   6 +
 13 files changed, 846 insertions(+), 17 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_20.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_20.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h

-- 
2.34.1

