Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFCF268EAC7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 10:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbjBHJPj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 04:15:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbjBHJPJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 04:15:09 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BF8298E3
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 01:13:48 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ml19so49742566ejb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 01:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ESZ5sYzsSuLis2Ic+bLQcSGEAiegZhd+ptLkHkRxs1U=;
        b=hH1AZHKBPbBOCA2o8mvrJbRyZt63UxlvnIaKHB56Ek5LyyvH1a7vwK+wfSpkWVmO86
         ER8wk0XPAQbIEIIQFj/AoEpVsmZJlmK5pVhiJNvKRb5NWXOkL2nNxTPkGWpiRufzNTeQ
         SsNQEWwUDjGphTbgBKuAp2cqeigKims8/6bi3F+oT8ohhIUeJNMR23Segmazw0OFEXIZ
         KWCZALUxiZ3GSa3V1fobGylBRcwN8z7WHlhqzxVzMmwY10ltT5f7GQmR9gZWdRnw7zH6
         gqLSf2HZFOoSbHdIY+fRMBPFFshkR42Z3dikkJSbd4d+oCU0WF3SthkzVm86QH9TLrtC
         P4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESZ5sYzsSuLis2Ic+bLQcSGEAiegZhd+ptLkHkRxs1U=;
        b=W7coXAjFP9CQ+/E63ue+lpUV/w7qOQZx0wbxIGQqOzaVSZiIBw/gPTq4bEx1W343zS
         h2/EED3BlFI7H90xmN2sohuiuBklNbX6xLZUklAPjqmb2vYJBjRl4po+W+1sxCrWbCkZ
         XtnOyXDkdzh+4ngxHtglNhAweIRbE4sxkAhoojr/UdMICU/hglNrxRxgmHdSmGehcMlh
         QZbKLrYVvZ/GcDDsEp6p4wet258vkUyimiPFkMV+aA6RrkQQA2N/ClQ37cGTvYGlod+3
         teu/xJl/smcveXVs8okV63ZRk0IXiX4HM48pp7Dx6N8NEDw8w/oQd8yl2c49gSfMh7t1
         iC4g==
X-Gm-Message-State: AO0yUKWf6IBrShs0XrTqH5PAHo/TyXPvmsS0w+ilbnQzahSWrviGmV4e
        on7ZRV3y1K/Vf87/T4nQZXr3Iz3rgoXF0s7d
X-Google-Smtp-Source: AK7set+Q66uCA4UPwZ/J3zciYGLWd4HvH8H8WemPPYittLZMS9RJdcHxrPpe2v9q5udwiSn/Jl7dGQ==
X-Received: by 2002:a17:907:3f93:b0:8ae:b083:6ceb with SMTP id hr19-20020a1709073f9300b008aeb0836cebmr1041263ejc.72.1675847624560;
        Wed, 08 Feb 2023 01:13:44 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709064e0200b00887a23bab85sm7987279eju.220.2023.02.08.01.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 01:13:44 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v6 00/10] SM6(11|12|37)5 GPUCC
Date:   Wed,  8 Feb 2023 10:13:30 +0100
Message-Id: <20230208091340.124641-1-konrad.dybcio@linaro.org>
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

v6 includes bitfield.h for arm32 builds and fixes the kconfig display name (6115 != 6125, heh) in [10/10]

v5: https://lore.kernel.org/linux-arm-msm/20230201183626.351211-1-konrad.dybcio@linaro.org/

v5 fixes some issues pointed out by Dmitry and picks up tags

v4: https://lore.kernel.org/linux-arm-msm/20230130235926.2419776-1-konrad.dybcio@linaro.org/

v4 only brings a tiny bindings amend to [7/8].. I thought I could
fix it without running dt_binding_check but oh was I humbled again..

v3: https://lore.kernel.org/linux-arm-msm/20230130153252.2310882-1-konrad.dybcio@linaro.org/T/#t

Konrad Dybcio (10):
  clk: qcom: branch: Add helper functions for setting retain bits
  clk: qcom: branch: Add helper functions for setting SLEEP/WAKE bits
  clk: qcom: branch: Move CBCR bits definitions to the header file
  clk: qcom: branch: Clean up branch enable registers
  dt-bindings: clock: Add Qcom SM6125 GPUCC
  clk: qcom: Add GPU clock controller driver for SM6125
  dt-bindings: clock: Add Qcom SM6375 GPUCC
  clk: qcom: Add GPU clock controller driver for SM6375
  dt-bindings: clock: Add Qcom SM6115 GPUCC
  clk: qcom: Add GPU clock controller driver for SM6115

 .../bindings/clock/qcom,sm6115-gpucc.yaml     |  58 ++
 .../bindings/clock/qcom,sm6125-gpucc.yaml     |  64 +++
 .../bindings/clock/qcom,sm6375-gpucc.yaml     |  60 +++
 drivers/clk/qcom/Kconfig                      |  27 +
 drivers/clk/qcom/Makefile                     |   3 +
 drivers/clk/qcom/clk-branch.c                 |  15 +-
 drivers/clk/qcom/clk-branch.h                 |  44 ++
 drivers/clk/qcom/gpucc-sm6115.c               | 503 ++++++++++++++++++
 drivers/clk/qcom/gpucc-sm6125.c               | 424 +++++++++++++++
 drivers/clk/qcom/gpucc-sm6375.c               | 469 ++++++++++++++++
 include/dt-bindings/clock/qcom,sm6115-gpucc.h |  36 ++
 include/dt-bindings/clock/qcom,sm6125-gpucc.h |  31 ++
 include/dt-bindings/clock/qcom,sm6375-gpucc.h |  36 ++
 13 files changed, 1760 insertions(+), 10 deletions(-)
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

