Return-Path: <linux-arm-msm+bounces-47184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 055D1A2CE51
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 21:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89B6316B3A0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 20:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35AB21ADFFB;
	Fri,  7 Feb 2025 20:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jBpLuFpi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3869A1DA100
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 20:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738960898; cv=none; b=hJQyrC+DGhSWQ32LLkIaNz562eviiiXWMUXFuAmpwJgmkrK2V6wWp83eRkj2Xint5O0P0uAWDIx3pWEVuo62rnMCJ9Gkal+JAwiqul9pT9sZBCIMoXTsM09Xb937tM0xJl/r9G4x9a4Lf53eYUe2FEnmMOSZvwHBxPNEEgMzEA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738960898; c=relaxed/simple;
	bh=nvBn7R4zl24lXF8bRo2NYM4At9i0z38sCJ0Oi1zDsD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jAAF5uuMu0Ut08HrfEabVrSwOZbWqJVbWocKeEhlFKMkUHMP3Xmza5fxZSTv9KHG1EDp4cpFq7VufdMO6f2HCdIvKgy3RCcEMRIQRvcH+GLY06wiI/LmLD6csyaRMBeyDf1QHjoDYg4os634mzAM5EdSR45d5VTq3l2elgiIvKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jBpLuFpi; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-308d625295cso8692041fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 12:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738960894; x=1739565694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8UJbddvLQG9wXJNzynWa7omOtgBQR2Tq8dAU0qNTtA=;
        b=jBpLuFpi8awAQFehuVzFwx0neQzYX+5yQzbo+BH9RBWVpP9Q2sPkPHGy7WmdS6+MgE
         LNWGmYyCXUsr7vD3oT7eAbRcufx6H+IMP2s7FTXJ/MZIfTWCsfOGLSf63BgDDOghPcy3
         HgbwlG95W/5ZFgngvHES+ebLwf06g+orrHPZ5Sd80RcZ8B1OxVbqVdKBbAMFGSkVnZ9A
         ipc5n5gsF+gOwsJmdypd/LbqW8R2hms3p8UXF3y0FWtOtpb9WhV6NdsW+0Ayll5daeff
         goj3EadKUYK1jV9GK3Db79CvczAlMUHWLYtjKyN50C75uyLk6p3gaolOu1SENC3UhFMW
         rDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738960894; x=1739565694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8UJbddvLQG9wXJNzynWa7omOtgBQR2Tq8dAU0qNTtA=;
        b=q738emQj4paZuNe1nAeJrXUZfeOCVTeI3GRnugqa6iv5riqGKoFXqDYWFLeqYdAGSL
         SZnMwWDt7firfoRmYS2YxOnmNVe2HnRDLuicHolLBdBMAgchEfeT3Xw8KXND3HI1JLWD
         M7lWXMmyWCsvE6kESyGG8/It4BsxE0IPk5KlKgaN4HBVVAb0vlzY8+adf5qYDWHPw+pr
         3TTijJUMcIc7ubu4bX5aIHIz7493B5wmer4GfGQP0gDf8juTJatZWk2a9gma3ErPdwXr
         epBcrjMNzqtsVrGtjBulBKH0y50dDm9ndIBZSziQHkh6Cq5OvWQ3I2KufYyChz6otbHd
         kaaw==
X-Forwarded-Encrypted: i=1; AJvYcCU8u7oy8cnNWLIQE6zUvlP24VYr5xJoKdwqb8AUhATE/qWTkkeCdj3yosQYLbcSuNn7qHoVVI0bZcJvF3v1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3rvWZp9poinDGNdNbPmLp2Ovhe9wx5Zd7SVuJkaKjt8LuioiD
	akYNIO8+YrRpopYRvtflpbXA7GcpOFxegL9DjdY1u7L1LIkRaTPDFvzwCAWog7s=
X-Gm-Gg: ASbGnctG23o4dj76n+iflDJXeKlOb7TxNISIVRyfIDqidnTk0ZhRk1LssxNuWy41E1T
	eC8kwahdUUnfUi6u8U9D4NaR1n/pPWihQEBN09TUje2lHxeRaQ+RhSsVtAwJSC33sf5IOyLemyu
	UIgp0sLkfTpIjJA1MOAaVYdhYGb6Wb3ZBbrr6mZy8/6XswIKBySbzv/FZYMaSwuOAVMgS4cMYLB
	+sJj0G5mAcVkdQfZkrsNSRX/8rUhR1FX0KfFAxq0TwmwNyfmyriz9FMZzrvg1pndFaWHRj3E4Xr
	trC3hHxE0UcXSBYWmOQF6Mo=
