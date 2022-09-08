Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 888F45B1842
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 11:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231335AbiIHJTz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 05:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbiIHJTy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 05:19:54 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5336B3123E
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 02:19:52 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id k10so12089540lfm.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 02:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=cbAFyHUn+BqZYT6TfWgGhL/cdqwC4IvZm/qFbuiAxRE=;
        b=V3gNSM5EKz2GRMxgkAoAXZre4WyqQGqu//5MurbALT3N85R/tX4qgvkT2dfJPnlikC
         AuKRoHiSyAfFB6Xhe3HQtKP5KdO9VLnjN5pS/FPD8bVcaX28besp4ZFSrS+lII5LKNYR
         qwhkM/CZ9bdWJBnGI57JznuOLx1VL3RbuiSpjRp2V7Te/PiV1tpRHLP45bE7pbBzCF7w
         wXXmXeXcNpxSiM/JoK+BJUUSjyoIJvS10X2xDernP58R2Hpd2wsdqBC5p62LJ0qaVYiA
         ab2U5L4MY3JijyLSrsVvKn99j0CslYyui/3JI/3BndJj8lN6ulOENlccO3Yp5Scnimoi
         orUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=cbAFyHUn+BqZYT6TfWgGhL/cdqwC4IvZm/qFbuiAxRE=;
        b=WqMBZxWGAx0bU47u2zVVhO3iBJ+OKRXs0LT4JpqZHaDG2DqOb+NpLmJ9BsYWOuNAhS
         +LXKP2HYOUpd+1YrgM6BVmYjyw6b0Qu1cgXBurrLLJYPUwDF/MiBr93wkZIuxP7P+pBh
         vsLJiQqeg9yfVrgXEoUz3chqd/8SRFFEdp/+KGL7qPUhsrEGVzVi7IetxxIFZTgAyK4B
         FfptB90tm6amRi7jDJP5xBMTnkwUJ0a6gerd3K7epSLP5FKRJ6vTXZW+uuWf1nc34qNy
         PgLbsPBCxPwyY+bdIHRW6d2g8bEsxtGLxrqOYbdCBt6iGuCZnEGkHcixDa5O4nbenxSO
         14Mg==
X-Gm-Message-State: ACgBeo3sq2OoorJM96OAyaJCLlzknvIOkK4UO610vrRn+EsaHoPQ2vtS
        5bxwDGyy21EfUkKh161/b4Nupw==
X-Google-Smtp-Source: AA6agR592euC8UOiN76J/F3PYgmA3eREKtQn0VwCIdBdj6qISwhRuHNTAX82/cI6qlaxAp7i6+AD2g==
X-Received: by 2002:a05:6512:68f:b0:492:cbb1:c4b2 with SMTP id t15-20020a056512068f00b00492cbb1c4b2mr2643486lfe.130.1662628790704;
        Thu, 08 Sep 2022 02:19:50 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q17-20020a056512211100b004946a758d21sm218219lfr.161.2022.09.08.02.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 02:19:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 00/14] ASoC/qcom/arm64: Qualcomm ADSP DTS and binding fixes
Date:   Thu,  8 Sep 2022 11:19:32 +0200
Message-Id: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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

Changes since v2
================
1. Patch 9: rename and extend commit msg.
2. Add Rb tags.

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
 .../bindings/sound/qcom,q6asm-dais.yaml       | 112 ++++++++++++++++++
 .../devicetree/bindings/sound/qcom,q6asm.txt  |  70 -----------
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
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.txt

-- 
2.34.1

