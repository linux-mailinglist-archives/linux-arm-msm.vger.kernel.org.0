Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E80DDE39F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 07:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbfJUFNw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 01:13:52 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45036 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbfJUFNl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 01:13:41 -0400
Received: by mail-pg1-f195.google.com with SMTP id e10so7002765pgd.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2019 22:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jcsWTrEqHmC0K8//XXCKxi9HKF4+9QCm4JwJkdR1HEg=;
        b=zXd1TdKX/eSJYSajuTTdVwFexvvayqYggOhUBPnWVbl5kE42/+1eNhSWfscsrgD9Pi
         Pf0LSo/2/55TPc2Y77A7nPotyuP5ehh3ajYqaM40sSZ2jCwhXrg/vCwglkkufeiG86Pp
         fju+eflgg1LHruo1w6D2naomObl6knTeHgCMK+EDqB6QpQGn0ezAdLCIjhewwQJJJWiy
         y3qb+F8xctP0L2sVymKSRGdoOxHJ9EUpsSDqoTa7Dbnal3WQUzpJr9yE3KSdeuJmh/dK
         IO2PHD5saHFtNMX+tR9El8IlYNjSZZW+Xl0ziUtOYjpd74cyRUc/RF/o8OIVBuy7H1tE
         Durw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jcsWTrEqHmC0K8//XXCKxi9HKF4+9QCm4JwJkdR1HEg=;
        b=KofYpHrKg181gihWsS5QY4RCWHLlH9av5oOiKMnzrei34lwlQ8RWTbUK++PoPiWy7d
         xrHfUHliwRmQ1bh4KrxHfxQaRgUih6UHmW1urFiolfZQP/infWqv8OcTxKxDDGZ5GBiQ
         On33aHpkNw4yJO73xplFnApMtsEti8QrVHcqv0R91wIOls5yP3ne4/J1y1cS0A5ZgRBd
         pmYgPSAZQc/qiihMsLR/AdsusGuAR/PjJ6xnmBCpNN5Oyhkb3XDnwTegoXoUZcYWmJxz
         XjFBpzV5guu8I3lOv6mVBfCcF8b5iEjV0Yuv9xDTy9bQUssxkeBwbsPc6pDe24IqWeKK
         j6uw==
X-Gm-Message-State: APjAAAU34dTclaZNH8cixRi2IU/PpWroO5wJoKC+I05MnuKZl1oiCdzW
        Imo1ByXemKK7wNyMe0cMNzZ0Yw==
X-Google-Smtp-Source: APXvYqxsHVxNGFl9wU3yP2cSlvIyzC3UWFMa5v5rUxbF02VOyjJeh8Q83Pr06n5OGH3tBvhhEcqLTQ==
X-Received: by 2002:a63:2348:: with SMTP id u8mr23709813pgm.422.1571634819450;
        Sun, 20 Oct 2019 22:13:39 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h68sm15716862pfb.149.2019.10.20.22.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 22:13:38 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] arm64: dts: qcom: db820c: Use regulator names from schematics
