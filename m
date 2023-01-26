Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CACD067CE5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 15:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjAZOkq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 09:40:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjAZOkp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 09:40:45 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A74618B
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 06:40:43 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id me3so5582656ejb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 06:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fq2fSmYy2GV9idTEfGozqIa9rC83FhIFdeDv77ditZk=;
        b=PL++9oK3NQHQAaeIuLX/THTj2foXSS5GiH/QixCfHsBNPTuBSNIj0IEmiQC+MBHlDv
         lhhMaN9ZlSeFoRk/41KnyMivAu2KPs7v2sPU24MBfQQwfFHLm36wAebOIpN/SYBO6ebp
         YiDrrEWDdYokGO5O8j4UrxsaYA6PdjSnH7CpZVqZ2YRsk4dakAkhnM48Nd4BZxr2N54U
         RQ1gAgKiNhYzXl17/TUpGAR3TexBkukoHCjDtiz+eIzxT0Iy9DkN5NCDjGMmS48secxv
         TDxNJgXKdWVifIWHycP0Z4ffeNelmaNCGR9fYr4lGDm+kpuZR21znJQMTcOx+PoxQ1Iw
         XsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fq2fSmYy2GV9idTEfGozqIa9rC83FhIFdeDv77ditZk=;
        b=uBeQjfXxEvLXIKkAVDyJ5tf1lCfxSHoxfmeFU6lIS0hhEcyWkhYBFg+bDG/axXRVth
         gpkZ0XP8AGGcAiVqVtz49GTTEoUG9EgsIWK69hPIV+oYcJdAW2/rf4IzPd0AwYe4GxjP
         h7kJm6OcjnVajtt1a1B/Kuegxs1dOlpMDNSaMJEVU3CWrOFQjzPqd2zbX90m+ITB8VBC
         wxHT7fZx65l9zkg3jUn0lhQAy5qtI95gE9CMLCdUacZiIqYCwP0XBe7lL+LvDvGEi+xO
         S0gk5UVfiwpakKONNnq0XOUm6i/TmatmlTMsqpZfXfNpJGH0CsoQv+KAQt0Q5X+/VLr8
         atJA==
X-Gm-Message-State: AFqh2kr22JIfIERdaRjRBd/CiScgKboqzh22iAzlKYp7j8KaaJFADZSZ
        ZpebAGOBsJMf+6LAa1Uy4+Ed1W+9x5emaVvw
X-Google-Smtp-Source: AMrXdXuxZ87QwtCBcn1IP2q9WiPbKEh+TXCxJsK/qglpx5D1f+V/rnDX5HRuPBbpg0OufhwzOU54rA==
X-Received: by 2002:a17:906:eb13:b0:869:236c:ac43 with SMTP id mb19-20020a170906eb1300b00869236cac43mr38850877ejb.32.1674744041623;
        Thu, 26 Jan 2023 06:40:41 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl. [83.9.30.108])
        by smtp.gmail.com with ESMTPSA id s19-20020a1709060c1300b008699bacc03csm697547ejf.14.2023.01.26.06.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 06:40:41 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/6] SM6(11|12|37)5 GPUCC
Date:   Thu, 26 Jan 2023 15:40:27 +0100
Message-Id: <20230126144033.216206-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS autolearn=no autolearn_force=no
        version=3.4.6
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
 drivers/clk/qcom/Kconfig                      |  24 +
 drivers/clk/qcom/Makefile                     |   3 +
 drivers/clk/qcom/gpucc-sm6115.c               | 523 ++++++++++++++++++
 drivers/clk/qcom/gpucc-sm6125.c               | 444 +++++++++++++++
 drivers/clk/qcom/gpucc-sm6375.c               | 480 ++++++++++++++++
 include/dt-bindings/clock/qcom,sm6115-gpucc.h |  36 ++
 include/dt-bindings/clock/qcom,sm6125-gpucc.h |  31 ++
 include/dt-bindings/clock/qcom,sm6375-gpucc.h |  36 ++
 11 files changed, 1772 insertions(+)
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

