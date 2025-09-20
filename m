Return-Path: <linux-arm-msm+bounces-74256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6A6B8BCFA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 03:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2481AA05A21
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 01:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D3D1C8604;
	Sat, 20 Sep 2025 01:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyNxij0y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB5E20F08C
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 01:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758332832; cv=none; b=nvuZOQtFkrmvO1GCpduZGfK5CHTeOAmQBFArGv7P3C9lmNhtQAI1WYWKonGgO9rDYSgJcM40zP+MkHSVT6lNoFrRLMsZNUFvwx00MDfD69g8t0E7jQdN/XfC1nH3AW1IxBjDoTnkKRi2FHtGUHkhhp9pjfxR5Td7AmRF6YAqfwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758332832; c=relaxed/simple;
	bh=aRmp+/oecFFHV4rBizvkU5l0FhyGV7U0cEbn7zMDiEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iEB3r7Uj5WCUbOP4iymWMBmQ0USL56ZHRJ6NIqau218Jr+Jg/uRAd6gnlLN58ug8B+1LGoZrwAYHncPWTF7JGGSAHIM0Rchre60tC4YAZWnWg7D0izxo8qpmPz03s0cj0PmX8W3YkcR0uZrCvTJvHRhLqLhnBpZvE7gXw80z6QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyNxij0y; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24c8ef94e5dso23591425ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758332830; x=1758937630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7npXYgxY41NPqzpSKfP+17vnrXdgVumONF2Se9aVSk=;
        b=YyNxij0yxn/G9ntS3O7fl/1dOx3qH6zSQ/PUAeLpDCTyDnypmQVDD+gVsxx+gdYQIM
         WCgHkFE9wemLC7wFslJyQu11Y6o1CbnKY9rDTpifIZAo8XvU8Bt5R/RL337FSm2tzcGk
         raQkcK97BwEMdvGA6gsd9Iop6MFZwZOoBMPzI4J3pcNFjP095c6JXrXKqecpabBRUzHu
         CWv2iOKuRVvTBtzdLolNBnf9T3E86UZ5lv/AAfueASdCjN9yRNcMVDPFvhczqPQZ+1as
         b2xONbVqaY57dQX+7aWBrRm6NgqFP4bgKVnn4m9a6wMAuQYDiQnLBkKfX92bCg6MQcxH
         D/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758332830; x=1758937630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7npXYgxY41NPqzpSKfP+17vnrXdgVumONF2Se9aVSk=;
        b=djSe7pwneNz8MULaqDzMGmLZvPkUv+PLuhfjs/eGBqOVLxv9nJd2eSYSeLyWeMmpwa
         pYtLu56UsPgdmIHPrgjv0uZ2+hnc6Bn8xYtnNRSWvnuO8y7sP1DyzxncgbAMYUnUkNHg
         p1BdRmbJWpGO/CvWskuHaPirAll1elTNixcfRhCmB+3cQsGMjVLbfKQWb0sr0fFr9cyi
         NclG/IjQF9++BFpQpSSDubKaVn70903g59FM8jN2wYxmZorML4qKdmkYr0/XfUEnQUYJ
         WnWbjjGFwsvM51GV0TKaCs8QLr7HM4rDVEludyPpXUHcpVlr7faEqb9qbwYzLZ2sZwqH
         OMKw==
X-Forwarded-Encrypted: i=1; AJvYcCWYynHHUwOvateJS4xd6CZ1JydGtsN0iLVjSLDvyWDqUHNphh+zbyO+v0kUV/eVVTzBXMNkiVd+30x/zcME@vger.kernel.org
X-Gm-Message-State: AOJu0YxLU08Fu/ErJ8KNjW9hwanZVcbHgSwDS+ImoTYdKiActiAiJAdy
	8tK7LdjaKOKPiqrMgqdy86cd+lb9Yk0BkGthbmRIN+7p/ltRFkCrw8sp
X-Gm-Gg: ASbGncukzIKdM8DnTgR+wdVneK3Jdx76Q3tDZG2XKX6Tas57/JpQIBqOOD14lkDOLQm
	S0NkHev5WwDCVfms2KfBF/O3FglAxm2ET/SF6XQUqGZW3steXS4ZOgxXXWHk3FHjlYOuMoKkxfR
	0QkMcBZCOPhPGgZUg2lWmmHDIovNCUDdq95tvuluxcJ94cHKCLPnC0FVcFwsmi1f44A1RSvTfBA
	IkOnrKDQfyHr4wuN9tkfWJgLfRjBx0fl4l/rRS2JOR2eoyvjiydrQTOgFgFtg2OQPsO6rvsnzWW
	fcPFn9sptLFPUb0pWPCj3DWJh6nAgud5VoD4PWsmqJSCSRke7rTbog9otSCmoqVhWbFDFA+3LfS
	XwHXRhGeUAv8PH3zUoZw+
