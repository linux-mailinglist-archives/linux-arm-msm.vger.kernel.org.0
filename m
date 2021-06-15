Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADAB93A82D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 16:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbhFOO31 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 10:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbhFOO3F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 10:29:05 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E695FC034622
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 07:22:57 -0700 (PDT)
Received: from localhost.localdomain (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 860A71FA69;
        Tue, 15 Jun 2021 16:22:53 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8250: Add DMA to I2C/SPI
Date:   Tue, 15 Jun 2021 16:22:49 +0200
Message-Id: <20210615142249.170512-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add dma properties to I2C and SPI nodes to make sure DMA transfers can go
through. While at it, fix up the property order in SPI nodes to make #address-
and #size-cells go after all the meaningful properties.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Depends on this GPI DMA series:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=500245

 arch/arm64/boot/dts/qcom/sm8250.dtsi | 200 +++++++++++++++++++++------
 1 file changed, 160 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 806973d6ba55..1e8ad0017f58 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -561,6 +561,9 @@ i2c14: i2c@880000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c14_default>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -572,10 +575,13 @@ spi14: spi@880000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -587,6 +593,9 @@ i2c15: i2c@884000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c15_default>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -598,10 +607,13 @@ spi15: spi@884000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
 				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -613,6 +625,9 @@ i2c16: i2c@888000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c16_default>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -624,10 +639,13 @@ spi16: spi@888000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
 				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -639,6 +657,9 @@ i2c17: i2c@88c000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c17_default>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -650,10 +671,13 @@ spi17: spi@88c000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
 				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -678,6 +702,9 @@ i2c18: i2c@890000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c18_default>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -689,10 +716,13 @@ spi18: spi@890000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
 				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -717,6 +747,9 @@ i2c19: i2c@894000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c19_default>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -728,10 +761,13 @@ spi19: spi@894000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
 				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 		};
@@ -779,6 +815,9 @@ i2c0: i2c@980000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c0_default>;
 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -790,10 +829,13 @@ spi0: spi@980000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
 				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -805,6 +847,9 @@ i2c1: i2c@984000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c1_default>;
 				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -816,10 +861,13 @@ spi1: spi@984000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
 				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -831,6 +879,9 @@ i2c2: i2c@988000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c2_default>;
 				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -842,10 +893,13 @@ spi2: spi@988000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
 				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -870,6 +924,9 @@ i2c3: i2c@98c000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c3_default>;
 				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -881,10 +938,13 @@ spi3: spi@98c000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
 				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -896,6 +956,9 @@ i2c4: i2c@990000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c4_default>;
 				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -907,10 +970,13 @@ spi4: spi@990000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
 				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -922,6 +988,9 @@ i2c5: i2c@994000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c5_default>;
 				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -933,10 +1002,13 @@ spi5: spi@994000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
 				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -948,6 +1020,9 @@ i2c6: i2c@998000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c6_default>;
 				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -959,10 +1034,13 @@ spi6: spi@998000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
 				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -987,6 +1065,9 @@ i2c7: i2c@99c000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c7_default>;
 				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -998,10 +1079,13 @@ spi7: spi@99c000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
 				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma0 0 7 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 7 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 		};
@@ -1046,6 +1130,9 @@ i2c8: i2c@a80000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c8_default>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1057,10 +1144,13 @@ spi8: spi@a80000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
 				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -1072,6 +1162,9 @@ i2c9: i2c@a84000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c9_default>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1083,10 +1176,13 @@ spi9: spi@a84000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -1098,6 +1194,9 @@ i2c10: i2c@a88000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c10_default>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1109,10 +1208,13 @@ spi10: spi@a88000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
 				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -1124,6 +1226,9 @@ i2c11: i2c@a8c000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c11_default>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1135,10 +1240,13 @@ spi11: spi@a8c000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
 				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -1150,6 +1258,9 @@ i2c12: i2c@a90000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c12_default>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1161,10 +1272,13 @@ spi12: spi@a90000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
 				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 
@@ -1189,6 +1303,9 @@ i2c13: i2c@a94000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_i2c13_default>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1200,10 +1317,13 @@ spi13: spi@a94000 {
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SM8250_CX>;
 				operating-points-v2 = <&qup_opp_table>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				status = "disabled";
 			};
 		};
-- 
2.32.0

