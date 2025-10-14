Return-Path: <linux-arm-msm+bounces-77081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B710BD7493
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 06:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 87CEA4EBD89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 04:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0539430CD9B;
	Tue, 14 Oct 2025 04:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZxAcZ+q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA0630C601
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 04:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416957; cv=none; b=VdWmTfGAAKBxbDkNNc8mol+i+vhRL+gxi4JteYKChNUzIOejPOTXKSFiJFfNNdi57XBRGbp91OTxwSAnOLqpBoiCmVh5muQUtI2uF4gE5SCO7hQMQhNwYykuqS572s7cfkd5BeIFo5p+eawUCSa5gUvDRzZ4hwRwO23UwtWpJts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416957; c=relaxed/simple;
	bh=Lu+Wm6RQz65oFffbhnH7FkqqT/nKySBHieK5G4x8NUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nrx0aaetnfica0UEQX79lVjDAoCJHgEK/H2XFGeukQjTNebYRMG7U4UDwIMtY8mZg9AQ7TAd2Ll2RO9eLIs+5Pw4byHoyWIz0OipIKjZnd41zrRUwyG2pKNlGLEHBExvepodNXNT8R4+qS+f28zUFTmzV/qGIGp6TGkIOlB+UtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZxAcZ+q; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-791c287c10dso4130189b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 21:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760416956; x=1761021756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43dpYvG6mRE+3ZFMhinncIOl4K5qjfPZSeQUmpbj9wc=;
        b=SZxAcZ+qI+EXeGMOquWeSTnNtAXFDHLl0ryUxhueWvkBwvECpLxADInoUoGpgpW0AR
         rR/HND2RqpJf85JB9870bjMYUJSo4qY90eWBHo1ElpyVf+Y8EeqrWQ/AI9SeJCT8WeNG
         y9PiDAHxIrpXpcNoCfGoax+F3EXNbXTGDbeBULZYsE1tqJ2xmmRgT0Of70Gx/HmkFUvc
         wF8iJspX17oZponpExxYd9M2VMGccKbBC51J7FZRwv/Tt95P8W/UVMHZlU/PuaBkUlcm
         p3gfQk03OP+JjhPOqFA48XtWcUTUrRxLFDXeu3SfQyFpS9WR4lcyDo1TVp21YTyDaLAL
         rN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760416956; x=1761021756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43dpYvG6mRE+3ZFMhinncIOl4K5qjfPZSeQUmpbj9wc=;
        b=p8qX1NjR8hq6QpYnpYSko8JMgQSElBAhDKJ4H1Xi4bL8AAS/KDyAXK/Ow1tcMvOphN
         4vsm5EsDyaG0BPEjLu34i2NxvHFFJ2wjLBAL5wRKvaEaHaVKfS86ndEcAjDpl5+DY6Xj
         k/REEjghR7psnDzAny7jdSgD7ShNL1fFBmsjXgymTu2QjYnRI9QaGTL4WcT9sFWLlT9t
         RoVymt8HToccrmKsGumXGYKnwuqkhWTECOtIOhHQAK0yf1jPPSMUrDjaSf3QlkHADdrW
         bXJxYp0LJjLuzr8eKePqFpOUE+GOK7X4+DFozzT4eGhL6exz8R4KM01CDst+ap+EydSd
         ZMoA==
X-Gm-Message-State: AOJu0YwLSeqPRu24HakVEewuC+tcFYTWOTxTdxHsq7Q5Vvph+65TMqNI
	0haO72WJyRcGFawBq6DXBPuuXFOOzFxHlglctxlQBZo1X+VcQZOa+H2h
X-Gm-Gg: ASbGncv3Q22ghVikGY8d9SmuKduJFLGFZpQAguv8KXIe9yNph+GtqFcV5vAk9zEmrID
	3/9aAM7figuflM7rDFPG8MMy7YeSuDXlwrjhplMIfD78HUibHyl2hHYW9p1tTybsGhd6C/+XQyJ
	rwNphoWaDGbUFgl5YGJWUnPsnxUDPRPx/FrJn70DwdTad/RhXONukN7lKUcI/x7Q0Ja8613U70w
	xrD11sDbNHDBCkDc047skbVGBEafK7yhzS2vCby9+ys3es+iEKG00SCeofYEFz0m12LlbmVx3GO
	+0W07SFr/PfcEutxzOrGWdetpVvzkLBXjPQGCzaFsDq6DyC/nvo+6z4dM4df1mbPBXglrAzVhLH
	2lLpwm2xYJkTTLos1PLrzc6F34jKx+PW2tqxG
