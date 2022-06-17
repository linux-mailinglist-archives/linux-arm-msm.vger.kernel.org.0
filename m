Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F40F654F992
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 16:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382886AbiFQOrV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 10:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382878AbiFQOrT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 10:47:19 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA02B4F1D0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 07:47:17 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id h36so7273559lfv.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 07:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d7IyyWcogW6tzD/uS39NdaxdXjnV0hMVXgONOdwNoQI=;
        b=iGJFN/+WVtIXDzPKRmw43NyFfYfiKVIkVvkY3vISZDB67HLGS37o0WlFGGtigKjSwA
         xPf10AL6B9vqB1gO0sqIxh6r8RhrDoWcmIPXWib1nDq45SfnlkL1rpNNPKciOfhJ5fvS
         ucpGTQgjgKvG3iuLzMO8fYYNjRLa8q2WTOLjELoeldGI/fPrCWiz2eiCukfF22A10Gkq
         daYI4J1UkBUjggEheVSZEjtJcqZogw+bJPLvYeJkdgw557ZqQxfcJrd4l51Kb+ZsmLfW
         DRYl/ztLHZ0DPryZASx+ejmjqLh8yYBquH24OeRCMLSGpUCIcBYVEDGDrr1PmvJFVW11
         PuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d7IyyWcogW6tzD/uS39NdaxdXjnV0hMVXgONOdwNoQI=;
        b=XN3v7bUurMryAJjKEncFWmC4fKAcPAir1PlZomhAAkmIm83vNde+UzMvKBz5agoUsa
         67QTlXUIXiUqgNbyXh7I83wQ6xDkC+ch/7im8Q5wOyXRjEf44Bueajz2aC0FUPnczp+F
         RSc+N6Upshxg3MgKvolRoxG+OJ4xP0fK2Awk9oTY/yOIBT5gMaoMwf6fSdaSz46tKzf+
         PWpXNuUoxV5iaSuec6n+i5N+GH3SegND2ZnenBEIPK7KmbdDELHAOJEIbHR9plDMLhvI
         rzACrR9WjhemrEmeN+rFEl3eEdgCskMUOgFcqajRLN3buNvLllCeAOxEu/z7Z6BQzqnu
         3pyw==
X-Gm-Message-State: AJIora9CIUXvA6/DCOIqCv3Z+y0W3adZK2gpELnh6B/uLltWJ/IrfIlF
        tf3h9k6cj5xB2v/zEeW8mEoAqA==
X-Google-Smtp-Source: AGRyM1uYWX+CX2LWivh0Oae4UjqnwJb4t4TlULauVCsJ0YPqcusd6ubt2RGg5Vh3NiZpWbUOL1Xv0w==
X-Received: by 2002:a05:6512:2983:b0:47d:a3ac:3574 with SMTP id du3-20020a056512298300b0047da3ac3574mr5814842lfb.343.1655477236204;
        Fri, 17 Jun 2022 07:47:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a5-20020a2eb165000000b002553ab60e17sm571867ljm.122.2022.06.17.07.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 07:47:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/7] clk: qcom: gcc-msm8916: modernize the driver
Date:   Fri, 17 Jun 2022 17:47:07 +0300
Message-Id: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
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

Update gcc-msm8916 driver and bindings to use DT-specified clocks
rather than fetching the clocks from the global clocks list.

Dmitry Baryshkov (7):
  dt-bindings: clk: qcom,gcc-*: use qcom,gcc.yaml
  dt-bindings: clock: separate bindings for MSM8916 GCC device
  clk: qcom: gcc-msm8916: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: gcc-msm8916: move clock parent tables down
  clk: qcom: gcc-msm8916: move gcc_mss_q6_bimc_axi_clk down
  clk: qcom: gcc-msm8916: use parent_hws/_data instead of parent_names
  arm64: dts: qcom: msm8916: add clocks to the GCC device node

 .../bindings/clock/qcom,gcc-msm8916.yaml      |   61 +
 .../bindings/clock/qcom,gcc-msm8976.yaml      |   21 +-
 .../bindings/clock/qcom,gcc-msm8994.yaml      |   21 +-
 .../bindings/clock/qcom,gcc-msm8996.yaml      |   25 +-
 .../bindings/clock/qcom,gcc-msm8998.yaml      |   25 +-
 .../bindings/clock/qcom,gcc-other.yaml        |    1 -
 .../bindings/clock/qcom,gcc-qcm2290.yaml      |   25 +-
 .../bindings/clock/qcom,gcc-sc7180.yaml       |   25 +-
 .../bindings/clock/qcom,gcc-sc7280.yaml       |   21 +-
 .../bindings/clock/qcom,gcc-sc8180x.yaml      |   25 +-
 .../bindings/clock/qcom,gcc-sc8280xp.yaml     |   21 +-
 .../bindings/clock/qcom,gcc-sdm845.yaml       |   25 +-
 .../bindings/clock/qcom,gcc-sdx55.yaml        |   21 +-
 .../bindings/clock/qcom,gcc-sdx65.yaml        |   21 +-
 .../bindings/clock/qcom,gcc-sm6115.yaml       |   25 +-
 .../bindings/clock/qcom,gcc-sm6125.yaml       |   25 +-
 .../bindings/clock/qcom,gcc-sm6350.yaml       |   25 +-
 .../bindings/clock/qcom,gcc-sm8150.yaml       |   25 +-
 .../bindings/clock/qcom,gcc-sm8250.yaml       |   25 +-
 .../bindings/clock/qcom,gcc-sm8350.yaml       |   21 +-
 .../bindings/clock/qcom,gcc-sm8450.yaml       |   21 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |   14 +
 drivers/clk/qcom/gcc-msm8916.c                | 1020 +++++++++--------
 23 files changed, 669 insertions(+), 870 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml

-- 
2.35.1

