Return-Path: <linux-arm-msm+bounces-46631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C92CA247F0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 10:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E89DD16661A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 09:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB42F170A15;
	Sat,  1 Feb 2025 09:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tSJViwnK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E156815B0EC
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738401515; cv=none; b=ixOsrIqlma217wLjYU/2XWwc+KYu82837K6zyL2V4J20bbu7qNuASwYhfOwWwFaCqXfCxcHidSq6Ob6Eog91z/VTYHF0Vf/6Bh0vAzRljbWw1SlWjHp2LBSp1CmoOW0f8xwvOzs3ypjVnnyYHywfhxwAtdl0cJs/fmG9/P6uSPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738401515; c=relaxed/simple;
	bh=HZSRmLC0Y3vRBFov52uSE72iZIw43GshJDEASCPg0Lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gR9WyVkFsVet+ovBuCHyFcBfpnvqWQ1wQhn/35tP3hVSSpJiF6kjL5SOeoH8Y0maBgV85HsFR+46vDXZPM6rMEZXhnfRuVs00V43UyPhSASEZu/Zuf3dSdf2+wSBEwQBFpNcGUIMnDiKMN3/CqqTltWAPV9CV3UZnwyL0X1M5Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tSJViwnK; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-543d8badc30so2899611e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 01:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738401512; x=1739006312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DE3tyRugtbBbwb5/qBds84HRv3FrHZrDnoYQR1RwwhU=;
        b=tSJViwnKCrf12EVAxSrllB0ttG9bLGf7hCdf34Ns/D3XlJQN3/xYoKedEuy3iqYaoE
         1eoDWzhBqAbrc2zDJZClismsv/Zu0vAC/LO3CjokPr1rwX17G+tooHV0Tx5RuM+rYXp8
         sixWrq8YiJ8aVxCom9HgkWu5QhFe8ZZezMsGhZOJ/s35tVo24nkCbHgqHslKezZNGpsz
         7AUOlyIcdlxTxXBUT9dNzJgrvgt4WK9IRwBjAKKU7kRys0e2wWvYJBQK8UKY1h3S7f9G
         gzAdefusVgZ7LypWQmBC7DowJG7mQ4gwPGDEJDiSuG4XGH9My76Qkh3BRejydppRWOV0
         E6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738401512; x=1739006312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DE3tyRugtbBbwb5/qBds84HRv3FrHZrDnoYQR1RwwhU=;
        b=bjXoQ3nBP2rgMZwZS82JrL45J4CSbcFIrAonVxnT6bnv5ZBzLdO7PjrkZxK+lANWBj
         75muHj6rbIBZYWcFErz5m896olFFjCxz8IDtDRqYoAJL2owl/3bW6X4WTjL8ER3rMU+L
         uy78KS5A4Zz2VlvDhnM5XUjYWgyWSuIxyWaaMtNdi2ZTUH2SewnNdppvXwAoDbTKltdH
         k/tfMZMnPWTGMKHNALd9ncrI4rr0bTkViSKV93IHxsgwx9zLlAQolfgKW8r9FLmjZj+r
         oCmKYnX+qVhUer7cp/ArPFWM9J9FPCaBpHL6uACxKs/nWYhBK9Z2f65wAHOXRiRyKlxT
         68Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVDuR2Ol34WY/ZZIdY66yQNIPTjgZKbITQN/CiVdWH7sYXRFV5U3z4eytap+lgL3uayft/Lr2PteB+DrDnx@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt07gZkNsyucRC1v9xcGYERvQzg+m1Ke2yY3QTmvNLHPWILRPG
	YzQj0ed3ArTmjigb6UEdLGRGqfavrZa5jhPmQKoJr8iG2hrfJQSnTcOSB/nVEVQ=
X-Gm-Gg: ASbGncsmufWTbAQ9pg6Rlp5BYsdWY92Ekc+Sot6DVTEhRjMCFLEw2rBQ5eCEE+MUyU0
	5Dg5vDTzD+PXM0jNQz3PbDyURaYVIDy1d3DZibm+ptdeViY/8rNnibY1NQZE4vVF6OBeqrbNwBL
	1KtAQNLQ+H7A9E2Z92MTx9bx10n2otay9z+AND0nDYAoPxz3UxujDNpKNpm5kD2Fx76XyVvBLmB
	RWoLkD33lhgpiyEFXTlvzer9AoMVWrOs9jRZE+jLM4KONoRjMOeJ/0kU5kwDyCMrHuoTKoVeSJ0
	N4G69fyvdTyvfCLLhNIt+98=
X-Google-Smtp-Source: AGHT+IFe21U1IlPS4x+T4yASJ7xTnVn3osFOXoCkAT13PTPtSXL7mLE5yALNh9bOA7uW6MRuRMxFNw==
X-Received: by 2002:ac2:4155:0:b0:542:2166:44cb with SMTP id 2adb3069b0e04-543e4c372d3mr4045479e87.35.1738401511938;
        Sat, 01 Feb 2025 01:18:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe0ff47sm711234e87.93.2025.02.01.01.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 01:18:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Feb 2025 11:18:15 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: qrb2210-rb1: add Bluetooth support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250201-rb1-bt-v1-4-ae896c4923d8@linaro.org>
References: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
In-Reply-To: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3063;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HZSRmLC0Y3vRBFov52uSE72iZIw43GshJDEASCPg0Lc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnnebckokAP8uTlRjuuGQS1EydPg05UnSfhdcBK
 h/ymwhC8mSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ53m3AAKCRCLPIo+Aiko
 1QDHB/9/g8L/8xi9FbapXjniU6lHAcvCdTF8lKitUp1rPCd20TzISTNzSWNmTZwffhmFuhFaOmS
 CwH/eCnFBNEes2nLsYMw7j6X3SXMpDRMIyvA9iHLr5tLMAq4dHOiWKX1QF7rVFBVrL6I60huEoz
 noauOfgqwe+OYMibAgsYKvZonpW0TwScpeaugF3j0k2ydB5fhvVJNQupE53dg+dDn7n8iMxP9Nl
 uoXW1l5u9AvNKM8G7PrpBge1CGxNzLXpBgTb64po65XZU2iM24CffrVOi1+fegIqEsuUsN1w7cp
 t1P2MBapIJ9GmiPeKh8LxNCL65uHnE5QfrEAiZpMeDvuu5Vx
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 81 ++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 7a789b41c2f1887f0c41ae24da2e2fe8915ab13c..9bb2254d3198b18908bb6ba201602aa809592dcb 100644
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
@@ -584,6 +645,26 @@ key_volp_n: key-volp-n-state {
 	};
 };
 
+&uart3 {
+	interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+			      <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;
+	pinctrl-0 = <&uart3_default>;
+	pinctrl-1 = <&uart3_sleep>;
+	pinctrl-names = "default", "sleep";
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


