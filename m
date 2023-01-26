Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE43467D3CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 19:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbjAZSNo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 13:13:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjAZSNo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 13:13:44 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F12A22D178
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 10:13:40 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id fi26so2643925edb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 10:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d1JfUCE6Uih8p9EGNSJuAOzCK1DyJiE4xU/YV8mRu+g=;
        b=MZpZWEUtDWbUcMdjhB/L2TzJR1ya0FCuUW8FdUfayOieJJFKMTtHLsmJTwQhqwN5Pv
         7AYCDuowTVMAFZQhlAgCmiWjJTWIzFbNcj3C+zhOBhO/efAIwCdV9spDju7Hl62mksw3
         B3+Scrd7dESYS+3Y+RflMZDHjTxKDGTV0yRwc3Nqh0uyCCydBbZyNO/5SHZDWgvetC98
         jiM73JLCwT0bz/jJtz+EK6bwsj9S0QcKRiwkjFz3OLGJkrOCLlBPIAuTWqW+SpmOijZu
         rP6MqAtQFaOTb1KliG19G8dm2r7vd5Tg6eyARUSXAHAuC6Gnsm+0ue2Cm9hHCp02Ux9x
         IqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d1JfUCE6Uih8p9EGNSJuAOzCK1DyJiE4xU/YV8mRu+g=;
        b=DDuz5FXNUp4BeTL8PthdNGOKZezQaf+Ibv5VfUHTBtXlFiXNGtacy/TFmA+cVdt2Kb
         Is/tEJeEC1DUPJTEQsWUot8jV9Ff2pbJNwEvTSbbZKFODAyMcIFF9E7xu6GSFFhPhTvv
         7PIxMW0vziTqcgWekaPIfOeFKh5dUn8oq2vxdqMARdMwHYKlRFiwNK9RqjCuwJHfHwA5
         0a8jSHv+wnonshXj2C3g/0o/gwQdRpwND0upWX/hiTUF4/5BKkc7kXWxPBwuSYDi/6+l
         jULQPJKET4WqaDM7AnNK5BZGNVX3zH6oKfciNSEKt+67S2MKrKfndM1CC0NscFhbNBxB
         +zUg==
X-Gm-Message-State: AFqh2kpvzJC7YG/CEx13EcCtX+SCtTC8lVXmrFDU7yOjMYbobf2emq7s
        sMbWlPFJMvdxxxG12hoWqHBdRZM6v3daUM9T
X-Google-Smtp-Source: AMrXdXtHmfreykbZN+hOiNjNFYz4G7BtSjjMS9L9Q5SnMEPuvTSlfYTKJfHDTvkuNS5s0pm1N1TO0w==
X-Received: by 2002:a05:6402:43cf:b0:49b:b1ab:f216 with SMTP id p15-20020a05640243cf00b0049bb1abf216mr41087554edc.11.1674756819337;
        Thu, 26 Jan 2023 10:13:39 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id k6-20020aa7d8c6000000b00487fc51c532sm1100416eds.33.2023.01.26.10.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 10:13:38 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/6] SM6(11|12|37)5 GPUCC
Date:   Thu, 26 Jan 2023 19:13:29 +0100
Message-Id: <20230126181335.12970-1-konrad.dybcio@linaro.org>
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

Konrad Dybcio (6):
  dt-bindings: clock: Add Qcom SM6125 GPUCC
  clk: qcom: Add GPU clock controller driver for SM6125
  dt-bindings: clock: Add Qcom SM6375 GPUCC
  clk: qcom: Add GPU clock controller driver for SM6375
  dt-bindings: clock: Add Qcom SM6115 GPUCC
  clk: qcom: Add GPU clock controller driver for SM6115

 .../bindings/clock/qcom,sm6115-gpucc.yaml     |  71 +++
 .../bindings/clock/qcom,sm6125-gpucc.yaml     |  64 +++
 .../bindings/clock/qcom,sm6375-gpucc.yaml     |  60 ++
 drivers/clk/qcom/Kconfig                      |  27 +
 drivers/clk/qcom/Makefile                     |   3 +
 drivers/clk/qcom/gpucc-sm6115.c               | 523 ++++++++++++++++++
 drivers/clk/qcom/gpucc-sm6125.c               | 444 +++++++++++++++
 drivers/clk/qcom/gpucc-sm6375.c               | 480 ++++++++++++++++
 include/dt-bindings/clock/qcom,sm6115-gpucc.h |  36 ++
 include/dt-bindings/clock/qcom,sm6125-gpucc.h |  31 ++
 include/dt-bindings/clock/qcom,sm6375-gpucc.h |  36 ++
 11 files changed, 1775 insertions(+)
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

