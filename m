Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3552F0186
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 17:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbhAIQbK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 11:31:10 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:41115 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbhAIQbK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 11:31:10 -0500
Received: from localhost.localdomain (abaf53.neoplus.adsl.tpnet.pl [83.6.169.53])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 0053F3EFCD;
        Sat,  9 Jan 2021 17:30:26 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: qcom: msm8998: Add DMA to I2C hosts
Date:   Sat,  9 Jan 2021 17:29:56 +0100
Message-Id: <20210109163001.146867-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109163001.146867-1-konrad.dybcio@somainline.org>
References: <20210109163001.146867-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DMA properties to I2C hosts to allow for DMA transfers.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 37 +++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 699bd67efcd0..eadac13ff975 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1893,6 +1893,8 @@ blsp1_i2c1: i2c@c175000 {
 			clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 6>, <&blsp1_dma 7>;
+			dma-names = "tx", "rx";
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -1908,6 +1910,8 @@ blsp1_i2c2: i2c@c176000 {
 			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 8>, <&blsp1_dma 9>;
+			dma-names = "tx", "rx";
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -1923,6 +1927,8 @@ blsp1_i2c3: i2c@c177000 {
 			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 10>, <&blsp1_dma 11>;
+			dma-names = "tx", "rx";
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -1938,6 +1944,8 @@ blsp1_i2c4: i2c@c178000 {
 			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 12>, <&blsp1_dma 13>;
+			dma-names = "tx", "rx";
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -1953,6 +1961,8 @@ blsp1_i2c5: i2c@c179000 {
 			clocks = <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 14>, <&blsp1_dma 15>;
+			dma-names = "tx", "rx";
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -1968,6 +1978,8 @@ blsp1_i2c6: i2c@c17a000 {
 			clocks = <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp1_dma 16>, <&blsp1_dma 17>;
+			dma-names = "tx", "rx";
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -1975,6 +1987,19 @@ blsp1_i2c6: i2c@c17a000 {
 			#size-cells = <0>;
 		};
 
+		blsp2_dma: dma@c184000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x0c184000 0x25000>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <18>;
+			qcom,num-ees = <4>;
+		};
+
 		blsp2_uart1: serial@c1b0000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0x0c1b0000 0x1000>;
@@ -1993,6 +2018,8 @@ blsp2_i2c0: i2c@c1b5000 {
 			clocks = <&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP2_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp2_dma 6>, <&blsp2_dma 7>;
+			dma-names = "tx", "rx";
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -2008,6 +2035,8 @@ blsp2_i2c1: i2c@c1b6000 {
 			clocks = <&gcc GCC_BLSP2_QUP2_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP2_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp2_dma 8>, <&blsp2_dma 9>;
+			dma-names = "tx", "rx";
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -2023,6 +2052,8 @@ blsp2_i2c2: i2c@c1b7000 {
 			clocks = <&gcc GCC_BLSP2_QUP3_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP2_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp2_dma 10>, <&blsp2_dma 11>;
+			dma-names = "tx", "rx";
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -2038,6 +2069,8 @@ blsp2_i2c3: i2c@c1b8000 {
 			clocks = <&gcc GCC_BLSP2_QUP4_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP2_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp2_dma 12>, <&blsp2_dma 13>;
+			dma-names = "tx", "rx";
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -2053,6 +2086,8 @@ blsp2_i2c4: i2c@c1b9000 {
 			clocks = <&gcc GCC_BLSP2_QUP5_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP2_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp2_dma 14>, <&blsp2_dma 15>;
+			dma-names = "tx", "rx";
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -2068,6 +2103,8 @@ blsp2_i2c5: i2c@c1ba000 {
 			clocks = <&gcc GCC_BLSP2_QUP6_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP2_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp2_dma 16>, <&blsp2_dma 17>;
+			dma-names = "tx", "rx";
 			clock-frequency = <400000>;
 
 			status = "disabled";
-- 
2.29.2

