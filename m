Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90A776036F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 02:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbiJSAPQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Oct 2022 20:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbiJSAPA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Oct 2022 20:15:00 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC960DD8A4
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 17:14:16 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id i9so10420425qvu.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 17:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qk1Lk7K7X9zbqdIsTyGxp50kAio2yo1LV6scf4TNeLM=;
        b=l9vtW+GMcNZtK6k2yNVypl8dLO3IHkP4YJijha02yjP6OKRBUW0LE8z8EzX3T80pDr
         /2UKaB7RP2Bdkhj9FxVIR/cJHmhtmNZi+zHd0UTy3MfTU1YgtCiRaRh3+IWJi2rKVHv2
         9DhCEtEHLaYTHlwnWKHp5K6cCpMJbc+KnqiVHkKo3VhP9aB8O2+Q8DcWZno5v3uaiDJo
         BIKpTpoNgTO5LdQvyrlCCONNRsCmUT0mS3wkUpCWLug+ToJZ0+IzIon/Ax15N3XbexHH
         3Zl2FqxjQe9KJEtdy29Wh4Mkk0Lv5N2k4wnS9EoVR1lqBTrn+pklm8nXmoZSgArBBVY5
         I2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qk1Lk7K7X9zbqdIsTyGxp50kAio2yo1LV6scf4TNeLM=;
        b=BFxvvEI36egoYT9/GMgaeOMGuLQ2M58eLlZPnTqgQSll856oNib041Blsrk2LaLfgS
         uFcB10CwzBvXZfppOSl10XQgENj53lK08qvo21N9Bryu5YHWhh4n05IXqWdjC5100oQN
         /FBgG2S5TtxzwnXHiDo3jSt3fgoPAGrxej8YV3tb4MXs+I6oIu0E4ohWz/XVKGc5tvxn
         sJOPl3HKdxCauj68C9YGy92hUG25kiYc2DZ0yBpMGkILiNPUeM1iGYdIoCRDVH3DUhOp
         XYQYMz2z9ifBByfaGBBnPjhrv2Y/6r8UXJSdors7f1QhT261C1QEoxeyHulmU4toH1jN
         dLng==
X-Gm-Message-State: ACrzQf0SaYZzVRcIAZWXN35aLYAir2cKxLUMABy3rJH0oqOl5zkvWxBK
        dq0fJZJDLcQWL8etdFdbW/q3NQ==
X-Google-Smtp-Source: AMsMyM4CyuLLUb9WmRTKux2ZEH0203deqdUJhdEf+LBXl1nOMuojN7Ja89jOCr60TDNlRCrbUqTJig==
X-Received: by 2002:a05:6214:c67:b0:4b3:fe6c:9042 with SMTP id t7-20020a0562140c6700b004b3fe6c9042mr4616042qvj.76.1666138440851;
        Tue, 18 Oct 2022 17:14:00 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id ay40-20020a05620a17a800b006bb78d095c5sm3381240qkb.79.2022.10.18.17.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 17:14:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/4] arm64/pinctrl: dt-bindings: qcom: sc7180: convert to dtschema
Date:   Tue, 18 Oct 2022 20:13:47 -0400
Message-Id: <20221019001351.1630089-1-krzysztof.kozlowski@linaro.org>
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

Hi,

Changes since v2
================
1. New patch: revert of glitch SPI CS workaround
2. dt-bindings: Drop entire drive-strength (not needed, brought by common TLMM
   schema).
3. Add tags.
v2: https://lore.kernel.org/all/20221013184700.87260-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  arm64: dts: qcom: sc7180-trogdor-homestar: fully configure secondary
    I2S pins
  arm64: dts: qcom: sc7180: revert "arm64: dts: qcom: sc7180: Avoid
    glitching SPI CS at bootup on trogdor"
  arm64: dts: qcom: sc7180: align TLMM pin configuration with DT schema
  dt-bindings: pinctrl: qcom,sc7180: convert to dtschema

 .../bindings/pinctrl/qcom,sc7180-pinctrl.txt  | 187 -----
 .../bindings/pinctrl/qcom,sc7180-pinctrl.yaml | 158 +++++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts       | 236 +++----
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  36 +-
 .../dts/qcom/sc7180-trogdor-homestar.dtsi     |  41 +-
 .../dts/qcom/sc7180-trogdor-kingoftown-r0.dts |  16 +-
 .../dts/qcom/sc7180-trogdor-kingoftown.dtsi   |   8 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  16 +-
 .../dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi |  25 +-
 .../boot/dts/qcom/sc7180-trogdor-mrbland.dtsi |  72 +-
 .../qcom/sc7180-trogdor-parade-ps8640.dtsi    |  32 +-
 .../boot/dts/qcom/sc7180-trogdor-pazquel.dtsi |   8 +-
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  14 +-
 .../qcom/sc7180-trogdor-quackingstick.dtsi    |  56 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |   8 +-
 .../dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi |  16 +-
 .../qcom/sc7180-trogdor-wormdingler-rev0.dtsi |  25 +-
 .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  |  72 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 650 +++++++-----------
 arch/arm64/boot/dts/qcom/sc7180.dtsi          | 597 ++++++++--------
 20 files changed, 934 insertions(+), 1339 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.yaml

-- 
2.34.1

