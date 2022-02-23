Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 205EA4C1C36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 20:30:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244377AbiBWTaf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 14:30:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244380AbiBWTaf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 14:30:35 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E95147AF8
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 11:30:07 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id m11so16112579pls.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 11:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ka9RHf5LlAV9t5YczB4B6EzcVCEwJsVaAo0A7urPEuQ=;
        b=uNfsilgsoMSprr0nmijK5vWZsLbNKMzuPQCUHZlT6W83s/RX4FXCDUKRGVvE8oSoly
         TNDfU1DgpOitg2Vvh6mTKiUSyXyA8f33alp/ANVOrr7pGencnFPttIugbPlcxN/UD5Nk
         HSj/ScXuxGNsrNRtNF2pdWgUj9khCPCOab5bhT/YOPnlpVLGO4iFvaD010Gw3o3+9LGI
         /8ImEYESSBLIrIotYit/iJuUR4QdYQU+O9D8QlW1Fn76bh7iRVZNQxdKhqCS1Lbp1b3W
         c/NQmBv3muRawg9UgwFagYzq8W8JUMZsYtl7tDAYsKfBT/usuiwNlVwkUwZ0H3LtdTOd
         dezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ka9RHf5LlAV9t5YczB4B6EzcVCEwJsVaAo0A7urPEuQ=;
        b=KguycqGVaJdvtoBl+BYqBEXQuUv9NHyNNXS2imgYxU7opdudX8ZNhAtpLDgBoFGJr2
         KxDauCEkcfO96rBubYQrN2/6GidQf3XKU8ckTaca+f6e6qJXJayRDDkM8yArMdyxcCje
         /UVxpYrGGuHjISSTsEcUejgePejslgWRTv8rX8x6rYHpMSiT1mZz3jQdxzwt54xB4+9i
         Y2A+Yf2hoKW0BPrZYLDV5XUQ35PrgUqn/I8W+nVZ5dw5fhCAV6+B5tRZJ+AZfCHcFZqX
         JkY38SDvplfoOlX1/g6+Buc47+UKtSRtYoiXU3R+RUwYrr+bz0vv+63oLa2/YE4mleRa
         mMfQ==
X-Gm-Message-State: AOAM532J5CCpmhS/nvyOtLd6t9kpb5kGMdQpZzSINKg42i+PPDPOkRV+
        i3+OqUvoHsWcaay+7k8Q62Jvq50wec6T7g==
X-Google-Smtp-Source: ABdhPJxdcCJcayTBWBXDYvjtmSzduPXab/lhZ3pLtgwrLQGH4kkv87u7YxVz3zGKvvtjiijk6roiUw==
X-Received: by 2002:a17:902:8644:b0:14f:cf95:648a with SMTP id y4-20020a170902864400b0014fcf95648amr1110647plt.138.1645644606234;
        Wed, 23 Feb 2022 11:30:06 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:180f:6b3c:fda0:57e9:7d44:2aa7])
        by smtp.gmail.com with ESMTPSA id z10-20020a17090a8b8a00b001b8d20074c8sm3719917pjn.33.2022.02.23.11.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 11:30:05 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, svarbanov@mm-sol.com,
        bhelgaas@google.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: [PATCH 0/6] Add PCIe support for SM8150 SoC
Date:   Thu, 24 Feb 2022 00:59:40 +0530
Message-Id: <20220223192946.473172-1-bhupesh.sharma@linaro.org>
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

This series adds PCIe support for Qualcomm SM8150 SoC with relevant PHYs.
There are 2 PCIe instances on this SoC each with different PHYs. The PCIe
controller and PHYs are mostly compatible with the ones found on SM8250
SoC, hence the old drivers are modified to add the support.

This series has been tested on SA8155p ADP board with QCA6696 chipset connected
onboard.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>

Bhupesh Sharma (6):
  dt-bindings: pci: qcom: Document PCIe bindings for SM8150 SoC
  dt-bindings: phy: qcom,qmp: Add SM8150 PCIe PHY bindings
  phy: qcom-qmp: Add SM8150 PCIe QMP PHYs
  PCI: qcom: Add SM8150 SoC support
  arm64: dts: qcom: sm8150: Add pcie nodes for SM8150
  arm64: dts: qcom: sa8155: Enable pcie nodes

 .../devicetree/bindings/pci/qcom,pcie.txt     |   5 +-
 .../devicetree/bindings/phy/qcom,qmp-phy.yaml |   4 +
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts      |  42 +++
 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 243 ++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom.c        |  16 ++
 drivers/phy/qualcomm/phy-qcom-qmp.c           |  90 +++++++
 6 files changed, 398 insertions(+), 2 deletions(-)

-- 
2.35.1

