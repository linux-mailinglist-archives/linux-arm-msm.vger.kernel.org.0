Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAA4751E993
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 May 2022 21:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443612AbiEGTxM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 May 2022 15:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241958AbiEGTxL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 May 2022 15:53:11 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 383481704B
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 May 2022 12:49:21 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id p189so6311576wmp.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 May 2022 12:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mSvloqTW+LAcBVfdkk4tL0r4VTIkRhMmaRGKt/79Bfg=;
        b=o1QPOGp8HwQeIdRobedB1A9KVLtQfmzlT5DUrnJJHxPwYz0jKn+v2IVywg8Jmfggqw
         6IADOqj5ILtxFJhChtgQ+s7YOrxoxRdI55K4RvB0DyekZFGRMpJTNfQ2OuiR6+Rb2+EF
         g6BJU1fo9f8k/tH995TpYM9LuVEfGHNB8zUnk0xKXNOkw1NQNCxQuUfe6dOhSunR2gE2
         UlSgwTueXaYXIsvS656PYL1QeU7j5/8tkbREIAx1YzXsfv+fD8YRKBY5fmUX0fU2V5CR
         VAxezDkXbEfyrCMW+4Cl5Uld/LWBBMZ46ifpifTWpWqAgpzHruarponcAk4G4nv0V3RL
         BYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mSvloqTW+LAcBVfdkk4tL0r4VTIkRhMmaRGKt/79Bfg=;
        b=hB6FtrNbRLcq0SVCrRC3k1IzVFh1/U7K48IQOE4GVsM+PILK1c/s8r7QSlU2DOa9Xd
         q5+9/CtgJtdrmVQ8ZxtoMHZXG/JsPzR4HU0Kd6bGyrIEyJQFWUbAEor8YT2EwZE77LxM
         AGbeOJCzE5zBmx3eZxjW41qnjnvOyYAygESWnaX8PjSKCgJOWRqcf4Og/wjbCjHvceVn
         0ClOvekGEbJAXTictVOVMp1hp+ix/eT3E4yFc4eJsx81uM2LppKCsB3thxwKPqfh7h9L
         +SzAto9nJjw+9cPfrCmrNRvhiafWrS94bjoTmOzLkz+InczwmlprzQ+xPuf6NlNRkhuH
         7u/A==
X-Gm-Message-State: AOAM532MPXMmSReY2uNdnz0avhPY6HCCmUJBGXQ7ff0Y9mQ8KltU3Bai
        C7fscBq7SsmpqfhN2hRW//W6zA==
X-Google-Smtp-Source: ABdhPJzm5xHbzQNLV8z0TAAjIaAiMtzS2wj9w7qvI3CwAsYLF1l5cCiSLlz/wRnEIDHTuq7WUtK1/A==
X-Received: by 2002:a1c:5410:0:b0:394:1976:76e4 with SMTP id i16-20020a1c5410000000b00394197676e4mr15381238wmb.11.1651952959713;
        Sat, 07 May 2022 12:49:19 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c1c0600b003942a244ec4sm8535027wms.9.2022.05.07.12.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 12:49:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Luca Weiss <luca@z3ntu.xyz>, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/11] dt-bindings/pinctrl/arm: qcom: minor cleanups of QCOM PMIC pinctrl
Date:   Sat,  7 May 2022 21:49:02 +0200
Message-Id: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
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

Hi,

The patches are independent, so they can be picked up as is.

Not really tested on hardware (except SDM845).

Best regards,
Krzysztof

Krzysztof Kozlowski (11):
  dt-bindings: pinctrl: qcom,pmic-gpio: document PM8150L and PMM8155AU
  dt-bindings: pinctrl: qcom,pmic-gpio: fix matching pin config
  dt-bindings: pinctrl: qcom,pmic-gpio: describe gpio-line-names
  dt-bindings: pinctrl: qcom,pmic-gpio: add 'input-disable'
  arm64: dts: qcom: align PMIC GPIO pin configuration with DT schema
  arm64: dts: qcom: add fallback compatible to PMIC GPIOs
  arm64: dts: qcom: apq8096-db820c: add PM8994 pin function
  arm64: dts: qcom: msm8994-msft-lumia-octagon: add PM8994 pin
    properties
  ARM: dts: qcom: align PMIC GPIO pin configuration with DT schema
  ARM: dts: qcom: mdm9615: add missing PMIC GPIO reg
  ARM: dts: qcom: pmx65: add fallback compatible to PMIC GPIO

 .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 230 +++++++++++++++++-
 .../arm/boot/dts/qcom-apq8060-dragonboard.dts |  20 +-
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts   |   4 +-
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts    |   8 +-
 .../qcom-apq8064-sony-xperia-lagan-yuga.dts   |   2 +-
 arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi    |   2 +-
 arch/arm/boot/dts/qcom-mdm9615.dtsi           |   1 +
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    |   8 +-
 .../dts/qcom-msm8974-sony-xperia-rhine.dtsi   |   2 +-
 .../dts/qcom-msm8974pro-fairphone-fp2.dts     |   2 +-
 .../boot/dts/qcom-msm8974pro-samsung-klte.dts |  14 +-
 ...-msm8974pro-sony-xperia-shinano-castor.dts |  10 +-
 arch/arm/boot/dts/qcom-pm8941.dtsi            |   2 +-
 arch/arm/boot/dts/qcom-pmx65.dtsi             |   2 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts      |  10 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts   |  17 +-
 .../qcom/msm8916-samsung-a2015-common.dtsi    |   2 +-
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  |  19 +-
 .../dts/qcom/msm8996-sony-xperia-tone.dtsi    |  70 +++---
 .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  |   8 +-
 .../boot/dts/qcom/msm8996-xiaomi-gemini.dts   |   2 +-
 .../boot/dts/qcom/msm8998-fxtec-pro1.dts      |   6 +-
 .../dts/qcom/msm8998-oneplus-cheeseburger.dts |   2 +-
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi |   2 +-
 .../msm8998-sony-xperia-yoshino-maple.dts     |   2 +-
 .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi |  12 +-
 arch/arm64/boot/dts/qcom/pm6350.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pm660.dtsi           |   2 +-
 arch/arm64/boot/dts/qcom/pm8009.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pm8150.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pm8150b.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/pm8150l.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/pm8350.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pm8350b.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/pm8916.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi     |   2 +-
 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi     |   2 +-
 arch/arm64/boot/dts/qcom/pmr735b.dtsi         |   2 +-
 arch/arm64/boot/dts/qcom/pms405.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi      |   4 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |   2 +-
 arch/arm64/boot/dts/qcom/sc7180-idp.dts       |   2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      |   2 +-
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi    |   4 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |   6 +-
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |   4 +-
 .../boot/dts/qcom/sdm845-shift-axolotl.dts    |   2 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts |   2 +-
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    |   2 +-
 49 files changed, 373 insertions(+), 142 deletions(-)

-- 
2.32.0

