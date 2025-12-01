Return-Path: <linux-arm-msm+bounces-83914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AE779C957CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 02:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2925D4E067D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 01:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502E81C6FEC;
	Mon,  1 Dec 2025 01:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YB7dHId5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F74A19E7F7
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 01:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764551760; cv=none; b=LNAtVxHLtZ5XM7LXrtfIxQhVuOTiuovL89/XhzjmXUOlGqEOFgeIrbUR0R5npVJ/EBddUtav22J25qw5QdznIykVkK5J9uq4RZXzuKwWFBc1ewQ+1NW4PoqXUzxEUrmfberrJI/9S3cL3DGxADtDpAESi332lAFQYgUwAnlSNIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764551760; c=relaxed/simple;
	bh=IRggN3lmtuL1+sRl7lfs+N472nG3VqsOqQtqcI6fI1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S2jlEWgkcS+CcMcdVqeuBITDlAAs1+bdhZUaUidXi8B4YrNU/i85ZfkigEX0GkRKguNa6TD8pmnSjQlVwsp0TKdrjydIoL4y9RH47D6FfDui4OZBWuZXrKZbrJmdqBDCdk1UDmV01W9N5bsV7N4ZGsc5SXLdN+wjhonoHj4ZUlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YB7dHId5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775ae77516so37229525e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 17:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764551755; x=1765156555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caWS6hPO4Twt32QiX0Ivthekj2EdbIJLrCvPNIpwXHU=;
        b=YB7dHId5c2L/m4gcabJCjaOz7qt33PZi07+6m7ucpj/pXE/4wmREMpA+Yu/j9sAnRP
         kFq37apsSwpxKziId/WKqNk0Gk9e6V25lpCmgN8kYIot6SbRPGFT1eCC60FVzNGuC/w5
         8WPi9Y5U2/CAh2cIoUh7GnA+Piz+JbRmM+o2EjuJx6PwLjQiOYkvLOROZnsniu5yww4+
         Ykgo7wyjkB5895TPD9wFemZaIT1VFgwmuQ2hPIDDnmpkMav89tkLde2UQ7EguXZYtsg0
         azt5m4ei1IfttLhfcB+QDWE366FZOo42PVUbFaGFal3D5av+zhfYghA0TTi7xWWxDBy+
         HCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764551755; x=1765156555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=caWS6hPO4Twt32QiX0Ivthekj2EdbIJLrCvPNIpwXHU=;
        b=p0eJLyXunXQ6AJfwdlrL2s6wHOr4VAjxE8RY8vNX2LKjMb53FGASU2vaYnTWgiBuEM
         vNpHPcoGDA7922mjqsz/PIdO/9lZSJc2H87drO2kQJRLeWMNIAY0K/gx8en0MFT3vB5r
         mUc2Q5reS8beSRiRFyziahGzt22SKBdL8N4t5K9YRsYfO/pSbhhEqs2+tSKEi5h09Iqf
         3JjY8MLLz95w4Zf8iJkOluTvt2pOeLA7qVuySwG7wuqPZRU5MG3YB7miBkwK81ryvL71
         FYC+1+EVwgF+5uzALt8aZLqD+69zbhTVaxNJyI1ZKjoVYoJ8yUZh1wd+MybBQpoe4ES/
         kpgg==
X-Forwarded-Encrypted: i=1; AJvYcCUEM2x5osNcafF/FyAEEGM8JtFXS34eodl/GYe6lychl6J68z/ecrwlwsV6Ef2aV05WLFQnUjFGnF4+/sgs@vger.kernel.org
X-Gm-Message-State: AOJu0YxwCxtJaaC+aYCAgBf2ZqSTR0nUbAbwzpQd7oUvCrpnAau8u8KK
	Dh4dJlHNx5L4AlfJ2Y2Euob4TgXdCdmmkMIciWAOKZjPOBiFk3mtM9yH
