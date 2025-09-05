Return-Path: <linux-arm-msm+bounces-72359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5C8B4633E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 21:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3A0417C319
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 19:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C28B1B0437;
	Fri,  5 Sep 2025 19:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtvOMxAy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2922773F0;
	Fri,  5 Sep 2025 19:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757099450; cv=none; b=mpo6BbysUIJkMebmf7ZK/Gzdcdmp0qtHhk1Pa2l4hosSAQcZoSiuSvT7XhxXkt5+ZKnZNoREBluycWbL2z57qOXvAZZKUnaLqwI428qKpOaFggmwRVv84m9pxVu4ofBzQ7JJEMDIU9a/Whr7HEOmkB5J4jz9V0Rew74IZiSNtmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757099450; c=relaxed/simple;
	bh=Mofprml6et2yzprbTukpVwJim0n6RhyUeUq/99ONVFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MJleqgl03/e/XWQQeCR5FSynGzfvWojBnOhxpnSU5Vc1fl7cD6q4qsavR/wd/ESs7pWVt7kCdr18zqvLpIPigOa4lO4Vr204Uu82HclfuoRNQt9gb5uYSwB/ZzhvbziAFjoLUTV9L/9Qed+Iih5mP/ncJ2Lb78Ef1KvUkiWQigQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtvOMxAy; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77238cb3cbbso2675119b3a.0;
        Fri, 05 Sep 2025 12:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757099448; x=1757704248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8tcJBQnWOwZb2q3mkwtjBrtY4/1tMPGOi4eUpjzkMQ=;
        b=QtvOMxAyNVzvUlh7TqKC2iZZWfRhsq+6xbpa89WEwRMz7t2b04rHqBdL2Qrg3bNy8e
         1cKqGSUb8SvM5pvPv0tI5M6wwI1wpYE+C1ylkCKipy8rW9WDjX1CAeIv+OLa8VjTmXLJ
         HIIwU3RRjB1pSHZLrmeexH52jgHY7VjxnxHYmB8JnClac5cDe5IXsLwoZHA/Xl/Sk2xY
         Ie6SPU3mWEhVbFtVRdUgS3M6DR05wGgCRw3cH4DNzAESrc7MQB07bASt9ZaC4TPTWYuq
         MrMReUFBwq0x1pjZgJt/CjoopwEn3jqL3AVVAsfjTI+vb/u5mivwADCc0XCTJW2G0BXk
         VzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757099448; x=1757704248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8tcJBQnWOwZb2q3mkwtjBrtY4/1tMPGOi4eUpjzkMQ=;
        b=ZG8bf99IPNN1LyvCJ8O0j4HWo6C4XOkHSfAQFrIMnomLIbMm4RU2M+dylCUg07EK89
         JDChlyoiGBcyX5wx49BqagaESbDdYQ7gDESttCtnZFKZRhX4AR/7b4SGcMUO5EfExswx
         Qj8EsgpEeLaT2c7mmRHwlRVxXeezCEihfCemCFr+CmZl/7ohedkzjZz/apZetAyraS+c
         nfE2ZvXqgtwTS93dFC/8LK4SdAxQHwhkZaOK+U4IfKX/ojGjCmEQQPs0rlYcEBgOHNyb
         D11IPEvkDddB2tbfI9QGAxd8H+x4JlfbrX4Cl+soLAjW9Alsk+mx0g3aLDxlb3SovMgg
         1vnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmLCrQVN+XicdDQEsXCilzo5J3URXn1pVgtD4dO1lxAqcq5R+gf/2z8WCKjMn0UnrNuOugaQs8YultsdZe@vger.kernel.org, AJvYcCX4iEJHH6Ak/Y30vTLzsW3bd8pncsX5c9jBnosrvV7b0/5zLEr0tlyzoGvOG67Tm98DkgPiEVtt8MKb@vger.kernel.org
X-Gm-Message-State: AOJu0YyPv+hUi4dEckk8nSS4NEypB+unuT+iL7NmjiIQbOmqf0543I99
	RLHN/dPegDa9viG+9H1E7NIPyLeKvXAYhA4vEfi4HoMD+WsrgK6eSBU5Kmxp0ASQzVw=
X-Gm-Gg: ASbGncutGIhstY1a3iHDgITmO7YY9BgknWB3Phu2N3KfbVnDp3+YE2/wwrbcmMW2Cc7
	9UKVHs8tVyMOx6gZoUhCpVByT72mjgLywPhzlAQAHM13R6SK9X27Xa5eQC1+0WwiFvUVthn9pFS
	eJvWvos/i5e1FPQNA6AmAolzyLYsLQ8MDd5uPXq3KvUxwqnfBphLPq6Imp+yL9MwaRjRdk0GXOK
	fzMl4JLZGRvMfsLImpKV8ERRsOx30CMVcc7uwGeqJjsOzhOOM8sDCjczAzz2bPYpKk+wmFvAtrf
	RuABIESyaP5ujreTkfsT0ul8OG5hdm0nfUKaTeNHannK//1ZKNn/AMCOizKt1L+Qp4EllayYrrr
	Xc5Sk4M3nqviBARHtv2uirw==