X-Google-Smtp-Source: AGHT+IGAi8vnQCWhOm+osD3zmZZvsfCltRPv2Y4dmfTI+E54VnE88ez9zVtoTAQLIcJ0gDclrNP1WA==
X-Received: by 2002:a17:902:dace:b0:272:56e:e296 with SMTP id d9443c01a7336-272056ee45dmr173405ad.30.1758332830258;
        Fri, 19 Sep 2025 18:47:10 -0700 (PDT)
Received: from archlinux ([191.193.70.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698033c922sm65709455ad.131.2025.09.19.18.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 18:47:09 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: qcom: r0q: add touchscreen support
Date: Sat, 20 Sep 2025 01:46:34 +0000
Message-ID: <20250920014637.38175-3-ghatto404@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920014637.38175-1-ghatto404@gmail.com>
References: <20250920014637.38175-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable the ST-Microelectronics FTS2BA61Y touchscreen. This patch
depends on "Input: add support for the STM FTS2BA61Y touchscreen".

The device has an issue where SPI 8 (the bus which the touchscreen is
connected to) is not working properly right now, so
spi-gpio is used instead.

Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
---
 .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 167 ++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
index 70e953824996..7bf56564dfc6 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
@@ -55,6 +55,45 @@ splash-region@b8000000 {
 		};
 	};
 
+	spi_gpio: spi-gpio@0 {
+		compatible = "spi-gpio";
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&spi_clk_tsp_active &spi_mosi_tsp_active &spi_miso_tsp_active>;
+		pinctrl-1 = <&spi_clk_tsp_sleep &spi_mosi_tsp_sleep &spi_miso_tsp_sleep>;
+
+		status = "okay";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&tlmm 30 GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&tlmm 28 GPIO_ACTIVE_HIGH>;
+		cs-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
+
+		num-chipselects = <1>;
+
+		spi-max-frequency = <5000000>;
+
+		touchscreen@0 {
+			compatible = "st,fts2ba61y";
+			reg = <0>;
+			spi-max-frequency = <5000000>;
+
+			vdd-supply = <&vreg_l8c_1p8>;
+			avdd-supply = <&vreg_l11c_3p0>;
+
+			interrupt-parent = <&tlmm>;
+			interrupts = <46 IRQ_TYPE_LEVEL_LOW>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&tsp_int_active>;
+			pinctrl-1 = <&tsp_int_sleep>;
+
+			status = "okay";
+		};
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -132,6 +171,18 @@ vreg_l1c_1p8: ldo1 {
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
+
+		vreg_l8c_1p8: ldo8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11c_3p0: ldo11 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
 	};
 };
 
@@ -156,6 +207,122 @@ &pon_resin {
 
 &tlmm {
 	gpio-reserved-ranges = <36 4>; /* SPI (Unused) */
+
+	spi_clk_tsp_active: spi_clk_tsp_active {
+		mux {
+			pins = "gpio30";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio30";
+			drive-strength = <6>;
+			bias-disable;
+		};
+	};
+
+	spi_clk_tsp_sleep: spi_clk_tsp_sleep {
+		mux {
+			pins = "gpio30";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio30";
+			drive-strength = <6>;
+			input-enable;
+			bias-pull-down;
+		};
+	};
+
+	spi_cs_tsp_active: spi_cs_tsp_active {
+		mux {
+			pins = "gpio31";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio31";
+			drive-strength = <6>;
+			bias-disable;
+		};
+	};
+
+	spi_cs_tsp_sleep: spi_cs_tsp_sleep {
+		mux {
+			pins = "gpio31";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio31";
+			drive-strength = <6>;
+			input-enable;
+			bias-pull-down;
+		};
+	};
+
+	spi_miso_tsp_active: spi_miso_tsp_active {
+		mux {
+			pins = "gpio28";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio28";
+			drive-strength = <6>;
+			bias-disable;
+		};
+	};
+
+	spi_miso_tsp_sleep: spi_miso_tsp_sleep {
+		mux {
+			pins = "gpio28";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio28";
+			drive-strength = <6>;
+			input-enable;
+			bias-pull-down;
+		};
+	};
+
+	spi_mosi_tsp_active: spi_mosi_tsp_active {
+		mux {
+			pins = "gpio29";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio29";
+			drive-strength = <6>;
+			bias-disable;
+		};
+	};
+
+	spi_mosi_tsp_sleep: spi_mosi_tsp_sleep {
+		mux {
+			pins = "gpio29";
+			function = "gpio";
+		};
+		config {
+			pins = "gpio29";
+			drive-strength = <6>;
+			input-enable;
+			bias-pull-down;
+		};
+	};
+
+	tsp_int_active: tsp_int_active {
+		pins = "gpio46";
+		function = "gpio";
+		drive-strength = <2>;
+		input-enable;
+		bias-disable;
+	};
+
+	tsp_int_sleep: tsp_int_sleep_state {
+		pins = "gpio46";
+		function = "gpio";
+		drive-strength = <2>;
+		input-enable;
+		bias-disable;
+	};
 };
 
 &usb_1 {
-- 
2.51.0


