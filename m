Return-Path: <linux-arm-msm+bounces-8429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B49683D801
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 11:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AA8F29A20D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 10:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345685FF07;
	Fri, 26 Jan 2024 10:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kLYCHBAg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0855FF1D
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706263251; cv=none; b=CkowP3UO84y7QmGBPnLNWh7MvQ9sl6v8MkMg1SuPZrMfRql1LjGnoK1/OeY5Kfdb1J6wPaZI2iMKIo5s+6sJ24lWV3lOK9BVQxEePU8nBFH3BtZJBysfBe1Mg9CtjoAxt81yhwwUJBOXXnjxhR3MdncMlHesDjnmwXDI2fM33Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706263251; c=relaxed/simple;
	bh=b5me84CBLvNcqpO40KkAROvLnJP/DZ8uuhWcZAxxBlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fAtwUp6i8N15UTxGuVFXSDltqUkIIloHaYtiMGrj76vcrbe5AmtBN5vzqh8nhAgB8bDQ6R9wCBWVrxu6muocAyKsLZRhwDjYhbYoRe2M2hj1rnscr7D9ZSxAY8P927LjlO/miJ+HZj/AIMwdhNkSq2x5BAQIFw2k8GHXX0V+MMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kLYCHBAg; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-339289fead2so207462f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 02:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706263247; x=1706868047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHRWIZ6AIyJhvIjYmGETHUbdnTVzo35SA3ucS7gN62w=;
        b=kLYCHBAgRAfNI8f97sAZDUONXZuiXD/b9CjY1IYWsT+Bj5y2s5fedQbR+jLAHjhPpE
         8pLh1ynqpS400B6XLoRhj0BsIBQyEBqCiTcp8ZLgUhXHsXGWUyqeHCp8UaJ7HLaraHVw
         beUOeSwcgs556ykSm+i9lvFiweCqJY5xpOpiH3wyHfT/SEj/Dc/1lvDYMWWp7xIQISWj
         hDSznEzNjlZDTLixDM+ABnPyXJtGMF8E4vn2fJXbY8tk3oxBri38J7czxkLfDnVtIG9P
         eASPGqMGMIaUtF8C1sfwYULmjYqsNpTlPcwDMF52VU9MaFtJI0+B+5cA2WQpnn9qskZc
         CzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706263247; x=1706868047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHRWIZ6AIyJhvIjYmGETHUbdnTVzo35SA3ucS7gN62w=;
        b=HG1pPrjFiYF6JedpVoEw9kLq2IxKou7o0m7CnWUNtVCAM37HazxRSmTco8pT9J/vXD
         yvTRrNVdFssDeckZP3wPY1Y3b1IpEEyawU+deDA9Kp35One+B7sLM9+aimqPpzxoeqmG
         7OhD0Cmc6ALBIBXzl104e4AlEnEe9dRPbtrbfNh/PDLFCiywHWiAWTrCrNDt3rpFGehu
         D8QDxesqj7Lck2yaGtW2wgs8AlQta+E7d65A3T8H5awXkXVZKbXBnNLKbZ4Ex7+e0Vw+
         2t9wa8SDnN+PVGfpqpuu1WtpJowEsCdFtGoIxHwd8GCyV8dSb9LA8nkYu66hMpyijE+D
         0e1Q==
X-Gm-Message-State: AOJu0YwMVkEoKX5vMKT7D/CIhVBGj72zq4fM7RDxTT8nVS31XAkUgNkh
	d9b8n2X18R1Oxbh1qhtgJnkWwasKcsFN9bXM0djvKaYxLHy8QtIIDcgI1nGNysA=
X-Google-Smtp-Source: AGHT+IGApKbZoEuNOWIxn6/v7hwnWpXN4QzFLkiRzV9l+mW3S6kEfn5JbjI6SXrXajypXZoALUr7uA==
X-Received: by 2002:a05:600c:3d97:b0:40e:4398:25e7 with SMTP id bi23-20020a05600c3d9700b0040e439825e7mr650150wmb.209.1706263246942;
        Fri, 26 Jan 2024 02:00:46 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id ox27-20020a170907101b00b00a3221b95ce8sm448494ejb.77.2024.01.26.02.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 02:00:46 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 26 Jan 2024 12:00:21 +0200
