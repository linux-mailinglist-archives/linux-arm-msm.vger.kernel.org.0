Return-Path: <linux-arm-msm+bounces-80757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1DEC3F9A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 11:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 875CC3B14F6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 10:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E303031DD86;
	Fri,  7 Nov 2025 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdrWYIYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB52231B104
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 10:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762513072; cv=none; b=VOA+x921FZRPuTtutryWKimYkWFOs3YJfcIsNmFu5vMMyUrN520qX4CVVDcc7DmRucVwzt4u7u5giyjU+aSWpZGwC2wMczZAl3bRCIIywVC6G85VLNi1IUc7Oa9zbz2SUK1JrlvHGVZbAm6LakFTh53jwLrcr7m7S04qgJ/3rf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762513072; c=relaxed/simple;
	bh=Qfz+gQts4GQ+8eEsibD98yJHKgcgo2me8Rnajbwml1U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jbbVUrtzacZkEQOT1Ym9c762PIagBAev9BFpAk6Z5YnD0i7nwtUgl3XSYXEVcbQVEhDdUdIQqbzqV3CIY3S0K192/w/1YNF+FC78k2EKPbM5ouldUfhv1Dw5BMmAaaWlMnhvytEsaypF/dPyCEt7H7ItZ7Fcw8NunOy93tSq+OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdrWYIYN; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-340c39ee02dso547862a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 02:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762513070; x=1763117870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZq4Esb5bx5ezULPjdDm1czTdlmpt1TR6yFheeYQhtE=;
        b=YdrWYIYNnVRmqRBYkCraE28bx/O9a5mu1QIi7W6icQ9HXEwjZkNFGH3yY4q+kvg1AU
         8OELUkQrVDB+UZgPcEbwi3QJ5t8Ri0f2I+z15De5ghQ77LpPnZwDO8sqq5Xl8RbXjciz
         ZLwiz6ip08WKyY4vt2yS6hPgh0Wq/yQBQeQPt32aFkAQWMPxLdeFenVxkhxT/ucM7nSn
         3504fH+c3PykfzzkwbOrcv9R8JqCyq67+DhtshaFM7r58KH24v5zILUHQlo2b92nIV/z
         RILNhNNthe4gM+kFWUN0zImwak/KOioTiEIW5OwNWqykmpQ3R40Ql/C4nXuy5fxX35Kv
         OvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762513070; x=1763117870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FZq4Esb5bx5ezULPjdDm1czTdlmpt1TR6yFheeYQhtE=;
        b=iXfj71XY7WJKKJcrIaM5rpZ7UislCO3ZtRQYbRQY1OO5i75VQ285MBueRMxF0532zg
         g9eBW3Wm++Z6+rdr9uRrsmQKtQiiLpL6zUTglirPEbntmhkL9sgUiU78VGyWECkpUN7B
         vt0udQxnikNKrDI8UspIdJGuLJX0gYANIOOoxd3j1OC8v/cJRQQxC5lI095A49jIKi23
         E5SlQRZ8Eogz+OlIBMx+OsBLUPKfSpl1e2z36U0+3GTHK+I4GRL7VNf8YVA9B2NxbkTq
         0oulJu7coe6/QCReCD4bXrAjAUsSY7KcV4lW7GjqDPGGk6sk8isjzKwQ6CLpmM5yUa9L
         sUbw==
X-Forwarded-Encrypted: i=1; AJvYcCVRmbq3Iv9cxv9YFF3JuSJheimJrPs6w14fk0r5hVLgd4kJYYwnisnq+oNB4Rfwrot9/ck/iUEIOa1hE1Xy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5wJu4NBSUytvwwqYZKnO9mtguIjqvnjrfdrbTUJDI5LHPlST5
	qZv3pUr+B1hxfR+G5OLi8SYs8P7F9AOc6AxqG7LTmxoJXPSsZR6SRiyo
