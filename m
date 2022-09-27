Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 983615ECCBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 21:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbiI0TSC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 15:18:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbiI0TR6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 15:17:58 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821A7D8E27;
        Tue, 27 Sep 2022 12:17:55 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3ED3584DE9;
        Tue, 27 Sep 2022 21:17:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1664306273;
        bh=0EoFtf9+/8HZluDgFyBjuSyICxLtLI5ngjn16gq8H6s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e0wLyztCv1ALipXjS0OEoLHaY49chxUjBA5QYzWfa/jfX0U7VPKoxV5rdVvVTFlXL
         FnPk8ihfWwjUvVG0OOJYvB17bhkv1M2OKKeDBadCNh0vXp5TxjXleV513C1pU7ppr2
         XhaKMhC+ZUJoKjGW5IBIQzaa+jK4Zp6ZboP4fkwkkCpsym0DwayYH/y3UFmy9U+0Lu
         VyHrYnlD28Z0fBvMoPAq5BvIOT5gcQgef82xjsI8KoCPLZf31l7AQVlSrq4aL1p6Tg
         +QUH9BeAli0aMsAyqUzNf0Ar0GlrB6BzVEEJ08Ixp+81IsR35uOi/l1R8zNc9KJ/z7
         UuqCxj8ZQNfIA==
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yann Gautier <yann.gautier@foss.st.com>,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/3] ARM: dts: qcom: Drop MMCI interrupt-names
Date:   Tue, 27 Sep 2022 21:17:35 +0200
Message-Id: <20220927191736.299702-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220927191736.299702-1-marex@denx.de>
References: <20220927191736.299702-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The pl18x MMCI driver does not use the interrupt-names property,
the binding document has been updated to recommend this property
be unused, remove it.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Yann Gautier <yann.gautier@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 3 ---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 2 --
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 2 --
 arch/arm/boot/dts/qcom-msm8660.dtsi | 5 -----
 arch/arm/boot/dts/qcom-msm8960.dtsi | 2 --
 5 files changed, 14 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 942aa2278355d..ee258afaf296b 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1129,7 +1129,6 @@ sdcc1: mmc@12400000 {
 				arm,primecell-periphid = <0x00051180>;
 				reg = <0x12400000 0x2000>;
 				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <8>;
@@ -1147,7 +1146,6 @@ sdcc3: mmc@12180000 {
 				status = "disabled";
 				reg = <0x12180000 0x2000>;
 				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <4>;
@@ -1165,7 +1163,6 @@ sdcc4: mmc@121c0000 {
 				status = "disabled";
 				reg = <0x121c0000 0x2000>;
 				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC4_CLK>, <&gcc SDC4_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <4>;
diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 90c08b51680aa..11b3104f01e1d 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -728,7 +728,6 @@ sdcc3: mmc@12180000 {
 				status = "disabled";
 				reg = <0x12180000 0x2000>;
 				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <8>;
@@ -748,7 +747,6 @@ sdcc1: mmc@12400000 {
 				arm,primecell-periphid = <0x00051180>;
 				reg = <0x12400000 0x2000>;
 				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <8>;
diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index b47c86412de2c..0acbe62784be6 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -362,7 +362,6 @@ sdcc1: mmc@12180000 {
 				arm,primecell-periphid = <0x00051180>;
 				reg = <0x12180000 0x2000>;
 				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <8>;
@@ -382,7 +381,6 @@ sdcc2: mmc@12140000 {
 				status = "disabled";
 				reg = <0x12140000 0x2000>;
 				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC2_CLK>, <&gcc SDC2_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <4>;
diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index ddce7d64ba991..5133333da94ea 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -549,7 +549,6 @@ sdcc1: mmc@12400000 {
 				arm,primecell-periphid = <0x00051180>;
 				reg = <0x12400000 0x8000>;
 				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <8>;
@@ -565,7 +564,6 @@ sdcc2: mmc@12140000 {
 				arm,primecell-periphid = <0x00051180>;
 				reg = <0x12140000 0x8000>;
 				interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC2_CLK>, <&gcc SDC2_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <8>;
@@ -580,7 +578,6 @@ sdcc3: mmc@12180000 {
 				status = "disabled";
 				reg = <0x12180000 0x8000>;
 				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <4>;
@@ -596,7 +593,6 @@ sdcc4: mmc@121c0000 {
 				status = "disabled";
 				reg = <0x121c0000 0x8000>;
 				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC4_CLK>, <&gcc SDC4_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <4>;
@@ -611,7 +607,6 @@ sdcc5: mmc@12200000 {
 				status = "disabled";
 				reg = <0x12200000 0x8000>;
 				interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC5_CLK>, <&gcc SDC5_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <4>;
diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index c5740da3754c7..9a7a4e38c23cd 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -308,7 +308,6 @@ sdcc1: mmc@12400000 {
 				arm,primecell-periphid = <0x00051180>;
 				reg = <0x12400000 0x8000>;
 				interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <8>;
@@ -325,7 +324,6 @@ sdcc3: mmc@12180000 {
 				status = "disabled";
 				reg = <0x12180000 0x8000>;
 				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-				interrupt-names = "cmd_irq";
 				clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
 				clock-names = "mclk", "apb_pclk";
 				bus-width = <4>;
-- 
2.35.1

