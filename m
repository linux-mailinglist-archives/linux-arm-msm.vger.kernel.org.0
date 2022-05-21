Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0484752FF47
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 22:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbiEUU1P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 16:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234929AbiEUU1O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 16:27:14 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A861F5932A
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:27:12 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id e4so12475686ljb.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/PpAW1rCA8K0AeROLg21U6nb5i495vyBnLfIWXUn2ag=;
        b=j5XFMjYBtWYfnsUjmN100CLn2yTUqOuzYxqRrZ9+xC7NSg8L0dclwiWazMBfgqkTwa
         vd20bBVvONW2IYgt6wl6Fj1RRq/C99QRQ6bxmTHVQ/1hGrCehYtkIQQfI2H3qvGUkWvw
         6yTgFS+btTmC2HwveY+NR4T87E0crhPnMiqhMm/ia8oBDt7y6FjkCz/YIm8U7UZOevZc
         0Z+p41jBY4IV6oWd40qO4EnATY3p6+YHVzNwJfI8koL7ubh84oSQ1pJUFmPInVOwuMYQ
         fP4SoG1b3CiOEkCE/Dg8torkK3cjnn1BfvTN9xtYeOZG2uqncQ8n0oJJkqGfsS7ZoLQm
         ogqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/PpAW1rCA8K0AeROLg21U6nb5i495vyBnLfIWXUn2ag=;
        b=Jw8aItOuimN1yTp81p6NMs4qUQWW1th0I/Odg04WYcRsA5JdkDfxNrxVLNNA63PIZn
         x+9Wg/ei7slrftoHPZ33ktitRYYQKha/VZHmbkPANA109NpVChH73kTX9/xOkEvOJ/d4
         S2f3tDoovuKNAR8N9HsCKL0n3YNwIMHwOCHryRwVc0v7OEDcDQ8eIi7vPfSC/kNhOXsm
         k88/hei07dii55DeYFTH8r4wtP9ZjkCKfHde5iw9FfG4A2QoTlu7x5T30ALFIkiFaNIR
         N3c2GAGx5HyZslWchtWMEl48CO8EA6OFTkSAksFOIIbNdSTNaoCe4zGokmFuoabTGXcb
         tPYw==
X-Gm-Message-State: AOAM532M0EuOKuMXNQVtUkQMGNnS7SS+2U0BliW8TU0cHwEddW/Kw1w7
        tLCNBc4o315D7DloMN1EDzGj6Q==
X-Google-Smtp-Source: ABdhPJzsARt5RgDDONEB2hjhlcrRNPrC5kiOYHXqglPmG3Tzp5wHQCpO2w1rsV9D5bNsstpmHkgfWQ==
X-Received: by 2002:a2e:7c15:0:b0:253:e242:1897 with SMTP id x21-20020a2e7c15000000b00253e2421897mr2314088ljc.72.1653164830998;
        Sat, 21 May 2022 13:27:10 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id x1-20020ac259c1000000b004786291114fsm317773lfn.140.2022.05.21.13.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 13:27:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v7 00/11] arm64: dts: qcom: initial Inforce IFC6560 board support
Date:   Sat, 21 May 2022 23:26:57 +0300
Message-Id: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
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

Changes since v6:
- Rebase on top of linux-next
- Reorder last two patches to have bindings come before the dts (Marijn)
- Add missed R-b tags, excuse me Marijn.

Changes since v5:
- Drop icc patch, as there are questions whether the original paths are
  valid. It will be submitted separately.

Changes since v4:
- Remove unused mdp and sd-card-det-n DT nodes from the ifc6560 dts
  (thanks to Konrad).

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

Dmitry Baryshkov (11):
  arm64: dts: qcom: sdm630: disable dsi0/dsi0_phy by default
  arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy by default
  arm64: dts: qcom: sdm630: disable GPU by default
  arm64: dts: qcom: sdm630: fix the qusb2phy ref clock
  arm64: dts: qcom: sdm630: rename qusb2phy to qusb2phy0
  arm64: dts: qcom: sdm630: add second (HS) USB host support
  arm64: dts: qcom: sdm630: fix gpu's interconnect path
  arm64: dts: qcom: sdm636-sony-xperia-ganges-mermaid: correct sdc2
    pinconf
  arm64: dts: qcom: sdm660: move SDHC2 card detect pinconf to board
    files
  dt-bindings: arm: qcom: document sda660 SoC and ifc6560 board
  arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support

 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sda660-inforce-ifc6560.dts  | 461 ++++++++++++++++++
 .../dts/qcom/sdm630-sony-xperia-nile.dtsi     |  18 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |  81 ++-
 .../sdm636-sony-xperia-ganges-mermaid.dts     |   2 +-
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  |  18 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   3 +
 8 files changed, 571 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts

-- 
2.35.1

