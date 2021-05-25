Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5912F390A36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 22:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233149AbhEYUFA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 16:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233105AbhEYUEv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 16:04:51 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D9FEC061756;
        Tue, 25 May 2021 13:03:21 -0700 (PDT)
Received: from localhost.localdomain (83.6.168.54.neoplus.adsl.tpnet.pl [83.6.168.54])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 43DDD203E1;
        Tue, 25 May 2021 22:03:19 +0200 (CEST)
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
Subject: [PATCH 5/7] arm64: dts: qcom: msm8996: Add DMA to QUPs and UARTs
Date:   Tue, 25 May 2021 22:02:43 +0200
Message-Id: <20210525200246.118323-5-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525200246.118323-1-konrad.dybcio@somainline.org>
References: <20210525200246.118323-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add BAM DMA nodes and add required properties to devices
to enable DMA operations.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 38 +++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 2327101c255d..cc12de5a9d6b 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2436,6 +2436,17 @@ sdhc2: sdhci@74a4900 {
 			status = "disabled";
 		 };
 
+		blsp1_dma: dma@7544000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x07544000 0x2b000>;
+			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "bam_clk";
+			qcom,controlled-remotely;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+		};
+
 		blsp1_uart2: serial@7570000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0x07570000 0x1000>;
@@ -2443,6 +2454,8 @@ blsp1_uart2: serial@7570000 {
 			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 2>, <&blsp1_dma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -2456,6 +2469,8 @@ blsp1_spi1: spi@7575000 {
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&blsp1_spi1_default>;
 			pinctrl-1 = <&blsp1_spi1_sleep>;
+			dmas = <&blsp1_dma 12>, <&blsp1_dma 13>;
+			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -2471,11 +2486,24 @@ blsp1_i2c3: i2c@7577000 {
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&blsp1_i2c3_default>;
 			pinctrl-1 = <&blsp1_i2c3_sleep>;
+			dmas = <&blsp1_dma 16>, <&blsp1_dma 17>;
+			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
 		};
 
+		blsp2_dma: dma@7584000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x07584000 0x2b000>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "bam_clk";
+			qcom,controlled-remotely;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+		};
+
 		blsp2_uart2: serial@75b0000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0x075b0000 0x1000>;
@@ -2506,6 +2534,8 @@ blsp2_i2c1: i2c@75b5000 {
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&blsp2_i2c1_default>;
 			pinctrl-1 = <&blsp2_i2c1_sleep>;
+			dmas = <&blsp2_dma 12>, <&blsp2_dma 13>;
+			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -2521,6 +2551,8 @@ blsp2_i2c2: i2c@75b6000 {
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&blsp2_i2c2_default>;
 			pinctrl-1 = <&blsp2_i2c2_sleep>;
+			dmas = <&blsp2_dma 14>, <&blsp2_dma 15>;
+			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -2535,6 +2567,8 @@ blsp2_i2c5: i2c@75b9000 {
 			clock-names = "iface", "core";
 			pinctrl-names = "default";
 			pinctrl-0 = <&blsp2_i2c5_default>;
+			dmas = <&blsp2_dma 20>, <&blsp2_dma 21>;
+			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -2550,6 +2584,8 @@ blsp2_i2c6: i2c@75ba000 {
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&blsp2_i2c6_default>;
 			pinctrl-1 = <&blsp2_i2c6_sleep>;
+			dmas = <&blsp2_dma 22>, <&blsp2_dma 23>;
+			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -2565,6 +2601,8 @@ blsp2_spi6: spi@75ba000{
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&blsp2_spi6_default>;
 			pinctrl-1 = <&blsp2_spi6_sleep>;
+			dmas = <&blsp2_dma 22>, <&blsp2_dma 23>;
+			dma-names = "tx", "rx";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
-- 
2.31.1

