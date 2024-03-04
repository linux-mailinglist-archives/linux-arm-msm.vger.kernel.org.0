Return-Path: <linux-arm-msm+bounces-13244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE5A86FDA0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 10:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAFBD280A88
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 09:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E31B383AE;
	Mon,  4 Mar 2024 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jLfA7UNs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D850376FC
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 09:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709544384; cv=none; b=HJGHU9fMT8NWfz+F3LKsiUquruK/Wwf+Oj13tubHlbPtTHyWVlPEd8qQeWkRMh7Fl4gf//v8hu87PRMP/lFh92DZgMmPIe+lm6B5k9+qKttYFIleAPq6BBn/QsHahvjVY4xQgvlTs1G4gwqTwKTAN0gu4xM7HL5JN7sWRHN8mPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709544384; c=relaxed/simple;
	bh=AeFQeV88ZRaoI5+oi21Zl174Y0LNQdQHWgjrk5kLjUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RQS0ieZa+21WF5wvlnz/llzVKGDf93nQsfS9IeJQvDXwX7XUDyChLgUrdjG7oV/6uCjmE61EuqK2a+wwifv6m+W41sdAOLAsdsRcuzxMWMMfYqkHBz5KvBDLmsMp8w+498+1uvVis8s2epbPlDGwd8/f6Yw6AAvAcGpwJOtUEw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jLfA7UNs; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d27fef509eso58318771fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 01:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709544381; x=1710149181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpuuV28YyYnISt2K5ObSrV0aZBgPNxOMDlX9h4xVaEQ=;
        b=jLfA7UNs6JzcVjhHiY2x3D76iFqCivb+AP1lK6HP6fS7b8kGTEL2yw9KTPg30X9Mt5
         R/pOO3+NDKDTGcWunT6USLXk5zqEl2TTbg/93w4Lt3/Ud6XOyh+MjP1kzqQLy1N4F+8i
         DBZM2eVC5sFEI9tSUpANjt7IgTBETNzzOIz5L5B1pFv/HgJJfMeTnd18vpqEC2173KQe
         EunubrVJtONnhAdNwAvX1+k7el6E4DIkUee5o6YkF/YdqrcjfMGcK062xcapzh8dlRgk
         V81AaZfNJmVbel6cRYU5C5Dkd6Qtjrm4gppNs/reejFi5Ep0pnm28y6w2/czwSfihTYg
         2l7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544381; x=1710149181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpuuV28YyYnISt2K5ObSrV0aZBgPNxOMDlX9h4xVaEQ=;
        b=IA5voxv3JwedBfE0aqFyloUYxCjIIom7MqAxfsAWyM2eHLvHIp9tzJicg2kmlqMoRj
         S0mWbuN6NORlXyq3bDtWuLTkAX1uCpiy/Ni0fprd2Da8yZu1yydODJmdVcLcFsfiaABB
         wwUd0L+8q6Q7FnE5YLOeRyfSEmzMt5weju3+oo8AbxSeP7ZfJafhfZAr0QAhX1w/lSmI
         9Md2ZpjNfzbWh1mP5+Cm2ot2swSDsgQcF1Hy4MkHiQ6N2Ti+9QsTluNdjNRGJgouBpNi
         lDkZH9kNSUGu341lIGG+0gT1xV5GbU3Ryq5WqB3jkYh7e8GlfkqNYLFvGST0WGgvL2jC
         XJEA==
X-Gm-Message-State: AOJu0YytvobR3Y2AvBd7zCD/h1R2h5AiQ60PNi/5oQsW05kFM48le+jr
	IrXH0nhuk9C/tB18AKpjxVwSF/h0Qd4Ud1zP+p/Zmtn2py2dO/xDDX3hgqGPtsQ=