X-Gm-Gg: ASbGncvXZdLUHlaq4KXEzzyb8+/pKY6arByq54wSiAtf7P6yidaVskdajBwFRcG3WY5
	/zBer8o25pArv0hEbVueOvA55MdlQsdU7EsCRBnj1MwZpt6o/hFkzo2ksb+fJcqznISLcsmxDnY
	3ZLAbooy5JmzcVBJlGnm8ymXeml4dtFydX92TO3vJWrrrHh4rT/CQOXW1XgBsVoVcLyyv4Gxbh4
	zkLSMwjtVcY7OkJvefP3ym8htynQXRieS0jxOwx4Ie/SQHdmohmFhgGOyBVZjpD2335KvtpOGKj
	95JvC2niQgMjFSz+KiG47aY1xR9xczIdYqB1kETaF+OCQpfJ9MKAFIStlAZmWy2soI9QvGSGZ+g
	dxGXm3oE6kni/N5MourA0yITlhKWiKkXIJsLWBASOWTHePWOVrP33S3C6aiFog7c1I//rmr2AoS
	xb6KGME7XgetlW/n4+CJlJQtyn/5yyDViwhNOfIcgMjFU5hQ8G01CBqg==
X-Google-Smtp-Source: AGHT+IHEW3Rds/1KMTMF2j8T5zYO4ugi7BR6V2zJhUiHqId4d56QcNhq/Vr3IbhqYQtytyHF6ksGVg==
X-Received: by 2002:a05:600c:4ec7:b0:477:9b4a:a82 with SMTP id 5b1f17b1804b1-477c1138445mr357584795e9.35.1764551755281;
        Sun, 30 Nov 2025 17:15:55 -0800 (PST)