Date:   Sun, 20 Oct 2019 22:13:21 -0700
Message-Id: <20191021051322.297560-11-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021051322.297560-1-bjorn.andersson@linaro.org>
References: <20191021051322.297560-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update the regulator names in db820c.dtsi to use the names from the
schematics, instead of the made up genric names.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 239 +++++++++++++------
 1 file changed, 169 insertions(+), 70 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index 6c64deecf950..20d5561cf3e5 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -107,6 +107,26 @@
 		pinctrl-0 = <&usb3_vbus_det_gpio>;
 	};
 
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-always-on;
+		regulator-boot-on;
+
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
+	vreg_s8a_l3a_input: vreg-s8a-l3a-input {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s8a_l3a_input";
+		regulator-always-on;
+		regulator-boot-on;
+
+		regulator-min-microvolt = <0>;
+		regulator-max-microvolt = <0>;
+	};
+
 	wlan_en: wlan-en-1-8v {
 		pinctrl-names = "default";
 		pinctrl-0 = <&wlan_en_gpios>;
@@ -187,7 +207,7 @@
 };
 
 &camss {
-	vdda-supply = <&pm8994_l2>;
+	vdda-supply = <&vreg_l2a_1p25>;
 };
 
 &hdmi {
@@ -197,30 +217,30 @@
 	pinctrl-0 = <&hdmi_hpd_active &hdmi_ddc_active>;
 	pinctrl-1 = <&hdmi_hpd_suspend &hdmi_ddc_suspend>;
 
-	core-vdda-supply = <&pm8994_l12>;
-	core-vcc-supply = <&pm8994_s4>;
+	core-vdda-supply = <&vreg_l12a_1p8>;
+	core-vcc-supply = <&vreg_s4a_1p8>;
 };
 
 &hdmi_phy {
 	status = "okay";
 
-	vddio-supply = <&pm8994_l12>;
-	vcca-supply = <&pm8994_l28>;
+	vddio-supply = <&vreg_l12a_1p8>;
+	vcca-supply = <&vreg_l28a_0p925>;
 	#phy-cells = <0>;
 };
 
 &hsusb_phy1 {
 	status = "okay";
 
-	vdda-pll-supply = <&pm8994_l12>;
-	vdda-phy-dpdm-supply = <&pm8994_l24>;
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
 };
 
 &hsusb_phy2 {
 	status = "okay";
 
-	vdda-pll-supply = <&pm8994_l12>;
-	vdda-phy-dpdm-supply = <&pm8994_l24>;
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
 };
 
 &mdp {
@@ -493,26 +513,26 @@
 	status = "okay";
 	perst-gpio = <&msmgpio 35 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
-	vdda-supply = <&pm8994_l28>;
+	vdda-supply = <&vreg_l28a_0p925>;
 };
 
 &pcie1 {
 	status = "okay";
 	perst-gpio = <&msmgpio 130 GPIO_ACTIVE_LOW>;
-	vdda-supply = <&pm8994_l28>;
+	vdda-supply = <&vreg_l28a_0p925>;
 };
 
 &pcie2 {
 	status = "okay";
 	perst-gpio = <&msmgpio 114 GPIO_ACTIVE_LOW>;
-	vdda-supply = <&pm8994_l28>;
+	vdda-supply = <&vreg_l28a_0p925>;
 };
 
 &pcie_phy {
 	status = "okay";
 
-	vdda-phy-supply = <&pm8994_l28>;
-	vdda-pll-supply = <&pm8994_l12>;
+	vdda-phy-supply = <&vreg_l28a_0p925>;
+	vdda-pll-supply = <&vreg_l12a_1p8>;
 };
 
 &pm8994_gpios {
@@ -656,16 +676,35 @@
 	pm8994-regulators {
 		compatible = "qcom,rpm-pm8994-regulators";
 
-		vdd_l1-supply = <&pm8994_s3>;
-		vdd_l2_l26_l28-supply = <&pm8994_s3>;
-		vdd_l3_l11-supply = <&pm8994_s3>;
-		vdd_l4_l27_l31-supply = <&pm8994_s3>;
-		vdd_l5_l7-supply = <&pm8994_s5>;
-		vdd_l14_l15-supply = <&pm8994_s5>;
-		vdd_l20_l21-supply = <&pm8994_s5>;
-		vdd_l25-supply = <&pm8994_s3>;
-
-		pm8994_s3: s3 {
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+		vdd_s7-supply = <&vph_pwr>;
+		vdd_s8-supply = <&vph_pwr>;
+		vdd_s9-supply = <&vph_pwr>;
+		vdd_s10-supply = <&vph_pwr>;
+		vdd_s11-supply = <&vph_pwr>;
+		vdd_s12-supply = <&vph_pwr>;
+		vdd_l1-supply = <&vreg_s1b_1p025>;
+		vdd_l2_l26_l28-supply = <&vreg_s3a_1p3>;
+		vdd_l3_l11-supply = <&vreg_s8a_l3a_input>;
+		vdd_l4_l27_l31-supply = <&vreg_s3a_1p3>;
+		vdd_l5_l7-supply = <&vreg_s5a_2p15>;
+		vdd_l6_l12_l32-supply = <&vreg_s5a_2p15>;
+		vdd_l8_l16_l30-supply = <&vph_pwr>;
+		vdd_l9_l10_l18_l22-supply = <&vph_pwr_bbyp>;
+		vdd_l13_l19_l23_l24-supply = <&vph_pwr_bbyp>;
+		vdd_l14_l15-supply = <&vreg_s5a_2p15>;
+		vdd_l17_l29-supply = <&vph_pwr_bbyp>;
+		vdd_l20_l21-supply = <&vph_pwr_bbyp>;
+		vdd_l25-supply = <&vreg_s3a_1p3>;
+		vdd_lvs1_2-supply = <&vreg_s4a_1p8>;
+
+		vreg_s3a_1p3: s3 {
+			regulator-name = "vreg_s3a_1p3";
 			regulator-min-microvolt = <1300000>;
 			regulator-max-microvolt = <1300000>;
 		};
@@ -674,137 +713,197 @@
 		 * 1.8v required on LS expansion
 		 * for mezzanine boards
 		 */
-		pm8994_s4: s4 {
+		vreg_s4a_1p8: s4 {
+			regulator-name = "vreg_s4a_1p8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-always-on;
 		};
-		pm8994_s5: s5 {
+		vreg_s5a_2p15: s5 {
+			regulator-name = "vreg_s5a_2p15";
 			regulator-min-microvolt = <2150000>;
 			regulator-max-microvolt = <2150000>;
 		};
-		pm8994_s7: s7 {
+		vreg_s7a_1p0: s7 {
+			regulator-name = "vreg_s7a_1p0";
 			regulator-min-microvolt = <800000>;
 			regulator-max-microvolt = <800000>;
 		};
 
-		pm8994_l1: l1 {
+		vreg_l1a_1p0: l1 {
+			regulator-name = "vreg_l1a_1p0";
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1000000>;
 		};
-		pm8994_l2: l2 {
+		vreg_l2a_1p25: l2 {
+			regulator-name = "vreg_l2a_1p25";
 			regulator-min-microvolt = <1250000>;
 			regulator-max-microvolt = <1250000>;
 		};
-		pm8994_l3: l3 {
+		vreg_l3a_0p875: l3 {
+			regulator-name = "vreg_l3a_0p875";
 			regulator-min-microvolt = <850000>;
 			regulator-max-microvolt = <850000>;
 		};
-		pm8994_l4: l4 {
+		vreg_l4a_1p225: l4 {
+			regulator-name = "vreg_l4a_1p225";
 			regulator-min-microvolt = <1225000>;
 			regulator-max-microvolt = <1225000>;
 		};
-		pm8994_l6: l6 {
+		vreg_l6a_1p2: l6 {
+			regulator-name = "vreg_l6a_1p2";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 		};
-		pm8994_l8: l8 {
+		vreg_l8a_1p8: l8 {
+			regulator-name = "vreg_l8a_1p8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
-		pm8994_l9: l9 {
+		vreg_l9a_1p8: l9 {
+			regulator-name = "vreg_l9a_1p8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
-		pm8994_l10: l10 {
+		vreg_l10a_1p8: l10 {
+			regulator-name = "vreg_l10a_1p8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
-		pm8994_l11: l11 {
+		vreg_l11a_1p15: l11 {
+			regulator-name = "vreg_l11a_1p15";
 			regulator-min-microvolt = <1150000>;
 			regulator-max-microvolt = <1150000>;
 		};
-		pm8994_l12: l12 {
+		vreg_l12a_1p8: l12 {
+			regulator-name = "vreg_l12a_1p8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
-		pm8994_l13: l13 {
+		vreg_l13a_2p95: l13 {
+			regulator-name = "vreg_l13a_2p95";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2950000>;
 		};
-		pm8994_l14: l14 {
+		vreg_l14a_1p8: l14 {
+			regulator-name = "vreg_l14a_1p8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
-		pm8994_l15: l15 {
+		vreg_l15a_1p8: l15 {
+			regulator-name = "vreg_l15a_1p8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
-		pm8994_l16: l16 {
+		vreg_l16a_2p7: l16 {
+			regulator-name = "vreg_l16a_2p7";
 			regulator-min-microvolt = <2700000>;
 			regulator-max-microvolt = <2700000>;
 		};
-		pm8994_l17: l17 {
+		vreg_l17a_2p8: l17 {
+			regulator-name = "vreg_l17a_2p8";
 			regulator-min-microvolt = <2500000>;
 			regulator-max-microvolt = <2500000>;
 		};
-		pm8994_l18: l18 {
+		vreg_l18a_2p85: l18 {
+			regulator-name = "vreg_l18a_2p85";
 			regulator-min-microvolt = <2700000>;
 			regulator-max-microvolt = <2900000>;
 		};
-		pm8994_l19: l19 {
+		vreg_l19a_2p8: l19 {
+			regulator-name = "vreg_l19a_2p8";
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3000000>;
 		};
-		pm8994_l20: l20 {
+		vreg_l20a_2p95: l20 {
+			regulator-name = "vreg_l20a_2p95";
 			regulator-min-microvolt = <2950000>;
 			regulator-max-microvolt = <2950000>;
 			regulator-allow-set-load;
 		};
-		pm8994_l21: l21 {
+		vreg_l21a_2p95: l21 {
+			regulator-name = "vreg_l21a_2p95";
 			regulator-min-microvolt = <2950000>;
 			regulator-max-microvolt = <2950000>;
 			regulator-allow-set-load;
 			regulator-system-load = <200000>;
 		};
-		pm8994_l22: l22 {
+		vreg_l22a_3p0: l22 {
+			regulator-name = "vreg_l22a_3p0";
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
 		};
-		pm8994_l23: l23 {
+		vreg_l23a_2p8: l23 {
+			regulator-name = "vreg_l23a_2p8";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
 		};
-		pm8994_l24: l24 {
+		vreg_l24a_3p075: l24 {
+			regulator-name = "vreg_l24a_3p075";
 			regulator-min-microvolt = <3075000>;
 			regulator-max-microvolt = <3075000>;
 		};
-		pm8994_l25: l25 {
+		vreg_l25a_1p2: l25 {
+			regulator-name = "vreg_l25a_1p2";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-allow-set-load;
 		};
-		pm8994_l27: l27 {
+		vreg_l26a_0p8: l27 {
+			regulator-name = "vreg_l26a_0p8";
 			regulator-min-microvolt = <1000000>;
 			regulator-max-microvolt = <1000000>;
 		};
-		pm8994_l28: l28 {
+		vreg_l28a_0p925: l28 {
+			regulator-name = "vreg_l28a_0p925";
 			regulator-min-microvolt = <925000>;
 			regulator-max-microvolt = <925000>;
 			regulator-allow-set-load;
 		};
-		pm8994_l29: l29 {
+		vreg_l29a_2p8: l29 {
+			regulator-name = "vreg_l29a_2p8";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <2800000>;
 		};
-		pm8994_l30: l30 {
+		vreg_l30a_1p8: l30 {
+			regulator-name = "vreg_l30a_1p8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
-		pm8994_l32: l32 {
+		vreg_l32a_1p8: l32 {
+			regulator-name = "vreg_l32a_1p8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
+
+		vreg_lvs1a_1p8: lvs1 {
+			regulator-name = "vreg_lvs1a_1p8";
+		};
+
+		vreg_lvs2a_1p8: lvs2 {
+			regulator-name = "vreg_lvs2a_1p8";
+		};
+	};
+
+	pmi8994-regulators {
+		compatible = "qcom,rpm-pmi8994-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_bst_byp-supply = <&vph_pwr>;
+
+		vreg_s1b_1p025: s1 {
+			regulator-name = "vreg_s1b_1p025";
+			regulator-min-microvolt = <1025000>;
+			regulator-max-microvolt = <1025000>;
+		};
+
+		vph_pwr_bbyp: bst-byp {
+			regulator-name = "vph_pwr_bbyp";
+			regulator-min-microvolt = <3150000>;
+			regulator-max-microvolt = <3600000>;
+		};
 	};
 };
 
@@ -814,8 +913,8 @@
 	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
 	cd-gpios = <&msmgpio 38 0x1>;
-	vmmc-supply = <&pm8994_l21>;
-	vqmmc-supply = <&pm8994_l13>;
+	vmmc-supply = <&vreg_l21a_2p95>;
+	vqmmc-supply = <&vreg_l13a_2p95>;
 	status = "okay";
 };
 
@@ -908,13 +1007,13 @@
 &ufsphy {
 	status = "okay";
 
-	vdda-phy-supply = <&pm8994_l28>;
-	vdda-pll-supply = <&pm8994_l12>;
+	vdda-phy-supply = <&vreg_l28a_0p925>;
+	vdda-pll-supply = <&vreg_l12a_1p8>;
 
 	vdda-phy-max-microamp = <18380>;
 	vdda-pll-max-microamp = <9440>;
 
-	vddp-ref-clk-supply = <&pm8994_l25>;
+	vddp-ref-clk-supply = <&vreg_l25a_1p2>;
 	vddp-ref-clk-max-microamp = <100>;
 	vddp-ref-clk-always-on;
 };
@@ -922,9 +1021,9 @@
 &ufshc {
 	status = "okay";
 
-	vcc-supply = <&pm8994_l20>;
-	vccq-supply = <&pm8994_l25>;
-	vccq2-supply = <&pm8994_s4>;
+	vcc-supply = <&vreg_l20a_2p95>;
+	vccq-supply = <&vreg_l25a_1p2>;
+	vccq2-supply = <&vreg_s4a_1p8>;
 
 	vcc-max-microamp = <600000>;
 	vccq-max-microamp = <450000>;
@@ -955,8 +1054,8 @@
 &usb3phy {
 	status = "okay";
 
-	vdda-phy-supply = <&pm8994_l28>;
-	vdda-pll-supply = <&pm8994_l12>;
+	vdda-phy-supply = <&vreg_l28a_0p925>;
+	vdda-pll-supply = <&vreg_l12a_1p8>;
 
 };
 
@@ -965,9 +1064,9 @@
 	clocks = <&div1_mclk>,
 		 <&rpmcc RPM_SMD_BB_CLK1>;
 
-	vdd-buck-supply = <&pm8994_s4>;
-	vdd-buck-sido-supply = <&pm8994_s4>;
-	vdd-tx-supply = <&pm8994_s4>;
-	vdd-rx-supply = <&pm8994_s4>;
-	vdd-io-supply = <&pm8994_s4>;
+	vdd-buck-supply = <&vreg_s4a_1p8>;
+	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
+	vdd-tx-supply = <&vreg_s4a_1p8>;
+	vdd-rx-supply = <&vreg_s4a_1p8>;
+	vdd-io-supply = <&vreg_s4a_1p8>;
 };
-- 
2.23.0

