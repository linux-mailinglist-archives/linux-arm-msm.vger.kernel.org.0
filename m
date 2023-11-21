Return-Path: <linux-arm-msm+bounces-1337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A59307F2B2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 12:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB4DCB216F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 11:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4112B482E3;
	Tue, 21 Nov 2023 11:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qjZ8Wc4w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19AF183
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 03:00:16 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32f737deedfso3475594f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 03:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700564415; x=1701169215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwH2qT1++PESiijZP+WOU7M8Ojp5c692ghEq6yuOePc=;
        b=qjZ8Wc4wqJjU3DoyQUlBuXTdY3mTWW7/BbiT2DogE98b1efWCMv63Ot0cjVJWEk0bB
         gbo1RH9a1UJ6k0azDyl8KDS5WRdgc+wfyk8Tcnsvvj9S3TiIgwdUIfqvm1VgcRfCg2xN
         //eU4Ovt1WK5jqB6oCazBWKMGxEQXE0wE1IAOFY5GnBUxmDZQJB0CmBxfdHeT4zRq0ia
         uZ1NJbAec5KWL0ukE3Th/kuFETi7p1KQdcdb2rkgVREB71tGQHmuGluCKI/xtQo1oZ8i
         ws0L80R4XZVvzzgxyIND3qexIQX4eRm/f7E+lgPSO2TeR9DXtMRrbrmqVUse7t3cM+HI
         PzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700564415; x=1701169215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwH2qT1++PESiijZP+WOU7M8Ojp5c692ghEq6yuOePc=;
        b=TRw9a1dtYtncI1rFUs5YJLeyloD4aCNZscFdspJKb9xAsPZ1RdYjYbUYDwU21eHLvO
         M7/6pvGRi5Ia+TpWjfCmhcpiTfjQyt0by5wTbzONgNOiVPy5e+W12CsHOi2hfLecU1wB
         kJZML6XQaC/EBYtwF6NSTZzFDsgR+0A/YoKaiKQsYuBV5uVScushdZytEjQG60oEDH6A
         2+xzLFrQI39sBqsEYnHvbnBUrGCmapz23/stDnLxv8Vjg7FJEu9AJ3o8bJ3RfNi+PbQB
         7bftrMrDhg1P///pJEHYY9gaV5CmrrZ1nk2u9D9rSYAXZPNF45lQznKyttJ33j8eRV/+
         01Xw==
X-Gm-Message-State: AOJu0YxwMhI/zTsY5MB20ytMjzsMETrgRKKjhXqP1lMkwru+yobh7ged
	JqXre861mRV2Epo0HTftK3Xg3Q==
X-Google-Smtp-Source: AGHT+IE95PhMZ3mQqdYHhl7BrEzFMCT3RXiPCG1qr8A3pvAGA7pECQ6N4tMzGdOapqBvoZYjCqWkrw==
X-Received: by 2002:a05:6000:18a5:b0:332:ca0b:5793 with SMTP id b5-20020a05600018a500b00332ca0b5793mr4011361wri.19.1700564415282;
        Tue, 21 Nov 2023 03:00:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id f1-20020adff581000000b00332c0e934aasm9028500wro.44.2023.11.21.03.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 03:00:14 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 21 Nov 2023 12:00:06 +0100
Subject: [PATCH v3 7/8] arm64: dts: qcom: sm8650-mtp: add interconnect
 dependent device nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231121-topic-sm8650-upstream-dt-v3-7-db9d0507ffd3@linaro.org>
