Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0899D5EDF6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 17:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234538AbiI1PAU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 11:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234619AbiI1PAE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 11:00:04 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E4D2CDD8
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:00:01 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 10so20797052lfy.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=xCV7rEuLvHI3GvFjoeTBcnFw7+joKM18upgDxMAcDBI=;
        b=weoWm3gBbgKtdbJ0ToHNdVIuY63umcWDbGRkemKSg5Cn91vvsHrrR0JqjI64ndOAqY
         FyBhesHwiboHUIZ6Mh902UQbCH0pXB7HeajjE6zyljovqahI+T3q2oGBZvrwknjt3Qi6
         NNqE5hC0GFYDv2+ccHzg70LtA/mFFiXuPPULF2DScyKGMDIOrrqFECvfVS/qdPSRFQAE
         8QccLz1f9xFmGYQkL3W45snQ75/eO1GyBvcEc843ro65RPgWvwTfWokAMBv0/vkZY8M4
         K6HRBVWrt6btq0HmW4LOrlqTN8TwvwpLpg30ER0iVKHjRSLugQxZwP7kiQiu86TaaqNE
         Rh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=xCV7rEuLvHI3GvFjoeTBcnFw7+joKM18upgDxMAcDBI=;
        b=V+TDqSe6sidpdLvYP1Cv2THzQHzBs4VBvMbNYMp/gFjdWBFtOaU3Qm96ETsuC+ju9S
         4w08mWzrssBVExY4fA+2wtNwpndrdC4+FDdc/K8JPT/4lu7aSrlxh5MA/VqREi0FQdOI
         0NVqwWfJg0gez/Nzc83F10D+NtP4TWf20LrCTxj2l68ESzphixG013lqKrDy+xstmJJZ
         reNkw0TJBzdTijMBsLxhkPovHl0yUKi4R1PNHsioXdDdO+y+JTJk0IYDOw9/JIXsnhBE
         8rh4RLDRXYd2rIR6m4N6UMPkPPGuooEiLa452igvh7Banpq1UKpdF62Ya184qm8NHVGQ
         MkiQ==
X-Gm-Message-State: ACrzQf3z+mqXutwueWWkZ8UP2e4M1Yx9frEbMgYaGdgM9+M+jJgyTq7D
        r6cM0euZO7LIw1nsa0DGI4fIPA==
X-Google-Smtp-Source: AMsMyM4vHY45bzx8c51sdS1YYV6hghpZ3NttEYROkG2UbRR952yK4JK1ugFk/y5YCYxYhKLzbDBgHQ==
X-Received: by 2002:a05:6512:2312:b0:499:e67d:1b52 with SMTP id o18-20020a056512231200b00499e67d1b52mr12973951lfu.305.1664377199789;
        Wed, 28 Sep 2022 07:59:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id be36-20020a056512252400b00492c017de43sm494996lfb.127.2022.09.28.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 07:59:59 -0700 (PDT)
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
Subject: [PATCH 00/11] clk: qcom: update MSM8974 clock controller drivers
Date:   Wed, 28 Sep 2022 17:59:47 +0300
Message-Id: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Modernize drivers for global and multimedia clock controllers on the
MSM8974 platform. Switch them to using parent_hws/parent_data, use
clocks through the DT links rather than fetching them from the system
clocks list, update schema and platform DT files.

Dmitry Baryshkov (11):
  dt-bindings: clock: split qcom,gcc-msm8974,-msm8226 to the separate
    file
  dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8974
  clk: qcom: gcc-msm8974: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: gcc-msm8974: move clock parent tables down
  clk: qcom: gcc-msm8974: use parent_hws/_data instead of parent_names
  clk: qcom: mmcc-msm8974: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: mmcc-msm8974: move clock parent tables down
  clk: qcom: mmcc-msm8974: use parent_hws/_data instead of parent_names
  ARM: dts: qcom: msm8974: add second DSI host and PHY
  ARM: dts: qcom: msm8974: add clocks and clock-names to gcc device
  ARM: dts: qcom: msm8974: add clocks and clock-names to mmcc device

 .../bindings/clock/qcom,gcc-msm8974.yaml      |  65 ++
 .../bindings/clock/qcom,gcc-other.yaml        |   9 +-
 .../devicetree/bindings/clock/qcom,mmcc.yaml  |  38 +
 arch/arm/boot/dts/qcom-msm8974.dtsi           | 106 +++
 drivers/clk/qcom/gcc-msm8974.c                | 682 ++++++++--------
 drivers/clk/qcom/mmcc-msm8974.c               | 736 +++++++++---------
 6 files changed, 932 insertions(+), 704 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8974.yaml

-- 
2.35.1

