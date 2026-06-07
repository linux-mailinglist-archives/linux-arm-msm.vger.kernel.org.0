Return-Path: <linux-arm-msm+bounces-111570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LFIvFNpYJWouHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:41:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BA4650796
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:41:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SllMa1+d;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111570-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111570-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAB333045AA4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 11:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68282257855;
	Sun,  7 Jun 2026 11:37:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B44B3264DA
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 11:37:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780832259; cv=none; b=Ma/qKm2kZQYB4o/itACo3oN6jHJQK93ViyOeevnAtKQFxCRt7Q5eWCFkKagpaJB85YeGpMOhxheKaL6n6PTu+3NgV6WAu8e8tt6FjdGKzK4mY85TmVgL5EASCSq1hjOtVfj7GDc2/pmQMi9+gPZX3LZQ3RsuSCd1NKW0oKm+15s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780832259; c=relaxed/simple;
	bh=F4pyCzLz2urRifL0/ALYF8WTCQ8uYfEjirfd2IzH7c8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tyemR/qayvbRESs0DUPUw3nVJTL8f9WvQ0LPxGisCaB+auczwtL2yveL4pD2jeJo8yqgqN9JEiW6lUyY7OBt8OOn2of7pShhDHbtwVXkMgrGSwludp5BkOVH0C4RRy8gN983bgSuBMo2hfaPmf6k8jlHSqPKvwFT+7CAacmQ10c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SllMa1+d; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf114b0cf9so29203145ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 04:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780832257; x=1781437057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvPo1ohRYAqjrexZDWJdflEI2aU2S87VbkdG5/aQJXM=;
        b=SllMa1+di5oVqzqd7DmI+taeOq5UhM9HAa2NX6sv5LWeltuDJ71rPpr7G9D4rn1DlJ
         /VQyyiUjAxwNGbl7FMeMXM54/UUyWuo6Z2y0yCLipgDtJbT5LEYCSLN4Ay8hznxsGXHg
         WnfiWSI1f9iNHeiEQ4HrbgNh9o7u5eGLiWbxmZIx8l/LoxDa2U247t8nmZE1hz5PLkWe
         d9WCqP+br+b7MFy/5vSIfnmcvndbwSXxJ4xQtYcRbxkSMOlNwGWs4LsLT61tYt2Aqu5Z
         Z7GWJQiIZ/2twqovbxDXqQxSeEx680njL3J6d76lIBefYXhdWiLOoqgk4TDhNEZZZ2Kd
         iGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780832257; x=1781437057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rvPo1ohRYAqjrexZDWJdflEI2aU2S87VbkdG5/aQJXM=;
        b=jB6JhYPuv8UQTXJ4t+Aqpz8IWVWCtIyCvGgQFtmRycYSe3cJoJlaUHhNtyq7y0XDol
         j5cZuOIEXVkjCwUUqr87LLddQ+slM1y+sx3CA0jvvxCC0qEcsHbZsMB11e0K15awSuWT
         aODLDiNiHamytvPiCFXwZx5GOfXC/esxCa7PYU8kLlLUeamLhmWPghKmwXuaw9zX/1J2
         KJv/9MSjivumwiM/sBUjRT3NWbasiTqmEJIA5Aa7beOGR17cYgSRp0xwlHNZ3vrIot3d
         kTKefyWvCHoe+9IuCDuGqbfxPzG3FX0LqVMu8fesECPMUWrAkwSEwmKRsRVPNvuLmAJm
         zh7A==
X-Forwarded-Encrypted: i=1; AFNElJ9EsjI8te0+L4Z17CGPKc1K1x5wlK6CopXYaX7B1ONC2Dcqphp8TPTImiQ1YAMk4inPcVB4XeYCAJzqxcUU@vger.kernel.org
X-Gm-Message-State: AOJu0YwsAG3CjVD+DYLvnCzSSbl68SfiLZE51qfDouO1qv1Ursp2D8f2
	2hWg3zMlPYdAQ4+tQkP6Uk5SwyY7+UowWKK+VfENA09/TZCkLpQU+5+w
