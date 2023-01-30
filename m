Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74CC0681511
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jan 2023 16:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237947AbjA3PdM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Jan 2023 10:33:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236884AbjA3PdI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Jan 2023 10:33:08 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97EE03B3EF
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 07:33:05 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id ml19so9286143ejb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jan 2023 07:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fYFjYu0cCHKYx52nVT2EsfgZot4/KngQIjR+yY8DNYQ=;
        b=uZOclbAwKwUl/ZS0gDrOEP5MW57PtpTKLwxMIfLNU/jvML35ZhfocdTNnxQZETKN5N
         pGKAzz+L2w4PgdGrlBOAZBYd+aAN9IRpTc6s91J7gC0/cj9nzMmp+3J5HR+uAKu0FBNX
         Udt+P/fg5XZcnmJuSLW7oR7THO7yu4vr+sSYebe2EF/xKWX0Iqrmj+LrRZ42UG8/goMc
         POhVPnkMqJmkdwZ3DTsw8Z19wCUnhwihMKclWQ1Q9lV4xaKBGS2aOCj74ypSU4yMHkTR
         XU+/0HZUp4wZxEatO+ZB794Yo9RFCLr4lqQnHglfjDTjKpM6PiSNF75wkohwCEx39w8k
         MDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYFjYu0cCHKYx52nVT2EsfgZot4/KngQIjR+yY8DNYQ=;
        b=4HklFV5N1EUYzjhUYToHiwQVfnLy3q6KeRLzZlU9MicZnJUGhMbwAmAxFV3LmKZ6gj
         M8FKGn2pBED1re99H6GOv3elQ2jtHtLQ5ocli30hcU80hIIyB1p1Vq05KdFoRIHVWCKe
         7qF7uVUoaZBZzXnTEeo3yShMcg6Jmjb19st7qWUP6Goafy7jkX7bnWYglWErELk3tSxb
         qXFWaR605/UTPRL+ulmmHE7jKEOk9PA2wG20dgZDKtONVP4nJC3PC4fsb190NxWAKKZ/
         n9oQBRrFd06nh07Y13BAIC46LKYNU9a/OjBc6TMSPAZswijGQrHQ92SgK6+nyQf7Hdzj
         veGA==
X-Gm-Message-State: AO0yUKWinIRygOj7F7noK2h8SVIQIDW2ex+4xeX+ElTjvNAv0ODsCsAo
        NmdqzAOX3v05DYclkfLSZLe58y9QyB02cpEm
X-Google-Smtp-Source: AK7set+LcnE0galJTUG0x4WUoxI9U6YrRboNVkvz0IjLIJswbWj25UYuOaqNyyQ4WNUweWSyuvAOhQ==
X-Received: by 2002:a17:906:411:b0:88b:23bb:e61f with SMTP id d17-20020a170906041100b0088b23bbe61fmr1048011eja.25.1675092783930;
        Mon, 30 Jan 2023 07:33:03 -0800 (PST)
Received: from localhost.localdomain (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id k7-20020a170906054700b00878769f1e6bsm6805773eja.55.2023.01.30.07.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:33:02 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 0/8] SM6(11|12|37)5 GPUCC
Date:   Mon, 30 Jan 2023 16:32:44 +0100
Message-Id: <20230130153252.2310882-1-konrad.dybcio@linaro.org>
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

