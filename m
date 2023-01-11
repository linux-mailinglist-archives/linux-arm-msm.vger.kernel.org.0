Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C21466645F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 21:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235843AbjAKUFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 15:05:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235894AbjAKUE7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 15:04:59 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F7D43A39
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:30 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id j17so25226145lfr.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R4EjPqDqf5rLZ0bHqXvZFVAAysXKcEO63I4Y+lNmlts=;
        b=Xy+O1ciR3bKso3CBpPmfk2iecpJwX9koMougnpf2PXdWAXmFwvB6pAQ1EL6pCXFXMA
         da7bw891zryybms3nCxOncO0ujW4U93tEc5rDwAAKKPdSut3OVgQ540TTC1rrTwykWvN
         51rj92Yl2MbJg7Cci4u3QAwgVUiOZnwfleMFrkCryKJPA+yrYb/Yq3TP9qWq44qqphFp
         +Jm8rnE7Wv4/+8RVooQvUw8eYyGzIQ5rnUAX7pmerTa/BcxwIy8ILtZdYMFbgXBiOGV9
         L9pa792Fr292QV0ufT/jAo6iSIugsoFYO6ED091iU9rpLMgemrAZ+q7w6IKolujjMFW9
         SxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R4EjPqDqf5rLZ0bHqXvZFVAAysXKcEO63I4Y+lNmlts=;
        b=r6UmJ7b8orDCJ0H0wyD9tWMZRb5G90umAHGa1xfjes7G41mNU74U1ktMRpeJ2Wy9Yc
         Wp4daTEypUH3SseOV1yQ3W+L2hr5BpQgRX6dnmxTOETa5Cyn8K2DYvVtKuLNAWoPa+LR
         hmVo5EWMCz1SdD+XDNJbglz+ZNwrqYL5uFeDNWxzP4c4NcG+J+836cg8vYWt1+0pBO2g
         5enNX1ve1i5hWJgLAgSLhOBsD5mqTHDnfmN1oiex9OVQ9eb51nRoDTapPVg1bWBC5yWQ
         H0cHWBFSo8KO2BO0gB4StDzPAShfYNGjE7WYhdhYb/oMxg+7yT9h2sL/neuQ8W8CQ+Ku
         rmcA==
X-Gm-Message-State: AFqh2kqoEDp2k4jTj6pHxNj32p5GjI2dBzWZEMdRDdgqBjveoNohurfN
        rRY+GHu24GjegJSWk3yi3weyAA==
X-Google-Smtp-Source: AMrXdXt2II4jMeCeP/q/o/0mA1FbJvVhuuJTwdntqZpv2pgXoZWVejkkTJa8IrS78fbX0hQOcQXHWw==
X-Received: by 2002:a05:6512:1515:b0:4a4:8a04:4b37 with SMTP id bq21-20020a056512151500b004a48a044b37mr24871905lfb.32.1673467289018;
        Wed, 11 Jan 2023 12:01:29 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b004b4e6dab30esm2881437lfp.222.2023.01.11.12.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 12:01:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 00/14] clk: qcom: cpu-8996: stability fixes
Date:   Wed, 11 Jan 2023 23:01:14 +0300
Message-Id: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series provides stability fixes for the MSM8996 boot process. It
changes the order of calls during the CPU PLL setup, makes it use GPLL0
(through sys_apcs_aux) during PLL init, finetunes the ACD, etc.

Dependencies: [1], [2]

[1] https://lore.kernel.org/linux-arm-msm/20230111191453.2509468-1-dmitry.baryshkov@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/20230111191634.2509616-1-dmitry.baryshkov@linaro.org/

Changes since v1:
 - Included bindings update

Dmitry Baryshkov (14):
  dt-bindings: clock: qcom,msm8996-apcc: add sys_apcs_aux clock
  clk: qcom: clk-alpha-pll: program PLL_TEST/PLL_TEST_U if required
  clk: qcom: cpu-8996: correct PLL programming
  clk: qcom: cpu-8996: fix the init clock rate
  clk: qcom: cpu-8996: support using GPLL0 as SMUX input
  clk: qcom: cpu-8996: skip ACD init if the setup is valid
  clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb
  clk: qcom: cpu-8996: setup PLLs before registering clocks
  clk: qcom: cpu-8996: move qcom_cpu_clk_msm8996_acd_init call
  clk: qcom: cpu-8996: fix PLL configuration sequence
  clk: qcom: cpu-8996: fix ACD initialization
  clk: qcom: cpu-8996: fix PLL clock ops
  clk: qcom: cpu-8996: change setup sequence to follow vendor kernel
  arm64: dts: qcom: msm8996: support using GPLL0 as kryocc input

 .../bindings/clock/qcom,msm8996-apcc.yaml     |   6 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |   4 +-
 drivers/clk/qcom/clk-alpha-pll.c              |   5 +
 drivers/clk/qcom/clk-cpu-8996.c               | 145 +++++++++++++-----
 4 files changed, 115 insertions(+), 45 deletions(-)

-- 
2.30.2