X-Gm-Gg: Acq92OEmZxA4tkCkKDvJ/dIVlDcyY1ty454/IdYa92tORAhAJnwWTEIx9uddfIxGJYw
	gk1hQ1mAq0Wrmw5YFkmF1l/+gW+AWlrN0asTPmqgrAsIF9xrxN4gFPP1WZxW9eS9eDcKbtZ7aAg
	2D1CTnTwAdD2TawzKsAJJ2Fv70Fc4tsfTBeykkiYejB4DZqsnFjNjl4iCP+cGDxZ9ujPRE6fZNf
	AK8qI5cYPOb5ZbkWhPMnKEISKQ9M5b0VPS3nB55e+RLmSxc7RNMv4zQ1ETU/flN+g1vhrcEvO3J
	S1Rll1I54EzMYiLAwRmKn9BF8b85JaE0i5KJIdPfneKUEnouIcyWfHPSt2sXVvDOk7rxQdG/s9J
	wa27B0XFF/ZHU37knJyMPqBQa/dxM3LmEuWXaUrzYfL+CeCOue9j2FourFianhuxPX2mAJ3ekTf
	XLV7Lc5llpaYQrhLBKG0SkMQ2kdoPsNxLyH7oHMcXXxLZS9n078xQoTXm6tZFICy5djPgHD9s=
X-Received: by 2002:a17:902:da8d:b0:2be:fda1:42d9 with SMTP id d9443c01a7336-2c1e7845a08mr116054425ad.0.1780832256528;
        Sun, 07 Jun 2026 04:37:36 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:88b6:5847:b159:e15f:b4ca:e80d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm144144165ad.73.2026.06.07.04.37.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 07 Jun 2026 04:37:36 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Date: Sun,  7 Jun 2026 17:06:58 +0530
Message-ID: <20260607113658.25117-4-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260607113658.25117-1-blfizzyy@gmail.com>
References: <20260607113658.25117-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111570-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:blfizzyy@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78BA4650796

Add DTS for the Vicharak Axon Mini board based on the Qualcomm
QCS6490 SoC.

This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
support along with regulators.

The UFS ICE block is kept disabled because enabling it currently causes
an SError during qcom_ice_create() on this board. UFS works without ICE.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1027 +++++++++++++++++
 2 files changed, 1028 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e8..d8d04dc88e08 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -146,6 +146,7 @@ qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-vicharak-axon-mini.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
