Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37AD65AC049
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Sep 2022 19:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbiICRmX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Sep 2022 13:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbiICRmW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Sep 2022 13:42:22 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3DA3E744;
        Sat,  3 Sep 2022 10:42:20 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id cu2so9616642ejb.0;
        Sat, 03 Sep 2022 10:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=gTMyzloiI2NfKobs3bKLaJh3SRs9+Z9MfpL846v81O8=;
        b=YniKYlp0ix+F3fkz+fV5Nlc077GssA8IAuyhPDb4AwV+je3SiIndkZG2J2ZVFi73qH
         YxcRAcWlVZ7bZYjM3JrNnwp+FqgTB+Iq1GeE+wRj/7efynhPKRALutyb7UEUMFPwooB6
         /SQ1uvpLYmgA3e19HtSEr+HydRccBxbFaSFmG0e0yGoBvoVk3IWYPEON4BGuyLOdmsqF
         zOslQsaFq+QOfb5MCodQp5w+V7jD5Gvu9OmaSox+q0Ysbcm8fNeUtBZuZD+UoW/0BfW/
         l6EmJat+3eQ1wZwYMnzq9m6AWv6FIalOPAxUUtuQOWO6VyvQX9k36P3Xw33cPrjAifgg
         t03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=gTMyzloiI2NfKobs3bKLaJh3SRs9+Z9MfpL846v81O8=;
        b=Cv4P19CoGDrLzioLk0o1Fk9jV8lEUW0mzsEfO3XJz1DCH8TikMrueHosm5XU/l5iDz
         Tb7+hGENOKCu3Whv7srRWAwCpuzjaZ52Kd3P6lDyD3MRNqfLMNw5UYKvjgv79l2Szsss
         6D6lbYliLCZ7qbMclLLWhX2ha7o3oGLRwQKKszJTXjJc+S26WyiSM3eSOrsGSxhXWWFM
         tYVzOa3xhRaJ4oabq9oMINiatVnA8aP/Lm0tLfMxFoeKe3TIUSp8I9U7omfLUjDa3EQO
         D6TMV7/45HNWmbE5WLG2tK35UAdpukHeNtjgEHX6HcumL81LfugnmfJljW9hzx69+Ki7
         ZVAQ==
X-Gm-Message-State: ACgBeo1RLU5EYsDUAN9yP5FXNsMxtnVJA7lQHFCPGsHXHq+hkDvriJ01
        PXE/aV6tRQaPDgjv7AtyIaE=
X-Google-Smtp-Source: AA6agR5WZ6vEv2qN8pZk0mQY6Vn2fuztKRfkiL2GYj3iOlTVX4Nuw2DOQ2AXRJZl6tY4pvYWIrq5JA==
X-Received: by 2002:a17:907:6d11:b0:730:a382:d5ba with SMTP id sa17-20020a1709076d1100b00730a382d5bamr30294474ejc.371.1662226938678;
        Sat, 03 Sep 2022 10:42:18 -0700 (PDT)
Received: from localhost ([77.78.20.135])
        by smtp.gmail.com with ESMTPSA id k6-20020a17090632c600b0073c0b87ba34sm2699969ejk.198.2022.09.03.10.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Sep 2022 10:42:18 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 0/9] Add support for sm6115,4250 and OnePlus Nord N100
Date:   Sat,  3 Sep 2022 20:41:41 +0300
Message-Id: <20220903174150.3566935-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes from v1
---------------
v1: https://lore.kernel.org/all/20220901072414.1923075-1-iskren.chernev@gmail.com/
- merge dtsi patches in one
- fix ufs binding (allow ice register)
- fix dt schema issues (to the best of my ability)
- add a few necessary bindings (compats)
- some comments on remaining schema issues after commit msg (patch 7 and 9)

Description
-----------

This series adds support for sm6115 (clocks, pinctrl, usb, ufs, sdhc),
sm4250 (mostly empty shell on top of sm6115) and finally basic OnePlus Nord
N100 (codename billie2), including the above mentiond items plus simple
framebuffer.

Please note that this series depends on [1] (driver compat and bindings).

[1] https://lore.kernel.org/linux-devicetree/20220815100952.23795-1-a39.skl@gmail.com/

Iskren Chernev (9):
  dt-bindings: ufs: qcom: Add sm6115 binding
  dt-bindings: firmware: document Qualcomm SM6115 SCM
  dt-bindings: nvmem: Add SoC compatible for sm6115
  dt-bindings: pinctrl: qcom: sm6115: Add reserved ranges
  dt-bindings: arm: cpus: Add kryo240 compatible
  dt-bindings: arm: qcom: Add compatible for oneplus,billie2 phone
  arm64: dts: qcom: sm6115: Add basic soc dtsi
  arm64: dts: qcom: sm4250: Add soc dtsi
  arm64: dts: qcom: sm4250: Add support for oneplus-billie2

 .../devicetree/bindings/arm/cpus.yaml         |   1 +
 .../devicetree/bindings/arm/qcom.yaml         |   7 +
 .../bindings/firmware/qcom,scm.yaml           |   1 +
 .../bindings/nvmem/qcom,qfprom.yaml           |   1 +
 .../bindings/pinctrl/qcom,sm6115-pinctrl.yaml |   2 +
 .../devicetree/bindings/ufs/qcom,ufs.yaml     |  26 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm4250-oneplus-billie2.dts  | 243 +++++
 arch/arm64/boot/dts/qcom/sm4250.dtsi          |  38 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 904 ++++++++++++++++++
 10 files changed, 1224 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115.dtsi

-- 
2.37.2

