Return-Path: <linux-arm-msm+bounces-46672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA2FA24DEA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2025 13:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA7FF164013
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2025 12:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D8E1DC98D;
	Sun,  2 Feb 2025 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oHl597bl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93001DB13D
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Feb 2025 12:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498580; cv=none; b=EeYE2nf1/GZqrzuTwCOadbfxl99wM7hE1DMaOCeeQUcs4SaVw29TwZUZnzttYKNxYCEe8gBazIkfAmqYhGAcTASkE+jKdMnP5n2x+qlHdt/VJnVqD0kwTRysliqmM6elvf8gDbMzohPwUDOE8vg2z7sfO2bKEN+w0TZ2oNcIB2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498580; c=relaxed/simple;
	bh=JNFb6Y/XdVHYoGkQV0QeQUNrQN1lFqLu5lpLIO5kuFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UXpIpKm60nJr/hXiD0DtpawsFH8zkeVWk1qurPIMBRyE/YzoRo9i9LF6I3XIQ93mDesDTmcQK7taObPJEwHnkDguKswvModNz7cKhxzzruepJp8M08TofKbE2jztprydizHizuT5NKfcTMHAPg3c5T1VsQBwysoDmu7qJM0eLsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oHl597bl; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso4098476e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Feb 2025 04:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498577; x=1739103377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ov3UCovqBDyElf7wgQMMIsdctTosh7cq25mLIhj+V3w=;
        b=oHl597bldXrjDkLKrDwsqZBIFvlxUBjIMVBRgxwO+fb6o7eDABcNdC3HY+UQlVP90t
         CmDI2qVBPYQZAeijNunYGEZEPULJJT+8E/hJI2LEqARFHHB4OWiSjoSrexVB6xGlx1o8
         +LLA9F3bIi9Y9SxwaWuvE7qLNCbeFQGIKA1mWdVvIKxhSKW/va0rHhPHZjaSeROnjw5M
         sdKPsBUwBJrx3iKFX08QpTddetsf3UlStTu2av92uSaDg6EkQZWEcZ3Bh0iRXWk7v5Px
         XQ1XD5IUHl+HEm9weG0uvncaU0nhXXPEn/EdkQNkd5lwXYs0PlLbdIuxHP/w0P739btr
         2org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498577; x=1739103377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ov3UCovqBDyElf7wgQMMIsdctTosh7cq25mLIhj+V3w=;
        b=eYLPzRUjNZ6tVXjQeNHKsDWTs+OKy0hUKZrrthnSx0qZ8lkWiPwT4dHDuLQPkhlZfj
         uxMPySYDocPy2fHKC9+MOoM8TCc+mh9tMQyDpTk2vAvlZC5yMRnvMtn2iQjcz2VHwM2y
         j0VhJJKsgEaK+uCTm5ADSv1r/nHYVChwC5db6yI6FnYYW0HuKcM/hiHGVhHE8QJcZR/e
         vVIe/eA49PT+P3oXKUXABh08brzn6qXPJOsGiRhs++5bglU0WprNF1mwtSy5P2nfsMJc
         NKNCymVpSSOKHVghub3W96CvT2mHvt99Y7YP4MCvearNKU+DUCGI8d1LHxCE4fUfpBl9
         b7AA==
X-Forwarded-Encrypted: i=1; AJvYcCUwkAx3h/JU5pn64BVy4yNCJt2ElO5dvqaTCx2q3Ra4ybZGVY6hQnTXQf4vYwTIWjr3n5cmsOu5C+Rq2SJE@vger.kernel.org
X-Gm-Message-State: AOJu0YzGcNG7URuygh3qRzRaGAbqk6QS1CcEa5y0qPfJuxdJbkdpzBaL
	dEJZvvaNSq/2PLMPgZtDHKtM+eFhP79CUXieJ7TxtLa6KpL+CBtnTirOPdGJ5YA=
X-Gm-Gg: ASbGncuYvC922AwLYVCgymqlKe+AFT/dPLAnjsjIaIzqna5/C5NOdU59rNnzVEoTNoW
	99n/Rbzb7xavQg6lqvNRBBKIaw+0XshY7h4q2U90Qx7jD3GbVsGlVFdqbZ9GoOrexjbIHzEwXPf
	TReBSVluxEwJjbXG0NUtzh27BTmssX1CxyYv4ZFKSHs6JKHGQH8i/dHJUWjF9D+rjNcWOl30t9J
	2t58YbMQDFZdWwAs5aQK2ayscET0rQw8X2jfeRVGN0dLpQ4QTf43W7sG0bGZA0zBrnW/PvgkDLP
	2bUvwZBD7BkYLbNVBiYR1dQ=
X-Google-Smtp-Source: AGHT+IHU+cY7Sd2FJwu/fK+FejNxlwvrPxT3OOghYyb0HQvwwOLYe3yknR5BZu/qRImPl6zTGSjVfg==
X-Received: by 2002:a05:6512:3d2a:b0:540:16b3:3699 with SMTP id 2adb3069b0e04-543f0ef2da1mr2889703e87.9.1738498576871;
        Sun, 02 Feb 2025 04:16:16 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb0a4esm950663e87.114.2025.02.02.04.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:16:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:16:02 +0200
Subject: [PATCH v3 6/6] arm64: dts: qcom: qrb2210-rb1: add Bluetooth
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-rb1-bt-v3-6-6797a4467ced@linaro.org>
References: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
In-Reply-To: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3096;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JNFb6Y/XdVHYoGkQV0QeQUNrQN1lFqLu5lpLIO5kuFE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn2IBlxn0ajqkpQJUmshzRsvUxqdik1OzGVj7t
 fB8L11OJ6uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59iAQAKCRCLPIo+Aiko
 1UjUB/0XgJhzc/BM7b4PFzB0HBDUYi2cf0F8MCk7zDlSJF2i5R7Y9caEeQDxOtJLsLwumoRLsHk
 agl+SbPPMD1Ko63Ke//UhzKdl3q+0CSY841s1KHQaXSMTBnA3rb15CxX9c76QhEStY1pKeMpIIp
 LQOjfnEMjl+ZptAlrSK7lrcLtJeISceoQK0NVWvkEv3S1p9M5F200noLOF0mjxht2cp+JNvJioo
 sCCO0nObmvH1ncL0QIVmR5PLmHkq9AdgSUbgY3J69PMNsu9Gb/ViXkZwziVsLYVNfB51JDs6B+g
 MO81NMCey11gEa1Q5SB+2me34bViqTFIUjHaNJhFg/W65eFC
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
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 82 ++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 7a789b41c2f1887f0c41ae24da2e2fe8915ab13c..b9248505fadd3b986e188976435b786f43975dc3 100644
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
@@ -584,6 +645,27 @@ key_volp_n: key-volp-n-state {
 	};
 };
 
+&uart3 {
+	/delete-property/ interrupts;
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


