Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45971682024
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 00:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbjA3X7h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 18:59:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjA3X7g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 18:59:36 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E9E6EB0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 15:59:35 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id bk15so36876221ejb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 15:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IPMPBqRF9LAcJ4STPP5llLrHxgiOF+hRFtXsQbH0zYE=;
        b=B1aTQc3ZwElcKYGeUZXk6bQn2joiIE2EWyhzE+upkUQhFTAlityGRsw/9ywPbqu7eY
         C10L+q6kJLskb05dZdTQe3bztS2LEMPZZMdCelD0jaPoYOJ+UOaz2hPtfMC0YgQh7OsF
         WaRW5mjt7LYKDponsIzb79zE4HFKLtG9FJDh1VgHPOak4s1/uKk5DXZ3F1c5OL+/nHO5
         yQfizdfW7OJJO+h7BEB+S0ahRDwHY88OYSLWoU8fExpFIxf7+mXZg44XKURVfMwCu9Wg
         cjwY8pRXemaLxRUlCdWIHsMYE+d8wP0aOm/WqLgGqYLfjDY3z/odY+hyLTiD+QfpyMAb
         vZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPMPBqRF9LAcJ4STPP5llLrHxgiOF+hRFtXsQbH0zYE=;
        b=jIMFUOm47q+ezyoT1Wpa6IhjNsTq3YafgJkvAVAjowZZFcNEetTabAZSQdaYCjujl1
         A6uc/tkcIgZJFXnG5Mfo54ZT9YxIUo/TcdUQP8CW1iCf5MEnjEilxZ7Q2++RNbPIiWT+
         1hNZGhjHLG0sVCp+fwBR21FJTC2tod2TIq6hKed/RRJZZ80YBV57TsVfqDPcvYDSq3pU
         G0DT0RB9v9tqc4b2cfwj4GD0EWgWLnMI1AzMh2/lhlOxN09/SJFzlHeAWWcObSeU6Lff
         XceNtjFiZiwD8Doqf+y6XZIFFMg/gGJWz1RM2BQsYPPvX1fx4GY7GfuFso7TSjO9IXjf
         R4Qw==
X-Gm-Message-State: AO0yUKXs6GbWr4wloif9eoKl3udIT6/6pBL0cP8lrJefdo4I3UekoyO+
        +fOuw/0RhURwgisA2dnqHs59N2lfAsSS6rp2
X-Google-Smtp-Source: AK7set/FjSfaT1pTLeRV+w53N2k3XCB0NFBt2fuxHmoOZJ+BHUhxh1oA9SZZTxwsoSjUI4jH3OxEyQ==
X-Received: by 2002:a17:906:11c8:b0:87b:7c1d:e02b with SMTP id o8-20020a17090611c800b0087b7c1de02bmr17745392eja.36.1675123174255;
        Mon, 30 Jan 2023 15:59:34 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id jr23-20020a170906515700b0086f4b8f9e42sm7577751ejc.65.2023.01.30.15.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 15:59:33 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v4 0/8] SM6(11|12|37)5 GPUCC
Date:   Tue, 31 Jan 2023 00:59:18 +0100
Message-Id: <20230130235926.2419776-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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

This series brings GPUCC support and the correlated bindings for
three midrange SoCs, all of which host a GMU-less A6xx GPU.

v4 only brings a tiny bindings amend to [7/8].. I thought I could
fix it without running dt_binding_check but oh was I humbled again..

v3: https://lore.kernel.org/linux-arm-msm/20230130153252.2310882-1-konrad.dybcio@linaro.org/T/#t

Konrad Dybcio (8):
  clk: qcom: branch: Add helper functions for setting retain bits
  clk: qcom: branch: Add SLEEP/WAKE fields definitions
  dt-bindings: clock: Add Qcom SM6125 GPUCC
  clk: qcom: Add GPU clock controller driver for SM6125
  dt-bindings: clock: Add Qcom SM6375 GPUCC
  clk: qcom: Add GPU clock controller driver for SM6375
  dt-bindings: clock: Add Qcom SM6115 GPUCC
  clk: qcom: Add GPU clock controller driver for SM6115

 .../bindings/clock/qcom,sm6115-gpucc.yaml     |  58 ++
 .../bindings/clock/qcom,sm6125-gpucc.yaml     |  64 +++
 .../bindings/clock/qcom,sm6375-gpucc.yaml     |  60 ++
 drivers/clk/qcom/Kconfig                      |  27 +
 drivers/clk/qcom/Makefile                     |   3 +
 drivers/clk/qcom/clk-branch.h                 |  25 +
 drivers/clk/qcom/gpucc-sm6115.c               | 512 ++++++++++++++++++
 drivers/clk/qcom/gpucc-sm6125.c               | 424 +++++++++++++++
 drivers/clk/qcom/gpucc-sm6375.c               | 469 ++++++++++++++++
 include/dt-bindings/clock/qcom,sm6115-gpucc.h |  36 ++
 include/dt-bindings/clock/qcom,sm6125-gpucc.h |  31 ++
 include/dt-bindings/clock/qcom,sm6375-gpucc.h |  36 ++
 12 files changed, 1745 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6375-gpucc.yaml
 create mode 100644 drivers/clk/qcom/gpucc-sm6115.c
 create mode 100644 drivers/clk/qcom/gpucc-sm6125.c
 create mode 100644 drivers/clk/qcom/gpucc-sm6375.c
 create mode 100644 include/dt-bindings/clock/qcom,sm6115-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6125-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6375-gpucc.h

-- 
2.39.1

