Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C30B44AF041
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 12:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbiBIL4O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 06:56:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiBILzX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 06:55:23 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC35E00F7E5;
        Wed,  9 Feb 2022 02:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644404000; x=1675940000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=oKWHI1/oLjFI5xhSYdvQVsYvHQorhqBTY2LP5gYKBKI=;
  b=ke7ZYToXpgYuPwWj6roeJa2uRdMExcXlHAmStWEYHz9zSlmg57Albzem
   d41EmPbhVnspzGFHmtOvr+5NQJqxV9c1ykj2l1s2/b2gSkW7sZs6Ei7sT
   SDQ2AtNB2emE+SBuiNXK0gwfudsPqeIEdnhcLOBnwmMScYGSbrFxQlSAO
   k=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Feb 2022 00:56:07 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 00:56:07 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 00:56:06 -0800
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 00:56:00 -0800
From:   Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dianders@chromium.org>,
        <krzysztof.kozlowski@canonical.com>, <thierry.reding@gmail.com>,
        <sam@ravnborg.org>, <airlied@linux.ie>, <daniel@ffwll.ch>
CC:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        <quic_kalyant@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <quic_khsieh@quicinc.com>, <quic_mkrishn@quicinc.com>,
        <quic_vproddut@quicinc.com>
Subject: [PATCH v3 2/4] arm64: dts: qcom: sc7280: Add support for eDP panel on CRD
Date:   Wed, 9 Feb 2022 14:25:30 +0530
Message-ID: <1644396932-17932-3-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the eDP display panel support without HPD on sc7280 platform.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---

Changes in v3:
  - Sort the nodes alphabetically
  - Use - instead of _ as node names
  - Place the backlight and panel nodes under root
  - Change the name of edp_out to mdss_edp_out
  - Change the names of regulator nodes
  - Delete unused properties in the board file


Changes in v2:
  - Sort node references alphabetically
  - Improve readability
  - Move the pwm pinctrl to pwm node
  - Move the regulators to root
  - Define backlight power
  - Remove dummy regulator node
  - Cleanup pinctrl definitions

 arch/arm64/boot/dts/qcom/sc7280-crd.dts | 122 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    |   2 +-
 2 files changed, 123 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
index e2efbdd..2a490a0 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-crd.dts
@@ -21,6 +21,59 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	backlight_3v3_regulator: backlight-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "backlight_3v3_regulator";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&edp_bl_power>;
+	};
+
+	edp_3v3_regulator: edp-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "edp_3v3_regulator";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 80 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&edp_panel_power>;
+	};
+
+	edp_backlight: edp-backlight {
+		compatible = "pwm-backlight";
+
+		power-supply = <&backlight_3v3_regulator>;
+		pwms = <&pm8350c_pwm 3 65535>;
+	};
+
+	edp_panel: edp-panel {
+		compatible = "sharp,lq140m1jw46";
+
+		power-supply = <&edp_3v3_regulator>;
+		backlight = <&edp_backlight>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				edp_panel_in: endpoint {
+					remote-endpoint = <&edp_out>;
+				};
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -76,6 +129,44 @@ ap_ts_pen_1v8: &i2c13 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp_hot_plug_det>;
+	data-lanes = <0 1>;
+	vdda-1p2-supply = <&vreg_l6b_1p2>;
+	vdda-0p9-supply = <&vreg_l1b_0p8>;
+};
+
+&mdss_edp {
+	status = "okay";
+
+	vdda-1p2-supply = <&vreg_l6b_1p2>;
+	vdda-0p9-supply = <&vreg_l10c_0p8>;
+	/delete-property/ pinctrl-names;
+	/delete-property/ pinctrl-0;
+};
+
+&mdss_edp_out {
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_edp_phy {
+	status = "okay";
+
+	vdda-1p2-supply = <&vreg_l6b_1p2>;
+	vdda-0p9-supply = <&vreg_l10c_0p8>;
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
 &nvme_3v3_regulator {
 	gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
 };
@@ -84,7 +175,38 @@ ap_ts_pen_1v8: &i2c13 {
 	pins = "gpio51";
 };
 
+&pm8350c_gpios {
+	edp_bl_power: edp-bl-power {
+		pins = "gpio7";
+		function = "normal";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		bias-disable;
+		output-low;
+	};
+
+	edp_bl_pwm: edp-bl-pwm {
+		pins = "gpio8";
+		function = "func1";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&pm8350c_pwm {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&edp_bl_pwm>;
+};
+
 &tlmm {
+	edp_panel_power: edp-panel-power {
+		pins = "gpio80";
+		function = "gpio";
+		bias-pull-down;
+	};
+
 	tp_int_odl: tp-int-odl {
 		pins = "gpio7";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3572399..eca403a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3066,7 +3066,7 @@
 
 					port@1 {
 						reg = <1>;
-						edp_out: endpoint { };
+						mdss_edp_out: endpoint { };
 					};
 				};
 
-- 
2.7.4

