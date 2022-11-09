Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 588A0622DD6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 15:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbiKIO1T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 09:27:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbiKIO0u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 09:26:50 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A687238A7
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 06:26:30 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bp15so25771980lfb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 06:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QOM/18tuQeSshExrj1nFhm8np04jPjaz4ok/JKXVQZk=;
        b=xSjqTlZCD+6gnN97qVMFrpUAU3tjYYTgke5rBpW1GZCG1CWdRCodry3qsX9vS5R36N
         1N0u/8MW5yHpCBQvV+BC0XhvV940O1nuibuxbJUz1FgiqsuqEA/8O6R1mmMPSrnFl3xE
         t6Uy74x3gPVyN5ZcliWcMYLyhCtSxeWSWcOGBIiTllbgevdgv/lxDLtJWGNZq0ED6qc+
         xJw6kjrqvD2PTFdWbyuJ+thr2USsc9TyzADCCLx2U73zKv6TLONH5ZzZPY2tY1/fIq7D
         gQmXSrm/QIZW4/BvpNzsd16R/jLa23BZ5/h2ljHwsWvLj3dX87sH+SOhG/Bpl6ur8f8i
         eCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOM/18tuQeSshExrj1nFhm8np04jPjaz4ok/JKXVQZk=;
        b=7eTA623fnzQTwgY6zWr05+eprOVUP4fRDXpByGYqBU0ORXlNiBn5z8hNjrcaT7RMQx
         DLFq9x3d9vJNGDkKrcY+U3VP5m85nHf9ySVXCsD3C2vEeauWNSPghXOpERAqlZtmL4CR
         IKkrOGs6MYgPQlMf37Vbz1QfokqWwDcBhrJP6QebeUbsu4UsJkKvpDAlpBmGigU0SQ6z
         N998h7O4NQ558YBtLEaBwKGN2g94g60VRBv06uU0BdZ6wTiswT4O3aReyjb7hr3+17le
         zybEb5QZnozRo/rpX9+ads6FoSnaOM0cACSO+jIJRkmjg/iTqZXyN29T1XrnKzvibJok
         5L8Q==
X-Gm-Message-State: ACrzQf1EdMc30YwrsiZeOhowhti9Ia04HtaZb107YsEFhCMz0QDukWKT
        OxSMrliFGAEjz8LE466lT0iyugAPe6wdFKSm
X-Google-Smtp-Source: AMsMyM58+fbTbpe016ToYmqUFx7JF69efChh7inncT5rl7S/7R5R7xM8pktR2RBJimiVFg1DQFgBng==
X-Received: by 2002:a05:6512:10cf:b0:4a2:aaef:2933 with SMTP id k15-20020a05651210cf00b004a2aaef2933mr20612567lfg.521.1668003988783;
        Wed, 09 Nov 2022 06:26:28 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id q18-20020a056512211200b004a2ae643b99sm2241008lfr.170.2022.11.09.06.26.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Nov 2022 06:26:28 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/3] SM6375 / PDX225 SD Card support
Date:   Wed,  9 Nov 2022 15:26:20 +0100
Message-Id: <20221109142623.53052-1-konrad.dybcio@linaro.org>
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

Add SDHC2 for SM6375 which effectively means SD Card support for
PDX225. Nothing unusual here, some regulator dancing was required,
but that's expected.

Depends on [1] and [2].

[1] https://lore.kernel.org/linux-arm-msm/20221109111236.46003-1-konrad.dybcio@linaro.org/T/#t
[2] https://lore.kernel.org/linux-arm-msm/20221109110846.45789-2-konrad.dybcio@linaro.org/T/#u

Konrad Dybcio (3):
  dt-bindings: mmc: sdhci-msm: Document the SM6375 compatible
  arm64: dts: qcom: sm6375: Add SDHCI2
  arm64: dts: qcom: sm6375-pdx225: Enable SD card slot

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |  1 +
 .../qcom/sm6375-sony-xperia-murray-pdx225.dts | 34 +++++++-
 arch/arm64/boot/dts/qcom/sm6375.dtsi          | 82 +++++++++++++++++++
 3 files changed, 115 insertions(+), 2 deletions(-)

-- 
2.38.1

