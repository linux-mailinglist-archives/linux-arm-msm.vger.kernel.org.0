Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE6EB644394
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 13:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234682AbiLFM4s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 07:56:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234724AbiLFM4p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 07:56:45 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D971B165BC
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 04:56:41 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id f7so20137877edc.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 04:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BtG9dpRPPLVWEzqK98/sWy4KaJxGP67G9m64q51PucI=;
        b=aUp8k0BBIW4Siz7zDjeP3/m+HIa1vK+Fo4f43DGP6y08STvr6VnrVZ9ZbW/tClbrRt
         tNYsOtEO+AeDEoO5PdelTdTbPjhiVyXFL2ityh9QPfheVAIy2+3Nt2WBSRHXMNcIa0Gp
         cxK3dA0QPzYoOk2am9dXHDsFBjcOJimCu2XD6x3Y9tQxH1zewyd3zc00R5EYc71vXdg8
         sHMqKzbmJOvvNtYngywHI4215gCgSO9IjfZmsRXCJ3SXXvRBsLQKYvEYlCGSOTy3IP9M
         Fj4OkeG+0SLA2gV9rxeYh4Y8jSZ/mCswIlxpdlIidQV3s9S42Fj6XcAcRZoKaYHc0Ttd
         +NfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtG9dpRPPLVWEzqK98/sWy4KaJxGP67G9m64q51PucI=;
        b=3jM2YXCGgsK68XKVCx6ecFIVioI076pRuBaRkZT/sqyP0GTsdgy1i7YuMwGjt/Oq3k
         t8S5otVLAdGkkua6BMlpsCM7SCYEUcIcAezc5XkmpmObEkVV2Igypill/5xSSGLXb/oI
         LV3pNT+K9MS8vTm/tW0o/4q+HzNtopnmb434AYXk4U01YuNrRtgHg3glxNOElOZBL64K
         MFWlHvELHZiNM9DuJQBrQrl33vKMHwwuuZbS0fgnFrikPoiBZLlNM1VpbyjJm0wRq9Gv
         UaQ22hUYVPzmIXkoYiy6NsrqCnzt5thkfrzOJln5RCZ1dPX4ARQjiriOVSE1zeVSnjp9
         iqKA==
X-Gm-Message-State: ANoB5pkwTkquz4xaQfrb16Jrs0neL6G/FM/LRLNwanxGqdrgwWEE5I/5
        9upVVTx8W4yJob/Z/9Ai596MJA==
X-Google-Smtp-Source: AA0mqf5amD0/7EuYbW/R1Yi6jZ0jxw6ms60d+vDHm21+7pR85K3W4aL/sZup3DSK0CgbKCSFu4etww==
X-Received: by 2002:a05:6402:b8e:b0:46a:f256:491b with SMTP id cf14-20020a0564020b8e00b0046af256491bmr37584672edb.161.1670331400207;
        Tue, 06 Dec 2022 04:56:40 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v15-20020aa7cd4f000000b0046150ee13besm932991edw.65.2022.12.06.04.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 04:56:39 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v5 0/5] clk: qcom: Add support for SM8550
Date:   Tue,  6 Dec 2022 14:56:30 +0200
Message-Id: <20221206125635.952114-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

This patchset adds more clocks support for the Qualcomm SM8550 SoC,
It adds the TCSR clock controller driver and the rpmh clocks.

Changes since v4:
 * dropped the patches 1, 3, 4 and 5 since they are already applied.
 * replaced DEFINE_CLK_RPMH_FIXED with DEFINE_CLK_FIXED_FACTOR
   in clk-rpmh.c
 * changed TCSR clock controller driver compatible string to
   qcom,sm8550-tcsr
 * renamed the TCSR bindings header and schema files to match
   qcom,sm8550-tcsr

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

Abel Vesa (5):
  dt-bindings: clock: Add SM8550 TCSR CC clocks
  dt-bindings: clock: Add RPMHCC for SM8550
  dt-bindings: clock: qcom,rpmh: Add CXO PAD clock IDs
  clk: qcom: rpmh: Add support for SM8550 rpmh clocks
  clk: qcom: Add TCSR clock driver for SM8550

 .../bindings/clock/qcom,rpmhcc.yaml           |   1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml      |  53 +++++
 drivers/clk/qcom/Kconfig                      |   7 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/clk-rpmh.c                   | 110 ++++++++--
 drivers/clk/qcom/tcsrcc-sm8550.c              | 192 ++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmh.h         |   2 +
 include/dt-bindings/clock/qcom,sm8550-tcsr.h  |  18 ++
 8 files changed, 364 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
 create mode 100644 drivers/clk/qcom/tcsrcc-sm8550.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-tcsr.h

-- 
2.34.1

