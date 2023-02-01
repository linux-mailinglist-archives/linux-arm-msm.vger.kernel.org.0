Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A03F686AAC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 16:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232408AbjBAPvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 10:51:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbjBAPvQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 10:51:16 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E584E29168
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 07:51:12 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so1810066wms.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 07:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dlnsThehH5ZqnZW9i7JEADHDiPhKxjIK41CwqSLcFJQ=;
        b=JexsUxINNGtegO6ug3AqqToks4k6j7toxfGEg++uczvV30Rwxh8+OLaNjC6+oK8IV8
         MuxdoKJ9F5byEPuCbEH4iUnrQ0SV2MO5DlHaGeAXgvZoRyVcATfJ4NGjw90IH2AIaaAa
         U4bcDe26mJWeTs86kpUPIY+tLgHBeELvwb2JrYeieQuosW1qhFjZvmxOA3TkiQGnBVIO
         kqLI3hYdtDCpW2bXn0bj/OrjWaH6AAjGKzoP8dnOJK3HjY7hrH4rMBc4Qg9ouIB0jpDd
         ZVXvBLGKjimlfTHB0W+CASrcT6AYOwYEdrHLvOWH2gG0ULRpmoso7lZwT9TCOyiEpmT3
         VO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlnsThehH5ZqnZW9i7JEADHDiPhKxjIK41CwqSLcFJQ=;
        b=iI/2Qmn/rLlhGx/eGxqJLl7rRX16dLI7bOqobeEPVmc2of9kK9ZKxkGPopT0kzoEyY
         eOor2a3FLPHaBSY2O28Qijdty/Oy5qVKs4LJK/sfupg8YaBApohMj+AuTJJJkaNjEaiT
         F73cinncXwPFXUgqI9fCDPksswztMIwtkpzIAdMwaeJ7PTqoorhdqb+VuZf2evUB+0o6
         sfdKMyOwIsaGSR/dCL5+/NrysxBCZGWwGrkcBf5APCwC2vJMc32oRWS1GMfIGF/IB9K3
         jYwaVGPyiA1w/tvAiGbKPRVaFNz+NKcBM7SHhljkYsAnNcpFITQHfXYy9ePKg6hZQadp
         40lA==
X-Gm-Message-State: AO0yUKWf8W3ZmBhF23DE0MDmQ7xnfYAqjU3oIS8GfaZq4tCpJVChYaVC
        xhwvztMDStky6tMYdCbGiXo5jw==
X-Google-Smtp-Source: AK7set8Uddtxs5071XpEMBxO5aPlvg2bnxNbOxTw/RyBKm1x+I8n/jABXIK9ivuNlpVFkEBZ3H1BCA==
X-Received: by 2002:a05:600c:4e4e:b0:3dd:e621:d328 with SMTP id e14-20020a05600c4e4e00b003dde621d328mr2857825wmq.8.1675266671462;
        Wed, 01 Feb 2023 07:51:11 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe441000000b002bfd524255esm14816189wrm.43.2023.02.01.07.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:51:11 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 00/14] ARM/arm64: dts: qcom: correct TLMM gpio-ranges
Date:   Wed,  1 Feb 2023 16:50:51 +0100
Message-Id: <20230201155105.282708-1-krzysztof.kozlowski@linaro.org>
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

Hi,

Correct the number of GPIOs in TLMM pin controller.

I really hope I got it right... The last number of gpio-ranges is the number of
GPIOs. See: Documentation/devicetree/bindings/gpio/gpio.txt

The examples in bindings were fixed here:
https://lore.kernel.org/linux-arm-msm/20230201153019.269718-1-krzysztof.kozlowski@linaro.org/T/#t

Not realy tested, but I do not expect troubles, unless I missed some obvious
stuff (like a number in pinctrl driver).

Best regards,
Krzysztof

Krzysztof Kozlowski (14):
  ARM: dts: qcom: sdx55: correct TLMM gpio-ranges
  ARM: dts: qcom: sdx65: correct TLMM gpio-ranges
  arm64: dts: qcom: msm8953: correct TLMM gpio-ranges
  arm64: dts: qcom: sc7180: correct TLMM gpio-ranges
  arm64: dts: qcom: sc8280xp: correct TLMM gpio-ranges
  arm64: dts: qcom: sdm670: correct TLMM gpio-ranges
  arm64: dts: qcom: sdm845: correct TLMM gpio-ranges
  arm64: dts: qcom: sm6115: correct TLMM gpio-ranges
  arm64: dts: qcom: sm6125: correct TLMM gpio-ranges
  arm64: dts: qcom: sm6350: correct TLMM gpio-ranges
  arm64: dts: qcom: sm6375: correct TLMM gpio-ranges
  arm64: dts: qcom: sm8150: correct TLMM gpio-ranges
  arm64: dts: qcom: sm8450: correct TLMM gpio-ranges
  arm64: dts: qcom: sm8550: correct TLMM gpio-ranges

 arch/arm/boot/dts/qcom-sdx55.dtsi      | 2 +-
 arch/arm/boot/dts/qcom-sdx65.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi   | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.34.1