X-Google-Smtp-Source: AGHT+IFN2HtgJRh8s6x+tEn3p7J0qJhA4Hv1IhkpMVdDgnw3oWKkvvVOM6cfaI6fXuL+XUT5z02ecw==
X-Received: by 2002:a05:6a00:3e27:b0:781:2582:822a with SMTP id d2e1a72fcca58-79385ed2f30mr28375639b3a.8.1760416955694;
        Mon, 13 Oct 2025 21:42:35 -0700 (PDT)
Received: from archlinux ([177.9.216.59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-79b65528a51sm8440684b3a.85.2025.10.13.21.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 21:42:35 -0700 (PDT)
From: =?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] arm64: dts: qcom: r0q: add touchscreen support
Date: Tue, 14 Oct 2025 00:41:32 -0400
Message-ID: <20251014044135.177210-4-ghatto404@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014044135.177210-1-ghatto404@gmail.com>
References: <20251014044135.177210-1-ghatto404@gmail.com>
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
 .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
index 5ca45b040a99..96a8a0e69681 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
@@ -56,6 +56,50 @@ splash-region@b8000000 {
 		};
 	};
 
+	/*
+	 * The device has an issue where SPI 8 (the bus which the touchscreen is
+	 * connected to) is not working properly right now, so spi-gpio
+	 * is used instead.
+	 */
+
+	spi8 {
+		compatible = "spi-gpio";
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&spi_clk_tsp_active &spi_mosi_tsp_active &spi_miso_tsp_active>;
+		pinctrl-1 = <&spi_clk_tsp_sleep &spi_mosi_tsp_sleep &spi_miso_tsp_sleep>;
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
@@ -138,6 +182,20 @@ vreg_l1c_1p8: ldo1 {
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
+
+		vreg_l8c_1p8: ldo8 {
+			regulator-name = "vreg_l8c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11c_3p0: ldo11 {
+			regulator-name = "vreg_l11c_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
 	};
 };
 
@@ -162,6 +220,82 @@ &pon_resin {
 
 &tlmm {
 	gpio-reserved-ranges = <36 4>; /* SPI (Unused) */
+
+	spi_clk_tsp_active: spi-clk-tsp-active {
+		pins = "gpio30";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-disable;
+	};
+
+	spi_clk_tsp_sleep: spi-clk-tsp-sleep {
+		pins = "gpio30";
+		function = "gpio";
+		drive-strength = <6>;
+		input-enable;
+		bias-pull-down;
+	};
+
+	spi_cs_tsp_active: spi-cs-tsp-active {
+		pins = "gpio31";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-disable;
+	};
+
+	spi_cs_tsp_sleep: spi-cs-tsp-sleep {
+		pins = "gpio31";
+		function = "gpio";
+		drive-strength = <6>;
+		input-enable;
+		bias-pull-down;
+	};
+
+	spi_miso_tsp_active: spi-miso-tsp-active {
+		pins = "gpio28";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-disable;
+	};
+
+	spi_miso_tsp_sleep: spi-miso-tsp-sleep {
+		pins = "gpio28";
+		function = "gpio";
+		drive-strength = <6>;
+		input-enable;
+		bias-pull-down;
+	};
+
+	spi_mosi_tsp_active: spi-mosi-tsp-active {
+		pins = "gpio29";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-disable;
+	};
+
+	spi_mosi_tsp_sleep: spi-mosi-tsp-sleep {
+		pins = "gpio29";
+		function = "gpio";
+		drive-strength = <6>;
+		input-enable;
+		bias-pull-down;
+	};
+
+	tsp_int_active: tsp-int-active {
+		pins = "gpio46";
+		function = "gpio";
+		drive-strength = <2>;
+		input-enable;
+		bias-disable;
+	};
+
+	tsp_int_sleep: tsp-int-sleep-state {
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