new file mode 100644
index 000000000000..264668f739e1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
@@ -0,0 +1,1027 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Vicharak Computers Pvt. Ltd.
+ */
+
+/dts-v1/;
+
+/* PM7250B is configured to use SID8/9 */
+#define PM7250B_SID 8
+#define PM7250B_SID1 9
+
+#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "kodiak.dtsi"
+#include "pm7250b.dtsi"
+#include "pm7325.dtsi"
+#include "pm8350c.dtsi"
+#include "pmk8350.dtsi"
+
+/delete-node/ &adsp_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &ipa_fw_mem;
+/delete-node/ &mpss_mem;
+/delete-node/ &remoteproc_mpss;
+/delete-node/ &remoteproc_wpss;
+/delete-node/ &rmtfs_mem;
+/delete-node/ &video_mem;
+/delete-node/ &wifi;
+/delete-node/ &wlan_ce_mem;
+/delete-node/ &wlan_fw_mem;
+/delete-node/ &wpss_mem;
+/delete-node/ &xbl_mem;
+
+/ {
+	model = "Vicharak Axon Mini";
+	compatible = "vicharak,axon-mini", "qcom,qcm6490";
+	chassis-type = "embedded";
+
+	aliases {
+		serial0 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		pinctrl-0 = <&user_leds>;
+		pinctrl-names = "default";
+
+		user-led {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_INDICATOR;
+			gpios = <&tlmm 19 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+			default-state = "on";
+			panic-indicator;
+			retain-state-suspended;
+		};
+
+		status-led {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_INDICATOR;
+			gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
+			retain-state-suspended;
+		};
+	};
+
+	reserved-memory {
+		xbl_mem: xbl@80700000 {
+			reg = <0x0 0x80700000 0x0 0x100000>;
+			no-map;
+		};
+
+		cdsp_secure_heap_mem: cdsp-secure-heap@81800000 {
+			reg = <0x0 0x81800000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		camera_mem: camera@84300000 {
+			reg = <0x0 0x84300000 0x0 0x500000>;
+			no-map;
+		};
+
+		wpss_mem: wpss@84800000 {
+			reg = <0x0 0x84800000 0x0 0x1900000>;
+			no-map;
+		};
+
+		adsp_mem: adsp@86100000 {
+			reg = <0x0 0x86100000 0x0 0x2800000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp@88900000 {
+			reg = <0x0 0x88900000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		video_mem: video@8a700000 {
+			reg = <0x0 0x8a700000 0x0 0x700000>;
+			no-map;
+		};
+
+		cvp_mem: cvp@8ae00000 {
+			reg = <0x0 0x8ae00000 0x0 0x500000>;
+			no-map;
+		};
+
+		ipa_fw_mem: ipa-fw@8b300000 {
+			reg = <0x0 0x8b300000 0x0 0x10000>;
+			no-map;
+		};
+
+		ipa_gsi_mem: ipa-gsi@8b310000 {
+			reg = <0x0 0x8b310000 0x0 0xa000>;
+			no-map;
+		};
+
+		gpu_microcode_mem: gpu-microcode@8b31a000 {
+			reg = <0x0 0x8b31a000 0x0 0x2000>;
+			no-map;
+		};
+
+		tz_stat_mem: tz-stat@c0000000 {
+			reg = <0x0 0xc0000000 0x0 0x100000>;
+			no-map;
+		};
+
+		tags_mem: tags@c0100000 {
+			reg = <0x0 0xc0100000 0x0 0x1200000>;
+			no-map;
+		};
+
+		qtee_mem: qtee@c1300000 {
+			reg = <0x0 0xc1300000 0x0 0x500000>;
+			no-map;
+		};
+
+		trusted_apps_mem: trusted-apps@c1800000 {
+			reg = <0x0 0xc1800000 0x0 0x1c00000>;
+			no-map;
+		};
+
+		debug_vm_mem: debug-vm@d0600000 {
+			reg = <0x0 0xd0600000 0x0 0x100000>;
+			no-map;
+		};
+	};
+
+	thermal-zones {
+		chg-skin-thermal {
+			polling-delay-passive = <0>;
+
+			thermal-sensors = <&pm7250b_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		conn-thermal {
+			polling-delay-passive = <0>;
+
+			thermal-sensors = <&pm7250b_adc_tm 1>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		quiet-thermal {
+			polling-delay-passive = <0>;
+
+			thermal-sensors = <&pmk8350_adc_tm 1>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		sdm-skin-thermal {
+			polling-delay-passive = <0>;
+
+			thermal-sensors = <&pmk8350_adc_tm 3>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		xo-thermal {
+			polling-delay-passive = <0>;
+
+			thermal-sensors = <&pmk8350_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
+	vcc_5v0: regulator-vcc-5v-peri {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		vin-supply = <&vph_pwr>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc_5v0_usb2_0: regulator-vcc-5v0-usb2-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_5v0_usb2_0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		vin-supply = <&vcc_5v0>;
+
+		gpio = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&vcc5v0_usb2_0_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc_pcie1_3v3: regulator-vcc-pcie1-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_pcie1_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		vin-supply = <&vcc_5v0>;
+
+		gpio = <&tlmm 115 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&vcc_pcie1_3v3_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc_pcie0_dsi_3v3: regulator-vcc-pcie0-dsi-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_pcie0_dsi_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		vin-supply = <&vcc_5v0>;
+
+		gpio = <&tlmm 114 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&vcc_pcie0_dsi_3v3_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	wlan_pwrseq: wlan-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+
+		pinctrl-0 = <&wl_enable_h>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <200>;
+		power-off-delay-us = <20000>;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7325-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-l1-l4-l12-l15-supply = <&vreg_s7b_0p972>;
+		vdd-l2-l7-supply = <&vreg_bob_3p296>;
+		vdd-l6-l9-l10-supply = <&vreg_s8b_1p272>;
+		vdd-l8-supply = <&vreg_s7b_0p972>;
+		vdd-l11-l17-l18-l19-supply = <&vreg_s1b_1p872>;
+		vdd-l13-supply = <&vreg_s7b_0p972>;
+		vdd-l14-l16-supply = <&vreg_s8b_1p272>;
+
+		vreg_s1b_1p872: smps1 {
+			regulator-name = "vreg_s1b_1p872";
+			regulator-min-microvolt = <1840000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vreg_s7b_0p972: smps7 {
+			regulator-name = "vreg_s7b_0p972";
+			regulator-min-microvolt = <535000>;
+			regulator-max-microvolt = <1120000>;
+		};
+
+		vreg_s8b_1p272: smps8 {
+			regulator-name = "vreg_s8b_1p272";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1500000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_RET>;
+		};
+
+		vreg_l1b_0p912: ldo1 {
+			regulator-name = "vreg_l1b_0p912";
+			regulator-min-microvolt = <825000>;
+			regulator-max-microvolt = <925000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_3p072: ldo2 {
+			regulator-name = "vreg_l2b_3p072";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b_0p504: ldo3 {
+			regulator-name = "vreg_l3b_0p504";
+			regulator-min-microvolt = <312000>;
+			regulator-max-microvolt = <650000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b_1p2: ldo6 {
+			regulator-name = "vreg_l6b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_2p96: ldo7 {
+			regulator-name = "vreg_l7b_2p96";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_0p904: ldo8 {
+			regulator-name = "vreg_l8b_0p904";
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <970000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_1p2: ldo9 {
+			regulator-name = "vreg_l9b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b_1p504: ldo11 {
+			regulator-name = "vreg_l11b_1p504";
+			regulator-min-microvolt = <1776000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b_0p751: ldo12 {
+			regulator-name = "vreg_l12b_0p751";
+			regulator-min-microvolt = <751000>;
+			regulator-max-microvolt = <824000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b_0p53: ldo13 {
+			regulator-name = "vreg_l13b_0p53";
+			regulator-min-microvolt = <530000>;
+			regulator-max-microvolt = <824000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b_1p08: ldo14 {
+			regulator-name = "vreg_l14b_1p08";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_0p765: ldo15 {
+			regulator-name = "vreg_l15b_0p765";
+			regulator-min-microvolt = <765000>;
+			regulator-max-microvolt = <1020000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16b_1p1: ldo16 {
+			regulator-name = "vreg_l16b_1p1";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_l17b_1p7: ldo17 {
+			regulator-name = "vreg_l17b_1p7";
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_l18b_1p8: ldo18 {
+			regulator-name = "vreg_l18b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19b_1p8: ldo19 {
+			regulator-name = "vreg_l19b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8350c-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+		vdd-l1-l12-supply = <&vreg_s1b_1p872>;
+		vdd-l2-l8-supply = <&vreg_s1b_1p872>;
+		vdd-l3-l4-l5-l7-l13-supply = <&vreg_bob_3p296>;
+		vdd-l6-l9-l11-supply = <&vreg_bob_3p296>;
+		vdd-l10-supply = <&vreg_s7b_0p972>;
+		vdd-bob-supply = <&vph_pwr>;
+
+		vreg_s1c_2p19: smps1 {
+			regulator-name = "vreg_s1c_2p19";
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <2208000>;
+		};
+
+		vreg_s9c_1p084: smps9 {
+			regulator-name = "vreg_s9c_1p084";
+			regulator-min-microvolt = <1010000>;
+			regulator-max-microvolt = <1170000>;
+		};
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-name = "vreg_l1c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_1p62: ldo2 {
+			regulator-name = "vreg_l2c_1p62";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1976000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_2p8: ldo3 {
+			regulator-name = "vreg_l3c_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3540000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c_1p62: ldo4 {
+			regulator-name = "vreg_l4c_1p62";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5c_1p62: ldo5 {
+			regulator-name = "vreg_l5c_1p62";
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c_2p96: ldo6 {
+			regulator-name = "vreg_l6c_2p96";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c_3p0: ldo7 {
+			regulator-name = "vreg_l7c_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c_1p62: ldo8 {
+			regulator-name = "vreg_l8c_1p62";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c_2p96: ldo9 {
+			regulator-name = "vreg_l9c_2p96";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10c_0p88: ldo10 {
+			regulator-name = "vreg_l10c_0p88";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11c_2p8: ldo11 {
+			regulator-name = "vreg_l11c_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12c_1p8: ldo12 {
+			regulator-name = "vreg_l12c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+
+			/*
+			 * VREG_L12C_1P8 supplies the Ampak WLAN/BT module
+			 * VDDIO and the external 32.768 kHz oscillator.
+			 */
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vreg_l13c_2p7: ldo13 {
+			regulator-name = "vreg_l13c_2p7";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob_3p296: bob {
+			regulator-name = "vreg_bob_3p296";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3300000>;
+		};
+	};
+};
+
+&gcc {
+	protected-clocks = <GCC_CFG_NOC_LPASS_CLK>,
+			   <GCC_MSS_CFG_AHB_CLK>,
+			   <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>,
+			   <GCC_MSS_OFFLINE_AXI_CLK>,
+			   <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
+			   <GCC_MSS_Q6_MEMNOC_AXI_CLK>,
+			   <GCC_MSS_SNOC_AXI_CLK>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+			   <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
+			   <GCC_SEC_CTRL_CLK_SRC>,
+			   <GCC_WPSS_AHB_BDG_MST_CLK>,
+			   <GCC_WPSS_AHB_CLK>,
+			   <GCC_WPSS_RSCP_CLK>;
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs6490/a660_zap.mbn";
+};
+
+&ice {
+	status = "disabled";
+};
+
+&pcie0 {
+	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
+&pm7250b_adc {
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "charger_skin_therm";
+	};
+
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "conn_therm";
+	};
+};
+
+&pm7250b_adc_tm {
+	status = "okay";
+
+	charger-skin-therm@0 {
+		reg = <0>;
+		io-channels = <&pm7250b_adc ADC5_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	conn-therm@1 {
+		reg = <1>;
+		io-channels = <&pm7250b_adc ADC5_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
+&pm7325_temp_alarm {
+	io-channels = <&pmk8350_vadc PM7325_ADC7_DIE_TEMP>;
+	io-channel-names = "thermal";
+};
+
+&pmk8350_adc_tm {
+	status = "okay";
+
+	xo-therm@0 {
+		reg = <0>;
+		io-channels = <&pmk8350_vadc PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	quiet-therm@1 {
+		reg = <1>;
+		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+
+	sdm-skin-therm@3 {
+		reg = <3>;
+		io-channels = <&pmk8350_vadc PM7325_ADC7_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
+&pmk8350_rtc {
+	status = "okay";
+};
+
+&pmk8350_vadc {
+	status = "okay";
+
+	channel@3 {
+		reg = <PMK8350_ADC7_DIE_TEMP>;
+		qcom,pre-scaling = <1 1>;
+		label = "pmk8350_die_therm";
+	};
+
+	channel@44 {
+		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pmk8350_xo_therm";
+	};
+
+	channel@103 {
+		reg = <PM7325_ADC7_DIE_TEMP>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm7325_die_therm";
+	};
+
+	channel@144 {
+		reg = <PM7325_ADC7_AMUX_THM1_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm7325_quiet_therm";
+	};
+
+	channel@146 {
+		reg = <PM7325_ADC7_AMUX_THM3_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "pm7325_sdm_skin_therm";
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_RESTART>;
+
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	firmware-name = "qcom/qcs6490/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	firmware-name = "qcom/qcs6490/qupv3fw.elf";
+
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs6490/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs6490/cdsp.mbn";
+
+	status = "okay";
+};
+
+&sdhc_1 {
+	vqmmc-supply = <&vreg_l19b_1p8>;
+	vmmc-supply = <&vreg_bob_3p296>;
+
+	non-removable;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	vqmmc-supply = <&vreg_l2c_1p62>;
+	vmmc-supply = <&vreg_l6c_2p96>;
+
+	mmc-pwrseq = <&wlan_pwrseq>;
+
+	bus-width = <4>;
+	non-removable;
+	no-sd;
+	no-mmc;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	max-frequency = <100000000>;
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <48 4>; /* NFC */
+
+	pcie0_reset_n: pcie0-reset-n-state {
+		pins = "gpio87";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie0_wake_n: pcie0-wake-n-state {
+		pins = "gpio89";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	pcie1_reset_n: pcie1-reset-n-state {
+		pins = "gpio2";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie1_wake_n: pcie1-wake-n-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	user_leds: user-led-state {
+		pins = "gpio19", "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	vcc_3v3_en: vcc-3v3-en-state {
+		pins = "gpio113";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	vcc5v0_usb2_0_en: vcc-5v0-usb2-0-en-state {
+		pins = "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	vcc_pcie0_dsi_3v3_en: vcc-pcie0-dsi-3v3-en-state {
+		pins = "gpio114";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	vcc_pcie1_3v3_en: vcc-pcie1-3v3-en-state {
+		pins = "gpio115";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wl_enable_h: wl-enable-h-state {
+		pins = "gpio84";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	/delete-property/ qcom,ice;
+
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l7b_2p96>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l9b_1p2>;
+	vccq-max-microamp = <900000>;
+	vccq2-supply = <&vreg_l9b_1p2>;
+	vccq2-max-microamp = <900000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l10c_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	/* Routed to an onboard USB hub for two USB-A host ports. */
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l10c_0p88>;
+	vdda33-supply = <&vreg_l2b_3p072>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+
+	status = "okay";
+};
+
+&venus {
+	status = "okay";
+};
+
+/* pinctrl */
+&pcie0_clkreq_n {
+	bias-pull-up;
+	drive-strength = <2>;
+};
+
+&pcie1_clkreq_n {
+	bias-pull-up;
+	drive-strength = <2>;
+};
+
+&sdc1_clk {
+	bias-disable;
+	drive-strength = <16>;
+};
+
+&sdc1_cmd {
+	bias-pull-up;
+	drive-strength = <10>;
+};
+
+&sdc1_data {
+	bias-pull-up;
+	drive-strength = <10>;
+};
+
+&sdc1_rclk {
+	bias-pull-down;
+};
+
+&sdc2_clk {
+	bias-disable;
+	drive-strength = <16>;
+};
+
+&sdc2_cmd {
+	bias-pull-up;
+	drive-strength = <10>;
+};
+
+&sdc2_data {
+	bias-pull-up;
+	drive-strength = <10>;
+};
-- 
2.50.1 (Apple Git-155)