X-Google-Smtp-Source: AGHT+IHjnCEVdQxm5mCAb7PdOuCZCRuJzjyG4toVk44berGu1MWxHAYXsYFbVzrpAbiWlI2iqk+Thw==
X-Received: by 2002:a2e:8ecc:0:b0:2d2:42ff:483c with SMTP id e12-20020a2e8ecc000000b002d242ff483cmr6004977ljl.33.1709544380686;
        Mon, 04 Mar 2024 01:26:20 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id r4-20020a2e9944000000b002d2a4431fc4sm1651146ljj.119.2024.03.04.01.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 01:26:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 04 Mar 2024 11:26:11 +0200
Subject: [PATCH v4 2/2] arm64: dts: qcom: qrb2210-rb1: enable USB-C port
 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-pm4125-typec-v4-2-f3601a16f9ea@linaro.org>
References: <20240304-pm4125-typec-v4-0-f3601a16f9ea@linaro.org>
In-Reply-To: <20240304-pm4125-typec-v4-0-f3601a16f9ea@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3474;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AeFQeV88ZRaoI5+oi21Zl174Y0LNQdQHWgjrk5kLjUQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl5ZO6h5R6Zr0RQFjwJjzDDln+TsMOAIOIOunzI
 dPi+SYyQIyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeWTugAKCRCLPIo+Aiko
 1Qc9B/9p99jj0jQEu2ZrXMGSZ9qhLQVBF8dSgh7FUJIJ8xG8sdoJzLP95GV2YCWbC4EUxl8QsUf
 j8kRAGyE+Elkwb7yFZ4IQg+DWh+8hkxDbfCJE0/l6ktAthSNK/8dQNmjcR/z4TnAu9rYU/96pII
 3cTQA2O/vOklUlF2hu6DLaTmjrZHVeNQiatc5h7CDnFtAtYo4mvAKCiw8wG522uyfC63gw59TU3
 F++u7lY7KRwZ/2RlM563sSk9/ZymAl+f+dgrcsFBxXbWEQLtZPpeITjk8j2rV7b9ku6ukQzBduT
 P2QUWGtLpDKLOVqm+533haBcalrE05mwVdKawiRFL9EwZnfd
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Plug in USB-C related bits and pieces to enable USB role switching and
USB-C orientation handling for the Qualcomm RB1 board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi    | 42 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 60 +++++++++++++++++++++++++++-----
 2 files changed, 94 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 89beac833d43..967bc98d02dd 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -694,10 +694,31 @@ usb_qmpphy: phy@1615000 {
 			clock-output-names = "usb3_phy_pipe_clk_src";
 
 			#phy-cells = <0>;
+			orientation-switch;
 
 			qcom,tcsr-reg = <&tcsr_regs 0xb244>;
 
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
@@ -1380,6 +1401,27 @@ usb_dwc3: usb@4e00000 {
 				snps,usb3_lpm_capable;
 				maximum-speed = "super-speed";
 				dr_mode = "otg";
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
 
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 6e9dd0312adc..fca341300521 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -262,6 +262,46 @@ &pm4125_resin {
 	status = "okay";
 };
 
+&pm4125_typec {
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
+				pm4125_hs_in: endpoint {
+					remote-endpoint = <&usb_dwc3_hs>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				pm4125_ss_in: endpoint {
+					remote-endpoint = <&usb_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
+&pm4125_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <500000>;
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -535,14 +575,8 @@ &usb {
 	status = "okay";
 };
 
-&usb_qmpphy {
-	vdda-phy-supply = <&pm4125_l12>;
-	vdda-pll-supply = <&pm4125_l13>;
-	status = "okay";
-};
-
-&usb_dwc3 {
-	dr_mode = "host";
+&usb_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
 };
 
 &usb_hsphy {
@@ -552,6 +586,16 @@ &usb_hsphy {
 	status = "okay";
 };
 
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	status = "okay";
+};
+
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
 	vdd-1.8-xo-supply = <&pm4125_l13>;

-- 
2.39.2


