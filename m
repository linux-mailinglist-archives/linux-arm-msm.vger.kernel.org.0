Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A07E3D9871
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 00:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232355AbhG1W0G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 18:26:06 -0400
Received: from relay01.th.seeweb.it ([5.144.164.162]:40967 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232392AbhG1W0D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 18:26:03 -0400
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 71A5B1FD04;
        Thu, 29 Jul 2021 00:25:59 +0200 (CEST)
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
Subject: [PATCH 09/39] arm64: dts: qcom: sdm630: Add SDHCI2 node
Date:   Thu, 29 Jul 2021 00:25:12 +0200
Message-Id: <20210728222542.54269-10-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728222542.54269-1-konrad.dybcio@somainline.org>
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

This will enable usage of (generally) uSD cards.
While at it, add accompanying OPP table for DVFS.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 50 ++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 6f251e602996..7aa7e3b12541 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1036,6 +1036,56 @@ qusb2phy: phy@c012000 {
 			status = "disabled";
 		};
 
+		sdhc_2: sdhci@c084000 {
+			compatible = "qcom,sdm630-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0c084000 0x1000>;
+			reg-names = "hc";
+
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			bus-width = <4>;
+			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
+					<&gcc GCC_SDCC2_AHB_CLK>,
+					<&xo_board>;
+			clock-names = "core", "iface", "xo";
+
+			interconnects = <&a2noc 3 &a2noc 10>,
+					<&gnoc 0 &cnoc 28>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&sdc2_state_on>;
+			pinctrl-1 = <&sdc2_state_off>;
+			power-domains = <&rpmpd SDM660_VDDCX>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: sdhc1-opp-table {
+				 compatible = "operating-points-v2";
+
+				 opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+					opp-peak-kBps = <200000 140000>;
+					opp-avg-kBps = <130718 133320>;
+				 };
+				 opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmpd_opp_svs>;
+					opp-peak-kBps = <250000 160000>;
+					opp-avg-kBps = <196078 150000>;
+				 };
+				 opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_nom>;
+					opp-peak-kBps = <4096000 4096000>;
+					opp-avg-kBps = <1338562 1338562>;
+				 };
+			};
+		};
+
 		sdhc_1: sdhci@c0c4000 {
 			compatible = "qcom,sdm630-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x0c0c4000 0x1000>,
-- 
2.32.0

