Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8DBB629D53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 16:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbiKOP1k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 10:27:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237567AbiKOP1j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 10:27:39 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD3E2D76A
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 07:27:38 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id y14so36912239ejd.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 07:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MYpeX+o6S/d7ac0hTcwXTSD0KWW+bMW5jCETN1zgnjA=;
        b=crBPMMl5lk8tPOf43xGJ/2kWlL+h8hnj2Qg66VEzie7MbgkyOKL5ouyWDjFVzOkWbt
         /HGDdjjXW/RC6LqyJOBsD4FEpaI2CzAF0Rojlden0pLA/NJ5XmZd112GgZrM/cmnGBno
         eWWRydXpDKWMM7NcNe3jOZ3DlqrDUPD9bU1RUeytXD5LGdzcX4FfR8cXM7Y37Y9z8OkP
         tpHI+7VwEXbdM8H9+k1K338CDr4f8QddXSWfLmcoP1U9ghDARGpz1yqDEOS6JmGflJbp
         T1F/xTYDbFLQNF+ydkT0mVw5nw53TagVGO14VbupdjKmz3777Z8ap8mvHp+AaaZyrF3i
         k0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYpeX+o6S/d7ac0hTcwXTSD0KWW+bMW5jCETN1zgnjA=;
        b=h0NwFhDJ6+6l3EgJ1K0iZXLiNXen5SBja+L3qSYypY/q1x0ipSBUHbJQzfS9uApMcX
         l98tEppK00V9mJJZTm36yLEcxVXHal+h1BewsBmIBF4iPuiVKS1Vy67QMspiIzo36LUr
         IzRfqUMS0jlUJDOYL55h1ZNl+f0TFWMHJLsWFgz2jY9Eh7iXTgNzH3GFHc6ohNso/+VI
         m+lZ5wh/nOYaAL5HGr2wd2Rt+iAhIt4e2Us6VlgQWcnOnYRWMk6kuisqa75mbGOyeDZH
         DTkpegLSRAHM9x7n7wujoxTkwOyZ3bRgOZoBlWpr3f8cZsCDuRiMjoXZv65XiuInNuec
         4htw==
X-Gm-Message-State: ANoB5pmj42HTZl1f1n6cK+2SYmVea4ihz05eQKzxt7v8LB6ZDcB39Ael
        eFEyaT4op7XeZ+3i59VT0xFZqB400t2Js42v
X-Google-Smtp-Source: AA0mqf7QsXKg/zok04STh26UIzazIrBr/9IbGNf6kui4SftxIdHkaSQWkhdWUdSC7rmHAQpEVY5K9w==
X-Received: by 2002:a17:906:1f49:b0:7ae:76a4:e393 with SMTP id d9-20020a1709061f4900b007ae76a4e393mr14732054ejk.743.1668526056596;
        Tue, 15 Nov 2022 07:27:36 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id ku21-20020a170907789500b007ae1ab8f887sm5750679ejc.14.2022.11.15.07.27.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 15 Nov 2022 07:27:35 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 0/9] SM6375/PDX225 GPI DMA, QUPs & PMIC peripherals
Date:   Tue, 15 Nov 2022 16:27:18 +0100
Message-Id: <20221115152727.9736-1-konrad.dybcio@linaro.org>
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

Patches 1-7 can be applied right away, 8 and 9 depend on:

[1] https://lore.kernel.org/linux-arm-msm/20221109110846.45789-1-konrad.dybcio@linaro.org/T/#t

Changes since v2:
- rework 3-power-domains bindings [1/9]

Changes since v1:
- (afaict) fix errors with [1/9]
- use preprocessor to swap out pmk8350 sid instead of hardcoding it
- pick up tags
- drop [v1 2/10] (dt-b for gpi) - applied
- sort the newly-added regulator nodes properly

Konrad Dybcio (9):
  dt-bindings: arm-smmu: Allow 3 power domains on SM6375 MMU500
  arm64: dts: qcom: pmk8350: Allow specifying arbitrary SID
  arm64: dts: qcom: sm6375: Add GPI DMA nodes
  arm64: dts: qcom: sm6375: Add pin configs for some QUP configurations
  arm64: dts: qcom: sm6375: Add QUPs and corresponding SPI/I2C hosts
  arm64: dts: qcom: sm6375-pdx225: Enable QUPs & GPI DMA
  arm64: dts: qcom: sm6375-pdx225: Add PMIC peripherals
  arm64: dts: qcom: sm6375-pdx225: Configure SMD RPM regulators
  arm64: dts: qcom: sm6375-pdx225: Configure Samsung touchscreen

 .../devicetree/bindings/iommu/arm,smmu.yaml   |  23 +-
 arch/arm64/boot/dts/qcom/pmk8350.dtsi         |  19 +-
 .../qcom/sm6375-sony-xperia-murray-pdx225.dts | 254 ++++++++++++
 arch/arm64/boot/dts/qcom/sm6375.dtsi          | 389 ++++++++++++++++++
 4 files changed, 677 insertions(+), 8 deletions(-)

-- 
2.38.1

