Return-Path: <linux-arm-msm+bounces-84289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E57DBCA24DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 05:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D0943003175
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 04:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DE42EBB98;
	Thu,  4 Dec 2025 04:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YYLWFmi+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F300D2D7D47
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 04:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764821726; cv=none; b=szeRGiSTZv1xKH/VBomrKlbb/aUdo9TcvpPHvNYPkcN0nyjpblRFb11dKASP8fYnFTy8XQIeGk/yAngGwSfk41fa2RLivGEr9mOSwDKHV4h7xUxhwztSMO3j3NjG1qVX/+yMP4lqA1lcp1kDoz+mZdsdck1zl3r++5djgBRlLb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764821726; c=relaxed/simple;
	bh=TB0MBPr5fdXFRf8nAGZOfdvDlYolRPXfysDqnB+9WDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ao+IviwznusG4vRZM9zHYA2trqKVO653nOZC2WDJ0iCYlT2uEXuVl3MJE4vugsKiSqt5tnvNjOQu3Iri+JhIkM5mn56BoAwF2HS6xbzF4k/XOpqB/SThkMeRe92m1iRiE2IZZ7EwOJRt8dtzOXSVjWEfbe5q9LVP8NDItcV1VF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YYLWFmi+; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-597c366f2feso64932e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 20:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764821721; x=1765426521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0psW2YITj/BGz/R7G0e5/YUOTHhnc+iM0R98Ei9DYWo=;
        b=YYLWFmi+uhxfYuyiM0HVcRbnjXpWQ2cctQeL+okq9qpJOI7x181S/+mTvQWjv+ODu0
         Jrx0FlkakGM4m2jECl65+Deq5cMAO0YBJg03XVRh5M/l3SQuT99kPCa5BOEb8nVE5KMt
         SXfzx1qj5Uv4wUUaljlbnxOyblfx3V9WRc0OEZrxI0fCaxFGyXvebVwLi6cz5U6UpAmq
         pwOelCbDVzdzTt5djDLjvmdvMv3WEfeYzWYQ1JOVGg9HX/HoResqBdJCyRHQO1NLl7eZ
         MdstCL6YPpeuRBnJXvbdkbfyeV3gIYAEM0gJDod6NoxMG/IZSakOdLIEC4cQanVc+l8d
         KDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764821721; x=1765426521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0psW2YITj/BGz/R7G0e5/YUOTHhnc+iM0R98Ei9DYWo=;
        b=h3hkpnPTVLXvGd0ierWnjQA63xAkc/WnJsScq8/K5il1matQVnDIbf4lTm6RPN/t+m
         utD9I/j8lHbOOiuZ92IpLsZ4DKSV+vjhCIWcYBmaJ9A9m5DLddk8V6B26VG48udsBMxZ
         oGie1cZP5eRCs44h8VJ2U423caQdzdEvV5ToJtIers89QgABrtyFc3rmCVq4r8D9b5CQ
         O8jhrj665hlwmyLZgWZMhGUo2+xv3jAadSt/2z+udvGmoDJO+vjbp6mSYssRDkBfsx3B
         o5wpSAYmS0As0aQJv1C39aAdYT1WuHvfZ+3pJ5gYaeFZHihTjxvh2KSWOFJD5a4BYB/Y
         X3iA==
X-Forwarded-Encrypted: i=1; AJvYcCU/sKqOBoj9be0+MUjQmS0PqiHmplBMgq1zzxUxXLTotJIZcapvP6bIxMBw8Hu9Uaai4p5eW+AN3qhPAGAY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm+FbIZPyiV/2YPkoOPqeY7HhN27/WyDYEQTeubSxAEfAYAuK7
	JYCYp63LA238WlGLD+wZ/akaAx9MhxBqeNsJlO35+SMG3eNDsSCMWGpRezxk615AoZiH/hOLO96
	9SChX
