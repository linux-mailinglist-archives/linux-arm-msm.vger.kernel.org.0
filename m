Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 725D83A4145
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 13:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhFKLhS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 07:37:18 -0400
Received: from m-r2.th.seeweb.it ([5.144.164.171]:38951 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhFKLhS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 07:37:18 -0400
Received: from localhost.localdomain (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 5905C3F30C;
        Fri, 11 Jun 2021 13:35:18 +0200 (CEST)
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
Subject: [PATCH 1/2] arm64: dts: qcom: sm8250: Disable Adreno and Venus by default
Date:   Fri, 11 Jun 2021 13:35:12 +0200
Message-Id: <20210611113514.27173-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Components that rely on proprietary (not to mention signed!) firmware should
not be enabled by default, as lack of the aforementioned firmware could cause
various issues, from random errors to straight-up failing to boot.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts  | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts  | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi     |  6 ++++++
 4 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 5f41de20aa22..a5b742325261 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -552,7 +552,13 @@ &dsi0_phy {
 	vdds-supply = <&vreg_l5a_0p88>;
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
 		firmware-name = "qcom/sm8250/a650_zap.mbn";
@@ -1352,6 +1358,10 @@ &vamacro {
 	qcom,dmic-sample-rate = <600000>;
 };
 
+&venus {
+	status = "okay";
+};
+
 /* PINCTRL - additions to nodes defined in sm8250.dtsi */
 &qup_spi0_cs_gpio {
 	drive-strength = <6>;
diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index c3a2c5aa6fe9..397359ee2f85 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -365,6 +365,14 @@ vreg_l7f_1p8: ldo7 {
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
 &qupv3_id_1 {
 	status = "okay";
 };
@@ -452,3 +460,7 @@ &usb_1_dwc3 {
 &usb_2_dwc3 {
 	dr_mode = "host";
 };
+
+&venus {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index cfc4d1febe0f..062b944be91d 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -465,7 +465,13 @@ &cdsp {
 	firmware-name = "qcom/sm8250/cdsp.mbn";
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
 		firmware-name = "qcom/sm8250/a650_zap.mbn";
@@ -691,3 +697,7 @@ &usb_2_qmpphy {
 	vdda-phy-supply = <&vreg_l9a_1p2>;
 	vdda-pll-supply = <&vreg_l18a_0p9>;
 };
+
+&venus {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4c0de12aaba6..fc1049c2bb11 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1746,6 +1746,8 @@ gpu: gpu@3d00000 {
 
 			qcom,gmu = <&gmu>;
 
+			status = "disabled";
+
 			zap-shader {
 				memory-region = <&gpu_mem>;
 			};
@@ -1819,6 +1821,8 @@ gmu: gmu@3d6a000 {
 
 			operating-points-v2 = <&gmu_opp_table>;
 
+			status = "disabled";
+
 			gmu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
@@ -2323,6 +2327,8 @@ venus: video-codec@aa00000 {
 				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
 			reset-names = "bus", "core";
 
+			status = "disabled";
+
 			video-decoder {
 				compatible = "venus-decoder";
 			};
-- 
2.32.0

