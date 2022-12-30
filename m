Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0FF659BE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 21:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235488AbiL3UWq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 15:22:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235479AbiL3UWo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 15:22:44 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E07B1BEA6
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 12:22:41 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id bn26so1234673wrb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 12:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NgFwNM4M5cGhB9UpcaGEIdNhtR9zvkq2TS7bJ0knXCI=;
        b=KUvBlc0mRKd7kmk25KVrsvVRd+CGSod6vjnsEXmTQYhRKHbp8+oEoMsHx8CyzUzYGy
         j4KICEBA+Fs1Fdp4HU9IZR1uHSt331T5/E19CRJJ8Uoemnhn1ZNip5cAxt8no1CPisu1
         xVjNqT9PxeP6i21gTM31qKE1QXmCjJMVDBzkcZljbxSlcxLHRpZgL0Uz6gvxt1oerK5q
         +P0HTvZBImnUOnsimztNhstiWIPatDf/nY4aCXf08ZmcfyWHu5fdFYNVBL2HDHePbo8a
         SceB/1nKRdc12Ql8SDq9tEm0Uikr2aE1y9jHr/xdI2Y3R+I5K2F5i9d3fEHNB2VnnVkh
         RVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgFwNM4M5cGhB9UpcaGEIdNhtR9zvkq2TS7bJ0knXCI=;
        b=FnG1xOymhQvOSHJXI3PMMyPIaJ3JQFKirtfUfv1mjbCQQFbg8DNd4aoXOmClbsbWcC
         LTJzoSOQMWhYdEAINybFGAQqBgw82SNDcRC6p+ye1SOiaPkjUQkLTC1sGxr1xlDLx8Z2
         WQd3WpfET/6Gy4hM5CvQyOb/NAIFbKZJZPNnduqNq3jrucfhZWFiBe9s6WWSbEDu3anY
         HvDnplw/S0v17Tz0CLuZFz3u/OqYvPJNBUW2Czx0XSQGVcUgUaKNcLfE40KUfgkHaB/8
         8oIU2P6qK2nOrufpRESvls8UPS2VpHgXj5LSI2AMDgs2XcAp3XqUE+qB+Dm+tNEOHu7Z
         GIKQ==
X-Gm-Message-State: AFqh2krMT4CE8+J+MXTQaNjAi9WqeO1munKV/tnWvp9yX4cDUCLYwnZR
        QxaFX2DqgN7T2JYC6jkAedlMww==
X-Google-Smtp-Source: AMrXdXsnf57ZajA0fP/cV10Hb4N64+CCecbDerjNezb3/wP2WImQwi9tB/XbadQ94+9vneQg8c/vww==
X-Received: by 2002:adf:f38f:0:b0:242:102c:c571 with SMTP id m15-20020adff38f000000b00242102cc571mr19701100wro.19.1672431759916;
        Fri, 30 Dec 2022 12:22:39 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id z1-20020adfdf81000000b00268aae5fb5bsm21359142wrl.3.2022.12.30.12.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 12:22:39 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v8 00/10] arm64: dts: Add base device tree files for SM8550
Date:   Fri, 30 Dec 2022 22:22:20 +0200
Message-Id: <20221230202230.2493494-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

This series adds the base device tree files and MTP board support
for the Qualcomm SM8550 SoC, including the clock, pinctrl, smmu,
regulators, interconnect, cpufreq, and qup nodes.

The SM8550 is the latest Qualcomm Mobile Platform.
See more at:
https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/Snapdragon-8-Gen-2-Product-Brief.pdf

Here is a branch where the entire support has been merged:
https://git.codelinaro.org/linaro/qcomlt/linux/-/commits/topic/sm8550/next

The v7 of this patchset is here:
https://lore.kernel.org/all/20221206230102.1521053-1-abel.vesa@linaro.org/

Changes since v7:
 * Dropped the qcom,i2c-pull from the tlmm i2c data clk states (for now).

Abel Vesa (3):
  dt-bindings: arm: qcom: Document SM8550 SoC and boards
  arm64: dts: qcom: Add base SM8550 dtsi
  arm64: dts: qcom: Add base SM8550 MTP dts

Neil Armstrong (7):
  arm64: dts: qcom: Add pm8010 pmic dtsi
  arm64: dts: qcom: Add PM8550 pmic dtsi
  arm64: dts: qcom: Add PM8550b pmic dtsi
  arm64: dts: qcom: Add PM8550ve pmic dtsi
  arm64: dts: qcom: Add PM8550vs pmic dtsi
  arm64: dts: qcom: Add PMK8550 pmic dtsi
  arm64: dts: qcom: Add PMR735d pmic dtsi

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/pm8010.dtsi          |   84 +
 arch/arm64/boot/dts/qcom/pm8550.dtsi          |   59 +
 arch/arm64/boot/dts/qcom/pm8550b.dtsi         |   59 +
 arch/arm64/boot/dts/qcom/pm8550ve.dtsi        |   59 +
 arch/arm64/boot/dts/qcom/pm8550vs.dtsi        |  194 +
 arch/arm64/boot/dts/qcom/pmk8550.dtsi         |   55 +
 arch/arm64/boot/dts/qcom/pmr735d.dtsi         |  104 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts       |  404 ++
 arch/arm64/boot/dts/qcom/sm8550.dtsi          | 3519 +++++++++++++++++
 11 files changed, 4544 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8010.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550b.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550ve.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550vs.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8550.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735d.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550.dtsi

-- 
2.34.1

