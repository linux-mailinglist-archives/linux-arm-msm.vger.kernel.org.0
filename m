Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80D925B0180
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 12:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiIGKRP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 06:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbiIGKQz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 06:16:55 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9D6B8F00
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 03:16:06 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id bn9so15381880ljb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 03:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=3cA7dqgK29hXFF6uJvQ4BHeA+tHJfj6koNcu22+1Hr8=;
        b=Hy6HBAQezdf60tWZN7LIjziTj7M5/9xzdLhTneso24T91epLE3nPn9M8nxyWLbW3il
         Q19WX3z+2P+rJzT7gZ7RysB5pIGPedgOjzYPe1GNmlgSIW4IhKgsGWvaF0uKalQLJmNC
         sIKZY0M9eXiTUWMoH8SQ+sbPS+PjyFd7bwoxV1Vx6uD7kFv3tZAHuPWcCc93bFlVqqgz
         ffvw96bh2JvBb8zkJ07L+PpwTfVW309r0MSM6cioLCDhaFaVj8tfzN+8w05a4x3BwnbB
         LLbicUcFjmSf3QtHvhInoZ4q3uuC1hRUFVAT2BbW2w454cw8bNypO+Hm/AeVTZj3Tn/D
         vuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=3cA7dqgK29hXFF6uJvQ4BHeA+tHJfj6koNcu22+1Hr8=;
        b=Fj+y+ZCnRGzD9WMlKWZA2vymSvXygxtjc8paBm7GKMhcv8bR6TVWOwkeRJdIoN55fQ
         tyAjyPRTR/xs4QXdHQCwc83FwyxKaXU+2TZh+sMUMNZNUl2HVvG6stuW8CEQWLC5F8sW
         WNU/LFrCtUf4rELD2eokEgNZYWNJveGbPD4R2efxRagD1H6gK5eearp5F2sOFcdJ8liB
         M6hxJY4w7kKoeHbECpNRT743Oz135fQpPNJq4Bi1opja+O2S/fEtN3zPkJ0Y/H9xTMKf
         CI9ZwVfKvie9HSYWlzQ8IQa08IUV4sj2GcPc8QzJvfhPQiM3Sw4ZzENc7GgQwsD9CeJB
         /Maw==
X-Gm-Message-State: ACgBeo1AJ3+Zbcq7BlvI1jzv1jiEM318oAKIwc6GHZ9vxq7nkx4scdJb
        SysSktJoaxt/gVE8ZsYCPTuvGg==
X-Google-Smtp-Source: AA6agR5kMxBjpX/4YyjspCvud2EcoThLtvD9lUV+btA0OeIkvy3ClJ+phX0euGGDKW9B8lVVVSNYJw==
X-Received: by 2002:a2e:a309:0:b0:26a:c623:264 with SMTP id l9-20020a2ea309000000b0026ac6230264mr717373lje.267.1662545764599;
        Wed, 07 Sep 2022 03:16:04 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 03:16:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 00/14] ASoC/qcom/arm64: Qualcomm ADSP DTS and binding fixes
Date:   Wed,  7 Sep 2022 12:15:42 +0200
Message-Id: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Dependencies/merging
====================
1. The DTS patches are independent.
2. The binding patches should come together, because of context changes. Could
   be one of: Qualcomm SoC, ASoC or DT tree.

Changes since v1
================
1. Patch 9: New patch.
2. Patch 10: Correct also sound/qcom,q6apm-dai.yaml (Rob).
2. Patch 13: New patch.
3. Add Rb/Tb tags.

Best regards,
Krzysztof

Krzysztof Kozlowski (14):
  arm64: dts: qcom: sdm630: align APR services node names with dtschema
  arm64: dts: qcom: sdm845: align APR services node names with dtschema
  arm64: dts: qcom: sm8250: align APR services node names with dtschema
  arm64: dts: qcom: msm8996: fix APR services nodes
  arm64: dts: qcom: sdm845: align dai node names with dtschema
  arm64: dts: qcom: msm8996: align dai node names with dtschema
  arm64: dts: qcom: qrb5165-rb5: align dai node names with dtschema
  arm64: dts: qcom: sm8250: use generic name for LPASS clock controller
  ASoC: dt-bindings:: qcom,q6asm: convert to dtschema
  dt-bindings: soc: qcom: apr: correct service children
  ASoC: dt-bindings: qcom,q6dsp-lpass-ports: cleanup example
  ASoC: dt-bindings: qcom,q6dsp-lpass-clocks: cleanup example
  ASoC: dt-bindings: qcom,q6apm-dai: adjust indentation in example
  dt-bindings: soc: qcom: apr: add missing properties

 .../bindings/soc/qcom/qcom,apr.yaml           | 111 +++++++++++++++--
 .../bindings/sound/qcom,q6apm-dai.yaml        |  21 ++--
 .../devicetree/bindings/sound/qcom,q6asm.txt  |  70 -----------
 .../devicetree/bindings/sound/qcom,q6asm.yaml | 112 ++++++++++++++++++
 .../sound/qcom,q6dsp-lpass-clocks.yaml        |  36 +++---
 .../sound/qcom,q6dsp-lpass-ports.yaml         |  64 +++++-----
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  10 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |   4 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   8 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |   2 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts |   2 +-
 .../boot/dts/qcom/sdm845-xiaomi-polaris.dts   |   4 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   8 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  10 +-
 14 files changed, 293 insertions(+), 169 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.yaml

-- 
2.34.1