X-Google-Smtp-Source: AGHT+IFo+wRlamKkfuloCwU5dN5PBppl7y9Fz05LLr9Bmh1ai1Hs9vmBPja3pPN1Ta8qoTLN8AS6lA==
X-Received: by 2002:a05:6a00:cc1:b0:770:48cf:83f5 with SMTP id d2e1a72fcca58-7723e287b8dmr32922036b3a.14.1757099448157;
        Fri, 05 Sep 2025 12:10:48 -0700 (PDT)
Received: from archlinux ([179.110.125.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7727bce1b58sm9102326b3a.9.2025.09.05.12.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 12:10:47 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Subject: [PATCH v1 1/3] arm64: dts: qcom: sm8250-samsung-r8q: Move common parts to dtsi
Date: Fri,  5 Sep 2025 19:09:29 +0000
Message-ID: <20250905190931.27481-2-ghatto404@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905190931.27481-1-ghatto404@gmail.com>
References: <20250905190931.27481-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move common parts of the device tree to a separate dtsi in preparation for
adding other Samsung devices from the S20, Tab S7 or Note 20 families,
creating sm8250-samsung-common.dtsi. Also add support for UFS, USB and
GPIO keys.

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 .../boot/dts/qcom/sm8250-samsung-common.dtsi  | 204 ++++++++++++++++++
 .../boot/dts/qcom/sm8250-samsung-r8q.dts      |  42 ++--
 2 files changed, 217 insertions(+), 29 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
new file mode 100644
index 000000000000..96662bf9e527
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sm8250.dtsi"
+#include "pm8150.dtsi"
+
+/ {
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer: framebuffer@9c000000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x9c000000 0x0 0x2300000>;
+			width = <1080>;
+			height = <2400>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	gpio_keys: gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&vol_up_n>;
+
+		key-vol-up {
+			label = "Volume Up";
+			gpios = <&pm8150_gpios 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	reserved-memory {
+		cont_splash_mem: memory@9c000000 {
+			reg = <0x0 0x9c000000 0x0 0x2300000>;
+			no-map;
+		};
+
+		ramoops@9fa00000 {
+			compatible = "ramoops";
+			reg = <0x0 0x9fa00000 0x0 0x100000>;
+			record-size = <0x4000>;
+			console-size = <0x40000>;
+			ftrace-size = <0x40000>;
+			pmsg-size = <0x40000>;
+			no-map;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8150-rpmh-regulators";
+		qcom,pmic-id = "a";
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
+
+		vreg_s4a_1p8: smps4 {
+			regulator-name = "vreg_s4a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2a_3p1: ldo2 {
+			regulator-name = "vreg_l2a_3p1";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a_0p88: ldo5 {
+			regulator-name = "vreg_l5a_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a_1p2: ldo6 {
+			regulator-name = "vreg_l6a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a_1p2: ldo9 {
+			regulator-name = "vreg_l9a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-name = "vreg_l12a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a_3p0: ldo17 {
+			regulator-name = "vreg_l17a_3p0";
+			regulator-min-microvolt = <2496000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&pm8150_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio3";
+		function = "normal";
+		power-source = <0>;
+		input-enable;
+		bias-pull-up;
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <40 4>; /* I2C (Unused) */
+};
+
+&usb_1 {
+	/* Limit to USB 2.0 for now */
+	qcom,select-utmi-as-pipe-clk;
+
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+	maximum-speed = "high-speed";
+	/* Remove USB3 phy */
+	phys = <&usb_1_hsphy>;
+	phy-names = "usb2-phy";
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l5a_0p88>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+	vdda33-supply = <&vreg_l2a_3p1>;
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	vcc-supply = <&vreg_l17a_3p0>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l6a_1p2>;
+	vccq-max-microamp = <800000>;
+	vccq2-supply = <&vreg_s4a_1p8>;
+	vccq2-max-microamp = <800000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dts b/arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dts
index 131d1edc2ad4..415119a14856 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dts
@@ -2,41 +2,25 @@
 
 /dts-v1/;
 
-#include "sm8250.dtsi"
+#include "sm8250-samsung-common.dtsi"
 
 / {
 	model = "Samsung Galaxy S20 FE";
 	compatible = "samsung,r8q", "qcom,sm8250";
 	chassis-type = "handset";
+};
 
-	chosen {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-		
-		framebuffer: framebuffer@9c000000 {
-			compatible = "simple-framebuffer";
-			reg = <0x0 0x9c000000 0x0 (1080 * 2400 * 4)>;
-			width = <1080>;
-			height = <2400>;
-			stride = <(1080 * 4)>;
-			format = "a8r8g8b8";
-		};
-	};
+&adsp {
+	firmware-name = "qcom/sm8250/Samsung/r8q/adsp.mbn";
+	status = "okay";
+};
 
-	reserved-memory {
-		cont_splash_mem: memory@9c000000 {
-			reg = <0x0 0x9c000000 0x0 (1080 * 2400 * 4)>;
-			no-map;
-		};
+&cdsp {
+	firmware-name = "qcom/sm8250/Samsung/r8q/cdsp.mbn";
+	status = "okay";
+};
 
-		pstore_mem: ramoops@9fa00000 {
-			compatible = "ramoops";
-			reg = <0x0 0x9fa00000 0x0 0x100000>;
-			record-size = <0x4000>;
-			console-size = <0x40000>;
-			ftrace-size = <0x40000>;
-			pmsg-size = <0x40000>;
-		};
-	};
+&slpi {
+	firmware-name = "qcom/sm8250/Samsung/r8q/slpi.mbn";
+	status = "okay";
 };
-- 
2.50.1


