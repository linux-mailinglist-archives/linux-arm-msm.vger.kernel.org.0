Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD9134FFEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 14:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235421AbhCaMHA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 08:07:00 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:51415 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235140AbhCaMGb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 08:06:31 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 31 Mar 2021 05:06:31 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 31 Mar 2021 05:06:29 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 31 Mar 2021 17:35:59 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id C35B64963; Wed, 31 Mar 2021 17:35:57 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V3 3/5] arm64: dts: qcom: sc7280: Add RPMh regulators for sc7280-idp
Date:   Wed, 31 Mar 2021 17:35:37 +0530
Message-Id: <1617192339-3760-4-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617192339-3760-1-git-send-email-skakit@codeaurora.org>
References: <1617192339-3760-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add regulator devices for SC7280 as RPMh regulators. This ensures
that consumers are able to modify the physical state of PMIC
regulators.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in V2:
 - Corrected the indentation for "compatible" and "qcom,pmic-id" under
   pm8350c-regulators as per Konrad's comment.

Changes in V3:
 - No change.

 arch/arm64/boot/dts/qcom/sc7280-idp.dts | 212 ++++++++++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 950ecb2..54d2cb3 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -22,6 +22,218 @@
 	};
 };
 
+&apps_rsc {
+	pm7325-regulators {
+		compatible = "qcom,pm7325-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vreg_s1b_1p8: smps1 {
+			regulator-min-microvolt = <1856000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vreg_s7b_0p9: smps7 {
+			regulator-min-microvolt = <535000>;
+			regulator-max-microvolt = <1120000>;
+		};
+
+		vreg_s8b_1p2: smps8 {
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1500000>;
+		};
+
+		vreg_l1b_0p8: ldo1 {
+			regulator-min-microvolt = <825000>;
+			regulator-max-microvolt = <925000>;
+		};
+
+		vreg_l2b_3p0: ldo2 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		vreg_l6b_1p2: ldo6 {
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+		};
+
+		vreg_l7b_2p9: ldo7 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		vreg_l8b_0p9: ldo8 {
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <970000>;
+		};
+
+		vreg_l9b_1p2: ldo9 {
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		vreg_l11b_1p7: ldo11 {
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		vreg_l12b_0p8: ldo12 {
+			regulator-min-microvolt = <751000>;
+			regulator-max-microvolt = <824000>;
+		};
+
+		vreg_l13b_0p8: ldo13 {
+			regulator-min-microvolt = <530000>;
+			regulator-max-microvolt = <824000>;
+		};
+
+		vreg_l14b_1p2: ldo14 {
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		vreg_l15b_0p8: ldo15 {
+			regulator-min-microvolt = <765000>;
+			regulator-max-microvolt = <1020000>;
+		};
+
+		vreg_l16b_1p2: ldo16 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		vreg_l17b_1p8: ldo17 {
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1900000>;
+		};
+
+		vreg_l18b_1p8: ldo18 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		vreg_l19b_1p8: ldo19 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+	};
+
+	pm8350c-regulators {
+		compatible = "qcom,pm8350c-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_s1c_2p2: smps1 {
+			regulator-min-microvolt = <2190000>;
+			regulator-max-microvolt = <2210000>;
+		};
+
+		vreg_s9c_1p0: smps9 {
+			regulator-min-microvolt = <1010000>;
+			regulator-max-microvolt = <1170000>;
+		};
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1980000>;
+		};
+
+		vreg_l2c_1p8: ldo2 {
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1980000>;
+		};
+
+		vreg_l3c_3p0: ldo3 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3540000>;
+		};
+
+		vreg_l4c_1p8: ldo4 {
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		vreg_l5c_1p8: ldo5 {
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		vreg_l6c_2p9: ldo6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		vreg_l7c_3p0: ldo7 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		vreg_l8c_1p8: ldo8 {
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		vreg_l9c_2p9: ldo9 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		vreg_l10c_0p8: ldo10 {
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		vreg_l11c_2p8: ldo11 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		vreg_l12c_1p8: ldo12 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		vreg_l13c_3p0: ldo13 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+		};
+	};
+
+	pmr735a-regulators {
+		compatible = "qcom,pmr735a-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vreg_l2e_1p2: ldo2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		vreg_l3e_0p9: ldo3 {
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <1020000>;
+		};
+
+		vreg_l4e_1p7: ldo4 {
+			regulator-min-microvolt = <1776000>;
+			regulator-max-microvolt = <1890000>;
+		};
+
+		vreg_l5e_0p8: ldo5 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+		};
+
+		vreg_l6e_0p8: ldo6 {
+			regulator-min-microvolt = <480000>;
+			regulator-max-microvolt = <904000>;
+		};
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

