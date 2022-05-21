Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D81E352FDB0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 17:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235575AbiEUPVJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 11:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239211AbiEUPU5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 11:20:57 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6C39FD2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:20:53 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id v9so3259148lja.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pbCJumIvaZj2zpN+SmeDlo0xua0tKmGkiZ0bd1awMlM=;
        b=safdv9AlTVvzf+MXK8qkbmhtKfLwz8OfmujIPkUKxio4+8wkBg5FZ81PEJiSruI/uk
         EjMdakx9InmElN1wU66yPxOUVOCwNoqXrHXjm4bJFPKE7+Q/AJ4krDZTnng7r4AnMMEt
         SnM7rTV9VMCGnvSOcX/4QBYnxyF53rkGEuz6I2cfAaGPKgJeM30bqcm4WSdlold7Sesj
         Q1tuuT4vAlJQqSG2T0/pmiCsFXIGGTV3TRbJO+eOHTF51EVEo1Tenbj2IHoxTj7ZXIE4
         Bvqya4yDbGrLQgJsy8QrGbS0sDhMAhcHu7UznPcVvZqCaznIKC5uKk0fRXWBJeZXS58z
         xDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pbCJumIvaZj2zpN+SmeDlo0xua0tKmGkiZ0bd1awMlM=;
        b=v8cApLT/rRy7b0y9vaadqKKpGnYKelxZVwb2EzviKwYfhiFPPlxe5GNBJiVIFmAhtI
         x510qObazVYo9r22LPLy6givtskGl2TunxAGV5HzjGWrgvXYm/u3XtvwJhbJ0ZWn2NQL
         3+tRa/i+RPY0aaYb5+KozBRfTR/FmB5jkz5l30uLoOdxHw0kt7DBCebeKuH7dp7+piU0
         Zw8gUDys9LYHT6A3ufkatvrrdWRthZcjzclvNghVnN/nYpPVbGtxtUEkaTPisQQbAgv7
         ZkstCGf3CjfgLFCPEPugQljWWTHM09Gv/BWDE7P+C04YwZBf1270c3R1DrNa/NShQ+pb
         rPxA==
X-Gm-Message-State: AOAM532L0CrbUilVOJP3VSFAIEojKOvJuuB0HLizII65hJj5DIjNlbcu
        le98O/ZuyY52Z83xLNdC0mFHNqt0idLa8A==
X-Google-Smtp-Source: ABdhPJw9NQFQOX/HhXYmY+TWv9ieRs/iJhrWRfzq5NFWY7NzypY1x1ESxJty2DFnlzO7oO/Q1eFxjw==
X-Received: by 2002:a05:651c:10a8:b0:253:c8a7:3afd with SMTP id k8-20020a05651c10a800b00253c8a73afdmr8356824ljn.431.1653146451876;
        Sat, 21 May 2022 08:20:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.156])
        by smtp.gmail.com with ESMTPSA id k8-20020a2e92c8000000b0024f3d1daeccsm739933ljh.84.2022.05.21.08.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 08:20:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 00/11] arm64: dts: qcom: initial Inforce IFC6560 board support
Date:   Sat, 21 May 2022 18:20:38 +0300
Message-Id: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
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
  arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support
  dt-bindings: arm: qcom: document sda660 SoC and ifc6560 board

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

