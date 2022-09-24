Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 604195E8962
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 10:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233607AbiIXIFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 04:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233533AbiIXIFL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 04:05:11 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F219DF1855
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:08 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 10so3534521lfy.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ElHtmR9mOI/BrvJk0hvO/gtVtcCqjbq4VFU349Q7/Xc=;
        b=v7PtnQCmKyh/NBt8ZxmuaSZFAUMxfghvTB9dBxx4NqogBYpliz1ua5RWA16zgB3am1
         Dhhro6d0KeiKM0cHmsMSpv10RseFLe8OifR8ovxMmqtDAgkXF+SFfhsIU1oFdwqPMI7N
         CclD9q5GlYoib0xU4rt+um9kF1wQSVssBj9ott2nbtyGBLy+iOlUKWh9YT2DiBITpXsF
         JUxU49ZbPBqQw5frdjCcCOrr9IhqRYQHXehZHLaLHle2w61PXFpyPtYZUP9Vu//59j/i
         XOcIJhD003EeXIChrRJDZjeyiNmXdWDVctxm2NSb10tb4wlnclyT5GIarU9CuM7i/E00
         ZHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ElHtmR9mOI/BrvJk0hvO/gtVtcCqjbq4VFU349Q7/Xc=;
        b=RYjc8V8j4HcdXCWnVlSp1ICrSZypBEhYVL1FeRq16mf4hKyximrR8mtDy/2BlXK5dj
         S5T9uOJYs1afpaE169YmfKUJ6ewxg7+Y0vKuZ5oyloV0jOXsJV0Kp9G7myROs9zliVAC
         V9vNRHP90vpf5If+8qJYtpVlvEvKQZs29kfb1zuDhSxsXmkiXWjnkTayNLiMX4n1+npf
         OGTRSp+p9jkjqF3ZLIgbjob2/4imPnkboo6jPC1jU12jcNUyV6c6Uo5hiSQWUlqxWCJy
         Re2l5Xz7zgIItitwIULcWnd/xLcJ9ysrBTIPR8IcC2m9WXT/6hKM9g3IAS3UeMOygbaf
         MN0g==
X-Gm-Message-State: ACrzQf0wkTa19M+5biqjWHg/lpPZhCp+/3DoxdaQvpfI0QzDY/9qUNAb
        OcfVf9JdmS820sGL9PX7z2ZFUw==
X-Google-Smtp-Source: AMsMyM7HvtRyw3yb17oDRVHWizj4flnPGobu1t8j6Ga+AIEe2TPCNCL3lIS4aMYsJOzQ9fEuCAv6aw==
X-Received: by 2002:a05:6512:261c:b0:49f:af36:d47 with SMTP id bt28-20020a056512261c00b0049faf360d47mr4641346lfb.284.1664006707317;
        Sat, 24 Sep 2022 01:05:07 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/32] pinctrl/arm64: qcom: continued - fix Qualcomm TLMM pinctrl schema warnings
Date:   Sat, 24 Sep 2022 10:04:27 +0200
Message-Id: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
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

Overview
========
This is the third patchset around Qualcomm pinctrl in recent days:
1. First round of TLMM fixes: merged
2. LPASS fixes: https://lore.kernel.org/linux-devicetree/20220922195651.345369-1-krzysztof.kozlowski@linaro.org/T/#t
3. Second round of TLMM fixes: THIS PATCHSET

Dependencies
============
1. No dependencies.
2. dt-bindings are independent of DTS patches.

Best regards,
Krzysztof

