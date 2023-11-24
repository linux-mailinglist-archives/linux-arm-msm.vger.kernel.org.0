Return-Path: <linux-arm-msm+bounces-1806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB0B7F6F5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 10:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8902B211CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 09:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CE711735;
	Fri, 24 Nov 2023 09:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ImBvoVHk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA3510C9
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 01:20:58 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-332e40315bdso840797f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 01:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700817657; x=1701422457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qh57jYizUR6T9htWz0tIFyEV74zQHcgKpTBHSCa9cik=;
        b=ImBvoVHkBNg4bzE5T6N+gdfKydUeauOgmksrNUQWEOlTe8q7A98tAxFywpdAYu66Zl
         Blq0AujT3yZhIvXUnXt+oROgqn0KL2NZFR4mWtzRdbYsGgFvHeOpm/Gm0kZv5CoUV8TC
         k6AG2CxVSdYqQQFuwY/U00gi484ZrGQNJ7d3Wf1bFvesTGHqD94g8qd4CnQSMWBAOcOi
         dTGMMBRU3L9T40d1BTO99B5ckpX+3EfmqWbODzbBgHk3MwJ4WYOzeQwgU7JaZ7t4dBXO
         6i0uanilSG+RzSUss8zac0s5lEaSgM2bwfEo55/pIGWN4uLU4LBQXO+vwJDxUMTLVjhw
         2T0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700817657; x=1701422457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qh57jYizUR6T9htWz0tIFyEV74zQHcgKpTBHSCa9cik=;
        b=oGxxtJYk7R/bqNpFjbFMEguduTvZMZJUUtlIkfwTVwarO2zzi5rbvVueVJrheXD2nG
         Ml/PQA+9KXmooqaJjbummyNeVlSLcRdXOzKPJi147O8Of46ureCuWFqR+DEquzLmu8Bs
         uy0TLFvqD+thYjSp8SpKkS1UJQaw20RXWwi0zygnTOVqXN8GhEfsny7Vfz9iYXpY8gZ+
         IFH80WbRG5vFHECe+UCsundflbXa1awTBHtO9/V9HF1NyjZw4/K6ycUUC4CtxJ401Myi
         +EhX2a9GvuYZoIKXLu7O2X4uA8DvDa9pAHE4H2cV8BHGm7T6PQ4+RQbxA6Az6wiby1N6
         qMtQ==
X-Gm-Message-State: AOJu0YzGTS/DlWI6QX+exL1TGarXbevP+ahoY4pD9zipEEf6KgGSacpw
	WGsiTrUjs2UHoihI6LWBo8Q9og==
X-Google-Smtp-Source: AGHT+IHE9M9mC7eD0R7Y2GDrv+D+QNtcI27tqx5RX0gWWEfwQilLN9u9+1mzX6MGQZ71fQ07r9pMqQ==
X-Received: by 2002:a5d:43d2:0:b0:32d:9f1b:3a1f with SMTP id v18-20020a5d43d2000000b0032d9f1b3a1fmr1578414wrr.31.1700817656767;
        Fri, 24 Nov 2023 01:20:56 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m23-20020a056000025700b00332ce0d7300sm3805755wrz.92.2023.11.24.01.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 01:20:56 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 10:20:44 +0100
Subject: [PATCH v4 7/8] arm64: dts: qcom: sm8650-mtp: add interconnect
 dependent device nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231124-topic-sm8650-upstream-dt-v4-7-e402e73cc5f0@linaro.org>
References: <20231124-topic-sm8650-upstream-dt-v4-0-e402e73cc5f0@linaro.org>
In-Reply-To: <20231124-topic-sm8650-upstream-dt-v4-0-e402e73cc5f0@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6219;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lQBCp1m4Jg+eo2PKFFIsdpDkhpzuG5vLXmMIqKfipxY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGrwWfFhG8yF8ENycGFMUSBa3NrSdElEGH3H6R1y
 sldhmomJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBq8AAKCRB33NvayMhJ0X1+D/
 9Fzk4dh71NwGZEZhkhUHz3ZQ1azErl7pAjo7H1lvH1B/qEulRG2lTb6ETV9Se1lnjrgMqyWwndyNUG
 8fOahhweOMhMm7MDE5Qpzy+4wH5Vk8jr9cKybpjjV/KyEgtaMtgSchtdrgvjPYurHTt4ge2balWNNc
 72GcwrFHrRJ/AFoosGu99b/go0YtRgnrS/nukpx9+2yh2t4HBIdD1EEgweh/0rC/l5gBUxjRiHahhj
 fp1y8mNH7wvctX2bv8sWITiop1NVGelcR6nIFnLRRtSmQfuBXwrVWJIon6lGHRSr7RfcjjWeeLo/XD
 D8bb7FNPYFEnIY3XJ4Si4nZ3G882RL2+yGUw2tp0nuoY4D3hYSJRL6Ni/sTj4BYSS9FOenooCCR5MB
 2oOXz0LZHPWQ5QFFDShpA/XL8fC2aLZUCAJ+AWdDUC97aVfRESFRaiYXGsOeMEWI4bdy4E3uD+uM7F
 sS+R1BwqT1T7FhRd5gDKZw34bFbrcdzIu22AwdCx25JhpqOfiZybPpxjF4bo+fAO6ltMI360henxuZ
 fuYk7FswRz6TDxv80fo4vZ/0IlxRt/D2K1HLlR609QRcjhapHCOgsqLTCiuuo0Q04fzuqMiijP3hVI
 3erzTXxZaJ4fRaLtRZbNmxFgQuF4qzFP2axyrdJwHU8rxGccRP6Ff9c++qBg==
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
index 51092d20d610..656cdbc6f234 100644
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
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync_active>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync_suspend>;
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
@@ -398,6 +539,43 @@ &qupv3_id_1 {
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
@@ -405,12 +583,58 @@ &sleep_clk {
 &tlmm {
 	/* Reserved I/Os for NFC */
 	gpio-reserved-ranges = <32 8>;
+
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
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
@@ -422,7 +646,16 @@ &usb_1 {
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


