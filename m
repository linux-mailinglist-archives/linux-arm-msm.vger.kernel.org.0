Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBBB2F01A8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 17:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbhAIQbn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 11:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbhAIQbn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 11:31:43 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E82C0617A9;
        Sat,  9 Jan 2021 08:30:40 -0800 (PST)
Received: from localhost.localdomain (abaf53.neoplus.adsl.tpnet.pl [83.6.169.53])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 2F9223EFD1;
        Sat,  9 Jan 2021 17:30:38 +0100 (CET)
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
Subject: [PATCH 5/5] arm64: dts: qcom: msm8998: Disable some components by default
Date:   Sat,  9 Jan 2021 17:29:59 +0100
Message-Id: <20210109163001.146867-6-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109163001.146867-1-konrad.dybcio@somainline.org>
References: <20210109163001.146867-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some components (like PCIe) are not used on all devices and
with a certain firmware configuration they might end up triggering
a force reboot or a Synchronous Abort.

This commit brings no functional difference as the nodes are
enabled on devices which didn't disable them previously.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi       | 10 ++++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi           |  6 +++++-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
index 00d84fb21798..b500f24d47bc 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
@@ -74,6 +74,14 @@ &CPU7 {
 	cpu-idle-states = <&BIG_CPU_SLEEP_1>;
 };
 
+&pcie0 {
+	status = "okay";
+};
+
+&pcie_phy {
+	status = "okay";
+};
+
 &pm8005_lsid1 {
 	pm8005-regulators {
 		compatible = "qcom,pm8005-regulators";
@@ -295,6 +303,14 @@ &sdhc2 {
 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
 };
 
+&ufshc {
+	status = "okay";
+};
+
+&ufsphy {
+	status = "okay";
+};
+
 &usb3 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index cec42437b302..c1ef0c71d5f5 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -106,6 +106,14 @@ &funnel5 {
 	// status = "okay";
 };
 
+&pcie0 {
+	status = "okay";
+};
+
+&pcie_phy {
+	status = "okay";
+};
+
 &pm8005_lsid1 {
 	pm8005-regulators {
 		compatible = "qcom,pm8005-regulators";
@@ -345,6 +353,7 @@ &stm {
 };
 
 &ufshc {
+	status = "okay";
 	vcc-supply = <&vreg_l20a_2p95>;
 	vccq-supply = <&vreg_l26a_1p2>;
 	vccq2-supply = <&vreg_s4a_1p8>;
@@ -354,6 +363,7 @@ &ufshc {
 };
 
 &ufsphy {
+	status = "okay";
 	vdda-phy-supply = <&vreg_l1a_0p875>;
 	vdda-pll-supply = <&vreg_l2a_1p2>;
 	vddp-ref-clk-supply = <&vreg_l26a_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index b2481043205a..65c87a8be5a2 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -945,6 +945,7 @@ pcie0: pci@1c00000 {
 			num-lanes = <1>;
 			phys = <&pciephy>;
 			phy-names = "pciephy";
+			status = "disabled";
 
 			ranges = <0x01000000 0x0 0x1b200000 0x1b200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x1b300000 0x1b300000 0x0 0xd00000>;
@@ -970,11 +971,12 @@ pcie0: pci@1c00000 {
 			perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 		};
 
-		phy@1c06000 {
+		pcie_phy: phy@1c06000 {
 			compatible = "qcom,msm8998-qmp-pcie-phy";
 			reg = <0x01c06000 0x18c>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			status = "disabled";
 			ranges;
 
 			clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
@@ -1007,6 +1009,7 @@ ufshc: ufshc@1da4000 {
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			power-domains = <&gcc UFS_GDSC>;
+			status = "disabled";
 			#reset-cells = <1>;
 
 			clock-names =
@@ -1046,6 +1049,7 @@ ufsphy: phy@1da7000 {
 			reg = <0x01da7000 0x18c>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			status = "disabled";
 			ranges;
 
 			clock-names =
-- 
2.29.2

