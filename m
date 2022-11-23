Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B694C63615C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 15:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236653AbiKWOUc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 09:20:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237073AbiKWOUa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 09:20:30 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8B8657C3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 06:20:22 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id x17so16149452wrn.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 06:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EMoXuHIdbhjwJcHJBXXgxho78Ko/2YIp+fuaUAlW2rY=;
        b=UqeKHDjXeHPPYMhTlC9FYSoN/VLX8nN9SzpWL2c8bInJb/BM+st7kwbQPLjYgqeMf2
         Ta/IK17zgDEC303ru/IWF1DrALGhUdKXwcbPk6/0PPkIrzcko7JH6vChe2yLwSh6Y9hV
         HfMq9k2Cv0GB5WzTD3+rBAxpLCfPfuUNOV6U0uDcEWWBmLe9/hP5TV7+jACNBVTRSk/A
         pWww9GWjGlwjVYS4VHueBqyjcNoYCwK0d4RUCD4kVvhh3X1gJ7Rm3vSxyItOQUcBaFO1
         8leiLlGOXxQxOe+u548BsE31gKKGi/ZHbZnojcqp6ljxV0G6t2NnT5yYoU5Cti/0KMML
         xyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMoXuHIdbhjwJcHJBXXgxho78Ko/2YIp+fuaUAlW2rY=;
        b=i3KtcAJ3EZTCxcSmB7cEjMsXBxZGXbtlbWBSF6DqIXbO20YKu2hbYq7077xpcIklIG
         rx0MwsdMtQQ37QdPQEjFYLm2ZFNW0OiBmcWLYFzJ4MelGGPmkmFG/pCq6ZJ21cgPVUJi
         S3/bIvaTzItCzx1wMkh49HwRTaf6hi5+j/lTksvZ6N3DoalDLqCl3pfrBBA8UMffDPd7
         rY2c67jKs5Lf3aCO5lhCZRp0C18e4C0Gg39rK32d1SNjjjytSXqu7PPvX0Ecy1qLyt8+
         NfvIjNnin06e2tnSDcWdKUOqOWeC+NRQWiTs1a1IAv+nMfOlmN9ks39mHSw1PJEdzCll
         ssHQ==
X-Gm-Message-State: ANoB5pm5X3TwFs/zKfVKW6bD83P4XiWTUcCHl49Dm4I5bIpu4UEqLfgN
        6PqEKM0cqcbcZb8vQZfTN4YGahUVsSvglA==
X-Google-Smtp-Source: AA0mqf5/MjcP0RI/+UciB6PzI31sTUYrP2jKOSevJGF3jEz1P1vukOEYSoL/oxxMiaB9/eHN/I1Crw==
X-Received: by 2002:adf:de0a:0:b0:241:cdf6:6a81 with SMTP id b10-20020adfde0a000000b00241cdf66a81mr7110202wrm.243.1669213220617;
        Wed, 23 Nov 2022 06:20:20 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c4ec900b003cfd58409desm2837438wmq.13.2022.11.23.06.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 06:20:20 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 0/9] clk: qcom: Add support for SM8550
Date:   Wed, 23 Nov 2022 16:20:00 +0200
Message-Id: <20221123142009.594781-1-abel.vesa@linaro.org>
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

This patchset adds clock support for the Qualcomm SM8550 SoC,
It adds support for the new type of PLL, the TCSR clock controller
driver, support for configurable poll timeout, the RPMh clocks
and the bindings.

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Abel Vesa (9):
  dt-bindings: clock: Add SM8550 GCC clocks
  dt-bindings: clock: Add SM8550 TCSR CC clocks
  clk: qcom: gdsc: Add configurable poll timeout
  clk: qcom: Add LUCID_OLE PLL type for SM8550
  clk: qcom: Add clock driver for SM8550
  dt-bindings: clock: Add RPMHCC for SM8550
  dt-bindings: clock: qcom,rpmh: Add CXO PAD clock IDs
  clk: qcom: rpmh: Add support for SM8550 rpmh clocks
  clk: qcom: Add TCSR clock driver for SM8550

 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 .../bindings/clock/qcom,sm8550-gcc.yaml       |   56 +
 .../bindings/clock/qcom,sm8550-tcsrcc.yaml    |   39 +
 drivers/clk/qcom/Kconfig                      |   15 +
 drivers/clk/qcom/Makefile                     |    2 +
 drivers/clk/qcom/clk-alpha-pll.c              |   16 +
 drivers/clk/qcom/clk-alpha-pll.h              |    5 +
 drivers/clk/qcom/clk-rpmh.c                   |  110 +-
 drivers/clk/qcom/gcc-sm8550.c                 | 3396 +++++++++++++++++
 drivers/clk/qcom/gdsc.c                       |    5 +-
 drivers/clk/qcom/gdsc.h                       |    1 +
 drivers/clk/qcom/tcsrcc-sm8550.c              |  193 +
 include/dt-bindings/clock/qcom,rpmh.h         |    2 +
 include/dt-bindings/clock/qcom,sm8550-gcc.h   |  231 ++
 .../dt-bindings/clock/qcom,sm8550-tcsrcc.h    |   18 +
 15 files changed, 4069 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsrcc.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm8550.c
 create mode 100644 drivers/clk/qcom/tcsrcc-sm8550.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-tcsrcc.h

-- 
2.34.1

