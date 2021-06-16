Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D034A3A9A31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 14:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232865AbhFPM3Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 08:29:24 -0400
Received: from m-r1.th.seeweb.it ([5.144.164.170]:50497 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232501AbhFPM3W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 08:29:22 -0400
Received: from localhost.localdomain (83.6.168.10.neoplus.adsl.tpnet.pl [83.6.168.10])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 7B64E1FC51;
        Wed, 16 Jun 2021 14:27:14 +0200 (CEST)
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
Subject: [PATCH v2 3/6] arm64: dts: qcom: sm8250-edo: Enable PCIe
Date:   Wed, 16 Jun 2021 14:27:05 +0200
Message-Id: <20210616122708.144770-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210616122708.144770-1-konrad.dybcio@somainline.org>
References: <20210616122708.144770-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable PCIe0 (Wi-Fi) and 2 (SDX55m) interfaces and PHYs and assign relevant
pins and regulators.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes since v1:
- Bring the SDX55-specific pins over here

 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index 52ed4b082bd7..cb2ff95606b2 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -456,6 +456,30 @@ &i2c15 {
 	/* Richwave RTC6226 FM Radio Receiver @ 64 */
 };
 
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+};
+
+&pcie2 {
+	status = "okay";
+
+	pinctrl-0 = <&pcie2_default_state &mdm2ap_default &ap2mdm_default>;
+};
+
+&pcie2_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -515,6 +539,20 @@ data {
 		};
 	};
 
+	mdm2ap_default: mdm2ap-default {
+		pins = "gpio1", "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	ap2mdm_default: ap2mdm-default {
+		pins = "gpio56", "gpio57";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	sdc2_card_det_n: sd-card-det-n {
 		pins = "gpio77";
 		function = "gpio";
-- 
2.32.0