X-Google-Smtp-Source: AGHT+IE+PEeFY+/fGE/0oTDa+1Oyc89e2djwYGmCFITdkpFlLgeM+hJaVdYS05brkuhQo+y4hh2GcQ==
X-Received: by 2002:a2e:b8c6:0:b0:302:175e:5abb with SMTP id 38308e7fff4ca-307e57ce521mr12024031fa.3.1738960894523;
        Fri, 07 Feb 2025 12:41:34 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de178628sm5343811fa.10.2025.02.07.12.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:41:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 07 Feb 2025 22:41:20 +0200
Subject: [PATCH v4 6/6] arm64: dts: qcom: qrb2210-rb1: add Bluetooth
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-rb1-bt-v4-6-d810fc8c94a9@linaro.org>
References: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org>
In-Reply-To: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3166;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nvBn7R4zl24lXF8bRo2NYM4At9i0z38sCJ0Oi1zDsD0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpm/ubXRilr+k7yK/Z4ZjyxXCNNia7uDidNpQ8
 sX5SOfx5zmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6Zv7gAKCRCLPIo+Aiko
 1WrwB/9oYqO4kJTo5HFANYeTOnbkNfsQhepHwUbzzOqYGYqpxQVZmBr8VToM1SAv0sizF0vxQTs
 XRm+qgA1PS9ecw0ruoBWfz7wjB/8Mv45Y2X1RFcLfpwAhtkUlGM9Wz9ceZvmN9uC9DOtS+3TrEh
 YqfaTatOhHYtB85pc6buQE/BBrEmT9XcoF1r5+JI/n0QmKdvxAZDBLy+nDNYuvVIqWBy7q5HAZT
 zLD5FSrzKDxRSPlegfdbm7RJWcoPbjosqd2E9YJCh2uOPOgsK71vLTZsGn1nI631SnNIPytZS3x
 GyHI/Qz4fFFZA2FBmRdktbJdfRS5x+Y7hgMpnaY5qoc7lleC
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add support for the onboard WCN3950 BT/WiFi chip. Corresponding firmware
has been merged to linux-firmware and should be available in the next
release.

Bluetooth: hci0: setting up wcn399x
Bluetooth: hci0: QCA Product ID   :0x0000000f
Bluetooth: hci0: QCA SOC Version  :0x40070120
Bluetooth: hci0: QCA ROM Version  :0x00000102
Bluetooth: hci0: QCA Patch Version:0x00000001
Bluetooth: hci0: QCA controller version 0x01200102
Bluetooth: hci0: QCA Downloading qca/cmbtfw12.tlv
Bluetooth: hci0: QCA Downloading qca/cmnv12.bin
Bluetooth: hci0: QCA setup on UART is completed

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 83 ++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 7a789b41c2f1887f0c41ae24da2e2fe8915ab13c..9a2c86144ed529f13987b4135407f605b9ec71cd 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -15,6 +15,7 @@ / {
 
 	aliases {
 		serial0 = &uart4;
+		serial1 = &uart3;
 		sdhc1 = &sdhc_1;
 		sdhc2 = &sdhc_2;
 	};
@@ -549,6 +550,66 @@ can@0 {
 };
 
 &tlmm {
+	uart3_default: uart3-default-state {
+		cts-pins {
+			pins = "gpio8";
+			function = "qup3";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+
+		rts-pins {
+			pins = "gpio9";
+			function = "qup3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		tx-pins {
+			pins = "gpio10";
+			function = "qup3";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		rx-pins {
+			pins = "gpio11";
+			function = "qup3";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	uart3_sleep: uart3-sleep-state {
+		cts-pins {
+			pins = "gpio8";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-bus-hold;
+		};
+
+		rts-pins {
+			pins = "gpio9";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		tx-pins {
+			pins = "gpio10";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		rx-pins {
+			pins = "gpio11";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
 	lt9611_rst_pin: lt9611-rst-state {
 		pins = "gpio41";
 		function = "gpio";
@@ -584,6 +645,28 @@ key_volp_n: key-volp-n-state {
 	};
 };
 
+&uart3 {
+	/delete-property/ interrupts;
+	interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+			      <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
+	pinctrl-0 = <&uart3_default>;
+	pinctrl-1 = <&uart3_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3950-bt";
+
+		vddio-supply = <&pm4125_l15>;
+		vddxo-supply = <&pm4125_l13>;
+		vddrf-supply = <&pm4125_l10>;
+		vddch0-supply = <&pm4125_l22>;
+		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+		max-speed = <3200000>;
+	};
+};
+
 /* UART connected to the Micro-USB port via a FTDI chip */
 &uart4 {
 	compatible = "qcom,geni-debug-uart";

-- 
2.39.5


