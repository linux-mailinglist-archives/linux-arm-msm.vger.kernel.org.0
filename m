Return-Path: <linux-arm-msm+bounces-7228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B49B82CEA5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 21:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84E071F22046
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 20:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B15318E2D;
	Sat, 13 Jan 2024 20:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mu6HD8DW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0FC18B04
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 20:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50ed808db11so4822091e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 12:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705179365; x=1705784165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3WqPQqMhpu3cR1Hf9/2WsEYMLGlQ4ylvG16zRtJv1g=;
        b=Mu6HD8DWsWELuRtG0tYaHlhzc8A+/zvU9/zT2wo+lS0RXWS1LqRZudHtcgw7ZlrdTh
         xq0TkVl2k8c5v5DF+z5jEt4Edo1ooR41kMNsuEEMm6SySfOI+TlfRRsdXZTFqiYBEjDr
         xarjtfZzubyF7wjAZFxJ8VDLwCslGapSot3E/qq4a4tFVIt3sDvsiT/EdSOjPN2O5QpH
         nesxnSWIoHTKQ04c7eNaBhEadU1LUdhDzcGFHq0fo/UNLp+Fc56R9nIRJdJ1p6lwmsUz
         w9HaJfHKg/BrIqsM8b5vHCXNHXwRnwsViDwQ/8kTs+83y2leZ6KZUK1Z1h5KK74FFU+2
         aZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705179365; x=1705784165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3WqPQqMhpu3cR1Hf9/2WsEYMLGlQ4ylvG16zRtJv1g=;
        b=thEPx1X+flqwyZAQyQxPLxeox3HtqZqkIDPf6rLSvoqaHKTWkmsnAlm4cMJp4q9N4U
         WPqI184Hdgf5uoSJ/41OY/xaVTX1mfpZfoLvgTZ5se1U4lbx3d4OebAHThm88CMv5GCb
         +tBPgEcw0VqjU+laKmmT+S1CU18M9sRdkYE+NfHwGafaNGkuLJf8AsLzimo2WpcnjMJu
         W1a9gpcoVAX80n8xaW7Tvaij0X5ymci8yeodBjGktC8h1qhK63XktQZ5PtrnC06z626I
         3orniHz8B1C/23hZt6SZvgEk2bPdj6IafQOxgN+XDeRWbERso0G/5C44aDIOqfTsYN0C
         on/A==
X-Gm-Message-State: AOJu0Yy/dFL72oCaSSxniGMPq6tPm9Fd908DSPgTwicnID+ryQ8rHFMk
	qOs43nhqJQ58TaVJuVF+l4sgPiwwQHUqJg==
X-Google-Smtp-Source: AGHT+IHoxTXkzP/XPfT3u0hUoP6WnqNyOCTq8GbneVE2E6Aj/bXR7prpCOngtnBZcVXVwtjGiBiLhA==
X-Received: by 2002:ac2:43db:0:b0:50e:3b8f:3c40 with SMTP id u27-20020ac243db000000b0050e3b8f3c40mr1404982lfl.43.1705179365104;
        Sat, 13 Jan 2024 12:56:05 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p14-20020a056512328e00b0050e9355d7eesm919802lfe.103.2024.01.13.12.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 12:56:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 22:55:58 +0200
Subject: [PATCH v2 15/15] arm64: dts: qcom: qrb4210-rb2: enable USB-C port
 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v2-15-182d9aa0a5b3@linaro.org>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3380;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XAUYT0JI8EGw2t2EwxsMog3tphSISbkThFhkLyZxRdY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlovjYIg71eDGgUhWPH+SjPHm4oIIik1Y2R/pIb
 75l3i29BimJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaL42AAKCRCLPIo+Aiko
 1WqdB/9CYDUoI9k27gvPkw54OvJgUI9rmwd+I3OFtDqKSGk7n6Z0slhDzwM92kwibCzirbZS2Qs
 PoRsEZAKV17iiz5fDVaPou+GBqVywPM81njziMdDRXt0lQJG3K3HXEKJpNOtiTFVeTzDtr3ggE/
 lSTQwGkRddo14aBxz0l5ud1+f/g8VHtY3+FTwRUcXvDkfaxeTh11D+DnPlpr9UrSlnel3kh8HXH
 lUagL5gLd4TOe6C2f+MyCF/jHTbrzcTWBhLlGL2wDSOCL5R6ahy9wvzeeMB3tFaoZumbCNjXpul
 BO9jy4WDFuoyPoQTEYTf//6ZuOKXychZTbkJSxqolEKHEX1r
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Plug in USB-C related bits and pieces to enable USB role switching and
USB-C orientation handling for the Qualcomm RB2 board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 50 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi     | 43 +++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 52f31f3166c2..696d6d43c56b 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -6,8 +6,10 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm4250.dtsi"
 #include "pm6125.dtsi"
+#include "pmi632.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. QRB4210 RB2";
@@ -256,6 +258,46 @@ kypd_vol_up_n: kypd-vol-up-n-state {
 	};
 };
 
+&pmi632_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pmi632_hs_in: endpoint {
+					remote-endpoint = <&usb_dwc3_hs>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				pmi632_ss_in: endpoint {
+					remote-endpoint = <&usb_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
+&pmi632_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <3000000>;
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -607,6 +649,10 @@ &usb {
 	status = "okay";
 };
 
+&usb_dwc3_hs {
+	remote-endpoint = <&pmi632_hs_in>;
+};
+
 &usb_hsphy {
 	vdd-supply = <&vreg_l4a_0p9>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
@@ -622,6 +668,10 @@ &usb_qmpphy {
 	status = "okay";
 };
 
+&usb_qmpphy_out {
+	remote-endpoint = <&pmi632_ss_in>;
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&vreg_l8a_0p664>;
 	vdd-1.8-xo-supply = <&vreg_l16a_1p3>;
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 76c429e8ebab..01dff6641280 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -878,8 +878,29 @@ usb_qmpphy: phy@1615000 {
 			clock-output-names = "usb3_phy_pipe_clk_src";
 
 			#phy-cells = <0>;
+			orientation-switch;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_dwc3_ss>;
+					};
+				};
+			};
 		};
 
 		system_noc: interconnect@1880000 {
@@ -1614,6 +1635,28 @@ usb_dwc3: usb@4e00000 {
 				snps,has-lpm-erratum;
 				snps,hird-threshold = /bits/ 8 <0x10>;
 				snps,usb3_lpm_capable;
+
+				usb-role-switch;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_qmpphy_usb_ss_in>;
+						};
+					};
+				};
 			};
 		};
 

-- 
2.39.2


