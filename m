Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 446995B267A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 21:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbiIHTKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 15:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiIHTKt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 15:10:49 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08433EB2F9
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 12:10:47 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u18so17060899lfo.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 12:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Z1/OP11GlLnDRJmthsHNyWrCSy9RTalgs4TnhcvtaBc=;
        b=zHelYglSfbiBOl/MHigaMxHtV03GXhA+25+cn5kBD96M5f5O9JyCJbv9+sXejH0pCi
         fqM7FQKP7m+WvigjHYPLve7N4juBdMFFeSysL7jJO1Lwma5BeB0M/SQnJeO2YkfeK/7D
         XI0UN9KJA492tgn2UlSyCkw0QALrGpUkj/fjrs7qZ90WdclZfR75AgT3BjdUd9RHqVdX
         vgiphnRGqFFyaRXFOZqQgb10zg04eg4swldr4NPYDxeqljEvA3n9quZ6NfMDC1AUb2aq
         NcqvvfDpMwJ6iVBQLNYr/RAHCjzIR2jS1wYo5Ai1nXKKELG5SohYsZWOeGn/Bbz6Xich
         GvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Z1/OP11GlLnDRJmthsHNyWrCSy9RTalgs4TnhcvtaBc=;
        b=JJNMbVAT4eHqoUxIhJxGbyVU4ErF5C8MvCiPjubG+4w3pemi1OhtkSHOecxueSmv0p
         BJuAoN+3f+O/AOUTxXzSNf1ZcgIVZcjYAeYLCmH2HSB8+b6Rd3QojFHLdA+fGWsKl3iI
         ILT6SuP/thYQ8DZFnYtTNCCuuNzUf+zUkYBUyvqBY/HhekHe/5KCWg6C4rdzk8phBoXN
         JOECeGyxTlixqevZJ9Lbp4Agfzmnd2se0yfFuGIpbK2LW9vCebDb1o2VEvoHarCQbtho
         VdLA1pc16UJRgVHg0+0T+vFXpiewcE0HPM7LyYGJaHQYIsNWOdFSONoYUYjc+s44w34l
         XbHw==
X-Gm-Message-State: ACgBeo1hD0RcefCWA52mVBSO01E/8MEh8skgfAXSwcpQ2Oy02LqGrjvf
        p57SQmjsiiln98PZdotV6jMydURdFaCtTw==
X-Google-Smtp-Source: AA6agR62sFNq9FTxx9BBA64L192b2EXkbzrVmWXyATTRHjXuI1MJeVCylURlf81YIejbW3g+/P/ryw==
X-Received: by 2002:ac2:4c35:0:b0:497:ae09:11b with SMTP id u21-20020ac24c35000000b00497ae09011bmr1942257lfq.507.1662664245344;
        Thu, 08 Sep 2022 12:10:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v17-20020a2e4811000000b0026ad316375esm634904lja.38.2022.09.08.12.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 12:10:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] clk: qcom: add SM8450 Display clock controller support
Date:   Thu,  8 Sep 2022 22:10:40 +0300
Message-Id: <20220908191044.3538823-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the Display clock controller found on SM8450 platform.

Changes since v1:
 - Rebased on top of 6.0-rc
 - Dropped clk-names in favour of using parent indices (Bjorn)
 - Added GCC_DISP_AHB_CLK to dispcc node (Bjorn)
 - Changed bindings licence to dual GPL+BSD (Bjorn)
 - Removed zero clocks in dt bindings
 - Fixed syntax issues

Dmitry Baryshkov (4):
  dt-bindings: clock: qcom: add bindings for dispcc on SM8450
  clk: qcom: alpha-pll: add support for power off mode for lucid evo PLL
  clk: qcom: Add support for Display Clock Controller on SM8450
  arm64: dts: qcom: sm8450: add display clock controller

 .../bindings/clock/qcom,sm8450-dispcc.yaml    |   97 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   28 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |   40 +-
 drivers/clk/qcom/clk-alpha-pll.h              |    1 +
 drivers/clk/qcom/dispcc-sm8450.c              | 1829 +++++++++++++++++
 .../dt-bindings/clock/qcom,sm8450-dispcc.h    |  103 +
 8 files changed, 2105 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sm8450.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-dispcc.h

-- 
2.35.1

