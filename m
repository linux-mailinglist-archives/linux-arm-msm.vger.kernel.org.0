Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C3AC3D98BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 00:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233840AbhG1W1U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 18:27:20 -0400
Received: from relay03.th.seeweb.it ([5.144.164.164]:54569 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232967AbhG1W0p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 18:26:45 -0400
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id EAB911FAEC;
        Thu, 29 Jul 2021 00:26:35 +0200 (CEST)
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
Subject: [PATCH 39/39] arm64: dts: qcom: sdm630: Add DMA to I2C hosts
Date:   Thu, 29 Jul 2021 00:25:42 +0200
Message-Id: <20210728222542.54269-40-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728222542.54269-1-konrad.dybcio@somainline.org>
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DMA properties to I2C hosts to allow for DMA transfers.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 004df7a6eb6c..312f16efd91d 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1802,6 +1802,8 @@ blsp_i2c1: i2c@c175000 {
 					<&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
 			clock-frequency = <400000>;
+			dmas = <&blsp1_dma 4>, <&blsp1_dma 5>;
+			dma-names = "tx", "rx";
 
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c1_default>;
@@ -1820,6 +1822,8 @@ blsp_i2c2: i2c@c176000 {
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
 			clock-frequency = <400000>;
+			dmas = <&blsp1_dma 6>, <&blsp1_dma 7>;
+			dma-names = "tx", "rx";
 
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c2_default>;
@@ -1838,6 +1842,8 @@ blsp_i2c3: i2c@c177000 {
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
 			clock-frequency = <400000>;
+			dmas = <&blsp1_dma 8>, <&blsp1_dma 9>;
+			dma-names = "tx", "rx";
 
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c3_default>;
@@ -1856,6 +1862,8 @@ blsp_i2c4: i2c@c178000 {
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
 			clock-frequency = <400000>;
+			dmas = <&blsp1_dma 10>, <&blsp1_dma 11>;
+			dma-names = "tx", "rx";
 
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c4_default>;
@@ -1902,6 +1910,8 @@ blsp_i2c5: i2c@c1b5000 {
 				 <&gcc GCC_BLSP2_AHB_CLK>;
 			clock-names = "core", "iface";
 			clock-frequency = <400000>;
+			dmas = <&blsp2_dma 4>, <&blsp2_dma 5>;
+			dma-names = "tx", "rx";
 
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c5_default>;
@@ -1920,6 +1930,8 @@ blsp_i2c6: i2c@c1b6000 {
 				 <&gcc GCC_BLSP2_AHB_CLK>;
 			clock-names = "core", "iface";
 			clock-frequency = <400000>;
+			dmas = <&blsp2_dma 6>, <&blsp2_dma 7>;
+			dma-names = "tx", "rx";
 
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c6_default>;
@@ -1938,6 +1950,8 @@ blsp_i2c7: i2c@c1b7000 {
 				 <&gcc GCC_BLSP2_AHB_CLK>;
 			clock-names = "core", "iface";
 			clock-frequency = <400000>;
+			dmas = <&blsp2_dma 8>, <&blsp2_dma 9>;
+			dma-names = "tx", "rx";
 
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c7_default>;
@@ -1956,6 +1970,8 @@ blsp_i2c8: i2c@c1b8000 {
 				 <&gcc GCC_BLSP2_AHB_CLK>;
 			clock-names = "core", "iface";
 			clock-frequency = <400000>;
+			dmas = <&blsp2_dma 10>, <&blsp2_dma 11>;
+			dma-names = "tx", "rx";
 
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c8_default>;
-- 
2.32.0

