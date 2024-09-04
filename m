Return-Path: <linux-arm-msm+bounces-30702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3565896BA1F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 13:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E229C28165B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 11:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96271D014A;
	Wed,  4 Sep 2024 11:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z+4PkCEE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA0C1D1728
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 11:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448603; cv=none; b=J9FSOwLK85ejD3SIUgvC0EUt1maaMBwDG4qPBRdqArd19ztly0Iok7EJiRSNTazjyg7GDethuFXptLDrjy+BfX8vQm6yG8MitsB+RcF8enDy72RPmjOAZh7UIUPwplsyajkUVa8cy7Zl6KbVm9ifzy9JvkqiLfQwxNM0CgfVTcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448603; c=relaxed/simple;
	bh=BHNkXdbuDeSyYWH9x4xrrrvKy2er25z0pDR6JsdyCW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ExNu0X3Pwsu2TOb7GizdsCvOTVSzYvpRNgBQG0WrMn0WDDw5+SUUpaBA4unhQqlSMiQTn/cczWbDBzhnPUp3DK8sx9uEHfj+iRZDpOev3F5URXUYDUavM4yrwPPC2fCsW1DzPse9K8larLVzIDsYl0BtrLMb0YI2tqnoLjKs/pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z+4PkCEE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a86a37208b2so766319466b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 04:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725448600; x=1726053400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipXOKg2vsty97f8SFqB8vFyC+yH7gTEtBFNF9Xo9UzI=;
        b=Z+4PkCEE/MvM6QRo7hpMoOmw1vC/HiPAwz+egy79I741SrOyn68UWl3orQHFAx+JwM
         OvKixKYpMwgwE3Dx1K6FsUjie+M/Jyrmnv2kSfCRG6faY4y7gYZQCUTIDxZhtoJZKZwS
         9+1NdlbZGgrXRNdodeba7qEsPbRDHUZvct6LxLjMg88rR1nHVaRBAWxwNQpTnJvhAB8I
         /ISMAaDTJjNc76hy/7Xec+hjrCl5BDfz4TtT9VG36pgMT0zOm6p9bl6qkX3J3Ax/RF8t
         F5j+BkUmKQuCZKC/mpGJxSng9di2X72eOJSeDwWueiTnwJlt7Hjzbli9Ybddl64avCBt
         fKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725448600; x=1726053400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipXOKg2vsty97f8SFqB8vFyC+yH7gTEtBFNF9Xo9UzI=;
        b=CAnbaHsf2toUO4dOoaFeg4MXGVo2+ch8nwsbxOCNswHr3bj3zFRAyrwsD2wb6/dHo6
         x1jbUiq7mh6hPHlqDS6MsPfA3Q8U/BLt6qwdCYzEt+9YsHWpbPhmMtdQiS2ci0m7CEMl
         n01F3Hsp60AUrWYK7dUcKync0u9MaGLwcfuZESKLb/8IXEQ1WHmem8XLJNItsoFeJQg8
         UeRd0jHyjwjj1Xy7prfyyEV+yK/JH7mJMg9Hvh0iX70LbjlsPoaist/wRnMmsOctI3MT
         gnjy8zrE0fbLU5AkLqFZISPdDF9X+iHi6DoNJ3XI+W1gq5o7PGznunAliuqJZERzVBEu
         CXSA==
X-Gm-Message-State: AOJu0Yxv1VJu+QZoI5TvKBNG3pG5Z/0oXAvWZWIlCtloq2oEtQyvWIcd
	ZXCqUWtzHHUYYBli/vdC52hJrN4A//VV6iHlg2uOZ6iHctLTnh8CzLe0omt2XLem3tYCXagVJPY
	s
X-Google-Smtp-Source: AGHT+IHwtdshFf0dfpckpv2T/Fj/yJtZic99KVbVLqK80IyhltpeU/Wy6QEyYVWtLtXPTuOX9y8Lcw==
X-Received: by 2002:a17:907:7256:b0:a7a:a30b:7b93 with SMTP id a640c23a62f3a-a897f77eed8mr1684926766b.2.1725448599800;
        Wed, 04 Sep 2024 04:16:39 -0700 (PDT)
