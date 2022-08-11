Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 576E558F6E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 06:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233777AbiHKE0W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 00:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233585AbiHKE0U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 00:26:20 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B3919010
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 21:26:19 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id p132so20065165oif.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 21:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=H1D2I5F6jEY4Yho4Ry80Q/V7w8am8kAH/C1aUroh9io=;
        b=q8DxvR0+uMAaBPlHZlPA5S7nLlH2th+z7nIkuuh8u59GZidpQQW3qi56H+zUMkl4Bi
         3Wr8LJAwi+l61nM+KyUTMM+gTU1c+s2elv6Ba1DZ6olExnsY+7n0o0gPvrNrTaWajpJ4
         ZEbZ8pdev0J1vIFoEWv5hYQiN/hBphBLe3IADnwu4zNe2mGtpL2GjQwV514prWn5Esxy
         he7CXdVgyjfSBl0Cd1BOIC+DO/Hb+O1cArHJeJ5X5a53fJf073zQCz7kNaCQD/eWuf+5
         fNlOeIP84liinkTgYun5gV8DPSnhbnO9g8OaxNU98bobsV+P0VwZzQ55FdBxSQKoS2b0
         A6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=H1D2I5F6jEY4Yho4Ry80Q/V7w8am8kAH/C1aUroh9io=;
        b=Se4ZIPDnEMfhiXMOIRCvggWnqUMpXErIwvahmnEVI6UaawBHu0WH0li1xWz8YHdj3u
         nJbWlY+D59ZWJu4jKMWSFOJkfVoFxiktBHu0Kjh5UCWRHnXk/ie+ZKZ363+2KhX9jt76
         Kva6FlNtMWcnmy0x3pMG0pSGP/pmJoobZL/I1WUH6Tabj1O6vRo5Sy7oVAy/QUrGvTte
         zmQMCgHe88mEUeqR+sbSKGDauPLQ7l0J51xtkI2OjQkSiDGcGaJ0Kyr49R1tRkr3I4DO
         YJRM4jO57TdGaK1oTEAE+uumncrlEzkjXEzT6edgmjMxE9ue4eHZzCL2scesBfEnl4F/
         pqOw==
X-Gm-Message-State: ACgBeo0zenrWVjwVfiRkeq5zNMJLHpDhHfK0gD7hSLs1vJaK52445cwL
        QdNRs+mpNc+lHV9O9Jos0eljrA==
X-Google-Smtp-Source: AA6agR5vjFsODD7MmgxqVSNhUlWvgAy0IeZt4SYblC9qgNSbGpfnjRNLN6bgQipCk/Zph+plR9vfbQ==
X-Received: by 2002:a05:6808:d4d:b0:33b:6ae:bd06 with SMTP id w13-20020a0568080d4d00b0033b06aebd06mr2687110oik.183.1660191978945;
        Wed, 10 Aug 2022 21:26:18 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l17-20020a9d7351000000b006370c0e5be0sm1009517otk.48.2022.08.10.21.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 21:26:18 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: qcom: Add SC8280XP GPU clock controller
Date:   Wed, 10 Aug 2022 21:28:53 -0700
Message-Id: <20220811042855.3867774-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

What the subject says.

Bjorn Andersson (2):
  dt-bindings: clock: Add Qualcomm SC8280XP GPU binding
  clk: qcom: Add SC8280XP GPU clock controller

 .../devicetree/bindings/clock/qcom,gpucc.yaml |   2 +
 drivers/clk/qcom/Kconfig                      |   8 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/gpucc-sc8280xp.c             | 460 ++++++++++++++++++
 .../dt-bindings/clock/qcom,gpucc-sc8280xp.h   |  35 ++
 5 files changed, 506 insertions(+)
 create mode 100644 drivers/clk/qcom/gpucc-sc8280xp.c
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sc8280xp.h

-- 
2.35.1

