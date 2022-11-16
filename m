Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8742662B782
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbiKPKRF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:17:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbiKPKQ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:16:58 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2065EB489
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:16:57 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id y16so29092449wrt.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=SYky1sC+yYpT0jV8uhMC/5SyRMiJ5AfjSnC52D3jHp0=;
        b=bxJqZmMJmklaIMoPN/UfaDEYom0oT2ayFgTQ1b2kddVy9sFEyaRsfQ5KqbH/GKSQS2
         cA1hylsElDz+OxlgMslRLlT5oas67FfAFpWL5u2CrWU08XugFcsDKf5wiAxChc3BAjdc
         6CcHTFLsxZZccNCa1WQhi7LdQ7maQyCmzpzFNgju/++Ltr54pgDwf5I+ehUp9SE+9Phu
         A7gMR+byUGh/o6XoGRhhDHOQzC+pyP51JcLvh8XmgD2O63i3inMWSaQe5jr9xtkU4k4a
         3v833XfjqKA5i2JEaFHpIsZ5Q4gdZcNEIGu9RS/EcLbi48Wu74yxxU9b3STpoSt6x8dU
         OdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYky1sC+yYpT0jV8uhMC/5SyRMiJ5AfjSnC52D3jHp0=;
        b=K1ZYmglMZoVq+lbFo3rLblX61KjX8b1yN7fREyh7kev2iGkSp8TYaJEHaTBWsqCuFK
         tpTky+VUMhe/IcG5kSnjUMthSvwWk+Nx7Hre0WnXUTozlU9BeEVZYJ0mzq6EqZWJoaoH
         uITAuP1g4HtkxiDBo2hTrpdlmUsrCPvzPF0yhzwfukzzLkr10HxpOIo+TySp0Qy++6LH
         tKPPo639xW1xO3r2zeddrqxsG9HPZoRHdix3fTOMfq1IjZexAyACKvG07q4AqPChi7tl
         /X3WpovGPVF+9PQa8xslkWXLYfUiWUwlHNRJ0sDL+Zw/QB6JO+K2/TMWwnb/MdcXjbH1
         im0w==
X-Gm-Message-State: ANoB5plTXRvDp0P2BX+TOBC2w7labVor274Eo2WdnHGDNhsckW+8v81m
        6j2H/tJ7q8B9asV18kABiMGx4GuzAydBag==
X-Google-Smtp-Source: AA0mqf5Oj2v5/klDxE8Qeui759eu0PP781LebTzAWOULR+D1EYxLNXgsTSjvz8iIH8jFWTbXpUqCvg==
X-Received: by 2002:adf:e543:0:b0:236:91d0:1f with SMTP id z3-20020adfe543000000b0023691d0001fmr13742500wrm.33.1668593815565;
        Wed, 16 Nov 2022 02:16:55 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id c4-20020a5d4f04000000b0023672104c24sm15081007wru.74.2022.11.16.02.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:16:55 -0800 (PST)
Subject: [PATCH 0/2] soc: qcom: Add support for Qualcomm Modem Processing SubSystem DSM memory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAJO4dGMC/w3MwQ6CMAwA0F8hPduETWbQnzHdqLCEFtKKF8K/u+O7vBOcrbLDqzvB+Fe9btoQbh
 2UhXRmrFMzxD7GEMKASib+tU1ndBlT6vHYm5kEZXd/Ty4YQxnuY3mkzzNDmzI5YzbSsrRLj3W9rj8v B6AaegAAAA==
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:16:51 +0100
Message-Id: <20221114-narmstrong-sm8550-upstream-mpss_dsm-v1-0-158dc2bb6e96@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SM8550 SoC Modem Processing SubSystem requires that a memory
region named DSM should be shared with the Application Processor SubSystem.

This adds bindings for this MPSS DSM memory and driver implementation to
share this memory region with the Modem Processing SubSystem.

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

---
Neil Armstrong (2):
      dt-bindings: reserved-memory: document Qualcomm MPSS DSM memory
      soc: qcom: add MDSS DSM memory driver

 .../reserved-memory/qcom,mpss-dsm-mem.yaml         | 37 +++++++++
 drivers/of/platform.c                              |  1 +
 drivers/soc/qcom/Kconfig                           | 10 +++
 drivers/soc/qcom/Makefile                          |  1 +
 drivers/soc/qcom/mpss_dsm_mem.c                    | 95 ++++++++++++++++++++++
 5 files changed, 144 insertions(+)
---
base-commit: 3c1f24109dfc4fb1a3730ed237e50183c6bb26b3
change-id: 20221114-narmstrong-sm8550-upstream-mpss_dsm-21c438c65f9b

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
