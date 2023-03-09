Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 067766B1FAC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 10:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjCIJQL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 04:16:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbjCIJP7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 04:15:59 -0500
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997C78C83D;
        Thu,  9 Mar 2023 01:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:Message-Id
        :Date:Subject:Cc:To:From:References:In-Reply-To:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description;
        bh=/Iruk07udClqOidKd3XLs37bnerqa53fIBHH8Cf4z+g=; b=dkM1Xf0o5eKJJaLbRbWqo1KatB
        KXSPh431NzObsm1Oop/VaEt2rNeMk6CaGfUSS5Bo0TlnRhVpz2Dx/fl0C94th5T9iNkI5zPlrX4Zf
        CFCo4JDRRafFQHV9XTZ5zWBW/AYAzh3IEe4fm2jISmt92auIOJ+TXUpHbVIBiAncyxY9c2ngz3npC
        sSPezLzTrjqFEzJg5UI72N1Rr9uY0ZXv9GhEDmAgB1f0ODKrpFHgvWzybBv07LbC/yKweidlgINtY
        b1fagPsnBYMNZ4d+7SKVJM9QzKwq+wKkI2hDvvjlZSQbzS0kbeKgKoBMowiKmxbUWFfCEb2cmY0fB
        HSMUA/JA==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1paCMw-00FObN-8o; Thu, 09 Mar 2023 10:15:26 +0100
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH] arm64: dts: qcom: msm8916: Move WCN compatible to boards
Date:   Thu,  9 Mar 2023 10:14:52 +0100
Message-Id: <20230309091452.1011776-1-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On MSM8916 the wireless connectivity functionality (WiFi/Bluetooth) is
split into the digital part inside the SoC and the analog RF part inside
a supplementary WCN36xx chip. For MSM8916, three different options
exist:

  - WCN3620  (WLAN 802.11 b/g/n 2.4 GHz + Bluetooth)
  - WCN3660B (WLAN 802.11 a/b/g/n 2.4/5 GHz + Bluetooth)
  - WCN3680B (WLAN 802.11ac 2.4/5 GHz + Bluetooth)

Choosing one of these is up to the board vendor. This means that the
compatible belongs into the board-specific DT part so people porting
new boards pay attention to set the correct compatible.

Right now msm8916.dtsi sets "qcom,wcn3620" as default compatible,
which does not work at all for boards that have WCN3660B or WCN3680B.

Remove the default compatible from msm8196.dtsi and move it to the board
DT as follows:

  - Boards with only &pronto { status = "okay"; } used the default
    "qcom,wcn3620" so far. They now set this explicitly for &wcnss_iris.
  - Boards with &pronto { ... iris { compatible = "qcom,wcn3660b"; }};
    already had an override that just moves to &wcnss_iris now.
  - For msm8916-samsung-a2015-common.dtsi the WCN compatible differs for
    boards making use of it (a3u: wcn3620, a5u: wcn3660b, e2015: wcn3620)
    so the definitions move to the board-specific DT part.

Since this requires touching all the board DTs, use this as a chance to
name the WCNSS-related labels consistently, so everything is grouped
properly when sorted alphabetically.

No functional change, just clean-up for more clarity & easier porting.
Aside from ordering the generated DTBs are identical.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts      | 15 ++++++++-----
 .../boot/dts/qcom/msm8916-acer-a1-724.dts     | 12 ++++++----
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts | 12 ++++++----
 .../arm64/boot/dts/qcom/msm8916-asus-z00l.dts | 12 ++++++----
 .../boot/dts/qcom/msm8916-gplus-fl8005a.dts   | 12 ++++++----
 .../arm64/boot/dts/qcom/msm8916-huawei-g7.dts | 12 ++++++----
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 12 ++++++----
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts | 12 ++++++----
 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi  | 22 +++++++++----------
 .../qcom/msm8916-samsung-a2015-common.dtsi    |  4 ----
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts |  8 +++++++
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts | 14 +++++++-----
 .../qcom/msm8916-samsung-e2015-common.dtsi    |  8 +++++++
 .../dts/qcom/msm8916-samsung-gt5-common.dtsi  | 16 +++++++-------
 .../dts/qcom/msm8916-samsung-j5-common.dtsi   | 12 ++++++----
 .../dts/qcom/msm8916-samsung-serranove.dts    | 16 +++++++-------
 arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi     | 12 ++++++----
 .../dts/qcom/msm8916-wingtech-wt88047.dts     | 12 ++++++----
 arch/arm64/boot/dts/qcom/msm8916.dtsi         | 13 +++++------
 19 files changed, 146 insertions(+), 90 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index c52d79a55d80..27ceaa94c8bd 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -325,12 +325,6 @@ &pm8916_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 };
 
