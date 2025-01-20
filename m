Return-Path: <linux-arm-msm+bounces-45630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBF6A170B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 17:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9216216A1D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 16:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACF81EE013;
	Mon, 20 Jan 2025 16:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMY66EV9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F41D1EE00E;
	Mon, 20 Jan 2025 16:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737391672; cv=none; b=Sijitz0KiXpE1qpzyhz2o7x0O+7ggtCqgSs16N07sAm5qT2HoLHPD+Rc24iqIiw37dgpCN9GBpFTHbMFX1rAOId0PwXZU5tmgl+wB8Ztp+m0x2UF3N5HmCOmQ8ZJmDXi7fRrqhGtfb7gyYrm0Qo3Z024zhH7qUSEdHkceeMvWJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737391672; c=relaxed/simple;
	bh=YuN2c9W6EQRPv4NlEuuYJwYVAzo6uRjqKAVJpKO3+t4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F6HupMTYfy3bymrRO+GFjhLsNC0d/Vy18jgzc43p/cfgwBPV2KDFmZ7pWRdpXc5QXYQCyRt2qv66M8/9rsa/CgyJHs1QyzOa+8adggy9zfG5PSEUy6/9b1uSJsBKXDgqj0J8L1DNbXgccwHsgfyXskVjndAYB/rhQEFYbv/D8gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMY66EV9; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-215770613dbso58984575ad.2;
        Mon, 20 Jan 2025 08:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737391669; x=1737996469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/Hqjkk9J1a1URYUHxfhR6WnpNhcryXM5Zhz30rZ4Pg=;
        b=jMY66EV9pMogjYTr9ugt93HqvydM1cVN6oio5fh+8Zvk0TkdiyE0KJbg73HW54MEZr
         arVVEkErikS9yYVONdhwrQjhMpZTo4OGm2bRhyNPQjmuL2YMFCcqC+YRgKb9Y5DiBokJ
         H34GVt5bc219FLeccExgtNKx5/5nQ+Qv9W0zYBJj6FC9Gc9iSZpcl6p9NpJveliKv9cp
         SYWqi7gPukGcmoj1+zCgbaZrcBhfN3c9r7e5xEm6bFdFeK0abPH9AXoX+lUk+VY91vPD
         YkCEWI7LtyF0ZXmKDMeMbwzNXhQDO9Of7V6lRT/ce5irJnOlgyguIo3TjSYh8CU4s8l0
         HbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737391669; x=1737996469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/Hqjkk9J1a1URYUHxfhR6WnpNhcryXM5Zhz30rZ4Pg=;
        b=JROQ39Q3Wrzitsdv5oHCQ6Ra9X6VFlo1qMipiM1XBjoPPVXmWiUH3dk6/ymNurvti3
         BfzI82rG166Uc8MJVkbZo9k4UFeh5wJeO6bXFdlrthMWHreEupRkQELO2dhHh0q/hByy
         EUkH0HkQtm/67gJOW1C0L6ZkXD341WlPfxsoyAqqi80QL2Pa+O5mjGqFBpvitAaLhCr4
         Y3tdcNITJiv+N6xiOn9b0+LmHTFnxvxXnWY36GEgPit0lIXET6yj3pld3ioISwBjEqhk
         j+XvS0JlgOr62o7ywXnlNN8+aoLlCJXSHaG6yxI0n8OHvT+TbpngyWcZs0fysG2/A794
         47CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZUJhoKX2lxxo1zFVtoHyX+1Kvw6/9MwtQuPsagpGgFQjIl+/BWal2f/fREjsXzq3E/qz9dF01jk3cA1dd@vger.kernel.org, AJvYcCW2+VcmL/THUIIEVV3B3KXLtsRvkABeirpIhmiU8tT0YAB6z9V2XlxxQe5mcqyU+2Lzgw6aI3c4mH4wSqo=@vger.kernel.org, AJvYcCXKx+XruQFmnVsHNukSSURVv2UHgBZMtPtTjBXlLk/9+onZlgYYRSeb3qdjwervm2I0Wn2/7pO+E+FlVFrnqAc4i9PZQw==@vger.kernel.org, AJvYcCXcuWeo5FYAtgYkN6gqaMuthcBGLACLDdv4BPdafgzPI7ae0HaHVLUH8nQN1sbMz3r9Kgtm4QRp0LHSeRL0@vger.kernel.org
X-Gm-Message-State: AOJu0YwOrLhaeRvgP14OSPz9wOsQNrWkScss2UZtEZeE2mOYB652rEHl
	RlTxQ/C8lSk6dsOd1Y0E8LQlNnPTa7vJoJHMKxGVdvo9XoEzTN7h
X-Gm-Gg: ASbGnctqWXu62F+DaIXsx03OjMeK7qCSF+zv0JxlPLnuvSA2VQwv/r0dd67vo6v3XWe
	qC437wqdpS5mcH66iuw5T8ox7/iLUsuszgExjRcX5eL594fEH92Er3uirqtLqet9EDp94ZkFiOC
	BzWhkiJBI6Vg6fFYzcUrz9xzW/WVG0odxWqtLC0h2H6NgZf2aspBhs2aucF19qWc5fxCWZ3eJtP
	HuYh5cfttT+298dB3dAGofDi1Pa15S19jL+hIxBT439k8FlcjjeWQUT3IBnOWap2XuOy28=
X-Google-Smtp-Source: AGHT+IEf5YqJiFLTBJSP0kqleTRhyB4HPnKQFCC29x7vHSFoeqiKrN/hmc6lbBGjMEFwBtllYGRZbA==
X-Received: by 2002:a05:6a20:7492:b0:1e1:ae4a:1d42 with SMTP id adf61e73a8af0-1eb2159cc48mr24429739637.31.1737391669594;
        Mon, 20 Jan 2025 08:47:49 -0800 (PST)
Received: from SC8280XP.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcaa3a97dsm6017266a12.9.2025.01.20.08.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 08:47:49 -0800 (PST)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND v5 3/3] arm64: dts: qcom: gaokun3: Add Embedded Controller node
Date: Tue, 21 Jan 2025 00:47:01 +0800
Message-ID: <20250120164701.7918-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120164701.7918-1-mitltlatltl@gmail.com>
References: <20250120164701.7918-1-mitltlatltl@gmail.com>
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


