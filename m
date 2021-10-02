Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1E4241F884
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Oct 2021 02:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbhJBAPx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 20:15:53 -0400
Received: from relay07.th.seeweb.it ([5.144.164.168]:43665 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232269AbhJBAPx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 20:15:53 -0400
Received: from localhost.localdomain (83.6.167.124.neoplus.adsl.tpnet.pl [83.6.167.124])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 2C3863F365;
        Sat,  2 Oct 2021 02:14:05 +0200 (CEST)
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
Subject: [PATCH 2/5] arm64: dts: qcom: sdm845: Disable Adreno, modem and Venus by default
Date:   Sat,  2 Oct 2021 02:13:55 +0200
Message-Id: <20211002001358.45920-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211002001358.45920-1-konrad.dybcio@somainline.org>
References: <20211002001358.45920-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Components that rely on proprietary (not to mention signed!) firmware should
not be enabled by default, as lack of the aforementioned firmware could cause
various issues, from random errors to straight-up failing to boot.

Re-enable these remote processors on boards that didn't previously explicitly
disable them.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi           | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts              | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi  | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi                 |  8 ++++++++
 5 files changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index dfd1b42c07fd..1f8a26f36f2e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -616,6 +616,14 @@ touchscreen@10 {
 	};
 };
 
+&gmu {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
 &ipa {
 	status = "okay";
 	modem-init;
@@ -643,6 +651,8 @@ &adreno_smmu {
 };
 
 &mss_pil {
+	status = "okay";
+
 	iommus = <&apps_smmu 0x781 0x0>,
 		 <&apps_smmu 0x724 0x3>;
 };
@@ -1317,6 +1327,8 @@ config {
 };
 
 &venus {
+	status = "okay";
+
 	video-firmware {
 		iommus = <&apps_smmu 0x10b2 0x0>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 52dd7a858231..bccc90a469ab 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -439,7 +439,13 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
+&gmu {
+	status = "okay";
+};
+
 &gpu {
+	status = "okay";
+
 	zap-shader {
 		memory-region = <&gpu_mem>;
 		firmware-name = "qcom/sdm845/a630_zap.mbn";
@@ -566,6 +572,10 @@ &usb_2_qmpphy {
 	vdda-pll-supply = <&vdda_usb2_ss_core>;
 };
 
+&venus {
+	status = "okay";
+};
+
 &wifi {
 	status = "okay";
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index d4355522374a..2f8942542788 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -362,7 +362,13 @@ &gcc {
 				<GCC_LPASS_SWAY_CLK>;
 };
 
+&gmu {
+	status = "okay";
+};
+
 &gpu {
+	status = "okay";
+
 	zap-shader {
 		memory-region = <&gpu_mem>;
 		firmware-name = "qcom/sdm845/oneplus6/a630_zap.mbn";
@@ -641,6 +647,10 @@ mux {
 	};
 };
 
+&venus {
+	status = "okay";
+};
+
 &wifi {
 	status = "okay";
 	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index c60c8c640e17..51cfe6f31bec 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -256,7 +256,13 @@ &gcc {
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
+&gmu {
+	status = "okay";
+};
+
 &gpu {
+	status = "okay";
+
 	zap-shader {
 		memory-region = <&gpu_mem>;
 		firmware-name = "qcom/sdm845/a630_zap.mbn";
@@ -513,6 +519,10 @@ &usb_1_qmpphy {
 	vdda-pll-supply = <&vreg_l1a_0p875>;
 };
 
+&venus {
+	status = "okay";
+};
+
 &wcd9340{
 	pinctrl-0 = <&wcd_intr_default>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index edfff955ca02..970e92188503 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3004,6 +3004,8 @@ mss_pil: remoteproc@4080000 {
 					<&rpmhpd SDM845_MSS>;
 			power-domain-names = "cx", "mx", "mss";
 
+			status = "disabled";
+
 			mba {
 				memory-region = <&mba_region>;
 			};
@@ -3898,6 +3900,8 @@ venus: video-codec@aa00000 {
 					<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
 			interconnect-names = "video-mem", "cpu-cfg";
 
+			status = "disabled";
+
 			video-core0 {
 				compatible = "venus-decoder";
 			};
@@ -4432,6 +4436,8 @@ gpu: gpu@5000000 {
 			interconnects = <&mem_noc MASTER_GFX3D 0 &mem_noc SLAVE_EBI1 0>;
 			interconnect-names = "gfx-mem";
 
+			status = "disabled";
+
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
@@ -4527,6 +4533,8 @@ gmu: gmu@506a000 {
 
 			operating-points-v2 = <&gmu_opp_table>;
 
+			status = "disabled";
+
 			gmu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-- 
2.33.0

