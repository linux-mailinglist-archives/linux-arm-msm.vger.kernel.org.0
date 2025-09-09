Return-Path: <linux-arm-msm+bounces-72770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C13B4FBD9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F12C162C52
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D099C33CE91;
	Tue,  9 Sep 2025 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwvgsBaz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0C5337688;
	Tue,  9 Sep 2025 12:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757422394; cv=none; b=A12kM1PKvgnugMOKid4Lzdwru1Q4om0fwaztaDjoPCpznLo3sLv7/7rizm9lqkfL6UGEg/ixuLj5PV+rXeXpErZIyWT6/OjvgN54m/M229Cq8Ay0pYjvyxcGcBo8Ix2jvK5tSWnYYy4uj4TLlt7BcOdJvP0j3VpUuWLC3kkjp14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757422394; c=relaxed/simple;
	bh=0L460nQrjx+x0oT/SqiYXSlsrmbLi0akZ/cjiNVQrSc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SkVeDDC3R7lVtFhPF3JQM9UaVgoV66XFYQMhl2HJN3p/9xXG7MxTqMrULTnP08Kw3spobUc1HmlWVw5HuseEqnYqm58qtMtPs5Y9YfbwlaMJPJgd2FRHkWBIqCTMJR2OYLqG0k2A+CINygeLitR4YUIkO+jsFApBGopC4qNH7gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwvgsBaz; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso4684505a12.3;
        Tue, 09 Sep 2025 05:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757422392; x=1758027192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsDnz9/mLaBNsAgB9e03f6bc+bz6Bf9SrAQHBZDhkto=;
        b=lwvgsBazVCbnEtxBETLqqySBAzf/Iq2LvpK0SekSzVg2QcM8AwNfwHSIURL4l39CJp
         pQ92PT4oD+c+jb2GW+R+KyENIIgflB9zJ+XEb5zfCXcIGVhEXP8oXHdBUJ3t54uaPfGS
         PPtRu9D6MQl3l+xPkLNK0OBFQSZb8f9er9QwpNtlsCh4FKOfH9eQyxH0I1iZH+pDNKZG
         OC+Vu8VH3je3GrULhRVEP/l/B8AZCdLPPx+98JQJ4nIRMaTFiykdvzaQMmsn1Ukjz5uF
         h2lkYhMww5OFkMUTPuxm4uqrS0oAGhzgT1DbxCwLBnSaFtM84uiWxK72YzKLBudu1i3d
         yuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757422392; x=1758027192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsDnz9/mLaBNsAgB9e03f6bc+bz6Bf9SrAQHBZDhkto=;
        b=BUgocE2X3XnFW/hpG6L5x/v6zZFxymg/RI1+E2j9d/LGnkjdATWUiY98w+3hqlQhAs
         UD40ea97sa6owK71E6jH08gGBcuzlZAz1KI4cqkSigU+kKoKMI2geKVvlZfzBhsc/4WH
         xgIbiLtsVKG2JUSfEen/u3GakemwfgCb3DWh4uPx5RF/DZoQGHQlT3PnkLXW2QEdJQ/t
         vxxra1ZA6hwxGf93wD3JowCnR1u0hFdu9Ez+R31EFKhYg8TuU0gJ7JnBa0F/RpD+O6h7
         GCC0QFd5a2KHBTOfvxnVCAYqKBWscr4zfvfBhthf0yK6MfLZKqc51licUMfA+r8cZFcc
         TLvA==
X-Forwarded-Encrypted: i=1; AJvYcCUzULJ8TE3UaiLra78QRURWQc7I887QsvjNWqc42AKlWWB/uZjHl1SYUnY8khIxBwyeZXFQe30sMrZ9@vger.kernel.org, AJvYcCV31MjZZH/VCVsc+w6UxNoo3QwffphCaGHLMTbr61UkqGf8TOfHD2A7zfNRHENF+coonszwnnWYYwA8TGY6KQ==@vger.kernel.org, AJvYcCXv4V+MZqaev/vkbNIR+WH82IvjO+pJoUEmjba6fwEhqT3JjDY5bSurhoRtFl2NIUfBnxBlZhEZnQr6IzNv@vger.kernel.org
X-Gm-Message-State: AOJu0YzbG96NmXLx64QrG93P2aAuzUg+B3zwNRWI0w0X/4IGtC+0XWvQ
	JmP3u32rtSP+vG4b0WnpJnm+LiBmBq1gSbEIksjlIxWnDZWtkl2VroFNJuvSMA==
