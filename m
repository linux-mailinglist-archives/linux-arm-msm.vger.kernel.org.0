Return-Path: <linux-arm-msm+bounces-2691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 363EF7FECC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 11:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87F35B211D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 10:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECF13C085;
	Thu, 30 Nov 2023 10:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oZuFsrzU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4315310E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 02:20:16 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c9d2ca9a96so2103351fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 02:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701339614; x=1701944414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bMrcES86CdSQONkR9JBqr8JyNo6XxvrCH6tbtQgulA=;
        b=oZuFsrzUKNPUxEA5npNrlzWEu0XLbbshpMSGqMDZyU+KW240R8x0S8HSY4Vp6G4hB2
         55lE/n8GKkkfJOLGvcO4V0gXhPJMvu3gtvsrdsQHv/dy8bDjS2uvNmHsAzfCTF9SIkS7
         E5wfsBhGGw0tXN0YDoFFV/faGlftQMA1o7hx/p63W1QrOKdp2NLidmxMnHx5bszlRCz3
         lpnOGf7hOm+chLnPcnxON7ALrwySHxtTCg4Dcl6EeCuVxAZvV4TVDh6UUazrbAo/SF5h
         2eKADCyMnmLslY3WC9pWy2rO2iKsf1Ff/VZGI4MMQq1ArEe4Pri6RIKmRzsiKl1weW6r
         FAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701339614; x=1701944414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8bMrcES86CdSQONkR9JBqr8JyNo6XxvrCH6tbtQgulA=;
        b=DEZNbVU60Qis7uS4CyJ25cxy6KlWC9+tcrm0b76p8q+Wz+sZYjwjQ2HLO0Uzk5dwN6
         lCvojx8RUlO161bog6rCpa7Z09xTtw7rwvEvCTxiruuTudJuhuHTKsq8i7u++a9B89tD
         MYK46f1n6QtoGlD6SWuHwQ8qMtukfoVllxjcQcnsEhTqVMP5leYIQVqrX/jaXST9Sbrc
         FqkK2PmidbbA3WxyiFcbd5aC3IJeL2Hb0I9LWIPHjss4q6mZPJnJlEhLQO+7poQ+2JlT
         xg+0yko3qQHjiN+hBc8N7616sRsh5FfuUC5aZZsU//koDLq53zVLlKV5WPnpGnEpxDsu
         4yUw==
X-Gm-Message-State: AOJu0YwBXErVGfjrpxl8IAizwSWl6QQetlm+jqw/5JOz6Xu9KCK+kvo6
	6e7gdBPCiPIa8PJzqP1z205/Qw==
X-Google-Smtp-Source: AGHT+IHJRgtOe0pV3oatsLBzZZfpJ1YhQGIa5NqmI/jHw1Ri55NMiM0p4dVy/by7yc1w8HUjtOzjvA==
X-Received: by 2002:a2e:3a03:0:b0:2c9:c03d:58c9 with SMTP id h3-20020a2e3a03000000b002c9c03d58c9mr2965284lja.28.1701339614543;
        Thu, 30 Nov 2023 02:20:14 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600c1d0a00b00407460234f9sm1465217wms.21.2023.11.30.02.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 02:20:14 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 30 Nov 2023 11:20:02 +0100
Subject: [PATCH v5 7/8] arm64: dts: qcom: sm8650-mtp: add interconnect
 dependent device nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231130-topic-sm8650-upstream-dt-v5-7-b25fb781da52@linaro.org>
References: <20231130-topic-sm8650-upstream-dt-v5-0-b25fb781da52@linaro.org>
In-Reply-To: <20231130-topic-sm8650-upstream-dt-v5-0-b25fb781da52@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6274;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=r9leNDaTdMg69rOglhJRjcIXbDF8kFCI4TYQbRiiLJ4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlaGHWjrz7oGV10FX1bQE45CH1/hivWkays4T1SBxT
 o+QeKKqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWhh1gAKCRB33NvayMhJ0QdqEA
 CRDN8C8GYS4uQPILk0oqBhEshrrXkX6Z2zTDIw7Jgd/dOyNXHK3HcKQs9xkdKi6RgTvqDRo65EqsLD
 7UQOSPCUerBs1rARtguB/2kwJ/5WiJ0KNZuesyK2/RXzxbA04HF9mVBxVNy8BrDbiwXU1thjV/EWQI
 jfcOZ6bMknlLvX0t/mdgCfmWdZ/htvLzr2t5DZMueOPfUM/TpiJAwSMSx2HQ7huptioPVnIQxJq8uf
 KqxH+ownh6PJ8K4dqy4AsuYXDvgo5UoEfhxbTs5ylklTMQS1uD9QytDjWW254/PHlzpxA4tKNJHjYq
 dzUeYNTbgC7F8NgB3D9fjHh/I3mJhcYUSoZFzyVfBlzRtg4S8IS0rKQ5NLHH5/2x091FT3cj0jf8lc
 u1bOoTwrpbdm/T+VYGGkCBPQ2ZPlCkZ2lAsh/lhXAFpJSRSFn/DnearY4FRD11jQSdHFe6KN43e/EG
 gs0PIxuC+8bsH9f+RaUAgMk03Pu3YzZkp4SC0o9PLuEP2IlawAePr5ryaaACerj73cxDvQ0AQj4xvh
 dL+d/j3YVdtVCsxtfFWpV3Qf+9iekqZWMVYzdDvcPq6YFQTPfhBsEW6vUVOxemEKY7BzYlssMxJCc5
 EDkgTMoU2GmSQsccDYTR2bmKqaA+TjaBhDK4HK1bTni7b8bAEMFbC9j29vSg==
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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