Krzysztof Kozlowski (32):
  arm64: dts: qcom: ipq6018-cp01-c1: correct blspi1 pins
  arm64: dts: qcom: ipq6018: align TLMM pin configuration with DT schema
  ARM: dts: qcom: sdx55: add gpio-ranges to TLMM pinctrl
  ARM: dts: qcom: sdx55: align TLMM pin configuration with DT schema
  ARM: dts: qcom: msm8226: align TLMM pin configuration with DT schema
  ARM: dts: qcom: msm8974: align TLMM pin configuration with DT schema
  dt-bindings: pinctrl: qcom,ipq6018: add qpic_pad function
  dt-bindings: pinctrl: qcom,ipq6018: increase number of pins in pinmux
  dt-bindings: pinctrl: qcom,ipq6018: fix matching pin config
  dt-bindings: pinctrl: qcom,ipq6018: do not require function on
    non-GPIOs
  dt-bindings: pinctrl: qcom,ipq6018: fix indentation in example
  dt-bindings: pinctrl: qcom,msm8226: fix matching pin config
  dt-bindings: pinctrl: qcom,msm8226: do not require function on
    non-GPIOs
  dt-bindings: pinctrl: qcom,msm8226: add functions and input-enable
  dt-bindings: pinctrl: qcom,msm8226: fix indentation in example
  dt-bindings: pinctrl: qcom,msm8909-tlmm: fix matching pin config
  dt-bindings: pinctrl: qcom,msm8909-tlmm: do not require function on
    non-GPIOs
  dt-bindings: pinctrl: qcom,msm8909-tlmm: fix indentation in example
  dt-bindings: pinctrl: qcom,msm8953: fix matching pin config
  dt-bindings: pinctrl: qcom,msm8953: do not require function on
    non-GPIOs
  dt-bindings: pinctrl: qcom,msm8953: fix indentation in example
  dt-bindings: pinctrl: qcom,mdm9607: do not require function on
    non-GPIOs
  dt-bindings: pinctrl: qcom,mdm9607: fix indentation in example
  dt-bindings: pinctrl: qcom,qcm2290: fix matching pin config
  dt-bindings: pinctrl: qcom,qcm2290: do not require function on
    non-GPIOs
  dt-bindings: pinctrl: qcom,sdx55: fix matching pin config
  dt-bindings: pinctrl: qcom,sdx55: do not require function on non-GPIOs
  dt-bindings: pinctrl: qcom,sdx55: fix indentation in example
  dt-bindings: pinctrl: qcom,sdx65: fix matching pin config
  dt-bindings: pinctrl: qcom,sdx65: do not require function on non-GPIOs
  dt-bindings: pinctrl: qcom,sc7280: fix matching pin config
  dt-bindings: pinctrl: qcom,sc8280xp: fix indentation in example
    (remaining piece)

 .../pinctrl/qcom,ipq6018-pinctrl.yaml         | 67 ++++++++++-------
 .../pinctrl/qcom,mdm9607-pinctrl.yaml         | 34 +++++----
 .../pinctrl/qcom,msm8226-pinctrl.yaml         | 70 ++++++++++-------
 .../bindings/pinctrl/qcom,msm8909-tlmm.yaml   | 75 +++++++++++--------
 .../pinctrl/qcom,msm8953-pinctrl.yaml         | 58 ++++++++------
 .../pinctrl/qcom,qcm2290-pinctrl.yaml         | 20 +++--
 .../bindings/pinctrl/qcom,sc7280-pinctrl.yaml | 14 +++-
 .../pinctrl/qcom,sc8280xp-pinctrl.yaml        |  4 +-
 .../bindings/pinctrl/qcom,sdx55-pinctrl.yaml  | 58 ++++++++------
 .../bindings/pinctrl/qcom,sdx65-pinctrl.yaml  | 20 +++--
 arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts   |  6 +-
 arch/arm/boot/dts/qcom-msm8226.dtsi           | 24 +++---
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 30 ++++----
 .../boot/dts/qcom-sdx55-telit-fn980-tlb.dts   | 45 ++++-------
 arch/arm/boot/dts/qcom-sdx55.dtsi             |  1 +
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts  |  8 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         |  4 +-
 17 files changed, 316 insertions(+), 222 deletions(-)

-- 
2.34.1

