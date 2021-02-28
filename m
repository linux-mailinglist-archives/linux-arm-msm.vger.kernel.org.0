Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E01232726B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Feb 2021 14:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhB1NKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Feb 2021 08:10:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbhB1NKh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Feb 2021 08:10:37 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67A7C0617A9;
        Sun, 28 Feb 2021 05:09:08 -0800 (PST)
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 95C0E1F583;
        Sun, 28 Feb 2021 14:09:06 +0100 (CET)
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
Subject: [PATCH 11/11] arm64: dts: qcom: msm8996: Clean up the SDHCI2 node
Date:   Sun, 28 Feb 2021 14:08:29 +0100
Message-Id: <20210228130831.203765-11-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210228130831.203765-1-konrad.dybcio@somainline.org>
References: <20210228130831.203765-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the indentation, add pinctrl and move status="disabled"
down.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 33 +++++++++++++++------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 75675fae0334..12afd49e0097 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2415,20 +2415,25 @@ sdhc1: sdhci@7464900 {
 		};
 
 		sdhc2: sdhci@74a4900 {
-			 status = "disabled";
-			 compatible = "qcom,sdhci-msm-v4";
-			 reg = <0x074a4900 0x314>, <0x074a4000 0x800>;
-			 reg-names = "hc_mem", "core_mem";
-
-			 interrupts = <0 125 IRQ_TYPE_LEVEL_HIGH>,
-				      <0 221 IRQ_TYPE_LEVEL_HIGH>;
-			 interrupt-names = "hc_irq", "pwr_irq";
-
-			 clock-names = "iface", "core", "xo";
-			 clocks = <&gcc GCC_SDCC2_AHB_CLK>,
-			 <&gcc GCC_SDCC2_APPS_CLK>,
-			 <&xo_board>;
-			 bus-width = <4>;
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0x074a4900 0x314>, <0x074a4000 0x800>;
+			reg-names = "hc_mem", "core_mem";
+
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				      <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clock-names = "iface", "core", "xo";
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				<&gcc GCC_SDCC2_APPS_CLK>,
+				<&xo_board>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&sdc2_state_on>;
+			pinctrl-1 = <&sdc2_state_off>;
+
+			bus-width = <4>;
+			status = "disabled";
 		 };
 
 		blsp1_uart2: serial@7570000 {
-- 
2.30.1

