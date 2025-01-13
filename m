Return-Path: <linux-arm-msm+bounces-44900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83589A0BF50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 18:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AD281889F34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 17:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF551BEF7C;
	Mon, 13 Jan 2025 17:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSOosu6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE091C3029;
	Mon, 13 Jan 2025 17:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736790804; cv=none; b=cr1wIZkAIlDgE8AVEOLJz4Cn6GkbL3e8U/HaLtt1LqUMLfrC6DmWAaaFqnEF/eQzSlRmutzJ6p74EfqLIw8UqvaBnqIT4fXj192OeUp1bD1qkN1gtOo9IH42e0yrDoEHo7X6k3Rppe254okeJyDLTJ/JrrsQvFTCX7cVtMa8hKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736790804; c=relaxed/simple;
	bh=OwVWuseTNWroA+uJMs7XSqwDxqtJXywX6tYH7cAdya0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svSobE0HeNYCS3ynzbP+8oO7g2Jy6E5U46w/8DoJ6OleaC1/RgE+Q82fg8PV2nsxV7Cm14AUIhgVBRU21s5pHXhIU4cPKH2sa4FJLsXQa9eslUSnxWEmNNFSzG3RESb/mZHCb+MRzqDw+ah97hiF1SMceks9nri+CBWY8SsvASE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSOosu6d; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-216634dd574so52687995ad.2;
        Mon, 13 Jan 2025 09:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736790802; x=1737395602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28V0RQB8EoSyy3cFCq4Krah5UQMbH1QJd6NpV+bZku0=;
        b=fSOosu6duV+J4i8pZvA0rfduZUCndiITiXIkYqSoWlfC5VRDyhZzRuMREvuU/me3vA
         tof1KqtBo3f7oZtV6WroflSWu3oAYDHTHi1a8CLGfk5fnYoeiFWOKAFpKqIZcOcRIuco
         IsXtpoETkX6VzRkISYgtz40vvFtkog8RJSsnkkMyneSWZYtCkViKvjmLxcmO0/A4JgMD
         AQtFUjrBnYrR0Sgj7fQNtq7jsgSB96s1ytNTLlMsuSudQmjAScBd2bgH0Nb9GtsQUJCa
         Bphyr5gMr9gpvkYSTUGXvBneTsqX8kViIzady76J812SXr/bKiVnqFLbHuvvWN7m8eva
         tDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736790802; x=1737395602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28V0RQB8EoSyy3cFCq4Krah5UQMbH1QJd6NpV+bZku0=;
        b=UqbnkdAl3PDrumHiyr5cgR3e054l+H0JcM9GNBc9J7OIgPRpHr+czzOvM+I+AGexCd
         gveAd6BN7+aa77tQ+cN0vYsyEqubvJUgDA5NS559EFU30apUHxaCjC1mNRj198Vnf6Rn
         RhpBV9LrFg+GpI2KJC+ez6qzDvrt9+qR5oqVbTrGay5BMogsyQqQ+IgzMypFnCBzvXmD
         eWvQT6KGYdNuHwDJsFiLyHEmj0izAHXXn4vvuLsRfmwMcXQYY9TnO9t5Ukg+bm5MfijK
         fkIYEJ0ZZi+Ctj42ng/eLBv5YSV8Yn9DtiHYDZW1kamTa8mDuJ8y+9FayTR+6KXWT6mn
         6GHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEnAiX7xDcmYhlycdM/sQ6ZWpeCgpi2XYP7JH9lP2+CyfcFQPmvrYZ8+g6rklRpcQeJdrOVKTzidAtDTgO/g==@vger.kernel.org, AJvYcCWmq0oMQQ4LRkpmomhLJm9PWO14MhYkOe1oPiAWcVYg2pr9Oc1GcyM/T74WHW5gXN/CMz9/xmC7TOZmM0g5@vger.kernel.org, AJvYcCWxDEKDHVVAYDhTxWGuQEvEVXqtD3ee9IXR1YZqHEQ4+VYDS9+2QC+3mWyTu1Ff1AkW8YJKLG6DHF3a@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnu+cdVMyocXZqdYWSrhpx+oEOQyTE4Nv3BjBzjBXWt1shHgrs
	RxiRsaognrbZ9CJPoqw5UO8DILP0d0iwbwUMUAnGlWXY7qssuMFE
X-Gm-Gg: ASbGncuFGbE7OJdtHrQBQRhFp/R8q/bX5EhG8Upz4iCCCuBIxfa/KZDbq5f9IKQEqNq
	T9qQMGCDq/sdSofFjN7jtMPZ3VCgWCrtTo+ksl9m13YiMBRb3IsNp3Xd8aVXPsbjc2VLcaaVnd8
	hPRvMWsBoK+HKB5RwgVUgUkr45a2OFhL02kzDJJS27RVCAOMdhFdmbp33usKgmO2fKgCRX2QARz
	30BGRZg+SVdRzlEV8et1R+YfwGt6iOpXYfa5Ik5J2UJBmI9qiOMtuA=
X-Google-Smtp-Source: AGHT+IGto2BaQi68523DsR3iDavWRRsTMrTS1ATGfAroiQo6cHE20D2gdGngXC1KyKQ3zwQ4S9MgSw==
X-Received: by 2002:a17:902:cec5:b0:215:8270:77e2 with SMTP id d9443c01a7336-21a83da4965mr318816775ad.0.1736790801823;
        Mon, 13 Jan 2025 09:53:21 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10e0c4sm55724905ad.24.2025.01.13.09.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 09:53:21 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] arm64: dts: qcom: gaokun3: Add Embedded Controller node
Date: Tue, 14 Jan 2025 01:51:28 +0800
Message-ID: <20250113175131.590683-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113175131.590683-1-mitltlatltl@gmail.com>
References: <20250113175131.590683-1-mitltlatltl@gmail.com>
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


