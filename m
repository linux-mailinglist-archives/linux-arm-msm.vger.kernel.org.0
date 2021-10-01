Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3EF341E662
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 06:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238172AbhJAED2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 00:03:28 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:21977 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237038AbhJAED0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 00:03:26 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 30 Sep 2021 21:01:41 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 Sep 2021 21:01:39 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 01 Oct 2021 09:31:17 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 4BDE3551D; Fri,  1 Oct 2021 09:31:16 +0530 (IST)
From:   Satya Priya <skakit@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, collinsd@codeurora.org,
        subbaram@codeaurora.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V2 4/4] arm64: dts: qcom: sc7280: Add pm8008 regulators support for sc7280-idp
Date:   Fri,  1 Oct 2021 09:30:59 +0530
Message-Id: <1633060859-22969-5-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633060859-22969-1-git-send-email-skakit@codeaurora.org>
References: <1633060859-22969-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: satya priya <skakit@codeaurora.org>

Add pm8008 regulators support for sc7280 idp.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in V2:
 - As per Stephen's comments, replaced '_' with '-' for node names.

 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 103 +++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 272d5ca..b953261 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -280,6 +280,97 @@
 	};
 };
 
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	pm8008_chip: pm8008@8 {
+		compatible = "qcom,pm8008";
+		reg = <0x8>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pm8008_active>;
+	};
+
+	pm8008_ldo: pm8008@9 {
+		compatible = "qcom,pm8008";
+		reg = <0x9>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8008-regulators {
+			compatible = "qcom,pm8008-regulator";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			vdd_l1_l2-supply = <&vreg_s8b_1p2>;
+			vdd_l3_l4-supply = <&vreg_s1b_1p8>;
+			vdd_l5-supply = <&vreg_bob>;
+			vdd_l6-supply = <&vreg_bob>;
+			vdd_l7-supply = <&vreg_bob>;
+
+			pm8008_l1: regulator@4000 {
+				reg = <0x4000>;
+				regulator-name = "pm8008_l1";
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <1300000>;
+				qcom,min-dropout-voltage = <96000>;
+			};
+
+			pm8008_l2: regulator@4100 {
+				reg = <0x4100>;
+				regulator-name = "pm8008_l2";
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <1250000>;
+				qcom,min-dropout-voltage = <24000>;
+			};
+
+			pm8008_l3: regulator@4200 {
+				reg = <0x4200>;
+				regulator-name = "pm8008_l3";
+				regulator-min-microvolt = <1650000>;
+				regulator-max-microvolt = <3000000>;
+				qcom,min-dropout-voltage = <224000>;
+			};
+
+			pm8008_l4: regulator@4300 {
+				reg = <0x4300>;
+				regulator-name = "pm8008_l4";
+				regulator-min-microvolt = <1504000>;
+				regulator-max-microvolt = <1600000>;
+				qcom,min-dropout-voltage = <0>;
+			};
+
+			pm8008_l5: regulator@4400 {
+				reg = <0x4400>;
+				regulator-name = "pm8008_l5";
+				regulator-min-microvolt = <2600000>;
+				regulator-max-microvolt = <3000000>;
+				qcom,min-dropout-voltage = <104000>;
+			};
+
+			pm8008_l6: regulator@4500 {
+				reg = <0x4500>;
+				regulator-name = "pm8008_l6";
+				regulator-min-microvolt = <2600000>;
+				regulator-max-microvolt = <3000000>;
+				qcom,min-dropout-voltage = <112000>;
+			};
+
+			pm8008_l7: regulator@4600 {
+				reg = <0x4600>;
+				regulator-name = "pm8008_l7";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3544000>;
+				qcom,min-dropout-voltage = <96000>;
+			};
+		};
+	};
+};
+
 &qfprom {
 	vcc-supply = <&vreg_l1c_1p8>;
 };
@@ -408,6 +499,18 @@
 	};
 };
 
+&pm8350c_gpios {
+	pm8008-reset {
+		pm8008_active: pm8008-active {
+			pins = "gpio4";
+			function = "normal";
+			bias-disable;
+			output-high;
+			power-source = <0>;
+		};
+	};
+};
+
 &qspi_cs0 {
 	bias-disable;
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