Subject: [PATCH v5 10/11] arm64: dts: qcom: x1e80100-qcp: Enable more
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-x1e80100-dts-missing-nodes-v5-10-3bb716fb2af9@linaro.org>
References: <20240126-x1e80100-dts-missing-nodes-v5-0-3bb716fb2af9@linaro.org>
In-Reply-To: <20240126-x1e80100-dts-missing-nodes-v5-0-3bb716fb2af9@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3993; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=b5me84CBLvNcqpO40KkAROvLnJP/DZ8uuhWcZAxxBlk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBls4K/lsJt6H7wxMhDuiVTa7aA6DlbWsbotJ7Qv
 B1908w71JOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbOCvwAKCRAbX0TJAJUV
 VuVJEACRAzyCTauKPMR4nwNKZF/Z3LYM4TaYFt9MJerwvjFmxAbLOXaTqN8J2E5t8TVt3T2HyKC
 2XK/x7ALAYnD1TWYYL4yQwNJ5P8GYR9sAiNMggU4Aa9p2/3QAZ1gDRWueASiSUbx4AxNABTaI1A
 nOBp94cGbB3J4Tr/SjnTlm+T4UohKpLW6KqxE3rryfUZ6d5JKl7it3Mgjx5w+JukQFvYaacyuJ4
 66N7NgkxCWB7RSbuZlbDpXBFc6PXLvbe69SpHMm3DPhywHREzBgkDIGluGe0EQJ3KlNmf2M1xPG
 Ea+4JQzaC8hBlAdDKoqw8SbgGjfn6RP/Z15115Uo7tmyMBlF2ciDqVrFLyR3twznDOFU8CNmW73
 BqB0LhXYGuqS1FUNovYJ5RjJB37uIidsWwjw4fOVKitnwVD4ZA85txC5tzSnh0zJJX1gNz3S6ap
 pNCPefT3EpFtBQW3wOXdp03rm+ZcfOll61dGXe7latdEdHDTYcDHDpZweBg/6ylu62HH6vfxgW0
 1V2Vjueahl3KzlGVkcVeZwxK20IIJPj7pBOAb7A8iUrwkSIUygHfMeWLXStgohEf9GhE76AB7S+
 UOGbRuHog0H7Y5og2m4/PNcqnKdPvtiVbL0H0+7/SnRNB6nAHks81RTa+h0tcebR37AaIrrSvMX
 e4GgBo6ZjTsIjZg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Enable display, pcie and usb support.

Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Co-developed-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 171 ++++++++++++++++++++++++++++++
 1 file changed, 171 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index a37ad9475c90..8dbf6d0eaac3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "x1e80100.dtsi"
@@ -31,6 +32,23 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &apps_rsc {
@@ -383,17 +401,170 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp3 {
+	compatible = "qcom,x1e80100-dp";
+	/delete-property/ #sound-dai-cells;
+
+	data-lanes = <0 1 2 3>;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+			power-supply = <&vreg_edp_3p3>;
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+
+	ports {
+		port@1 {
+			reg = <1>;
+			mdss_dp3_out: endpoint {
+				remote-endpoint = <&edp_panel_in>;
+			};
+		};
+	};
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&pcie4 {
+	status = "okay";
+};
+
+&pcie4_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&pcie6a {
+	status = "okay";
+};
+
+&pcie6a_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&qupv3_0 {
+	status = "okay";
+};
+
+&qupv3_1 {
+	status = "okay";
+};
+
 &qupv3_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/x1e80100/adsp.mbn",
+			"qcom/x1e80100/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1e80100/cdsp.mbn",
+			"qcom/x1e80100/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <33 3>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
 
 &uart21 {
 	compatible = "qcom,geni-debug-uart";
 	status = "okay";
 };
+
+&usb_1_ss0_hsphy {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&usb_1_ss0_qmpphy {
+	status = "okay";
+};
+
+&usb_1_ss0 {
+	status = "okay";
+};
+
+&usb_1_ss0_dwc3 {
+	dr_mode = "host";
+	usb-role-switch;
+};
+
+&usb_1_ss1_hsphy {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&usb_1_ss1_qmpphy {
+	status = "okay";
+};
+
+&usb_1_ss1 {
+	status = "okay";
+};
+
+&usb_1_ss1_dwc3 {
+	dr_mode = "host";
+	usb-role-switch;
+};
+
+&usb_1_ss2_hsphy {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&usb_1_ss2_qmpphy {
+	status = "okay";
+};
+
+&usb_1_ss2 {
+	status = "okay";
+};
+
+&usb_1_ss2_dwc3 {
+	dr_mode = "host";
+	usb-role-switch;
+};

-- 
2.34.1


