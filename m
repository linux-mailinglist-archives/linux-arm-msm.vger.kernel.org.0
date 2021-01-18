Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 956DB2FA624
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 17:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406682AbhARQ01 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 11:26:27 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:35227 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406696AbhARQZ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 11:25:57 -0500
Received: from localhost.localdomain (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 30AD21FC91;
        Mon, 18 Jan 2021 17:25:13 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] arm64: dts: qcom: msm8994: Fix BLSP2_UART2 node
Date:   Mon, 18 Jan 2021 17:24:29 +0100
Message-Id: <20210118162432.107275-9-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118162432.107275-1-konrad.dybcio@somainline.org>
References: <20210118162432.107275-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix up the node to make the peripheral functional.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index f7e6423db8d4..3dfa74085f10 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -493,7 +493,7 @@ blsp_i2c6: i2c@f9928000 {
 		blsp2_uart2: serial@f995e000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0xf995e000 0x1000>;
-			interrupts = <GIC_SPI 146 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "core", "iface";
 			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>,
 					<&gcc GCC_BLSP2_AHB_CLK>;
@@ -588,16 +588,18 @@ blsp1_uart2_sleep: blsp1-uart2-sleep {
 
 			blsp2_uart2_default: blsp2-uart2-default {
 				function = "blsp_uart8";
-				pins = "gpio45", "gpio46";
-				drive-strength = <2>;
+				pins = "gpio45", "gpio46",
+						"gpio47", "gpio48";
+				drive-strength = <16>;
 				bias-disable;
 			};
 
 			blsp2_uart2_sleep: blsp2-uart2-sleep {
 				function = "gpio";
-				pins = "gpio45", "gpio46";
+				pins = "gpio45", "gpio46",
+						"gpio47", "gpio48";
 				drive-strength = <2>;
-				bias-pull-down;
+				bias-disable;
 			};
 
 			i2c1_default: i2c1-default {
-- 
2.29.2