Received: from alarm (92.40.200.0.threembb.co.uk. [92.40.200.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479110b6da9sm216152305e9.0.2025.11.30.17.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 17:15:54 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] arm64: dts: qcom: Add support for Surface Pro 11
Date: Mon,  1 Dec 2025 01:14:45 +0000
Message-ID: <20251201011457.17422-5-daleyo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201011457.17422-1-daleyo@gmail.com>
References: <20251201011457.17422-1-daleyo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add device trees for the Qualcomm X1E and X1P-based Microsoft Surface
Pro 11 machines (codenamed 'Denali').

This device is very similar to the Surface Laptop 7 ('Romulus').

Use a similar strategy to x1-asus-zenbook-a14.dtsi so that we can create
x1e and x1p-specific flavors of the device tree without too much code
duplication.

Hardware support is similar to other X1E machines. The most notable
features missing are:

- Touchscreen and pen
- Cameras (and status LEDs)

Tested-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |    4 +
 .../boot/dts/qcom/x1-microsoft-denali.dtsi    | 1338 +++++++++++++++++
 .../qcom/x1e80100-microsoft-denali-oled.dts   |   20 +
 .../dts/qcom/x1p64100-microsoft-denali.dts    |   16 +
 4 files changed, 1378 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 296688f7cb26..fe2054ee093e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -336,6 +336,8 @@ x1e80100-hp-omnibook-x14-el2-dtbs	:= x1e80100-hp-omnibook-x14.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-omnibook-x14.dtb x1e80100-hp-omnibook-x14-el2.dtb
 x1e80100-lenovo-yoga-slim7x-el2-dtbs	:= x1e80100-lenovo-yoga-slim7x.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb x1e80100-lenovo-yoga-slim7x-el2.dtb
+x1e80100-microsoft-denali-oled-el2-dtbs	:= x1e80100-microsoft-denali-oled.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-denali-oled.dtb x1e80100-microsoft-denali-oled-el2.dtb
 x1e80100-microsoft-romulus13-el2-dtbs	:= x1e80100-microsoft-romulus13.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb x1e80100-microsoft-romulus13-el2.dtb
 x1e80100-microsoft-romulus15-el2-dtbs	:= x1e80100-microsoft-romulus15.dtb x1-el2.dtbo
@@ -350,3 +352,5 @@ x1p42100-hp-omnibook-x14-el2-dtbs := x1p42100-hp-omnibook-x14.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-hp-omnibook-x14.dtb x1p42100-hp-omnibook-x14-el2.dtb
 x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
+x1p64100-microsoft-denali-el2-dtbs	:= x1p64100-microsoft-denali.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1p64100-microsoft-denali.dtb x1p64100-microsoft-denali-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
new file mode 100644
index 000000000000..64eabe2b96cf
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -0,0 +1,1338 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025 Dale Whinham <daleyo@gmail.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "x1e80100-pmics.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart2;
+		serial1 = &uart14;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,x1e80100-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 123 GPIO_ACTIVE_HIGH>;
+
+		/* Left-side rear port */
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
+					pmic_glink_ss0_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss0_ss_in: endpoint {
+						remote-endpoint = <&retimer_ss0_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss0_con_sbu_in: endpoint {
+						remote-endpoint = <&retimer_ss0_con_sbu_out>;
+					};
+				};
+			};
+		};
+
+		/* Left-side front port */
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
+					pmic_glink_ss1_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss1_ss_in: endpoint {
+						remote-endpoint = <&retimer_ss1_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss1_con_sbu_in: endpoint {
+						remote-endpoint = <&retimer_ss1_con_sbu_out>;
+					};
+				};
+			};
+		};
+	};
+
+	reserved-memory {
+		linux,cma {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x8000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR0_1P15";
+
+		regulator-min-microvolt = <1150000>;
+		regulator-max-microvolt = <1150000>;
+
+		gpio = <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&rtmr0_1p15_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR0_1P8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&rtmr0_1p8_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR0_3P3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&rtmr0_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR1_1P15";
+
+		regulator-min-microvolt = <1150000>;
+		regulator-max-microvolt = <1150000>;
+
+		gpio = <&tlmm 188 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&rtmr1_1p15_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR1_1P8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 175 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&rtmr1_1p8_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR1_3P3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 186 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&rtmr1_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_nvme: regulator-nvme {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_NVME_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&nvme_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	/*
+	 * TODO: These two regulators are actually part of the removable M.2
+	 * card and not the CRD mainboard. Need to describe this differently.
+	 * Functionally it works correctly, because all we need to do is to
+	 * turn on the actual 3.3V supply above.
+	 */
+	vreg_wcn_0p95: regulator-wcn-0p95 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_1p9: regulator-wcn-1p9 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_1P9";
+		regulator-min-microvolt = <1900000>;
+		regulator-max-microvolt = <1900000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	sound {
+		compatible = "qcom,x1e80100-sndcard";
+		model = "X1E80100-Microsoft-Surface-Pro-11";
+		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb";
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		vdd-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_l15b_1p8>;
+		vddaon-supply = <&vreg_wcn_0p95>;
+		vdddig-supply = <&vreg_wcn_0p95>;
+		vddrfa1p2-supply = <&vreg_wcn_1p9>;
+		vddrfa1p8-supply = <&vreg_wcn_1p9>;
+
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8550-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-bob1-supply = <&vph_pwr>;
+		vdd-bob2-supply = <&vph_pwr>;
+		vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
+		vdd-l2-l13-l14-supply = <&vreg_bob1>;
+		vdd-l5-l16-supply = <&vreg_bob1>;
+		vdd-l6-l7-supply = <&vreg_bob2>;
+		vdd-l8-l9-supply = <&vreg_bob1>;
+		vdd-l12-supply = <&vreg_s5j_1p2>;
+		vdd-l15-supply = <&vreg_s4c_1p8>;
+		vdd-l17-supply = <&vreg_bob2>;
+
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob2: bob2 {
+			regulator-name = "vreg_bob2";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1b_1p8: ldo1 {
+			regulator-name = "vreg_l1b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_3p0: ldo2 {
+			regulator-name = "vreg_l2b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b_1p8: ldo4 {
+			regulator-name = "vreg_l4b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b_1p8: ldo6 {
+			regulator-name = "vreg_l6b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_3p0: ldo8 {
+			regulator-name = "vreg_l8b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_2p9: ldo9 {
+			regulator-name = "vreg_l9b_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_1p8: ldo10 {
+			regulator-name = "vreg_l10b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b_1p2: ldo12 {
+			regulator-name = "vreg_l12b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b_3p0: ldo13 {
+			regulator-name = "vreg_l13b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b_3p0: ldo14 {
+			regulator-name = "vreg_l14b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-l1-supply = <&vreg_s5j_1p2>;
+		vdd-l2-supply = <&vreg_s1f_0p7>;
+		vdd-l3-supply = <&vreg_s1f_0p7>;
+		vdd-s4-supply = <&vph_pwr>;
+
+		vreg_s4c_1p8: smps4 {
+			regulator-name = "vreg_s4c_1p8";
+			regulator-min-microvolt = <1856000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c_1p2: ldo1 {
+			regulator-name = "vreg_l1c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_0p8: ldo2 {
+			regulator-name = "vreg_l2c_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_0p8: ldo3 {
+			regulator-name = "vreg_l3c_0p8";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "d";
+
+		vdd-l1-supply = <&vreg_s1f_0p7>;
+		vdd-l2-supply = <&vreg_s1f_0p7>;
+		vdd-l3-supply = <&vreg_s4c_1p8>;
+		vdd-s1-supply = <&vph_pwr>;
+
+		vreg_l1d_0p8: ldo1 {
+			regulator-name = "vreg_l1d_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2d_0p9: ldo2 {
+			regulator-name = "vreg_l2d_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3d_1p8: ldo3 {
+			regulator-name = "vreg_l3d_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vdd-l2-supply = <&vreg_s1f_0p7>;
+		vdd-l3-supply = <&vreg_s5j_1p2>;
+
+		vreg_l2e_0p8: ldo2 {
+			regulator-name = "vreg_l2e_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3e_1p2: ldo3 {
+			regulator-name = "vreg_l3e_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "f";
+
+		vdd-l1-supply = <&vreg_s5j_1p2>;
+		vdd-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-supply = <&vreg_s5j_1p2>;
+		vdd-s1-supply = <&vph_pwr>;
+
+		vreg_s1f_0p7: smps1 {
+			regulator-name = "vreg_s1f_0p7";
+			regulator-min-microvolt = <700000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-6 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "i";
+
+		vdd-l1-supply = <&vreg_s4c_1p8>;
+		vdd-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-supply = <&vreg_s1f_0p7>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+
+		vreg_s1i_0p9: smps1 {
+			regulator-name = "vreg_s1i_0p9";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2i_1p0: smps2 {
+			regulator-name = "vreg_s2i_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1i_1p8: ldo1 {
+			regulator-name = "vreg_l1i_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_1p2: ldo2 {
+			regulator-name = "vreg_l2i_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3i_0p8: ldo3 {
+			regulator-name = "vreg_l3i_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-7 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "j";
+
+		vdd-l1-supply = <&vreg_s1f_0p7>;
+		vdd-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-supply = <&vreg_s1f_0p7>;
+		vdd-s5-supply = <&vph_pwr>;
+
+		vreg_s5j_1p2: smps5 {
+			regulator-name = "vreg_s5j_1p2";
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1j_0p8: ldo1 {
+			regulator-name = "vreg_l1j_0p8";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2j_1p2: ldo2 {
+			regulator-name = "vreg_l2j_1p2";
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1256000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3j_0p8: ldo3 {
+			regulator-name = "vreg_l3j_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_microcode_mem>;
+		firmware-name = "qcom/x1e80100/microsoft/qcdxkmsuc8380.mbn";
+	};
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "disabled";
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* Left-side rear port */
+	typec-mux@8 {
+		compatible = "parade,ps8830";
+		reg = <0x8>;
+
+		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK3>;
+
+		vdd-supply = <&vreg_rtmr0_1p15>;
+		vdd33-supply = <&vreg_rtmr0_3p3>;
+		vdd33-cap-supply = <&vreg_rtmr0_3p3>;
+		vddar-supply = <&vreg_rtmr0_1p15>;
+		vddat-supply = <&vreg_rtmr0_1p15>;
+		vddio-supply = <&vreg_rtmr0_1p8>;
+
+		pinctrl-0 = <&rtmr0_default>;
+		pinctrl-names = "default";
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				retimer_ss0_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				retimer_ss0_ss_in: endpoint {
+					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				retimer_ss0_con_sbu_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_con_sbu_in>;
+				};
+			};
+		};
+	};
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "disabled";
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "disabled";
+};
+
+&i2c7 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* Left-side front port */
+	typec-mux@8 {
+		compatible = "parade,ps8830";
+		reg = <0x8>;
+
+		reset-gpios = <&tlmm 176 GPIO_ACTIVE_LOW>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK4>;
+
+		vdd-supply = <&vreg_rtmr1_1p15>;
+		vdd33-supply = <&vreg_rtmr1_3p3>;
+		vdd33-cap-supply = <&vreg_rtmr1_3p3>;
+		vddar-supply = <&vreg_rtmr1_1p15>;
+		vddat-supply = <&vreg_rtmr1_1p15>;
+		vddio-supply = <&vreg_rtmr1_1p8>;
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				retimer_ss1_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss1_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				retimer_ss1_ss_in: endpoint {
+					remote-endpoint = <&usb_1_ss1_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				retimer_ss1_con_sbu_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss1_con_sbu_in>;
+				};
+			};
+		};
+	};
+};
+
+&lpass_tlmm {
+	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
+		pins = "gpio13";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_l1b_1p8>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp3 {
+	compatible = "qcom,x1e80100-dp";
+	/delete-property/ #sound-dai-cells;
+
+	status = "okay";
+
+	aux-bus {
+		panel: panel {
+			compatible = "edp-panel";
+			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+			power-supply = <&vreg_edp_3p3>;
+
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+
+	ports {
+		port@1 {
+			reg = <1>;
+
+			mdss_dp3_out: endpoint {
+				data-lanes = <0 1 2 3>;
+				link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+				remote-endpoint = <&edp_panel_in>;
+			};
+		};
+	};
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&pcie4 {
+	status = "okay";
+};
+
+&pcie4_phy {
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&pcie4_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
+&pcie6a {
+	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+
+	vddpe-3v3-supply = <&vreg_nvme>;
+
+	pinctrl-0 = <&pcie6a_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie6a_phy {
+	vdda-phy-supply = <&vreg_l1d_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&pm8550_gpios {
+	rtmr0_default: rtmr0-reset-n-active-state {
+		pins = "gpio10";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+	};
+
+	rtmr0_3p3_reg_en: rtmr0-3p3-reg-en-state {
+		pins = "gpio11";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+	};
+};
+
+&pm8550ve_9_gpios {
+	rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
+		pins = "gpio8";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+	};
+};
+
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+		input-disable;
+		output-enable;
+	};
+};
+
+&pmc8380_5_gpios {
+	rtmr0_1p15_reg_en: rtmr0-1p15-reg-en-state {
+		pins = "gpio8";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+	};
+};
+
+&qupv3_0 {
+	status = "okay";
+};
+
+&qupv3_1 {
+	status = "okay";
+};
+
+&qupv3_2 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1e80100/microsoft/Denali/qcadsp8380.mbn",
+			"qcom/x1e80100/microsoft/Denali/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1e80100/microsoft/Denali/qccdsp8380.mbn",
+			"qcom/x1e80100/microsoft/Denali/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&smb2360_0 {
+	status = "okay";
+};
+
+&smb2360_0_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l2b_3p0>;
+};
+
+&smb2360_1 {
+	status = "okay";
+};
+
+&smb2360_1_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l14b_3p0>;
+};
+
+&smb2360_2 {
+	status = "okay";
+};
+
+&smb2360_2_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l8b_3p0>;
+};
+
+&swr0 {
+	status = "okay";
+
+	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
+	pinctrl-names = "default";
+
+	/* WSA8845, Left Speaker */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Right Speaker */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
+						   <238 1>; /* UFS Reset */
+
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio2";
+		function = "gpio";
+		bias-disable;
+	};
+
+	nvme_reg_en: nvme-reg-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	ssam_state: ssam-state-state {
+		pins = "gpio91";
+		function = "gpio";
+		bias-disable;
+	};
+
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio147";
+			function = "pcie4_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio148";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie6a_default: pcie6a-default-state {
+		perst-n-pins {
+			pins = "gpio152";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		clkreq-n-pins {
+			pins = "gpio153";
+			function = "pcie6a_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-n-pins {
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	rtmr1_1p8_reg_en: rtmr1-1p8-reg-en-state {
+		pins = "gpio175";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rtmr1_3p3_reg_en: rtmr1-3p3-reg-en-state {
+		pins = "gpio186";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rtmr1_1p15_reg_en: rtmr1-1p15-reg-en-state {
+		pins = "gpio188";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_indicator_en: cam-indicator-en-state {
+		pins = "gpio225";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+			pins = "gpio214";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+			pins = "gpio116", "gpio117";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+	};
+};
+
+&uart2 {
+	status = "okay";
+
+	embedded-controller {
+		compatible = "microsoft,surface-sam";
+
+		interrupts-extended = <&tlmm 91 IRQ_TYPE_EDGE_RISING>;
+
+		current-speed = <4000000>;
+
+		pinctrl-0 = <&ssam_state>;
+		pinctrl-names = "default";
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};
+
+&usb_1_ss0_hsphy {
+	vdd-supply = <&vreg_l3j_0p8>;
+	vdda12-supply = <&vreg_l2j_1p2>;
+
+	phys = <&smb2360_0_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_ss0_qmpphy {
+	vdda-phy-supply = <&vreg_l2j_1p2>;
+	vdda-pll-supply = <&vreg_l1j_0p8>;
+
+	status = "okay";
+};
+
+&usb_1_ss0 {
+	status = "okay";
+};
+
+&usb_1_ss0_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_ss0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss0_hs_in>;
+};
+
+&usb_1_ss0_qmpphy_out {
+	remote-endpoint = <&retimer_ss0_ss_in>;
+};
+
+&usb_1_ss1_hsphy {
+	vdd-supply = <&vreg_l3j_0p8>;
+	vdda12-supply = <&vreg_l2j_1p2>;
+
+	phys = <&smb2360_1_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_ss1_qmpphy {
+	vdda-phy-supply = <&vreg_l2j_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
+	status = "okay";
+};
+
+&usb_1_ss1 {
+	status = "okay";
+};
+
+&usb_1_ss1_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_ss1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss1_hs_in>;
+};
+
+&usb_1_ss1_qmpphy_out {
+	remote-endpoint = <&retimer_ss1_ss_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dts b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dts
new file mode 100644
index 000000000000..f7159eef1d85
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025 Dale Whinham <daleyo@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "x1e80100.dtsi"
+#include "x1-microsoft-denali.dtsi"
+
+/ {
+	model = "Microsoft Surface Pro 11th Edition (OLED)";
+	compatible = "microsoft,denali-oled", "microsoft,denali",
+	             "qcom,x1e80100";
+};
+
+&panel {
+	compatible = "samsung,atna30dw01", "samsung,atna33xc20";
+};
diff --git a/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts b/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
new file mode 100644
index 000000000000..7c064ad49395
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025 Dale Whinham <daleyo@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "x1e80100.dtsi"
+#include "x1-microsoft-denali.dtsi"
+
+/ {
+	model = "Microsoft Surface Pro 11th Edition (LCD)";
+	compatible = "microsoft,denali-lcd", "microsoft,denali",
+	             "qcom,x1p64100", "qcom,x1e80100";
+};
-- 
2.52.0


