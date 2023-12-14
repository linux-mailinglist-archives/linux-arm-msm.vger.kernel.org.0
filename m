Return-Path: <linux-arm-msm+bounces-4844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B18D6813D52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 23:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4DD81C210D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 22:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD309697AB;
	Thu, 14 Dec 2023 22:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GQRGbq6N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8BE66AC5
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 22:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50be9e6427dso9301035e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 14:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702593347; x=1703198147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiGNO7nGH5sqI7oztw8qtdAlF8p3tRMX/zxT4K0FOs8=;
        b=GQRGbq6NmOcbDPbKAvtcx1SsveQxars8UBpdjsSVtYl6w8d7dOzQPm7d2jIokHaPqV
         P9gBzvYFurymqoYDxBqxNaxi3SU/7EjthYEa8TBw5OgUbtIu21tgyU14KqtXoTQ8pwMf
         Cx91SbYn0gcpeBvb54XAJqxYOFENgRACZ2Hs0ay8KimxGJ7/w5tkqzHwVpXf8EbDg6cV
         6rStI9okSZy1M4J0ql6rq6RUR57BKT7USynckAp/GcL8GmfoQjVtxFOYaO2BpqUGljkK
         CNaJZfm6yVob1znnljshojocvXQLYBnm8wbGjZ0YHdsEBOM87HJ60O9cBmdeH3wTKfFW
         gV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702593347; x=1703198147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xiGNO7nGH5sqI7oztw8qtdAlF8p3tRMX/zxT4K0FOs8=;
        b=r7fpriApWe/JeJT9wTZf82Pj5v2EM4voDHpXQ2Y/2Ot+QcPa/tEWAH/utGNtg86mgI
         Sb325jF8V4+SbBfUS0pDnNz64OIsgkiSiclc9azLXkjpeZKFW9bVgHnCDSVYnHeLFhPn
         4/utm32s7PX+qBoVHEnfP6s30p3/Hb/rPzY/rPdbq8bOoMwXpJcovfpoxONBgUCO5ztt
         9e3SMDUVAThOOcleyUPbDSxckMFHlCsva3KB7wet5rXGjQ3m63eNwgNSX9UrhX38hcrb
         wlM9wCSCXADDG5LRkusqw3SPjxZqopAK+ELW96Ttwnnr9vppEZ+EIjrnxaeCM5u0+QW0
         7rNQ==
X-Gm-Message-State: AOJu0YwsSdK/31EFSqX9sRUTzf+kmyOpbHQF3YEUYItkXyKpJIdCWBgw
	mijFqxRs2KILhPsDf79pbUe25w==
X-Google-Smtp-Source: AGHT+IFeDhTZrElLVi1BTa+Kqi/GgurYBdQaTzuH5fmaAQAWUgaz0Gw4xz3UseUEJ7V43iydOfMAjw==
X-Received: by 2002:ac2:4e4d:0:b0:50b:e605:f872 with SMTP id f13-20020ac24e4d000000b0050be605f872mr3840171lfr.23.1702593346791;
        Thu, 14 Dec 2023 14:35:46 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id z9-20020a170906d00900b009c5c5c2c5a4sm9975877ejy.219.2023.12.14.14.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 14:35:46 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 15 Dec 2023 00:35:38 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: x1e80100: Add some issing nodes
 for CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231215-x1e80100-dts-missing-nodes-v2-2-5a6efc04d00c@linaro.org>
References: <20231215-x1e80100-dts-missing-nodes-v2-0-5a6efc04d00c@linaro.org>
In-Reply-To: <20231215-x1e80100-dts-missing-nodes-v2-0-5a6efc04d00c@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4659; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=VbKD9ZfFBOu/1RFjFMjVNWqxFtSzzqvj9RY5eif77qY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBle4M9Ycx7iTatOnT4kOL8Su6EHFlUw7nsl8yNV
 555rqqjxW+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXuDPQAKCRAbX0TJAJUV
 VhRhD/9xSkIK6tMruDquGq1wZbJephAPFiorb3nMbg8RQZHh9EJRwmRXk6n6fT+uAVFWIbHvmJW
 EaHL1rw5RM7hN8NzyEw68abgwSiA9db1vrKYEfIfTl1q86Cbr3pqwQcBzZCy7FkhPSj0XTVilbO
 MxflMjDptsDiwCtJAkpQuWkcKQ7Ae6j5sRz9h348Dpam/CrDVQ7l1p3zhi1sVjSW51XmeDTiS+F
 y9va0gy1at6BUS6Zop1pyiisdhcMHaw8TX+EDdu+FDhXRMEQaM8Eqjkh5KOrEJ+kCFXYfaEsJNs
 aQIow2OHYtckotjgGBCHML50WI/Nsf+CpamgIiuIfcL2kBjkJfSXmbKUQez8Vrxl+g1WldNHnU3
 omyMNslMeAQOSCvBiwxtob0JXGDZjuiUhOncZiZUj4t92aYQD52Wh0TfI42DrjfMk3zLenG4s+K
 ETOWrzn8cMoFuwX/joLaPsM76HgXLecPRfzkyFP1Wcw5WpTbvh+5crr++i072jYHPXsImkdugiU
 5htYmu3udkN7IFi8AAvE70Eb//yOoR+dpbMRsvpiMWq5RWiztmzLJJryEiVPlm8Y+ERqXrZPJT0
 fSaksLFI6ZKuBOvk6FuuUjYKTCEU11YflfTLNyrU3rIH0fAyXFTVo6slSejh6KgCqheGG9GQNH6
 x0AUlvzSdgmxNUQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Enable touchscreen, touchpad, keyboard, display, pcie and usb
and all related nodes.

Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Co-developed-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 221 ++++++++++++++++++++++++++++++
 1 file changed, 221 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 7532d8eca2de..d44898453315 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -401,10 +401,144 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchpad@15 {
+		compatible = "hid-over-i2c";
+		reg = <0x15>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&tpad_default>;
+
+		wakeup-source;
+	};
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&kybd_default>;
+		wakeup-source;
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts0_default>;
+	};
+};
+
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
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
@@ -416,9 +550,96 @@ edp_reg_en: edp-reg-en-state {
 		drive-strength = <16>;
 		bias-disable;
 	};
+
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	ts0_default: ts0-default-state {
+		int-n-pins {
+			pins = "gpio51";
+			function = "gpio";
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio48";
+			function = "gpio";
+			output-high;
+			drive-strength = <16>;
+		};
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