Received: from lion.localdomain ([2a02:8109:aa0d:be00::a253])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988fefc12sm793401966b.9.2024.09.04.04.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 04:16:38 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Wed, 04 Sep 2024 13:16:26 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: qcs6490-rb3gen2: describe secondary
 USB port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240904-b4-rb3gen2-usb2-v1-3-b858e681195e@linaro.org>
References: <20240904-b4-rb3gen2-usb2-v1-0-b858e681195e@linaro.org>
In-Reply-To: <20240904-b4-rb3gen2-usb2-v1-0-b858e681195e@linaro.org>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3115;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=BHNkXdbuDeSyYWH9x4xrrrvKy2er25z0pDR6JsdyCW8=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhrQbjpO5gnT8HtjNO7NLM9DtyuRHWkV6uWZpD9uTnrDee
 3RS/NWJjlIWBkEOBlkxRRbxE8ssm9ZettfYvuACzBxWJpAhDFycAjCRw0EM/wO+dkRr7fbRPqD3
 pyZLeH6EItPj7o/eE985mP+euKKqqY+RYf3y1Pl2rRMW/nnb7yP09d3z00z6EzzUcpelS5bW2sW
 x8wAA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47

The secondary USB controller on the rb3gen2 is routed directly to a
mico-USB port where it can be used for EUD debugging or in OTG mode.

Configure the controller to prefer peripheral mode (as this is almost
always more useful) and describe the connector, vbus supply, and ID pin.

OTG/Host mode is untested as I don't have micro-USB OTG cables to hand.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 513d5265bb13..fe66f589cb5b 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -62,8 +62,30 @@ hdmi_con: endpoint {
 			};
 		};
 	};
 
+	connector-usb2 {
+		compatible = "gpio-usb-b-connector";
+		vbus-gpio = <&pm7325_gpios 9 GPIO_ACTIVE_HIGH>;
+		id-gpio = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&vbus_usb2>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb2_vbus_detect_pin>,
+			     <&usb2_id_detect_pin>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				usb2_port_connector: endpoint {
+					remote-endpoint = <&usb_2_dwc3_hs>;
+				};
+			};
+		};
+	};
+
 	lt9611_1v2: lt9611-vdd12-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "LT9611_1V2";
 
@@ -195,8 +217,18 @@ pmic_glink_sbu_in: endpoint {
 			};
 		};
 	};
 
+	vbus_usb2: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_supply";
+		gpio = <&tlmm 63 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		enable-active-high;
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
 		regulator-min-microvolt = <3700000>;
@@ -683,8 +715,18 @@ &mdss_edp_out {
 &mdss_edp_phy {
 	status = "okay";
 };
 
+&pm7325_gpios {
+	usb2_vbus_detect_pin: usb2-vbus-detect-state {
+		pins = "gpio9";
+		function = "normal";
+		bias-pull-down;
+		input-enable;
+		power-source = <0>;
+	};
+};
+
 &pmk8350_rtc {
 	status = "okay";
 };
 
@@ -718,8 +760,15 @@ &remoteproc_wpss {
 
 &tlmm {
 	gpio-reserved-ranges = <32 2>, /* ADSP */
 			       <48 4>; /* NFC */
+
+	usb2_id_detect_pin: usb2-id-detect-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart5 {
 	status = "okay";
@@ -758,8 +807,28 @@ &usb_1_qmpphy {
 
 	status = "okay";
 };
 
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	role-switch-default-mode = "peripheral";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&usb2_port_connector>;
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l10c_0p88>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+	vdda33-supply = <&vreg_l2b_3p072>;
+
+	status = "okay";
+};
+
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&redriver_phy_con_ss>;
 };
 

-- 
2.46.0


