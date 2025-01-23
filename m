Return-Path: <linux-arm-msm+bounces-45999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3757A1A70D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 16:27:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C5373AB636
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 15:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7880A2135D3;
	Thu, 23 Jan 2025 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkci6zzo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83EE21322B;
	Thu, 23 Jan 2025 15:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646025; cv=none; b=HWEFM0CJ3iBr2eJfTHkrPCm9o/O5fCEEZxv0UwE0LFcHP5+2XaaiAYlx4zrYMY4SvqEiaNoNdiofn4Yyer2IbKeGkf5N56F5YaoAhL/fucNwBNVr0vEnYWCX5c0piqE5Gzl/ZCmonAegxWUICWycmWKc24lCX3KgoeBwtBfsc58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646025; c=relaxed/simple;
	bh=MTePTFZO0fJY5+8Rwq04Zyp4iZ/qTd/L+xe/WvK/kzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CkDtO8cyvjsI/b1cSHmyXTDYtb80Bk8dp3yQkKsYp+5mmjTjRgRl1DTr5omPETTniDrNh5az15xq/cO4mRuEbzSOC36TK48c1/MlBhWccXNi2Tb6AGuwEqhNuKhZBQSVOO0yJe9dTUGkUS6ZZmSacehfSFDddZguw9Mp/VN2y4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkci6zzo; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21631789fcdso30429005ad.1;
        Thu, 23 Jan 2025 07:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737646023; x=1738250823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6kosElOaSMZSNtX69a/Hsyj1tzL+5G6ZJzdXAObE/E=;
        b=nkci6zzo21Lkz+kGzYwoAPi8Fm/sictfW8Zit06qRcfKvPJ71KmLgw3khkKGLg+7ib
         FbxK6Aw8okO6eCUlkvArbXfpRm0FaK/qcBhb+6oShoJLKGz09PXj0ffeHwirmu3GEFJy
         L5k/9W7QPzJ3eD/eJVsxETx0YyFnau0bDXOvgOBWrzJojcfmdGd/VlCzgOcWM0CUy8kE
         t+o+I1wZAihf5X1fR5rkRCV3QdzMpcWHEQY3CKntV3alQENgORZcSQnbpnYxW6ukqa6Q
         vy4jnITe9C225fiV5r+iLGXlcyrAfTIkn3ZWOMmAWNCIjHNXido0w9hgPAAUpciMbyBB
         mlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737646023; x=1738250823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6kosElOaSMZSNtX69a/Hsyj1tzL+5G6ZJzdXAObE/E=;
        b=SZtbLPs08w/MUHNrF6dRIv3t3ZHwXnHrVLpJxFlDPce1vkD7WTXbIuaUAT9CuEf5bg
         /wN/Mv2NCvQR3pw2qj4n2RNJ7EsAMeMFhfWCyDfTum/1opXmLJvQdJFQQHCZd63Yji9+
         5PTCd6Peo/ivX1IOXa4+6OhtWw91/UVjiYV9dhfx1kL2WnYJwWOkuzCPsx/aFgyWzORG
         Ub++WP71Mj+xArs/wf5cQ5YwQTOZs8Kg9l9rKj78yFdubKcLgTDgN2+c9+DPsvJBnhqJ
         Nl4lacy9zUd8QLWo5MwPAly6YdoSiMIdm0ZAFxqij2D1CwcNm+Mas1VWMajFQ0iPJrUB
         10AA==
X-Forwarded-Encrypted: i=1; AJvYcCUiqK3x9JH1aDN8U1BOfVJPYAN1RPndrYmZufsUmO8Lr6YwsUqqXlcXhmrOhQ1W2j/NxoeUEbdURtKKvC4r@vger.kernel.org, AJvYcCUyST4BVrvhM7h7SxkfmqIIH+MPctNzkaxNzo3U9fE0wdkCpvcyj7CPyzTN2B4ZQq5/j7s4iO+DiYX6etA=@vger.kernel.org, AJvYcCWKsHOne/Ixue5xegryUCt2sKkTYfBvs8clk5UbvdPtAkBfc7CG2XPaUqoRsZrZm3rx6s1xZHXloQsJjIGL@vger.kernel.org, AJvYcCWsFTqpS5/HXTqilkl7oqV8A/Yq5uXA/vng2dkzaPzbwulMpwn6GMhYRDpJEImxtaCSnJPnfcUciSaplnM4U2FK+H6k6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+qcgUCtQGYL5FjvHB6SvJcI8wl43BSzIc7MzTtXaXREuM1+e2
	bnCCa0hXBbqD4aeePn4+MtDL6jH2rqsEXtYQv/nf0vJqYfzD3vNS
X-Gm-Gg: ASbGncvpwNbtTMfaDF5ML8GVuHt2b4T9wBlKeOuxpHKu35ok8EV9p7n4D5/pUUd5JZs
	MGo3FazQ5CGi63c9USCwP5+zgImMXE/PQf0O1xf0XUqYnwGXQRjqMdAGm9MSqqznOIycDcryIaw
	jtID4PseXe1LSWrIzEQ9MVEGO0zxX1GHVzoSET+LcTm0kPqspkj7mWEqt2pNlPQ1uTKkDwFplHt
	J8FqvxPhXhTp1h68yeNNu0+onKQD3mbyxOXhDJvEwtmUw7q/NZmCoqRtd91Zl7sxt7hvyJMrxBI
	pkVA9/jcoff9Wv2r
