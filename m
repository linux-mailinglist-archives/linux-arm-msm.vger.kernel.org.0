Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25221550D35
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jun 2022 23:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237314AbiFSV1k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jun 2022 17:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233624AbiFSV1j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jun 2022 17:27:39 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20AF8AE56
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 14:27:38 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id c2so14443837lfk.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 14:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJLe278N4mRl3E1vVE4w4t5r41H7ei/+ymPNgrkUtZg=;
        b=NbWFoE75zlAPNIrVYEgvAK4lPxQsTJQENiGPBbakhRgSrS+e+GjzRqguwBdUDPJJEN
         vKqQQZQAhEhLXj2z+4K17S4pV4VVvmNEepZmgFOtcI1zjufnub9sWRldoGJzZ/tlJBpY
         yfjLgQopzej0TNMq1saMHgUczt90jMP5tM3oSZDCk3wFbKtmWpwv80aXqDgC7bRk+mfL
         ZABJWUz1+xlvlMlkOnTzuC+zO2wX3n+z+9aGUjwhQ1+VKyRDrT0hWUS0sqe5GDt8iexs
         oAS9+QXu9rP0vyftqppCiG5mZWNHqzqoLdQfHbxsGCVYiHbvRNkUlCzJnduLYehVJJl1
         iWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJLe278N4mRl3E1vVE4w4t5r41H7ei/+ymPNgrkUtZg=;
        b=Jcvli5Ailh2q+0MXPdRGBk1bYAl8D1IhN5uQMxGm/rpQSB9N+AxO0d4yS4Vothb+Cn
         iZpNBuXuc2wgmHPMGssu4ZyhhON9gh4F+fmX4GqxR85rnDtPXRzMxT11nHff9cHYfenw
         /uHI1fkfK+mZ3f1keuZgoarQRUbuS9CUhNVLZtvVdHqLqABqgEpo18YZ42VNn/D3ri9r
         ZfvDf8yO0JOb9HdJbCtK7cEdvR6ueO5ZDXcRPtP8CuPyp3BAEUhzsoyYLIliHVHpK0mX
         5iYdZNngsd6aq/WitvmWXprY+YsqG7hY3Lis7Gpn+nRP4xquF7Yj+JOUuRC0W1H0Y1Vt
         /f2g==
X-Gm-Message-State: AJIora8BiyXTQjQMIUpeRh9qtfMOY84qXprwewtUU7T/ZaowPXYXLYDL
        uw4v4JU7MSkRRdvpVtToG3X65A==
X-Google-Smtp-Source: AGRyM1ucbMFjdw2URvElL0AsC7Ua+u+MCHSIC47vbXYscRzPTWBlB/Rg48T4u7a8j9sYjqS2fEfmWg==
X-Received: by 2002:a05:6512:224b:b0:47f:68cf:e697 with SMTP id i11-20020a056512224b00b0047f68cfe697mr3011924lfu.233.1655674056504;
        Sun, 19 Jun 2022 14:27:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s19-20020a056512215300b004796a17246esm649078lfr.252.2022.06.19.14.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 14:27:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v3 0/7] clk: qcom: gcc-msm8916: modernize the driver
Date:   Mon, 20 Jun 2022 00:27:28 +0300
Message-Id: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
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

Please excuse me for the spam, I've erroneously sent v2 without the
requested change.

Update gcc-msm8916 driver and bindings to use DT-specified clocks
rather than fetching the clocks from the global clocks list.

Changes since v2:
 - Use xo-board for the XO rather than RPM clock. This will be sorted
   out separately (requested by Stephan Gerhold).

Changes since v1:
 - None.

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

