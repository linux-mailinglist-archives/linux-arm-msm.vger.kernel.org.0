Return-Path: <linux-arm-msm+bounces-4954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD7C814F0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 18:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9B061F2213C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 17:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C5330133;
	Fri, 15 Dec 2023 17:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kT3VhiU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058A630123
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50bf898c43cso939456e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 09:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702662126; x=1703266926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKgsVk0fjSxD37WNiVSTe954mlFL2bYCq2rQX68jkaY=;
        b=kT3VhiU9QeQt9z22Kstvbm4CmeiQYmsTiyXzKhrycGhCPyCOAdFKhD39HUmlc7BsRg
         tgXB+4hkY2uYVU6Pv9bqTsCl4q2VhleplgQ9+vcbqIC7ey11wdygLERnEcCMmjMiR5Un
         PLeam/3MDjCSCe1oXABxStmuNkBy2zUi34OdWtLBRrycubda2i6C53Pfj4CihCVkTBYu
         8hhyECtpt7+s6r7PfU62A2WeXjZ/2Lbc4dZ9POwWt1pyPx7eiWJQVA7RfAY/5POOgjdK
         fJOEnp1e3XmJZBSrQLGqxhJBGdh2/lH6EpSF3lsOwWJC2jTU5OXieiPah4SlKg7YWkVv
         7s1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702662126; x=1703266926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKgsVk0fjSxD37WNiVSTe954mlFL2bYCq2rQX68jkaY=;
        b=iX5IJKb1xm6eWAhV63VbNu/gc3VZA/2dkGCDcumkUYu5O/ap8MaoNL7NqFe+0fUU3K
         PXXwxLpKbbQARyMGe3QuB8zM35HjoBxMVc9NrC9qLhx/WntUEjG6Mme8kIvRU1cs5tNw
         nIjMR/MAx5iDX3GeU4m3hEYkUHvwua8+bEv+WUxiHH7Qyb6W5QXCDnV3B3zHLf7ImVML
         0cg2d0fgmkydmQzAi16Wdsc9dghoVry6Q2xHw/G6ExoXiM6OaNuS8l9oV/wVcZ8BjRt4
         beJNiqahkIBIeD1UtzqKf1YfZWx4Q9sExN1NtwnOe88pNWEk3FcKohLvAKA/h/j9ubRV
         xZyw==
X-Gm-Message-State: AOJu0YxA3/ji0S2/lqJQEnrOlfysLSsdNfw3McNVluSE9epl8N/2Z0qG
	427x94dOOXFIWf5tQzc7WOYdVI/JSerJkMPutOThew==
X-Google-Smtp-Source: AGHT+IFlvxXC5TE5auDkzGipxwETeZ8JnKAa47UPmrKiIe2mKiF+REikFN6qCk/43O/2LJaQMRKjcg==
X-Received: by 2002:a19:4f49:0:b0:50e:2222:6ca3 with SMTP id a9-20020a194f49000000b0050e22226ca3mr175189lfk.90.1702662126180;
        Fri, 15 Dec 2023 09:42:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (85-76-13-188-nat.elisa-mobile.fi. [85.76.13.188])
        by smtp.gmail.com with ESMTPSA id c16-20020a056512239000b0050dff5bb793sm1389263lfv.143.2023.12.15.09.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 09:42:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 7/7] arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode
Date: Fri, 15 Dec 2023 19:40:39 +0200
Message-ID: <20231215174152.315403-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215174152.315403-1-dmitry.baryshkov@linaro.org>
References: <20231215174152.315403-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the USB-C related functionality for the USB-C port on this board.
This includes OTG, PowerDelivery and DP AltMode. Also enable the
DisplayPort itself.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 124 +++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index ea4d75308ac8..de670b407ef1 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8150.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -374,6 +375,10 @@ &gmu {
 	status = "okay";
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
 &gpi_dma1 {
 	status = "okay";
 };
@@ -382,6 +387,29 @@ &gpu {
 	status = "okay";
 };
 
+&i2c4 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	typec-mux@42 {
+		compatible = "fcs,fsa4480";
+		reg = <0x42>;
+
+		interrupts-extended = <&tlmm 152 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc-supply = <&vreg_bob>;
+		mode-switch;
+		orientation-switch;
+
+		port {
+			fsa4480_sbu_mux: endpoint {
+				remote-endpoint = <&pm8150b_typec_sbu_out>;
+			};
+		};
+	};
+};
+
 &i2c9 {
 	status = "okay";
 	clock-frequency = <400000>;
@@ -436,6 +464,15 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&usb_1_qmpphy_dp_in>;
+};
+
 &mdss_dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l3c_1p2>;
@@ -483,6 +520,65 @@ &mdss_dsi1_phy {
 	status = "okay";
 };
 
+&pm8150b_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <3000000>;
+	status = "okay";
+};
+
+&pm8150b_typec {
+	status = "okay";
+
+	vdd-pdphy-supply = <&vreg_l2a_3p1>;
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "source";
+		data-role = "dual";
+		self-powered;
+
+		source-pdos = <PDO_FIXED(5000, 3000,
+					 PDO_FIXED_DUAL_ROLE |
+					 PDO_FIXED_USB_COMM |
+					 PDO_FIXED_DATA_SWAP)>;
+
+		altmodes {
+			displayport {
+				svid = /bits/ 16 <0xff01>;
+				vdo = <0x00001c46>;
+			};
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pm8150b_role_switch_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				pm8150b_typec_mux_in: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				pm8150b_typec_sbu_out: endpoint {
+					remote-endpoint = <&fsa4480_sbu_mux>;
+				};
+			};
+		};
+	};
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -493,6 +589,10 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
@@ -568,6 +668,19 @@ &usb_1_qmpphy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l3c_1p2>;
 	vdda-pll-supply = <&vreg_l18a_0p8>;
+	orientation-switch;
+};
+
+&usb_1_qmpphy_dp_in {
+	remote-endpoint = <&mdss_dp_out>;
+};
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux_in>;
+};
+
+&usb_1_qmpphy_usb_ss_in {
+	remote-endpoint = <&usb_1_dwc3_ss>;
 };
 
 &usb_2_qmpphy {
@@ -585,7 +698,16 @@ &usb_2 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm8150b_role_switch_in>;
+};
+
+&usb_1_dwc3_ss {
+	remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
 };
 
 &usb_2_dwc3 {
-- 
2.43.0