X-Gm-Gg: ASbGnctzhqFcooH+V7GzTU904uVJSvCQOvXvy/fNMJfoA4EP9Bu8U1vgZ1INxj9AkCi
	Hgx2FXZTQupuxbMp7NNQQ56hGLDYHCOv/6VXOy8vkhKo1fGdJfrs/QlKLD+asQsr2JhqzRwbaDP
	MqpptX2BLsrvokvneFMtWnIqMdZ7bD7L3fv9BrhFgnJ6cqB8MYV6G0435QYZQMU+kl0FfpOrcvT
	Ytqbx8oHgehq/BifEwEgs0wxqt65r9ZJZvnDY7lGRSJhCmV+OJBqWXi5PFPFiglcOSHMbVPdmY/
	DqGiojCg2jsG2WVBUfFJeB1ButQoWsI5Ix8oFxHpND7qjS0W5c19Sj3HWCzNHpJeeaJ1K6FVIi3
	6VQEXsQxafJpyoXkIq4owDaGy3NUozDRpUQSyKmPHH1aNhw==
X-Google-Smtp-Source: AGHT+IFwkkmlpWEu6SR1JlJXvVRoWqZC+DisMwgx0KzJLCtSlygEgrMoDFqt73Th4hHdpOxovQjY/w==
X-Received: by 2002:a17:90b:3e83:b0:32b:8b8d:c2d1 with SMTP id 98e67ed59e1d1-32d43f770fcmr15842289a91.21.1757422391833;
        Tue, 09 Sep 2025 05:53:11 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([49.249.92.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32b8ba6e145sm16326461a91.22.2025.09.09.05.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:53:11 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: konradybcio@kernel.org
Cc: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tingweiz@qti.qualcomm.com,
	tessolveupstream@gmail.com
Subject: [PATCH 2/2] arm64: dts: qcom: Add support for QCS615 talos evk board
Date: Tue,  9 Sep 2025 18:22:55 +0530
Message-Id: <20250909125255.1124824-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909125255.1124824-1-tessolveupstream@gmail.com>
References: <20250909125255.1124824-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the device tree support for the QCS615-based talos-evk
platform, which follows the SMARC (Smart Mobility ARChitecture)
standard. The platform is composed of two main hardware
components: the IQ-QCS615-SOM and the talos-evk carrier board.

The IQ-QCS615-SOM is a compact System on Module that integrates the
QCS615 SoC, PMIC, and essential GPIO connectivity. It follows the
SMARC standard, which defines a modular form factor allowing the SoM
to be paired with different carrier boards for varied applications.

The talos-evk is one such carrier board, designed for evaluation
and development purposes. It provides additional peripherals
such as UART, USB, and other interfaces to enable rapid
prototyping and hardware bring-up.

This initial device tree provides the basic configuration needed
to boot the platform to a UART shell. Further patches will extend
support for additional peripherals and subsystems.

The initial device tree includes basic support for:

- CPU and memory

- UART

- GPIOs

- Regulators

- PMIC

- Early console

- AT24MAC602 EEPROM

- MCP2515 SPI to CAN

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---

This series depend on the below patch changes
https://lore.kernel.org/linux-arm-msm/20250625063213.1416442-1-quic_ziyuzhan@quicinc.com/T/#t
https://lore.kernel.org/all/20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org/
https://lore.kernel.org/linux-arm-msm/20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com/T/#t
---
 arch/arm64/boot/dts/qcom/Makefile        |   1 +
 arch/arm64/boot/dts/qcom/qcs615-som.dtsi | 414 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-evk.dts   |  42 +++
 3 files changed, 457 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs615-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4bfa926b6a08..588dc55995c5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -117,6 +117,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
 
 qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
diff --git a/arch/arm64/boot/dts/qcom/qcs615-som.dtsi b/arch/arm64/boot/dts/qcom/qcs615-som.dtsi
new file mode 100644
index 000000000000..1b9b2581af42
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs615-som.dtsi
@@ -0,0 +1,414 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/gpio/gpio.h>
+#include "sm6150.dtsi"
+#include "pm8150.dtsi"
+/ {
+	aliases {
+		mmc0 = &sdhc_1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		xo_board_clk: xo-board-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB2_VBUS";
+		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb2_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	vreg_v3p3_can: regulator-v3p3-can {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-v3p3-can";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vreg_v5p0_can: regulator-v5p0-can {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-v5p0-can";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8150-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s3a: smps3 {
+			regulator-name = "vreg_s3a";
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <650000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4a: smps4 {
+			regulator-name = "vreg_s4a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1829000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5a: smps5 {
+			regulator-name = "vreg_s5a";
+			regulator-min-microvolt = <1896000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s6a: smps6 {
+			regulator-name = "vreg_s6a";
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1404000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1a: ldo1 {
+			regulator-name = "vreg_l1a";
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <852000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2a: ldo2 {
+			regulator-name = "vreg_l2a";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a: ldo3 {
+			regulator-name = "vreg_l3a";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1248000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <975000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10a: ldo10 {
+			regulator-name = "vreg_l10a";
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11a: ldo11 {
+			regulator-name = "vreg_l11a";
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a: ldo12 {
+			regulator-name = "vreg_l12a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1890000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a: ldo13 {
+			regulator-name = "vreg_l13a";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3230000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a: ldo15 {
+			regulator-name = "vreg_l15a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16a: ldo16 {
+			regulator-name = "vreg_l16a";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a: ldo17 {
+			regulator-name = "vreg_l17a";
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gcc {
+	clocks = <&rpmhcc RPMH_CXO_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK_A>,
+		 <&sleep_clk>;
+};
+
+&i2c5 {
+	status = "okay";
+
+	eeprom@57 {
+		compatible = "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+
+	eeprom@5f {
+		compatible = "atmel,24mac602";
+		reg = <0x5f>;
+		pagesize = <16>;
+	};
+};
+
+&pcie {
+	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};
+
+&pm8150_gpios {
+	usb2_en: usb2-en-state {
+		pins = "gpio10";
+		function = "normal";
+		output-enable;
+		power-source = <0>;
+	};
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs615/adsp.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs615/cdsp.mbn";
+	status = "okay";
+};
+
+&rpmhcc {
+	clocks = <&xo_board_clk>;
+};
+
+&tlmm {
+	pcie_default_state: pcie-default-state {
+		clkreq-pins {
+			pins = "gpio90";
+			function = "pcie_clk_req";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio101";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wake-pins {
+			pins = "gpio100";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
+&sdhc_1 {
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	vmmc-supply = <&vreg_l17a>;
+	vqmmc-supply = <&vreg_s4a>;
+
+	non-removable;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
+
+&spi6 {
+	status = "okay";
+
+	mcp2515@0 {
+		compatible = "microchip,mcp2515";
+		reg = <0>;
+		clock-frequency = <20000000>;
+		interrupts-extended = <&tlmm 87 IRQ_TYPE_LEVEL_LOW>;
+		spi-max-frequency = <10000000>;
+		vdd-supply = <&vreg_v3p3_can>;
+		xceiver-supply = <&vreg_v5p0_can>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+	vdda-phy-dpdm-supply = <&vreg_l13a>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_hsphy_2 {
+	vdd-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+	vdda-phy-dpdm-supply = <&vreg_l13a>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	dr_mode = "host";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 123 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l17a>;
+	vcc-max-microamp = <600000>;
+	vccq2-supply = <&vreg_s4a>;
+	vccq2-max-microamp = <600000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};
+
+&watchdog {
+	clocks = <&sleep_clk>;
+};
diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
new file mode 100644
index 000000000000..7500f051783f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+
+#include "qcs615-som.dtsi"
+
+/ {
+	model = "Qualcomm QCS615 IQ 615 EVK";
+	compatible = "qcom,qcs615-iq-615-evk", "qcom,qcs615", "qcom,sm6150";
+	chassis-type = "embedded";
+
+	aliases {
+		mmc1 = &sdhc_2;
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_state_on>;
+	pinctrl-1 = <&sdc2_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l10a>;
+	vqmmc-supply = <&vreg_s4a>;
+
+	status = "okay";
+};
-- 
2.34.1


