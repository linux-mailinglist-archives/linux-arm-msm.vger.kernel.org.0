Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2DC456CA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 10:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbhKSJqe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 04:46:34 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:50364 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234671AbhKSJqe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 04:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637315012; x=1668851012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=gjNQXd45TcMbMNCM6PFG/zGDQLeKq6DMiiQVQ+Ek21c=;
  b=vXsgZo3eJ9pB1FyxzJ9l19k11iYvqu1OSLl+1GDxdrURNTd9nIOXtC3A
   SuHEfJA+Wj/aHtl+7Uz//4wXkK95OPpx46iDmzNO3F7F374irA3IM838o
   8qsMjP0wBPFOqFyGTTjw/pX/8l1q+9YZW75NJZVqd1jE3yKJj5tfHp07+
   o=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Nov 2021 01:43:32 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 01:43:32 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 01:43:31 -0800
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 19 Nov 2021 01:43:27 -0800
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, <swboyd@chromium.org>,
        <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>,
        "Lee Jones" <lee.jones@linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH V4 6/6] arm64: dts: qcom: sc7280: Add pm8008 regulators support for sc7280-idp
Date:   Fri, 19 Nov 2021 15:12:33 +0530
Message-ID: <1637314953-4215-7-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637314953-4215-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1637314953-4215-1-git-send-email-quic_c_skakit@quicinc.com>
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

Changes in V4:
 - Moved all common stuff to pm8008.dtsi and added board specific configurations here.

 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 73 ++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index d623d71..f86368d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -309,6 +309,69 @@
 	};
 };
 
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	#include "pm8008.dtsi"
+};
+
+&pm8008_chip {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pm8008_active>;
+};
+
+&pm8008_regulators {
+	vdd_l1_l2-supply = <&vreg_s8b_1p2>;
+	vdd_l3_l4-supply = <&vreg_s1b_1p8>;
+	vdd_l5-supply = <&vreg_bob>;
+	vdd_l6-supply = <&vreg_bob>;
+	vdd_l7-supply = <&vreg_bob>;
+};
+
+&pm8008_l1 {
+	regulator-min-microvolt = <950000>;
+	regulator-max-microvolt = <1300000>;
+	regulator-min-dropout-voltage-microvolt = <96000>;
+};
+
+&pm8008_l2 {
+	regulator-min-microvolt = <950000>;
+	regulator-max-microvolt = <1250000>;
+	regulator-min-dropout-voltage-microvolt = <24000>;
+};
+
+&pm8008_l3 {
+	regulator-min-microvolt = <1650000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-min-dropout-voltage-microvolt = <224000>;
+};
+
+&pm8008_l4 {
+	regulator-min-microvolt = <1504000>;
+	regulator-max-microvolt = <1600000>;
+	regulator-min-dropout-voltage-microvolt = <0>;
+};
+
+&pm8008_l5 {
+	regulator-min-microvolt = <2600000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-min-dropout-voltage-microvolt = <104000>;
+};
+
+&pm8008_l6 {
+	regulator-min-microvolt = <2600000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-min-dropout-voltage-microvolt = <112000>;
+};
+
+&pm8008_l7 {
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3544000>;
+	regulator-min-dropout-voltage-microvolt = <96000>;
+};
+
 &qfprom {
 	vcc-supply = <&vreg_l1c_1p8>;
 };
@@ -437,6 +500,16 @@
 	};
 };
 
+&pm8350c_gpios {
+	pm8008_active: pm8008_active {
+		pins = "gpio4";
+		function = "normal";
+		bias-disable;
+		output-high;
+		power-source = <0>;
+	};
+};
+
 &qspi_cs0 {
 	bias-disable;
 };
-- 
2.7.4

