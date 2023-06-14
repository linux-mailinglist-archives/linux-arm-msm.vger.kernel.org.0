Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E14F72FC84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 13:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243381AbjFNLfw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 07:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244038AbjFNLfv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 07:35:51 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 453F91BC3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 04:35:49 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f649db9b25so8294241e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686742547; x=1689334547;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S8KZM/F5g0Sr267RV/S9m6olNEra+NdUFalrdFIdYQw=;
        b=mpHyDAKVCq1eVhSWEhGnB0BOvkUh9SqUoWX5vqdFyz/08za/0Kry77C1uqoGt6Mooy
         9cdAPXqJKe8/L+4dodWqztgVV2IOzBE6XqYvm+p5e7tFeCK9DFUoDLawsq/vnvCmoWdN
         UJtC4eNOrDh77MSP6QpXHLKjcnxpRjzehupP5GExHoEW4XESXbalNUAD67Ayp+MOrOu8
         WGu9B+dr+iC19o9jcU2tJtu0iOyQGDPWPXdVPP6KjufSvG5QAS+IapIugY7J0EOCtTqU
         kpHCqZSq9dtd7wO7s6vlhljcPoceRoDTMKCeDVH9T+wdLUmySory2NoWxy916uMCH7GF
         XXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686742547; x=1689334547;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8KZM/F5g0Sr267RV/S9m6olNEra+NdUFalrdFIdYQw=;
        b=PjlqGR6gfIFOSywopyZN68u+VEwVWYF4THBKzt+lIX+lcqlc+ZyJbrgan8gANfaMZc
         kuXe2XVVuR+1oEAIIUBs9EtNPubPi71BPTmcW9gd9jexRvS4xHggkjarzrTfDG3Iqa3/
         6lF6ji3So9u5hsUjr92NIRfWgzXB3/Mqrmp9KZfvzwitJjRO6bQ2/BxhXK+J+VO6QS6J
         NXBZWjx17eRxcbL8UltuREu+U9Oer27mxwi4kSYFQlSf6PAq40SRyhSsd1ZWf6WX3C71
         Wwa1iun5n8PB7Z0JDf4NMY0L4FAOhXMVrDCA6etSSdCpbfI1JcfbvsD9CczfktB+nsDq
         kSDg==
X-Gm-Message-State: AC+VfDzEaWee2dQGmN5C7Qj9ZOxHHMD8h/m95X6QaJUD7pHSE/9yXJum
        Pbn2uZZIGH+zjVvfeCuFrmyl7w==
X-Google-Smtp-Source: ACHHUZ7KXLv9kmJ+cdzMkqHWV+lomjVVpBW3xt6ULmH9+l9wsJjlmE0rldrrUDIzcGYfb8RLzy9B2Q==
X-Received: by 2002:a05:6512:32aa:b0:4f6:2e5c:de65 with SMTP id q10-20020a05651232aa00b004f62e5cde65mr7601565lfe.28.1686742547496;
        Wed, 14 Jun 2023 04:35:47 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id x1-20020ac25dc1000000b004f64b8eee61sm2088406lfq.97.2023.06.14.04.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 04:35:47 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/7] SM6350 GPU
Date:   Wed, 14 Jun 2023 13:35:31 +0200
Message-Id: <20230315-topic-lagoon_gpu-v2-0-afcdfb18bb13@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAOmiWQC/32NWwqDMBAAryL5bopG+6BfvUeRstmucSFkQ6LSI
 t69qQfo5wwMs6pMiSmrW7WqRAtnllDAHCqFIwRHml+FlalNW7fNSU8SGbUHJxKeLs76igYsosU
 zWVUyC5m0TRBwLGGYvS8yJhr4vX8efeGR8yTps2+X5mf/HJZG1xouHVrCjnDAu+cASY6SnOq3b
 fsCrWAwX8YAAAA=
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686742545; l=1513;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Zj6EKpI9LyjJLvwEHwqcCLEiQUgWc1gxPnuUuffY2/g=;
 b=REH0Yu7DJoufQBzafbTcHqja8hly3sLq7yU4EtTvyEhzgxq8NBvoWzl8NYb8tCbLsdhZ18DMC
 w8tIAtoHF9HAmmKgKM7XJ15oATMACRjPgEMqkd9qG59bVTRgDlQOPWG
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add all the required nodes for SM6350's A619 and fix up its GPUCC
bindings.

This has been ready for like 1.5y now, time to finally merge it as
the display part will take some more time (due to the HW catalog rework).

Depends on (bindings, admittedly I could have organized it better):
https://lore.kernel.org/linux-arm-msm/20230314-topic-nvmem_compats-v1-0-508100c17603@linaro.org/#t

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- gpu_speed_bin@ -> gpu-speed-bin@ [3/5]
- Order GPU nodes properly [4/5]
- sort out the clock-names issue
- throw in the dpu patch, as the driver part has been finally merged
- pick up tags
- Link to v1: https://lore.kernel.org/r/20230315-topic-lagoon_gpu-v1-0-a74cbec4ecfc@linaro.org

---
Konrad Dybcio (7):
      clk: qcom: gpucc-sm6350: Introduce index-based clk lookup
      clk: qcom: gpucc-sm6350: Fix clock source names
      arm64: dts: qcom: sm6350: Add GPUCC node
      arm64: dts: qcom: sm6350: Add QFPROM node
      arm64: dts: qcom: sm6350: Add GPU nodes
      arm64: dts: qcom: sm6350: Fix ZAP region
      arm64: dts: qcom: sm6350: Add DPU1 nodes

 arch/arm64/boot/dts/qcom/sm6350.dtsi | 394 ++++++++++++++++++++++++++++++++++-
 drivers/clk/qcom/gpucc-sm6350.c      |  18 +-
 2 files changed, 402 insertions(+), 10 deletions(-)
---
base-commit: b16049b21162bb649cdd8519642a35972b7910fe
change-id: 20230315-topic-lagoon_gpu-8c2abccbc6eb

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

