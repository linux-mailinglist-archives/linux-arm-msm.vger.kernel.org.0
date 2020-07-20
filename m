Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BACB1225A7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 10:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgGTIy2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 04:54:28 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:20146 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgGTIy1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 04:54:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595235263;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=zqSadbsqF/04Yrr3+ei95T1TUFma6s/yHTAR51h1L1U=;
        b=bnYx0NQDF/bH2+nkXQQFvI44FHCsqEuTY9SNxvQXAiSablShbquktfSTCw1HjjmnOW
        XpiKPU/7OTC+7XE3gAPdSaM8dVyeTdt7KsLICjk0VN+fvl9tkRldZqUWsUtWo9V9C3KW
        w73gu+nq4XzqoGaAp2HmeMDefd6BYoxOtMZCdHnOzZlAQs7zDJhTlWF48Zu/Jqh9jyQ7
        0wJKKEuAojFBscuRyfo+JlkAmHJePAKY/uZzevxLGuMhyI1r3FEi1s63n3fkKxdNtk6g
        HNoHnVked5fh38Zg9bovwIWizFAXf76s3kNogycKJM6c/frODDqvuywE59+eI4N2Xj7N
        uTOA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6NeHYC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew6K8sLdgL
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 20 Jul 2020 10:54:21 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 08/10] arm64: dts: qcom: msm8916: Move more supplies to msm8916-pm8916.dtsi
Date:   Mon, 20 Jul 2020 10:54:04 +0200
Message-Id: <20200720085406.6716-9-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720085406.6716-1-stephan@gerhold.net>
References: <20200720085406.6716-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

So far we had some supplies defined for all boards in msm8916.dtsi,
while others were duplicated into every board-specific device tree.

Now that we have msm8916-pm8916.dtsi as a common include for all
standard MSM8916 devices using PM8916, move the remaining common
supplies to msm8916-pm8916.dtsi to reduce duplication a bit.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     | 15 ------------
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts |  8 -------
 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi  | 24 +++++++++++++++++++
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 15 ------------
 4 files changed, 24 insertions(+), 38 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index e07308cca447..91852f929141 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -301,9 +301,6 @@ ov5640_ep: endpoint {
 };
 
 &dsi0 {
-	vdda-supply = <&pm8916_l2>;
-	vddio-supply = <&pm8916_l6>;
-
 	ports {
 		port@1 {
 			endpoint {
@@ -314,10 +311,6 @@ endpoint {
 	};
 };
 
-&dsi_phy0 {
-	vddio-supply = <&pm8916_l6>;
-};
-
 &lpass {
 	status = "okay";
 };
@@ -334,9 +327,6 @@ &pronto {
 &sdhc_1 {
 	status = "okay";
 
-	vmmc-supply = <&pm8916_l8>;
-	vqmmc-supply = <&pm8916_l5>;
-
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
 	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
@@ -345,9 +335,6 @@ &sdhc_1 {
 &sdhc_2 {
 	status = "okay";
 
-	vmmc-supply = <&pm8916_l11>;
-	vqmmc-supply = <&pm8916_l12>;
-
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
@@ -410,8 +397,6 @@ &usb {
 };
 
 &usb_hs_phy {
-	v1p8-supply = <&pm8916_l7>;
-	v3p3-supply = <&pm8916_l13>;
 	extcon = <&usb_id>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 0b72da1bb6ca..8a6a9cd4a3fe 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -72,9 +72,6 @@ &pronto {
 &sdhc_1 {
 	status = "okay";
 
-	vmmc-supply = <&pm8916_l8>;
-	vqmmc-supply = <&pm8916_l5>;
-
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
 	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
@@ -83,9 +80,6 @@ &sdhc_1 {
 &sdhc_2 {
 	status = "okay";
 
-	vmmc-supply = <&pm8916_l11>;
-	vqmmc-supply = <&pm8916_l12>;
-
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on>;
 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
@@ -105,8 +99,6 @@ &usb {
 
 &usb_hs_phy {
 	extcon = <&usb_vbus>;
-	v1p8-supply = <&pm8916_l7>;
-	v3p3-supply = <&pm8916_l13>;
 };
 
 &smd_rpm_regulators {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
index d416fe354f82..cd626e7db599 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
@@ -7,6 +7,15 @@ &camss {
 	vdda-supply = <&pm8916_l2>;
 };
 
+&dsi0 {
+	vdda-supply = <&pm8916_l2>;
+	vddio-supply = <&pm8916_l6>;
+};
+
+&dsi_phy0 {
+	vddio-supply = <&pm8916_l6>;
+};
+
 &mpss {
 	cx-supply = <&pm8916_s1>;
 	mx-supply = <&pm8916_l3>;
@@ -25,6 +34,21 @@ iris {
 	};
 };
 
+&sdhc_1 {
+	vmmc-supply = <&pm8916_l8>;
+	vqmmc-supply = <&pm8916_l5>;
+};
+
+&sdhc_2 {
+	vmmc-supply = <&pm8916_l11>;
+	vqmmc-supply = <&pm8916_l12>;
+};
+
+&usb_hs_phy {
+	v1p8-supply = <&pm8916_l7>;
+	v3p3-supply = <&pm8916_l13>;
+};
+
 &rpm_requests {
 	smd_rpm_regulators: pm8916-regulators {
 		compatible = "qcom,rpm-pm8916-regulators";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index 64e9c73953bb..f1ddb23ac3c3 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -125,18 +125,11 @@ &dsi0 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	vdda-supply = <&pm8916_l2>;
-	vddio-supply = <&pm8916_l6>;
-
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&mdss_default>;
 	pinctrl-1 = <&mdss_sleep>;
 };
 
-&dsi_phy0 {
-	vddio-supply = <&pm8916_l6>;
-};
-
 &pm8916_resin {
 	status = "okay";
 	linux,code = <KEY_VOLUMEDOWN>;
@@ -149,9 +142,6 @@ &pronto {
 &sdhc_1 {
 	status = "okay";
 
-	vmmc-supply = <&pm8916_l8>;
-	vqmmc-supply = <&pm8916_l5>;
-
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
 	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
@@ -160,9 +150,6 @@ &sdhc_1 {
 &sdhc_2 {
 	status = "okay";
 
-	vmmc-supply = <&pm8916_l11>;
-	vqmmc-supply = <&pm8916_l12>;
-
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
@@ -181,8 +168,6 @@ &usb {
 
 &usb_hs_phy {
 	extcon = <&muic>;
-	v1p8-supply = <&pm8916_l7>;
-	v3p3-supply = <&pm8916_l13>;
 };
 
 &smd_rpm_regulators {
-- 
2.27.0

