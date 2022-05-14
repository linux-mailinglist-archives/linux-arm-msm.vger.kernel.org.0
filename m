Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80E82527394
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 21:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234814AbiENTBq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 15:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiENTBo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 15:01:44 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3A4286FD
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:41 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bq30so19689097lfb.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vi8fxy71W2to+9RR7qoY/4t3tKTZ+kc+BCzeiGIfqZ8=;
        b=tG8PoGtmnkm4P+M+2Q0mP7rD0moNYkuuXeoArbzEoZUg9o+yx2HL5DY6srGOW+oZIQ
         pU9kEn2J5AMXnP9nrnZkBS6jV6jFLTPYgKWw4/FvJmhAvKtpruAlRbzQjvOHH51dIh4S
         2eqJ6VtqNLLDK30y778TxntUE+jwjuE8IZos4hov17MkgPIT2TgVNenQD0Hyz3KYnyC5
         5lXz8EFHIaftfEEwnIABCSY8Jousf4u90cZkUGiqABU2aekRwqzn3Yf9VSRuAYsS/ryi
         /3b54sqjnYwXIHfo3Wx+Dr2iDeR1OsS73GsaI8eJlOXv9nfcou3hG68OsZZRT2saZyRD
         0OXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vi8fxy71W2to+9RR7qoY/4t3tKTZ+kc+BCzeiGIfqZ8=;
        b=gxmY+h24TLcXUo9BB/q1Smi5dI+QtEmsztMAb8IqGi6wfmXUj7PoLDoKiT0MV7qaSm
         dexi2qafw4CftNB5K+zFungcoPpoLf3yebQtN/1GtkRw3jIt6xlJHXnH+uAQEptgnue5
         Ke23pbqKaXjN+D/QAVM0TN2IiWysmQsJ74MOtLpAg2ZtRuPgXNifxZw7SO7akslQr6pm
         35VAp3NER+MIlOy/cW+ZA1rWcIlenqej+EmnkPOzSOw5F8dNAuoZOqLuyv7tg9DY9Bcr
         zwDtS2SIZR4/T7NCVo+/6djm5AGuTqWFw79mEVcPnfdLsdvI7LC8L3xR5krJqGEot3qI
         fIIw==
X-Gm-Message-State: AOAM531n0sFIIF2FDOxw0Vtpk8cF/tIQYv/iMalQpACcdZsv+AHfW5nG
        nodg0100o9GCrx6p17d4uzBUqA==
X-Google-Smtp-Source: ABdhPJzY4MEctIFUIHNhIZWGfaYng++jMQ9SsNpU5l/pv0mnqufUNP9TV8JSM5vlWi2CtZF9xuWOCw==
X-Received: by 2002:a05:6512:169a:b0:44a:fea7:50a5 with SMTP id bu26-20020a056512169a00b0044afea750a5mr7591148lfb.498.1652554899968;
        Sat, 14 May 2022 12:01:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([93.92.200.201])
        by smtp.gmail.com with ESMTPSA id y26-20020ac255ba000000b0047255d210f4sm787427lfg.35.2022.05.14.12.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 12:01:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 00/12] arm64: dts: qcom: initial Inforce IFC6560 board support
Date:   Sat, 14 May 2022 22:01:26 +0300
Message-Id: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
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

his work is largely based on the previous work by Bjorn Andersson ([1])

Changes since v3:
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
 .../boot/dts/qcom/sda660-inforce-ifc6560.dts  | 461 ++++++++++++++++++
 .../dts/qcom/sdm630-sony-xperia-nile.dtsi     |  18 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          | 101 +++-
 .../sdm636-sony-xperia-ganges-mermaid.dts     |   2 +-
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  |  18 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi          |   3 +
 8 files changed, 581 insertions(+), 29 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts

-- 
2.35.1