X-Google-Smtp-Source: AGHT+IHFlluqRzeoleihkx/bcTrNne6uQb8YuY7g6wHNtvViX8qKUhx6520LrDuU/chdPPdA2LdZDw==
X-Received: by 2002:a05:6a20:9c8b:b0:1e1:b878:de64 with SMTP id adf61e73a8af0-1eb696aeb45mr6435398637.6.1737646022746;
        Thu, 23 Jan 2025 07:27:02 -0800 (PST)
Received: from SC8280XP.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf707dsm11247915a12.32.2025.01.23.07.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 07:27:02 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=83=C2=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 3/3] arm64: dts: qcom: gaokun3: Add Embedded Controller node
Date: Thu, 23 Jan 2025 23:25:59 +0800
Message-ID: <20250123152559.52449-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123152559.52449-1-mitltlatltl@gmail.com>
References: <20250123152559.52449-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Embedded Controller in the Huawei Matebook E Go is accessible on &i2c15
and provides battery and adapter status, port orientation status, as well
as HPD event notifications for two USB Type-C port, etc.

Add the EC to the device tree and describe the relationship among
the type-c connectors, role switches, orientation switches and the QMP
combo PHY.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 09b95f89e..1667c7157 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -28,6 +28,7 @@ / {
 
 	aliases {
 		i2c4 = &i2c4;
+		i2c15 = &i2c15;
 		serial1 = &uart2;
 	};
 
@@ -216,6 +217,40 @@ map1 {
 		};
 	};
 
+	usb0-sbu-mux {
+		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
+
+		select-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb0_sbu_default>;
+		pinctrl-names = "default";
+
+		orientation-switch;
+
+		port {
+			usb0_sbu_mux: endpoint {
+				remote-endpoint = <&ucsi0_sbu>;
+			};
+		};
+	};
+
+	usb1-sbu-mux {
+		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
+
+		select-gpios = <&tlmm 47 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb1_sbu_default>;
+		pinctrl-names = "default";
+
+		orientation-switch;
+
+		port {
+			usb1_sbu_mux: endpoint {
+				remote-endpoint = <&ucsi1_sbu>;
+			};
+		};
+	};
+
 	wcn6855-pmu {
 		compatible = "qcom,wcn6855-pmu";
 
@@ -584,6 +619,97 @@ touchscreen@4f {
 
 };
 
+&i2c15 {
+	clock-frequency = <400000>;
+
+	pinctrl-0 = <&i2c15_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	embedded-controller@38 {
+		compatible = "huawei,gaokun3-ec";
+		reg = <0x38>;
+
+		interrupts-extended = <&tlmm 107 IRQ_TYPE_LEVEL_LOW>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
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
+					ucsi0_hs_in: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi0_ss_in: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ucsi0_sbu: endpoint {
+						remote-endpoint = <&usb0_sbu_mux>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
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
+					ucsi1_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi1_ss_in: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ucsi1_sbu: endpoint {
+						remote-endpoint = <&usb1_sbu_mux>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &mdss0 {
 	status = "okay";
 };
@@ -1004,6 +1130,10 @@ &usb_0_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_0_dwc3_hs {
+	remote-endpoint = <&ucsi0_hs_in>;
+};
+
 &usb_0_hsphy {
 	vdda-pll-supply = <&vreg_l9d>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1025,6 +1155,10 @@ &usb_0_qmpphy_dp_in {
 	remote-endpoint = <&mdss0_dp0_out>;
 };
 
+&usb_0_qmpphy_out {
+	remote-endpoint = <&ucsi0_ss_in>;
+};
+
 &usb_1 {
 	status = "okay";
 };
@@ -1033,6 +1167,10 @@ &usb_1_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi1_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l4b>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1054,6 +1192,10 @@ &usb_1_qmpphy_dp_in {
 	remote-endpoint = <&mdss0_dp1_out>;
 };
 
+&usb_1_qmpphy_out {
+	remote-endpoint = <&ucsi1_ss_in>;
+};
+
 &usb_2 {
 	status = "okay";
 };
@@ -1177,6 +1319,13 @@ i2c4_default: i2c4-default-state {
 		bias-disable;
 	};
 
+	i2c15_default: i2c15-default-state {
+		pins = "gpio36", "gpio37";
+		function = "qup15";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	mode_pin_active: mode-pin-state {
 		pins = "gpio26";
 		function = "gpio";
@@ -1301,6 +1450,20 @@ tx-pins {
 		};
 	};
 
+	usb0_sbu_default: usb0-sbu-state {
+		pins = "gpio164";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	usb1_sbu_default: usb1-sbu-state {
+		pins = "gpio47";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wcd_default: wcd-default-state {
 		reset-pins {
 			pins = "gpio106";
-- 
2.47.1