X-Gm-Gg: ASbGncv0IjjhBX1sb8WMSaKl/Wn4okALtDWMn0YMFwiFqR9MgXrQxMXyoY8Q1WQ2Zz8
	Y1YLmRFi/8b9oV/VJyzCBf7NE6fKiPJeoB1dT1l6xlEEFmO85l3C2TwmW98NcykFP/RbmkoG2Uh
	0GFau06nvkQCJWrIdzK+xU1E9S9GgqnOrWPMSWTvozgXFQPeEecAOIYJdsn2x+vqZoRmgNehBBA
	tGq/AyhCKLgxFYRMs0oX3frXaFU89SbVpinEjgJosslxla71VW0N6suvnXNdWVkzzVgG5EfQmKX
	2dmwOpzBoVckhYUWPi8aT1g6T1d7vC1yUB8SkLDsrH1yhI+x6OeCgfEI5KVjvh+DseGtKfWb/go
	txdroIQ7P74Fq4o80GZvZZdqBYu3k/VQWldDFvJFG84WCfBnxe3J4t4zAY3Egoue8peSOkVjDUJ
	9r3FLHIffLukMWojKaDuE8pC18ow==
X-Google-Smtp-Source: AGHT+IGeFcvqDQzwagO9PiciX1pV3vJD2jx2u/ORygC00foJerCQJFNFn5l+QcF+P25IDmVuyqxiuA==
X-Received: by 2002:a17:90b:4b0b:b0:340:a1a8:eb87 with SMTP id 98e67ed59e1d1-3434c589e5emr3500064a91.35.1762513070071;
        Fri, 07 Nov 2025 02:57:50 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c30b96dsm2276332a91.5.2025.11.07.02.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:57:49 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>
Subject: [PATCH v6 2/2] arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board
Date: Fri,  7 Nov 2025 16:27:35 +0530
Message-Id: <20251107105735.1491273-3-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251107105735.1491273-1-tessolveupstream@gmail.com>
References: <20251107105735.1491273-1-tessolveupstream@gmail.com>
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
components: the talos-evk-som and the talos-evk-cb.

The Talos EVK platform supports multiple display configurations
HDMI and LVDS that share a common carrier board design.
Both configurations use the same base carrier board hardware,
while the display output is selected through hardware configuration
options (DIP switch selection).

To avoid duplication, introduce a new include file,
talos-evk-cb.dtsi, which defines interfaces and peripherals that are
common to both display variants.

The initial device tree includes basic support for:
- CPU and memory
- UART
- GPIOs
- Regulators
- PMIC
- Early console
- AT24MAC602 EEPROM
- MCP2515 SPI to CAN
- ADV7535 DSI-to-HDMI bridge
- DisplayPort

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi  |  56 +++
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 443 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-evk.dts      |  89 ++++
 4 files changed, 589 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5b52f9e4e5f3..282d744acd73 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -305,6 +305,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi
new file mode 100644
index 000000000000..81d15ee4f366
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include "talos-evk-som.dtsi"
+
+/ {
+	model = "Qualcomm QCS615 IQ 615 EVK";
+	compatible = "qcom,talos-evk", "qcom,qcs615", "qcom,sm6150";
+	chassis-type = "embedded";
+
+	aliases {
+		mmc1 = &sdhc_2;
+	};
+
+	dp-connector {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+
+		hpd-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp0_out>;
+			};
+		};
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
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
new file mode 100644
index 000000000000..9e6198892c11
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -0,0 +1,443 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
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
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
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
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&mdss_dp_phy {
+	vdda-phy-supply = <&vreg_l11a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l11a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&adv7535_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a>;
+
+	status = "okay";
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
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs615/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs615/cdsp.mbn";
+
+	status = "okay";
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
+	can@0 {
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
+&venus {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
new file mode 100644
index 000000000000..b694dda422a8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include "talos-evk-cb.dtsi"
+
+/ {
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
+	vreg_v5p0_out: regulator-v5p0-out {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-v5p0-out";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		/* Powered by system 20V rail (USBC_VBUS_IN) */
+	};
+
+	vreg_v3p3_out: regulator-v3p3-out {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-v3p3-out";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vreg_v5p0_out>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vreg_v1p8_out: regulator-v1p8-out {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-v1p8-out";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vreg_v5p0_out>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	bridge: bridge@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>;
+		avdd-supply = <&vreg_v1p8_out>;
+		dvdd-supply = <&vreg_v1p8_out>;
+		pvdd-supply = <&vreg_v1p8_out>;
+		a2vdd-supply = <&vreg_v1p8_out>;
+		v3p3-supply = <&vreg_v3p3_out>;
+		interrupts-extended = <&tlmm 26 IRQ_TYPE_LEVEL_LOW>;
+		adi,dsi-lanes = <4>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7535_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_con_out>;
+				};
+			};
+		};
+	};
+};
-- 
2.34.1