X-Gm-Gg: ASbGnctSFX3VVxNUKfRS4f5CmxMskT+XltUvUJd+26bVdyRAln1PpVXiC3BFZrJy8wX
	FA6wSTLLgZqt7664Vt190Hnq1A33hIjs1T/CezuBjJ0ccI3Kzqg0JrTiWiSEh9Wl8xZ92AmLCZm
	ozc275awpY4mlll8qWe8hg+75GpMR58kYpjYduRhpiUDDO43HllaTBmuuVTV9P9sJmgRcIM2FbX
	3oYM0LFzUP1C59TO7yMaC4GKaCJbcLOQeWpzHJIHsRjGrpzBfuti3VjlSOlYQPIJy3HGD7h2Q8M
	Y+VxNtsbXlqsZC7bIgmhj+YPAwUwV7/BlxuC5njJJeVRqJVP2ZABZsPPXZJ8CTSDc/PsDk55ky5
	jjwHNUpSROgC+oLe4EzDyS14TVaMcPxbLb+3Rz1ubv2T61c/ZwFiknBX8muWWVkjXfHrmM81I0L
	sbeO/BMifuQQtMsPdAWR0UtLuwehVrrMHxravZg14dbaZiVb313pbWBA==
X-Google-Smtp-Source: AGHT+IE2C36kK5XUmomK7mcLwCorAXmkpdRBp6f+4+t9Cgh48ryT3PjGZXSf475IzaSimfPGZpts+w==
X-Received: by 2002:a05:6512:1329:b0:594:1992:3be with SMTP id 2adb3069b0e04-597d4afbd1emr715501e87.3.1764821720706;
        Wed, 03 Dec 2025 20:15:20 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2a1sm67649e87.64.2025.12.03.20.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:15:19 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm8650-hdk: Add support for the Rear Camera Card overlay
Date: Thu,  4 Dec 2025 06:15:05 +0200
Message-ID: <20251204041505.131891-5-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251204041505.131891-1-vladimir.zapolskiy@linaro.org>
References: <20251204041505.131891-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To provide access to camera sensors a Rear Camera Card can be connected
to SM8650-HDK board, the camera sensors are:
* Samsung S5K33D ToF camera sensor, connected to CSI0 over MIPI D-PHY,
* Sony IMX766 Wide camera sensor, connected to CSI1 over MIPI C-PHY,
* Omnivision OV64B Ultrawide camera sensor, connected to CSI2 over MIPI C-PHY,
* Samsung S5KJN1 Tele camera sensor, connected to CSI3 over MIPI D-PHY).

Get the initial support of Samsung S5KJN1 camera sensor and two flash leds
on the Rear Camera Card board by adding a board overlay.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 +
 .../dts/qcom/sm8650-hdk-rear-camera-card.dtso | 88 +++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-hdk-rear-camera-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f34d5ed331c..35839b993bc4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -315,8 +315,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-samsung-q5q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-sony-xperia-yodo-pdx234.dtb
 
 sm8650-hdk-display-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-display-card.dtbo
+sm8650-hdk-display-card-rear-camera-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-display-card.dtbo sm8650-hdk-rear-camera-card.dtbo
+sm8650-hdk-rear-camera-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-rear-camera-card.dtbo
 
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card-rear-camera-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-rear-camera-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk-rear-camera-card.dtso b/arch/arm64/boot/dts/qcom/sm8650-hdk-rear-camera-card.dtso
new file mode 100644
index 000000000000..8a7c6d7634d3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk-rear-camera-card.dtso
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * SM8650-HDK Rear Camera Card overlay
+ *
+ * Copyright (c) 2025, Linaro Limited
+ */
+
+#include <dt-bindings/clock/qcom,sm8650-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/dts-v1/;
+/plugin/;
+
+&camss {
+	vdd-csiphy35-0p9-supply = <&vreg_l2i_0p88>;
+	vdd-csiphy35-1p2-supply = <&vreg_l3i_1p2>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@3 {
+			reg = <3>;
+
+			csiphy3_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&cam_tele>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sensor@56 {
+		compatible = "samsung,s5kjn1";
+		reg = <0x56>;
+		clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+		reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam3_default>;
+		pinctrl-names = "default";
+		afvdd-supply = <&vreg_l7m_2p96>;
+		vdda-supply = <&vreg_l4m_2p8>;
+		vddd-supply = <&vreg_l2m_1p056>;
+		vddio-supply = <&vreg_l3n_1p8>;
+
+		port {
+			cam_tele: endpoint {
+				link-frequencies = /bits/ 64 <700000000>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
+};
+
+&pm8550_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_YELLOW>;
+		led-sources = <1>, <4>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+		function-enumerator = <0>;
+	};
+
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <2>, <3>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+		function-enumerator = <1>;
+	};
+};
-- 
2.49.0


