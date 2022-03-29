Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07AEA4EAC4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Mar 2022 13:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235831AbiC2Laz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Mar 2022 07:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235820AbiC2Lay (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Mar 2022 07:30:54 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C140216A56
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 04:29:11 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id o10so34505923ejd.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Mar 2022 04:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rQA1SC+5wILa0uCwjAsPana/VKgoWviK4j2duLrJTD8=;
        b=aRPwUFjxKcPmCftYTQzKknXkn5//5zkLm7acqt2bImPGYuunFKBT6eGoCBb0jr+55y
         bMRmYs5HN/WJWPnxh7KCFrbdPjE0aI57f3heizzNsSX1mfkW/gwmTfyGhy/HdT+wRbuk
         G3Z2wk7lcCsZieKfymzxCK2lUaQmJAspFRy0paolGnVykzOXbDJKHcryYd71v2mDt/VP
         U8BmSVH3RwbXdo/iT95LwuzGENsi2DjaNmOOp/ZZxaOAeqqU8NcYeznzK3nLg2+NF/aI
         5BcXftXlDs/BLfp1cgWEVuMQxnnlxgInTyKZtFA249i3isAn8Id6IMGLksrLrs67UcmA
         LMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rQA1SC+5wILa0uCwjAsPana/VKgoWviK4j2duLrJTD8=;
        b=oH1sim8F5Je8NcSpnC1n1NWrudSHYtBD342zlVqgxybAPrv6xGDKZV+U86l/GAAZjL
         5UswHYhRMG0kq9Upk1Qlpu+eUCkjcBmWtSjI3K9AO1Y+R2qjLD2JBsI+x6wZP3KZ6yTl
         pjvE4gRU90IQFqF9Lw5Q6awGrvz64JOPBlDLOjStvLc/2QZkv4ESjMia9MHAhLrLYqSo
         L3EpgoBEA6mP5pKmRQVzZeexDPXZfp3hub4/fqCQW6iEnTYaNZxM/ESZV8UxlIePuMRs
         HRxXfAJLFlFLgP961T2PMKQDZ4lF6yzZXKtC/U2SaTYcnoKXRje4MHqR3VhCL94LBza2
         joAA==
X-Gm-Message-State: AOAM533fkp0jxbNsrtdWh2Ytd2cpZyD1Oq0gyz/ZtUpFpRZFDJBKwZ5B
        xYhMBPeo0II38jAvDwX206ym1w==
X-Google-Smtp-Source: ABdhPJyTTaoqZBirTOrQoJlhXA2RyEcSrw+SLabM3SfXqaNhH0wXTGU7twum7XZG6TeyFXFtjKms5Q==
X-Received: by 2002:a17:907:2d06:b0:6e0:2ec:c7bd with SMTP id gs6-20020a1709072d0600b006e002ecc7bdmr35407711ejc.656.1648553350116;
        Tue, 29 Mar 2022 04:29:10 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id t19-20020a056402525300b0041952a1a764sm8510909edd.33.2022.03.29.04.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 04:29:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: qcom: qcs404: align clocks in SPI with DT schema
Date:   Tue, 29 Mar 2022 13:29:01 +0200
Message-Id: <20220329112902.252937-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220329112902.252937-1-krzysztof.kozlowski@linaro.org>
References: <20220329112902.252937-1-krzysztof.kozlowski@linaro.org>
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

The DT schema expects clocks core-iface order.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 36 ++++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 3f06f7cd3cf2..4af5065e830b 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -928,9 +928,9 @@ blsp1_spi0: spi@78b5000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b5000 0x600>;
 			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP0_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP0_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_spi0_default>;
 			#address-cells = <1>;
@@ -956,9 +956,9 @@ blsp1_spi1: spi@78b6000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b6000 0x600>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP1_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_spi1_default>;
 			#address-cells = <1>;
@@ -984,9 +984,9 @@ blsp1_spi2: spi@78b7000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b7000 0x600>;
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP2_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_spi2_default>;
 			#address-cells = <1>;
@@ -1012,9 +1012,9 @@ blsp1_spi3: spi@78b8000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b8000 0x600>;
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_spi3_default>;
 			#address-cells = <1>;
@@ -1040,9 +1040,9 @@ blsp1_spi4: spi@78b9000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x078b9000 0x600>;
 			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP4_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP1_QUP4_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp1_spi4_default>;
 			#address-cells = <1>;
@@ -1092,9 +1092,9 @@ blsp2_spi0: spi@7af5000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x07af5000 0x600>;
 			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc GCC_BLSP2_AHB_CLK>,
-				 <&gcc GCC_BLSP2_QUP0_SPI_APPS_CLK>;
-			clock-names = "iface", "core";
+			clocks = <&gcc GCC_BLSP2_QUP0_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp2_spi0_default>;
 			#address-cells = <1>;
-- 
2.32.0