-&pronto {
-	status = "okay";
-
-	firmware-name = "qcom/apq8016/wcnss.mbn";
-};
-
 &sdhc_1 {
 	status = "okay";
 
@@ -411,10 +405,19 @@ &wcd_codec {
 	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
 };
 
+&wcnss {
+	status = "okay";
+	firmware-name = "qcom/apq8016/wcnss.mbn";
+};
+
 &wcnss_ctrl {
 	firmware-name = "qcom/apq8016/WCNSS_qcom_wlan_nv_sbc.bin";
 };
 
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
 /* Enable CoreSight */
 &cti0 { status = "okay"; };
 &cti1 { status = "okay"; };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
index ed3fa7b3575b..13cd9ad167df 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts
@@ -118,10 +118,6 @@ &pm8916_vib {
 	status = "okay";
 };
 
-&pronto {
-	status = "okay";
-};
-
 &sdhc_1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
@@ -149,6 +145,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
index 701a5585d77e..fecb69944cfa 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
@@ -160,10 +160,6 @@ &pm8916_vib {
 	status = "okay";
 };
 
-&pronto {
-	status = "okay";
-};
-
 &sdhc_1 {
 	status = "okay";
 
@@ -191,6 +187,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
index 3618704a5330..91284a1d0966 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
@@ -128,10 +128,6 @@ &blsp1_uart2 {
 	status = "okay";
 };
 
-&pronto {
-	status = "okay";
-};
-
 &sdhc_1 {
 	status = "okay";
 
@@ -159,6 +155,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts b/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
index a0e520edde02..525ec76efeeb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts
@@ -118,10 +118,6 @@ &pm8916_vib {
 	status = "okay";
 };
 
-&pronto {
-	status = "okay";
-};
-
 &sdhc_1 {
 	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
 	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
@@ -149,6 +145,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
index 8c07eca900d3..5b1bac8f5122 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
@@ -227,10 +227,6 @@ &pm8916_vib {
 	status = "okay";
 };
 
-&pronto {
-	status = "okay";
-};
-
 &sdhc_1 {
 	status = "okay";
 
@@ -312,6 +308,14 @@ &wcd_codec {
 	qcom,hphl-jack-type-normally-open;
 };
 
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index d1e8cf2f50c0..f1dd625e1822 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -231,10 +231,6 @@ &pm8916_vib {
 	status = "okay";
 };
 
-&pronto {
-	status = "okay";
-};
-
 &sdhc_1 {
 	status = "okay";
 
@@ -263,6 +259,14 @@ &usb_hs_phy {
 	extcon = <&pm8916_usbin>;
 };
 
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
index 3899e11b9843..b79e80913af9 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
@@ -99,10 +99,6 @@ &pm8916_vib {
 	status = "okay";
 };
 
-&pronto {
-	status = "okay";
-};
-
 &sdhc_1 {
 	status = "okay";
 
@@ -130,6 +126,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
index 8cac23b5240c..6eb5e0a39510 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
@@ -20,17 +20,6 @@ &mpss {
 	pll-supply = <&pm8916_l7>;
 };
 
-&pronto {
-	vddpx-supply = <&pm8916_l7>;
-
-	iris {
-		vddxo-supply = <&pm8916_l7>;
-		vddrfa-supply = <&pm8916_s3>;
-		vddpa-supply = <&pm8916_l9>;
-		vdddig-supply = <&pm8916_l5>;
-	};
-};
-
 &sdhc_1 {
 	vmmc-supply = <&pm8916_l8>;
 	vqmmc-supply = <&pm8916_l5>;
@@ -46,6 +35,17 @@ &usb_hs_phy {
 	v3p3-supply = <&pm8916_l13>;
 };
 
+&wcnss {
+	vddpx-supply = <&pm8916_l7>;
+};
+
+&wcnss_iris {
+	vddxo-supply = <&pm8916_l7>;
+	vddrfa-supply = <&pm8916_s3>;
+	vddpa-supply = <&pm8916_l9>;
+	vdddig-supply = <&pm8916_l5>;
+};
+
 &rpm_requests {
 	smd_rpm_regulators: regulators {
 		compatible = "qcom,rpm-pm8916-regulators";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index a2ed7bdbf528..16d67749960e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -252,10 +252,6 @@ &pm8916_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 };
 
-&pronto {
-	status = "okay";
-};
-
 &sdhc_1 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
index c691cca2eb45..a1ca4d883420 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
@@ -112,6 +112,14 @@ &vibrator {
 	status = "okay";
 };
 
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
 &msmgpio {
 	panel_vdd3_default: panel-vdd3-default-state {
 		pins = "gpio9";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
index 3dd819458785..4e10b8a5e9f9 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
@@ -54,12 +54,6 @@ &clk_pwm {
 	status = "okay";
 };
 
-&pronto {
-	iris {
-		compatible = "qcom,wcn3660b";
-	};
-};
-
 &touchkey {
 	vcc-supply = <&reg_touch_key>;
 	vdd-supply = <&reg_touch_key>;
@@ -69,6 +63,14 @@ &vibrator {
 	status = "okay";
 };
 
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3660b";
+};
+
 &msmgpio {
 	tkey_en_default: tkey-en-default-state {
 		pins = "gpio97";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi
index c95f0b4bc61f..f6c4a011fdfd 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi
@@ -58,6 +58,14 @@ &touchkey {
 	vdd-supply = <&reg_touch_key>;
 };
 
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
 &msmgpio {
 	tkey_en_default: tkey-en-default-state {
 		pins = "gpio97";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
index d920b7247d82..74ffd04db8d8 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gt5-common.dtsi
@@ -125,14 +125,6 @@ &pm8916_usbin {
 	status = "okay";
 };
 
-&pronto {
-	status = "okay";
-
-	iris {
-		compatible = "qcom,wcn3660b";
-	};
-};
-
 &sdhc_1 {
 	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
 	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
@@ -162,6 +154,14 @@ &usb_hs_phy {
 	extcon = <&pm8916_usbin>;
 };
 
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3660b";
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
index f3b81b6f0a2f..adeee0830e76 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5-common.dtsi
@@ -93,10 +93,6 @@ &pm8916_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 };
 
-&pronto {
-	status = "okay";
-};
-
 &sdhc_1 {
 	status = "okay";
 
@@ -124,6 +120,14 @@ &usb_hs_phy {
 	extcon = <&muic>;
 };
 
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index d4984b3af802..1a41a4db874d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -272,14 +272,6 @@ &pm8916_vib {
 	status = "okay";
 };
 
-&pronto {
-	status = "okay";
-
-	iris {
-		compatible = "qcom,wcn3660b";
-	};
-};
-
 &sdhc_1 {
 	status = "okay";
 
@@ -320,6 +312,14 @@ &usb_hs_phy {
 	extcon = <&muic>;
 };
 
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3660b";
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi b/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi
index cdf34b74fa8f..50bae6f214f1 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi
@@ -99,10 +99,6 @@ &pm8916_usbin {
 	status = "okay";
 };
 
-&pronto {
-	status = "okay";
-};
-
 &sdhc_1 {
 	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
 	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
@@ -122,6 +118,14 @@ &usb_hs_phy {
 	extcon = <&pm8916_usbin>;
 };
 
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
index a87be1d95b14..ac56c7595f78 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
@@ -153,10 +153,6 @@ &pm8916_vib {
 	status = "okay";
 };
 
-&pronto {
-	status = "okay";
-};
-
 &sdhc_1 {
 	status = "okay";
 
@@ -184,6 +180,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
 &smd_rpm_regulators {
 	vdd_l1_l2_l3-supply = <&pm8916_s3>;
 	vdd_l4_l5_l6-supply = <&pm8916_s4>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 0733c2f4f379..4973e8f5b5e9 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1870,7 +1870,7 @@ usb_hs_phy: phy {
 			};
 		};
 
-		pronto: remoteproc@a21b000 {
+		wcnss: remoteproc@a21b000 {
 			compatible = "qcom,pronto-v2-pil", "qcom,pronto";
 			reg = <0x0a204000 0x2000>, <0x0a202000 0x1000>, <0x0a21b000 0x3000>;
 			reg-names = "ccu", "dxe", "pmu";
@@ -1896,9 +1896,8 @@ pronto: remoteproc@a21b000 {
 
 			status = "disabled";
 
-			iris {
-				compatible = "qcom,wcn3620";
-
+			wcnss_iris: iris {
+				/* Separate chip, compatible is board-specific */
 				clocks = <&rpmcc RPM_SMD_RF_CLK2>;
 				clock-names = "xo";
 			};
@@ -1916,13 +1915,13 @@ wcnss_ctrl: wcnss {
 					compatible = "qcom,wcnss";
 					qcom,smd-channels = "WCNSS_CTRL";
 
-					qcom,mmio = <&pronto>;
+					qcom,mmio = <&wcnss>;
 
-					bluetooth {
+					wcnss_bt: bluetooth {
 						compatible = "qcom,wcnss-bt";
 					};
 
-					wifi {
+					wcnss_wifi: wifi {
 						compatible = "qcom,wcnss-wlan";
 
 						interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.30.2

