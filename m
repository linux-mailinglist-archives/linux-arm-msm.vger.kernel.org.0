Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC34B627ABD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 11:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236024AbiKNKmh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 05:42:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbiKNKmf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 05:42:35 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11B01A22E
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:42:34 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id b3so18557736lfv.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7s00UB07pA5eJO2fwXePj1LBqEZxVRnvRo0WjRCLEo0=;
        b=pH9Hg+/b33/FPzVIzBOfDcXDRRQojFigXPJOwc+wh6ZjxUwYyQgC8ofdl66gKdEzc5
         bLE4xmxTZ3Us9S383y8pL0usBu/SvRdWtkgvVAKgTSAhQzBOA4AC11GeOJHQlWKwKEfb
         0pLiJlTmPV7Ml6iSlDsIl3mwGrCFuwrMlK4KRGfQBYPnxmH4sfbJIeWfi1DMNNrfYiz+
         Qxy5cvgfFrcMdODs9x+wYXDYevCNBqMw678qpduKie68NdTQHBiOOBoZy3Jp6OQmzr/9
         mpm3HqunGvKwnycvrHQODX4RIvDv9j02GETzR6/z949OOhc4F1TUSOrJktH/nwltRAtA
         q9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7s00UB07pA5eJO2fwXePj1LBqEZxVRnvRo0WjRCLEo0=;
        b=vr0TLGk10d/jfB5ynx/bPwAgry8RePoYvgrc8NSmgRhGbmzFt9I90mdzf05c1SX9Ps
         Rp5eiFaqOawpdaTfBr8/JW6AtT3nELXJf0LE5SAjdB3BrlHXVEIEdSgzVQCQ8KLaBJx7
         KRyBRWutmky1vOUtoMxNoNInUpVDICVgGUwk15KEXHZSgBEHB+e38+3aF5PxMgt26vqS
         3hxxYbQ1O7UeYKfKbe+Uj2ayixlkUGUVA1tOH7TdytFzqdw6Wsbk7NV2HZv/HbgOwIFP
         mRG5XJ7SNUUZ+TT0R25fnJcQlOW5LeSIphsNpVKIM0uElUNDk87Onxc6W6AQbU8yUVZ5
         AwHQ==
X-Gm-Message-State: ANoB5pnfkp6EnKBZIXTx3BOnyK7XOUAmjtbnixCkx9P7b3L45dH2SVQO
        2NswM9mk/+6yLkbnGoTiYTPo8tcTodpejM/V
X-Google-Smtp-Source: AA0mqf66613cFQkzqkNJvI93bzpfRMDHEht8rhWFcpsEWEHqsXmb7qGoRFqj9j48jXFrmavnBIlTbA==
X-Received: by 2002:ac2:58d0:0:b0:4b0:65b0:7f30 with SMTP id u16-20020ac258d0000000b004b065b07f30mr3702747lfo.385.1668422552959;
        Mon, 14 Nov 2022 02:42:32 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id bs21-20020a05651c195500b0026c4e922fb2sm1946486ljb.48.2022.11.14.02.42.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Nov 2022 02:42:32 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/9] SM6375/PDX225 GPI DMA, QUPs & PMIC peripherals
Date:   Mon, 14 Nov 2022 11:42:13 +0100
Message-Id: <20221114104222.36329-1-konrad.dybcio@linaro.org>
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
- pmk8350 on arbitrary SID
- touchscreen & SMD regulators on PDX225 (depends on [1])
- pmic peripherals on PDX225

As well as some necessary binding changes with it.

Patches 1-8 can be applied right away, 9 and 10 depend on:

[1] https://lore.kernel.org/linux-arm-msm/20221109110846.45789-1-konrad.dybcio@linaro.org/T/#t

Changes since v1:
- (afaict) fix errors with [1/9]
- use preprocessor to swap out pmk8350 sid instead of hardcoding it
- pick up tags
- drop [v1 2/10] (dt-b for gpi) - applied
- sort the newly-added regulator nodes properly

Konrad Dybcio (9):
  dt-bindings: arm-smmu: Allow up to 3 power-domains
  arm64: dts: qcom: pmk8350: Allow specifying arbitrary SID
  arm64: dts: qcom: sm6375: Add GPI DMA nodes
  arm64: dts: qcom: sm6375: Add pin configs for some QUP configurations
  arm64: dts: qcom: sm6375: Add QUPs and corresponding SPI/I2C hosts
  arm64: dts: qcom: sm6375-pdx225: Enable QUPs & GPI DMA
  arm64: dts: qcom: sm6375-pdx225: Add PMIC peripherals
  arm64: dts: qcom: sm6375-pdx225: Configure SMD RPM regulators
  arm64: dts: qcom: sm6375-pdx225: Configure Samsung touchscreen

 .../devicetree/bindings/iommu/arm,smmu.yaml   |   3 +-
 arch/arm64/boot/dts/qcom/pmk8350.dtsi         |  19 +-
 .../qcom/sm6375-sony-xperia-murray-pdx225.dts | 254 ++++++++++++
 arch/arm64/boot/dts/qcom/sm6375.dtsi          | 389 ++++++++++++++++++
 4 files changed, 657 insertions(+), 8 deletions(-)

-- 
2.38.1

