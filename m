Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 305A943E4CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 17:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbhJ1PSo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 11:18:44 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:14748 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231460AbhJ1PSf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 11:18:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635434168; x=1666970168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=rZ35PAmj2ZM0gYGTV0O5/B/yO4omBn7WGn9bgn37XKQ=;
  b=V50CdGLo159H+coR6sB93IiDOEKO2w5cTEZkucADz0R1Bapjz66rborl
   UZSzKqfg2b1rV9SlT5UMjPfgz2MdxQX4ajqqEtxmfGDoNwRXAk2gqWhPx
   owiq4R5MuaxZjSfedr1gZKAmeOV3cGOAhzfxgOGjUom3TgxuySh9XaobP
   c=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Oct 2021 08:16:08 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2021 08:16:07 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 08:16:07 -0700
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 08:16:03 -0700
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, <swboyd@chromium.org>,
        <collinsd@codeurora.org>, <subbaram@codeaurora.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Lee Jones" <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH V3 4/4] arm64: dts: qcom: sc7280: Add pm8008 regulators support for sc7280-idp
Date:   Thu, 28 Oct 2021 20:44:32 +0530
Message-ID: <1635434072-32055-5-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635434072-32055-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1635434072-32055-1-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add pm8008 regulators support for sc7280 idp.

Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
---
Changes in V2:
 - As per Stephen's comments, replaced '_' with '-' for node names.

Changes in V3:
 - Changed the regulator node names as l1, l2 etc
 - Changed "pm8008-regulators" to "regulators"
 - Changed "qcom,min-dropout-voltage" to "regulator-min-dropout-voltage-microvolt"

 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 103 +++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index d623d71..493575b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -309,6 +309,97 @@
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
+		regulators {
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
+			pm8008_l1: l1@4000 {
+				reg = <0x4000>;
+				regulator-name = "pm8008_l1";
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-min-dropout-voltage-microvolt = <96000>;
+			};
+
+			pm8008_l2: l2@4100 {
+				reg = <0x4100>;
+				regulator-name = "pm8008_l2";
+				regulator-min-microvolt = <950000>;
+				regulator-max-microvolt = <1250000>;
+				regulator-min-dropout-voltage-microvolt = <24000>;
+			};
+
+			pm8008_l3: l3@4200 {
+				reg = <0x4200>;
+				regulator-name = "pm8008_l3";
+				regulator-min-microvolt = <1650000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-min-dropout-voltage-microvolt = <224000>;
+			};
+
+			pm8008_l4: l4@4300 {
+				reg = <0x4300>;
+				regulator-name = "pm8008_l4";
+				regulator-min-microvolt = <1504000>;
+				regulator-max-microvolt = <1600000>;
+				regulator-min-dropout-voltage-microvolt = <0>;
+			};
+
+			pm8008_l5: l5@4400 {
+				reg = <0x4400>;
+				regulator-name = "pm8008_l5";
+				regulator-min-microvolt = <2600000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-min-dropout-voltage-microvolt = <104000>;
+			};
+
+			pm8008_l6: l6@4500 {
+				reg = <0x4500>;
+				regulator-name = "pm8008_l6";
+				regulator-min-microvolt = <2600000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-min-dropout-voltage-microvolt = <112000>;
+			};
+
+			pm8008_l7: l7@4600 {
+				reg = <0x4600>;
+				regulator-name = "pm8008_l7";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3544000>;
+				regulator-min-dropout-voltage-microvolt = <96000>;
+			};
+		};
+	};
+};
+
 &qfprom {
 	vcc-supply = <&vreg_l1c_1p8>;
 };
@@ -437,6 +528,18 @@
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
2.7.4

