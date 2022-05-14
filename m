Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60EF0527197
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 16:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232926AbiENOKq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 10:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232920AbiENOKp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 10:10:45 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49755140C1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:10:44 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id o22so12440914ljp.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 07:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cViI95/oKKeMLGtoQusTFe3W64lJwHzV9ynNluvfOWg=;
        b=sUB/XzUlDriK0G/2bCWfaRPNKCDxALe+8cGEm2/10u9eCIoqaM6k40oG0g2hVPW/RZ
         dfXY5w13Hkat0djujts1KV8VgbFVpbwUlcRfRtCZ4ekV71Hoyzx6AxGkQhPcrLLVe7y/
         qTxPHVJsTyfnhthYFuG8/Ma9DYZsoW0p2XpTh/N5pzYSAsbAOGmHNYDwrYQ4bqvPTyLu
         I2UsbAvTkeS07YnsLsUfDq0UKRRWleBx3fC05bNyMD/fYJQmHtx5l+ARon4Cl5tSAfrp
         39d1dRd7wzPxTLi2JFhJr4Mrc7Ym+Kq2taj0gf3QYR/me2ClDSLRUgobtFFs9aT6LQfk
         D1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cViI95/oKKeMLGtoQusTFe3W64lJwHzV9ynNluvfOWg=;
        b=U7iSXUOcYhJF01NQaIwBA6TJ7Ust9ESKUd7SKFvRs4UO1HMMJvsZM9Wpv0eea0jPAg
         KLB47C+r7QnIMVlqy/SB1nj4u2lbHX4VS1aa0awm6eIgfA14YZvPiap8P9pk0DexWCpH
         d5JVd6L3p8mKloYkc9zHRJcU2+ZDAY12jMXZmeWYa2mihgOEPIYAk5adMr2y83KLq/ZB
         yZwX3x6/uEX3qjb5ZDAq8ApxZmM+tGMqNGYtKz4jn10HKpTh12AOTKoeEsTp5fHFsPaO
         /SVajMVg6fUY6OV+InYuxWfDJzyGLDnSJU9olBioWGCnBQE2sjRiLIy9PSmSv71R0heH
         z7YQ==
X-Gm-Message-State: AOAM530SFgYZm4+Z5r4hWTesHFa/f/bJ0yya6oka7IHcfRYzZwMtyYO2
        k/hpQRFai1euB23HYLHgPkx0Rg==
X-Google-Smtp-Source: ABdhPJxgxdZKSonE9t9pgq+i2o3qbVWKLwMY16Hebj2cAKXuGdbawmsZ64BOeszbEPX3mo0XmvIUwA==
X-Received: by 2002:a2e:b911:0:b0:24f:310d:7f02 with SMTP id b17-20020a2eb911000000b0024f310d7f02mr5814042ljb.179.1652537442583;
        Sat, 14 May 2022 07:10:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x9-20020a05651c104900b0024f3d1daedasm845912ljm.98.2022.05.14.07.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 07:10:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 00/12] arm64: dts: qcom: initial Inforce IFC6560 board support
Date:   Sat, 14 May 2022 17:10:29 +0300
Message-Id: <20220514141041.3158521-1-dmitry.baryshkov@linaro.org>
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

This work is largely based on the previous work by Bjorn Andersson ([1])

Changes since v3 (most points based on review by Marijn):
- Fixed a typo in dsi0 patch
- Fixed indentation here and there
- Renamed qusb2phy to qusb2phy0 to play better with qusb2phy1
- Fixed the ICC path for the GPU
- Fixed sdhc2 pinconf for sdm636-sony-xperia-ganges-mermaid
- Moved SDHC2 card detect gpio pin to board files

Changes since v2:
- Removed useless enablement of mdp node from the board file. It is
  already enabled in the SoC dtsi file.

Changes since v1 (mostly based on Kondrad's review):
- Also disabled dsi0/dsi0 phy in sdm630.dtsi
- Removed the clock from BAM DMA devices rather than disabling them
  completely
- Replaced numbers with symbolic names for interconnects in sdm630.dtsi
- Switched to "qcom,sda660" as a fallback compatible string
- Added dt-bindings for the qcom,sda660 compat
- Removed extra nesting level from the adsp firmware path
- Replaced numbers with proper symbolic names in the board file
- Added chassis-type property
- Changed the order of blsp entries in the board file
- Removed spurious newlines
- Changed the order of regulator properties
- Changed the DSI data-lines to list all four lanes. Still use just
  three lanes for the adv bridge (and describe the reason in the
  comment)

Changes since Bjorn's v2:
- Disable dsi1, dsi1 phy, GPU by default in sdm660.dtsi/sdm630.dtsi
- Fix qusb2phy ref clock
- Added USB2 host support to sdm630.dtsi
- Renamed DTS to follow SoC-vendor-board pattern
- Fixed vph_pwr voltage
- Removed extra/unrelated comments
- Added keys, USB2, USB3,
- Added configuration for the attached HDMI bridge
- Enabled MDP, MDSS and DSI0/DSI0 PHY devices
- Removed uart pinctrl and /reserved-mem nodes (present in main dtsi
  file)
- Added card detection for the SDCC2
- Disabled BLSP BAM DMA devices, they make the board reset during boot

[1] https://lore.kernel.org/linux-arm-msm/20210825221110.1498718-1-bjorn.andersson@linaro.org/#t

Dmitry Baryshkov (12):
  arm64: dts: qcom: sdm630: disable dsi0/dsi0_phy by default
  arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy by default
  arm64: dts: qcom: sdm630: disable GPU by default
  arm64: dts: qcom: sdm630: fix the qusb2phy ref clock
  arm64: dts: qcom: sdm630: rename qusb2phy to qusb2phy0
  arm64: dts: qcom: sdm630: add second (HS) USB host support
  arm64: dts: qcom: sdm630: fix gpu's interconnect path
  arm64: dts: qcom: sdm630: use defined symbols for interconnects
  arm64: dts: qcom: sdm636-sony-xperia-ganges-mermaid: correct sdc2
    pinconf
  arm64: dts: qcom: sdm660: move SDHC2 card detect pinconf to board
    files
  arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support
  dt-bindings: arm: qcom: document sda660 SoC and ifc6560 board

 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sda660-inforce-ifc6560.dts  | 471 ++++++++++++++++++
 .../dts/qcom/sdm630-sony-xperia-nile.dtsi     |  18 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          | 101 +++-
 .../sdm636-sony-xperia-ganges-mermaid.dts     |   2 +-
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  |  18 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   3 +
 8 files changed, 591 insertions(+), 29 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts

-- 
2.35.1