References: <20231121-topic-sm8650-upstream-dt-v3-0-db9d0507ffd3@linaro.org>
In-Reply-To: <20231121-topic-sm8650-upstream-dt-v3-0-db9d0507ffd3@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6151;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=BJqOQ8YbFD3haPuSny+8xy74H+sRrIrhD+HIGPKVNco=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlXI222DZCv0WuiTPkeGSWg299DhVY5pla2KwsJAsp
 KsqNCiGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZVyNtgAKCRB33NvayMhJ0Y8QD/
 9fOCDKRrvg/Al4Am71Ykq6D+1mj+NLMZo7+PzYWHA00y7KNQVr4CjEfNlCTyT+UqQBkOzJ5XATGrNt
 L4iFH4SoHC4oYY51RM8NO1p2YfJf+gIHPLVl0JqthWlYvpCMwLFfgPI3nEGlBtPXdD13fxte52K4R3
 U3mO5Xn/fBBmzsgWGXB4zsWMh0Ni8B/bQZyrKAyzlGQGs90jc5CfIYyvmI8dlREHra4aawStPYMHsl
 dvmVs86SpAFWNDmnvZUMBWPGttVP2DB4+n2yBhPb4u39xJaoQd3utf+GAEajmN2SmNpQMMRmzkNner
 ljx2gK6fKKRbLZMkLNXCWTGepGIh7v811+NQpTC20ktg6cUYI6xhej7TMO0woj12sqcvFvKuMWC00Z
 3MT61jsQJJhLaap9dfiGb7wVxcQDNhA5tacvyzidApQGwSmdbWoxPhBXxculqGt9IgNgNu3XjtZRV1
 np3TSdj9nLjhcAFVjIWnj7Y7yaYCJYp7QbqSk6utisF/ueNxlwys7fCh1xeyRo3TPZ0jGqZu9IkMC7
 Jg2Ji5WXMAVm7qMbbeWYNsuFAV7SIFYmKNLvaXg5TvWZEm0ZpOInYR2lon65WUAu5xbfQlZEng3KsO
 oyEWd509nug6YCZ+6SBLQUOHF69ZGZceDan+LMnvqZvRn7XPUuAZyF5XhbMw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now interconnect dependent devices are added in sm8650 DTSI,
now enable more devices for the Qualcomm SM8650 MTP board:
- PCIe
- Display
- DSPs
- SDCard
- UFS
- USB role switch with PMIC Glink

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 235 +++++++++++++++++++++++++++++++-
 1 file changed, 234 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 5738791fea2a..83412d4914b9 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -28,6 +28,44 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	pmic-glink {
+		compatible = "qcom,sm8650-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 
@@ -77,6 +115,9 @@ vreg_l2b_3p0: ldo2 {
 			regulator-min-microvolt = <3008000>;
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l5b_3p1: ldo5 {
@@ -389,6 +430,106 @@ vreg_l3i_1p2: ldo3 {
 	};
 };
 
+&dispcc {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3i_1p2>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "visionox,vtdr6130";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vci-supply = <&vreg_l13b_3p0>;
+		vdd-supply = <&vreg_l11b_1p2>;
+
+		pinctrl-0 = <&disp0_resetn_active>, <&mdp_vsync_active>;
+		pinctrl-1 = <&disp0_resetn_suspend>, <&mdp_vsync_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l1i_0p88>;
+
+	status = "okay";
+};
+
+&mdss_mdp {
+	status = "okay";
+};
+
+&pcie_1_phy_aux_clk {
+	clock-frequency = <1000>;
+};
+
+&pcie0 {
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1i_0p88>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l3e_0p9>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
+	vdda-qref-supply = <&vreg_l1i_0p88>;
+
+	status = "okay";
+};
+
+&pm8550_gpios {
+	sdc2_card_det_n: sdc2-card-det-state {
+		pins = "gpio12";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		output-disable;
+		power-source = <1>; /* 1.8 V */
+	};
+};
+
 &pm8550b_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_1p8>;
 	vdd3-supply = <&vreg_l5b_3p1>;
@@ -398,18 +539,101 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8650/adsp.mbn",
+			"qcom/sm8650/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm8650/cdsp.mbn",
+			"qcom/sm8650/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/sm8650/modem.mbn",
+			"qcom/sm8650/modem_dtb.mbn";
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	cd-gpios = <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l8b_1p8>;
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default>, <&sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep>, <&sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32000>;
 };
 
 &tlmm {
 	gpio-reserved-ranges = <32 8>;
+
+	disp0_resetn_active: disp0-resetn-active-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_resetn_suspend: disp0-resetn-suspend-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync_active: mdp-vsync-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync_suspend: mdp-vsync-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart15 {
 	status = "okay";
 };
 
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1c_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1d_0p88>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
+
+	status = "okay";
+};
+
 /*
  * DPAUX -> WCD9395 -> USB_SBU -> USB-C
  * eUSB2 DP/DM -> PM85550HS -> eUSB2 DP/DM -> USB-C
@@ -421,7 +645,16 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_1_dwc3_ss {
+	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
 &usb_1_hsphy {

-- 
2.34.1


