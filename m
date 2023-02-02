Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0B2687D6C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 13:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjBBMjP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 07:39:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjBBMjP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 07:39:15 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C61A71991
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 04:39:12 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso1271253wms.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 04:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zlZndr/Xexpx1FJ6qzYopCyK98Fm20nZ/gdrxKxxBl8=;
        b=C4Z2jcQloy00i40SwfiwkDblC0TFewrd5wlTqTxWF9eFn+OhE6sg4xgYhXTlme4V2a
         7NpBa7HTQ76YyELpe/9jbdLOPW6LuJstV7EnpEEq44hwJ6x9ZHxJpapy1nxHp+P137IX
         ZVvuPIMvA75u+wJ8WXOBW2Qq+cXemBtIt3OE/ScU6pmaFHxGQFrBAifBAtpTlJgruy5J
         uTKI8rnkA4k5fAVEQWiIjOAsurHrtH+dE/Szzkjr/8Nn3pNViAWHfBdZVCMWSMjP4N+K
         I4zuzZ8rR4F3qwI9Vt/7EsspcCkwJ7p6g0E2U8XdMV9ZCs5om6m47/IRLiVEifmTFV3d
         61JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlZndr/Xexpx1FJ6qzYopCyK98Fm20nZ/gdrxKxxBl8=;
        b=lDcW0o6gnEVkfnOLoV8gcxNi5wu4tQpCW3Vl2ue1MmGxK0rWN1oHN90ZXwIWiLJ00A
         exloQ7+4x7T8X23IcMZ5AVmf1XTZ59sGP/ByfflQm3Spy1fm2E6bEiSVnT7u0Tq/LOYg
         LTiXdJ6kxMqPTN/CCoQ8Z5Jaj35WD9k+Sz7aqJAWR5YY27dXizaTXLZhHZRxJDE+FIKv
         UggJ5+cbut0LtSHELHEzr/AgMlKCEVTqgO/LG+m0s0s+32PIR6sEONNfm2mO26XKbTwi
         nQy6um0PkTNko3BhOD6wswXKe7ZHX7DfCMvKpFuX/crIKbdNBxNnxajZWwVCCR5DpIwD
         ndJw==
X-Gm-Message-State: AO0yUKWOR4nk1YNk93n6gYf+00fdXtxdhGjhJ0EZ/p9n/iOYMQ77X8/1
        hJbp/Vu1eqtOPFG9muHijvCbetipOd2Ip0mr
X-Google-Smtp-Source: AK7set8NZe+DbGPlG32ChRQ12zNv/gAXhW6Byz18RrufHiLXw/dncDeZVwj5pQAfT/iqrXk3bPaAZg==
X-Received: by 2002:a05:600c:4f06:b0:3da:b40f:7a55 with SMTP id l6-20020a05600c4f0600b003dab40f7a55mr1811857wmq.6.1675341551096;
        Thu, 02 Feb 2023 04:39:11 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id j5-20020adff005000000b002bddd75a83fsm19525644wro.8.2023.02.02.04.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 04:39:10 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 00/12] sm8550: Add PCIe HC and PHY support
Date:   Thu,  2 Feb 2023 14:38:50 +0200
Message-Id: <20230202123902.3831491-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts       |  38 ++
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
 13 files changed, 847 insertions(+), 17 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_20.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6_20.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h

-- 
2.34.1

