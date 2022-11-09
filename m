Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12DC06229D4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 12:12:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiKILMn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 06:12:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiKILMm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 06:12:42 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DBDF22B3C
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 03:12:41 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id u24so26627738edd.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 03:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6oOl8d8AonHh+s2dAI8VnJgTk/i9weLsO8qn9kf1Oo=;
        b=bWWVhwAdt3fTWRn7iXz9q+vxjV7aSPMV5ya2kke6QF/sAG7tooxdlhurRK9Vnwb1nv
         MEjvDjZJgG54w+IdJ7Ar/Q9stEd0BRKAY7AkPolx1XYWaAiyXkIv8DeGcltcc42ck5Hi
         Hxu1aVM5RZdmhxcq9a3ItJvsU5IzfCnyI37KwnlTv2r1MkxfxDWhmtkGTDudBSTDR6lv
         rZfUu8dfSSySM2zGOB3Tr+pWYb4wXsKZ5QHphwIgVmTca+F2ABRzvELEdu/dT7hU0xTv
         JLJtQeWMSV8Loi28CZPphDhFPRnDI44JMghZEag4fA4SCiZBrwE8PPYHD7h9vQ8tALe9
         LKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6oOl8d8AonHh+s2dAI8VnJgTk/i9weLsO8qn9kf1Oo=;
        b=myIVMy9YPvjmyGj6eE7Hn5OT4blBGYVwE2hQ/gDZDtpd3BjveDFvphnmPJznz7fYfg
         9d2hwKP77Jh4fLzhafzQPPACfVc9HPNzqUHbhwg3dJYVBlZpLec/VbpOGjW8j4s1CTok
         jBYSNegZ0UpTK+9Q9djiZcCFYfJjvGSFi1NWa/KvO8Oq65hlsZ/ssvdzJXh96sjxLyUG
         igfogzk6WEsPWqwLWiQsKw7XSRbDdnuSYa21Wq5ZiR1+8RnI6f/WBtl9Zk2S1+YjzZW2
         oliA79wkoSvfsIZUVsSSHnZrD9/aTX5k/eoxmeh3AGqcY8dm0OnTKy8lUV8ZDyV31seL
         ku7w==
X-Gm-Message-State: ANoB5plJY4UzlpmhfMV/t6pljuHQW7Ee981uKpJcLLxSJZIgzYsFkDkk
        00BuwAd74yHGHb/X1a0DAiiHDAoeNPbjiyEG
X-Google-Smtp-Source: AA0mqf5B/yZdkyk4OezVq8fTNRIKi/2DNaSjRPAiHM+mdHGnnfvMy0Nks6e2LmzIXPwRQuRF6QpChQ==
X-Received: by 2002:a05:6402:5510:b0:459:5ea:9bc0 with SMTP id fi16-20020a056402551000b0045905ea9bc0mr3572537edb.152.1667992359762;
        Wed, 09 Nov 2022 03:12:39 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id k8-20020a1709062a4800b007ad9c826d75sm5825899eje.61.2022.11.09.03.12.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Nov 2022 03:12:39 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 00/10] SM6375/PDX225 GPI DMA, QUPs & PMIC peripherals
Date:   Wed,  9 Nov 2022 12:12:25 +0100
Message-Id: <20221109111236.46003-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
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

This series adds support for:

- GPI DMA for 6375
- QUP hosts & I2C / SPI controllers for 6375
- pinctrl for SOME (check commit message of 05/10) of ^
- pmk8350 on sid6 (rather sad implementation, check 03/10 commit msg)
- touchscreen & SMD regulators on PDX225 (depends on [1])
- pmic peripherals on PDX225

As well as some necessary binding changes with it.

Patches 1-8 can be applied right away, 9 and 10 depend on:

[1] https://lore.kernel.org/linux-arm-msm/20221109110846.45789-1-konrad.dybcio@linaro.org/T/#t

Konrad Dybcio (10):
  dt-bindings: arm-smmu: Allow up to 3 power-domains
  dt-bindings: dmaengine: qcom: gpi: add compatible for SM6375
  arm64: dts: qcom: Add a device tree for PMK8350 on SID6
  arm64: dts: qcom: sm6375: Add GPI DMA nodes
  arm64: dts: qcom: sm6375: Add pin configs for some QUP configurations
  arm64: dts: qcom: sm6375: Add QUPs and corresponding SPI/I2C hosts
  arm64: dts: qcom: sm6375-pdx225: Enable QUPs & GPI DMA
  arm64: dts: qcom: sm6375-pdx225: Add PMIC peripherals
  arm64: dts: qcom: sm6375-pdx225: Configure SMD RPM regulators
  arm64: dts: qcom: sm6375-pdx225: Configure Samsung touchscreen

 .../devicetree/bindings/dma/qcom,gpi.yaml     |   1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml   |   2 +-
 arch/arm64/boot/dts/qcom/pmk8350_sid6.dtsi    |  73 ++++
 .../qcom/sm6375-sony-xperia-murray-pdx225.dts | 251 +++++++++++
 arch/arm64/boot/dts/qcom/sm6375.dtsi          | 389 ++++++++++++++++++
 5 files changed, 715 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8350_sid6.dtsi

-- 
2.38.1

