Return-Path: <linux-arm-msm+bounces-74318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A588B8D3D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 05:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E37BF3BDD7F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 03:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3371F0E32;
	Sun, 21 Sep 2025 03:08:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from toucan.tulip.relay.mailchannels.net (toucan.tulip.relay.mailchannels.net [23.83.218.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F092F29;
	Sun, 21 Sep 2025 03:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.254
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758424100; cv=pass; b=YIbJu/gTPffTQW/hh/1PowHxsII1a2YTFGnTpgVKxiw31r7BBt8bXQKaVIhDXHi/w3iv9Bko2jRcP+evGndxvsEEcr1r4nG8Tedenk/eXDoG2OuDPl/gOKy4TdbZpry/7R77LI5J5UOB0D1ilrmUthjCKKhpRIPP9OyIIUr6ncw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758424100; c=relaxed/simple;
	bh=zwn42WMJN2d0q3qz3vKQFtx/+oncfWQZEdwrSkLls34=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=ePK5pMoUNE2YANzcgfEO9HLKHIXF4C9QKBJaJqp1t0DsuqlWAqrCYh2mtvjNIVE+ZZRc60x3DmxNT2oUtnBAc+jiwbl9//KhMZsq9j2mqtqz2FKvLFekHoXtntoSwkQswFe8R/98ZqACsBfnZ8x8Zvmhz3RwW9NODDS6fj6UEvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; arc=pass smtp.client-ip=23.83.218.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 98683941522;
	Sun, 21 Sep 2025 03:08:10 +0000 (UTC)
Received: from uk-fast-smtpout7.hostinger.io (trex-blue-1.trex.outbound.svc.cluster.local [100.108.158.238])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id F2BBD941435;
	Sun, 21 Sep 2025 03:08:06 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1758424089; a=rsa-sha256;
	cv=none;
	b=6ZS0x9rswiaLNoMqxLg2t8J7nu+K3lC4cMCjXvS3MPRVA1dLOx/wpj0RY1yLlwzWeym6F1
	1h42De6sjFvsyrF7r3ABSPKZ9Sdt3xRgcxPDku3wEkmbLbXX/hgSnsAxIoPobFcHQwwJJb
	wnpQr+ki5BCncMqoUbZH+xQ9fErSEUlPnv9nlAP3GUIPCLZAorPqTlcOrHa0Hglwji5mFb
	eSxvfSXimzikr6kpYEiv9o/82Joe1WxdQxnTCO5HSFE2WmG/oALgEzfsvXZRK9PnWdQ5lT
	9LJbI90KNmUkKReZIqyR0SB1KDZx+YwBq7++dmHB7zbuvS9F0YHxTWU5ugSzhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1758424089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4GzFI97kjeGLqB+OyEtHHWxZfzwiLrCDyQz38IKDVgQ=;
	b=gZ8O8qKMyg3OGDbIZKaxzni5qPqaT2h5/fYvo0irOkW9EtNKp0y2eoTX9mGaKzsHnE3JRN
	DY/1LlfoM7O6ZNwdFtV+b/t9Yve2/yfeZU/s437rwR11fPYbKFJ4D0gia70+SgcNJlcbiL
	uqRQ9Ji8bmENqe6xvTf1lFGKsY+8KOhbVMmwfah/7weZLBUM8JbWHzmLA1ON+07qpcsWNH
	3QZo8C/CX5lUyMvalCpDNQ3VMovbDxzRlrV9J76gcNS0wn6w09AHygEQiGiLZ44bCRHQFe
	cXi+jtoD/ee3R7o9M1WODAiSx83ZQxUGoVKMQOJPnjBwe4wmlu6a/mefGGnfzQ==
ARC-Authentication-Results: i=1;
	rspamd-5b85487794-f4lt5;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Quick-Befitting: 53c50ff24be8e8a4_1758424090416_1004095662
X-MC-Loop-Signature: 1758424090416:1554852629
X-MC-Ingress-Time: 1758424090415
Received: from uk-fast-smtpout7.hostinger.io (uk-fast-smtpout7.hostinger.io
 [31.220.23.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.158.238 (trex/7.1.3);
	Sun, 21 Sep 2025 03:08:10 +0000
Received: from [172.17.0.2] (unknown [180.253.43.125])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cTrlk0Xx9zHTq4c;
	Sun, 21 Sep 2025 03:08:01 +0000 (UTC)
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2 1/5] ARM: dts: qcom: msm8960: reorder nodes and
 properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-msm8960-reorder-v2-1-26c478366d21@smankusors.com>
References: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
In-Reply-To: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 David Heidelberg <david@ixit.cz>, Max Shevchenko <wctrl@proton.me>, 
 Rudraksha Gupta <guptarud@gmail.com>, Shinjo Park <peremen@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758424077; l=18833;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=zwn42WMJN2d0q3qz3vKQFtx/+oncfWQZEdwrSkLls34=;
 b=d8iOH/nkmsYnYoY9PpsPWuQvtKPoVrKO9WIxGq0HR7WXSLJVWjitcXtiL/6AzGtwDR2NT9fBC
 BGO+aHfioxXDt7uTG/h8wUPor75Ay8uZnCj/96CxR9jtYSlEHmm9m4N
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 21 Sep 2025 03:08:01 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68cf6c14 a=hVqNbC/oQIbyndLMfyRB3g==:117 a=hVqNbC/oQIbyndLMfyRB3g==:17 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=ACe_hbeD2ZCDdtVzaa4A:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfME0mcJMWZDp3wTXte3s9ZzA1K+eS/zLOSWoV3rD7zzNpMvIP4bSqY8NXJoqExzdpEtyJVoPGiC7CWHIPh6T9GRvrVq8/S52xgTuZ8pNPizQtVPwHS0+ r3q96ZZcYO28ITXC+urpQBeOdanhNjtWCsC/cHTosaRAOMMVgFbKawIO6WDa0CNcQ3xlhle0KJrAEOvPqT7PiGVJ+4/YckbdemGjKM3b2A1xta9rrfDYHlPr l5klDLBFArC13V7wRgVHitpaJuAr5kqrK+0bMek5ceN7uqaRaFzGkgykQVp9RJMe8DuBYJc/r7dO9dT52pc3H8mS5NKkEHE4Y/FhRn2nt6t3i7828cBlFf4N 9eMO5qsVr/IT1ZAToRXb3dMuVAnAqY7zNG4SpQDyxsOtLAvgKTt1WC3anegDJ1F+jf+nrAaaAQh4oTfH8bPlTUs7UaaxVs9/5wt96oWTmooe4hs1ZjiYhxms OqW88ra2zczE81nHvPwxBqrc8wuzguM6PSk4Swb9LFacnruACueWtGT2qIydKF9nSiDv1PjeYRNL7jz775YKqMBlrHOdEsPEPr13mw==
X-AuthUser: linux@smankusors.com

Reorder the nodes in qcom-msm8960.dtsi by unit address and sort
properties, as recommended in the Devicetree style guide. This is a
cosmetic change only, with no functional impact.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Tested-by: Shinjo Park <peremen@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 545 ++++++++++++++++---------------
 1 file changed, 280 insertions(+), 265 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 6e272d5345a85fde706d8666ac0fe6f2d40bcf37..6884f7f5b11889f9b28a2cf61890e50e1b1405dd 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -15,6 +15,35 @@ / {
 	compatible = "qcom,msm8960";
 	interrupt-parent = <&intc>;
 
+	clocks {
+		cxo_board: cxo_board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+			clock-output-names = "cxo_board";
+		};
+
+		pxo_board: pxo_board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <27000000>;
+			clock-output-names = "pxo_board";
+		};
+
+		sleep_clk: sleep_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+			clock-output-names = "sleep_clk";
+		};
+	};
+
+	cpu-pmu {
+		compatible = "qcom,krait-pmu";
+		interrupts = <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
+		qcom,no-pc-write;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -22,9 +51,9 @@ cpus {
 
 		cpu@0 {
 			compatible = "qcom,krait";
+			reg = <0>;
 			enable-method = "qcom,kpss-acc-v1";
 			device_type = "cpu";
-			reg = <0>;
 			next-level-cache = <&l2>;
 			qcom,acc = <&acc0>;
 			qcom,saw = <&saw0>;
@@ -32,9 +61,9 @@ cpu@0 {
 
 		cpu@1 {
 			compatible = "qcom,krait";
+			reg = <1>;
 			enable-method = "qcom,kpss-acc-v1";
 			device_type = "cpu";
-			reg = <1>;
 			next-level-cache = <&l2>;
 			qcom,acc = <&acc1>;
 			qcom,saw = <&saw1>;
@@ -52,111 +81,29 @@ memory@80000000 {
 		reg = <0x80000000 0>;
 	};
 
-	thermal-zones {
-		cpu0-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-			thermal-sensors = <&tsens 0>;
-
-			trips {
-				cpu_alert0: trip0 {
-					temperature = <60000>;
-					hysteresis = <10000>;
-					type = "passive";
-				};
-
-				cpu_crit0: trip1 {
-					temperature = <95000>;
-					hysteresis = <10000>;
-					type = "critical";
-				};
-			};
-		};
-
-		cpu1-thermal {
-			polling-delay-passive = <250>;
-			polling-delay = <1000>;
-			thermal-sensors = <&tsens 1>;
-
-			trips {
-				cpu_alert1: trip0 {
-					temperature = <60000>;
-					hysteresis = <10000>;
-					type = "passive";
-				};
-
-				cpu_crit1: trip1 {
-					temperature = <95000>;
-					hysteresis = <10000>;
-					type = "critical";
-				};
-			};
-		};
-	};
-
-	cpu-pmu {
-		compatible = "qcom,krait-pmu";
-		interrupts = <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
-		qcom,no-pc-write;
-	};
-
-	clocks {
-		cxo_board: cxo_board {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <19200000>;
-			clock-output-names = "cxo_board";
-		};
-
-		pxo_board: pxo_board {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <27000000>;
-			clock-output-names = "pxo_board";
-		};
-
-		sleep_clk: sleep_clk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <32768>;
-			clock-output-names = "sleep_clk";
-		};
-	};
-
-	/* Temporary fixed regulator */
-	vsdcc_fixed: vsdcc-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "SDCC Power";
-		regulator-min-microvolt = <2700000>;
-		regulator-max-microvolt = <2700000>;
-		regulator-always-on;
-	};
-
 	soc: soc {
+		compatible = "simple-bus";
+		ranges;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		ranges;
-		compatible = "simple-bus";
 
-		intc: interrupt-controller@2000000 {
-			compatible = "qcom,msm-qgic2";
-			interrupt-controller;
-			#interrupt-cells = <3>;
-			reg = <0x02000000 0x1000>,
-			      <0x02002000 0x1000>;
+		rpm: rpm@108000 {
+			compatible = "qcom,rpm-msm8960";
+			reg = <0x108000 0x1000>;
+			qcom,ipc = <&l2cc 0x8 2>;
+
+			interrupts = <GIC_SPI 19 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ack",
+					  "err",
+					  "wakeup";
 		};
 
-		timer@200a000 {
-			compatible = "qcom,kpss-wdt-msm8960", "qcom,kpss-timer",
-				     "qcom,msm-timer";
-			interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
-				     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
-				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
-			reg = <0x0200a000 0x100>;
-			clock-frequency = <27000000>;
-			clocks = <&sleep_clk>;
-			clock-names = "sleep";
-			cpu-offset = <0x80000>;
+		ssbi: ssbi@500000 {
+			compatible = "qcom,ssbi";
+			reg = <0x500000 0x1000>;
+			qcom,controller-type = "pmic-arbiter";
 		};
 
 		qfprom: efuse@700000 {
@@ -176,24 +123,26 @@ tsens_backup: backup-calib@414 {
 
 		msmgpio: pinctrl@800000 {
 			compatible = "qcom,msm8960-pinctrl";
+			reg = <0x800000 0x4000>;
 			gpio-controller;
 			gpio-ranges = <&msmgpio 0 0 152>;
 			#gpio-cells = <2>;
 			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			reg = <0x800000 0x4000>;
 		};
 
 		gcc: clock-controller@900000 {
 			compatible = "qcom,gcc-msm8960", "syscon";
+			reg = <0x900000 0x4000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-			reg = <0x900000 0x4000>;
 			clocks = <&cxo_board>,
 				 <&pxo_board>,
 				 <&lcc PLL4>;
-			clock-names = "cxo", "pxo", "pll4";
+			clock-names = "cxo",
+				      "pxo",
+				      "pll4";
 
 			tsens: thermal-sensor {
 				compatible = "qcom,msm8960-tsens";
@@ -208,49 +157,25 @@ tsens: thermal-sensor {
 			};
 		};
 
-		lcc: clock-controller@28000000 {
-			compatible = "qcom,lcc-msm8960";
-			reg = <0x28000000 0x1000>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			clocks = <&pxo_board>,
-				 <&gcc PLL4_VOTE>,
-				 <0>,
-				 <0>, <0>,
-				 <0>, <0>,
-				 <0>;
-			clock-names = "pxo",
-				      "pll4_vote",
-				      "mi2s_codec_clk",
-				      "codec_i2s_mic_codec_clk",
-				      "spare_i2s_mic_codec_clk",
-				      "codec_i2s_spkr_codec_clk",
-				      "spare_i2s_spkr_codec_clk",
-				      "pcm_codec_clk";
+		intc: interrupt-controller@2000000 {
+			compatible = "qcom,msm-qgic2";
+			reg = <0x02000000 0x1000>,
+			      <0x02002000 0x1000>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
 		};
 
-		clock-controller@4000000 {
-			compatible = "qcom,mmcc-msm8960";
-			reg = <0x4000000 0x1000>;
-			#clock-cells = <1>;
-			#power-domain-cells = <1>;
-			#reset-cells = <1>;
-			clocks = <&pxo_board>,
-				 <&gcc PLL3>,
-				 <&gcc PLL8_VOTE>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>;
-			clock-names = "pxo",
-				      "pll3",
-				      "pll8_vote",
-				      "dsi1pll",
-				      "dsi1pllbyte",
-				      "dsi2pll",
-				      "dsi2pllbyte",
-				      "hdmipll";
+		timer@200a000 {
+			compatible = "qcom,kpss-wdt-msm8960", "qcom,kpss-timer",
+				     "qcom,msm-timer";
+			reg = <0x0200a000 0x100>;
+			interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
+				     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
+				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
+			clock-frequency = <27000000>;
+			clocks = <&sleep_clk>;
+			clock-names = "sleep";
+			cpu-offset = <0x80000>;
 		};
 
 		l2cc: clock-controller@2011000 {
@@ -261,17 +186,6 @@ l2cc: clock-controller@2011000 {
 			#clock-cells = <0>;
 		};
 
-		rpm: rpm@108000 {
-			compatible = "qcom,rpm-msm8960";
-			reg = <0x108000 0x1000>;
-			qcom,ipc = <&l2cc 0x8 2>;
-
-			interrupts = <GIC_SPI 19 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "ack", "err", "wakeup";
-		};
-
 		acc0: clock-controller@2088000 {
 			compatible = "qcom,kpss-acc-v1";
 			reg = <0x02088000 0x1000>, <0x02008000 0x1000>;
@@ -281,15 +195,6 @@ acc0: clock-controller@2088000 {
 			#clock-cells = <0>;
 		};
 
-		acc1: clock-controller@2098000 {
-			compatible = "qcom,kpss-acc-v1";
-			reg = <0x02098000 0x1000>, <0x02008000 0x1000>;
-			clocks = <&gcc PLL8_VOTE>, <&pxo_board>;
-			clock-names = "pll8_vote", "pxo";
-			clock-output-names = "acpu1_aux";
-			#clock-cells = <0>;
-		};
-
 		saw0: power-manager@2089000 {
 			compatible = "qcom,msm8960-saw2-cpu", "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
@@ -300,6 +205,15 @@ saw0_vreg: regulator {
 			};
 		};
 
+		acc1: clock-controller@2098000 {
+			compatible = "qcom,kpss-acc-v1";
+			reg = <0x02098000 0x1000>, <0x02008000 0x1000>;
+			clocks = <&gcc PLL8_VOTE>, <&pxo_board>;
+			clock-names = "pll8_vote", "pxo";
+			clock-output-names = "acpu1_aux";
+			#clock-cells = <0>;
+		};
+
 		saw1: power-manager@2099000 {
 			compatible = "qcom,msm8960-saw2-cpu", "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
@@ -310,77 +224,34 @@ saw1_vreg: regulator {
 			};
 		};
 
-		gsbi5: gsbi@16400000 {
-			compatible = "qcom,gsbi-v1.0.0";
-			cell-index = <5>;
-			reg = <0x16400000 0x100>;
-			clocks = <&gcc GSBI5_H_CLK>;
-			clock-names = "iface";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-
-			syscon-tcsr = <&tcsr>;
-
-			status = "disabled";
-
-			gsbi5_serial: serial@16440000 {
-				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
-				reg = <0x16440000 0x1000>,
-				      <0x16400000 0x1000>;
-				interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GSBI5_UART_CLK>, <&gcc GSBI5_H_CLK>;
-				clock-names = "core", "iface";
-				status = "disabled";
-			};
-		};
-
-		gsbi8: gsbi@1a000000  {
-			compatible = "qcom,gsbi-v1.0.0";
-			cell-index = <8>;
-			reg = <0x1a000000 0x100>;
-			clocks = <&gcc GSBI8_H_CLK>;
-			clock-names = "iface";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-
-			syscon-tcsr = <&tcsr>;
-
-			status = "disabled";
-
-			gsbi8_serial: serial@1a040000 {
-				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
-				reg = <0x1a040000 0x1000>,
-				      <0x1a000000 0x1000>;
-				interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&gcc GSBI8_UART_CLK>,
-					 <&gcc GSBI8_H_CLK>;
-				clock-names = "core",
-					      "iface";
-
-				status = "disabled";
-			};
-		};
-
-		ssbi: ssbi@500000 {
-			compatible = "qcom,ssbi";
-			reg = <0x500000 0x1000>;
-			qcom,controller-type = "pmic-arbiter";
-		};
-
-		rng@1a500000 {
-			compatible = "qcom,prng";
-			reg = <0x1a500000 0x200>;
-			clocks = <&gcc PRNG_CLK>;
-			clock-names = "core";
+		clock-controller@4000000 {
+			compatible = "qcom,mmcc-msm8960";
+			reg = <0x4000000 0x1000>;
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&pxo_board>,
+				 <&gcc PLL3>,
+				 <&gcc PLL8_VOTE>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "pxo",
+				      "pll3",
+				      "pll8_vote",
+				      "dsi1pll",
+				      "dsi1pllbyte",
+				      "dsi2pll",
+				      "dsi2pllbyte",
+				      "hdmipll";
 		};
 
 		sdcc3: mmc@12180000 {
 			compatible = "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x00051180>;
-			status = "disabled";
 			reg = <0x12180000 0x2000>;
+			arm,primecell-periphid = <0x00051180>;
 			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc SDC3_CLK>, <&gcc SDC3_H_CLK>;
 			clock-names = "mclk", "apb_pclk";
@@ -392,6 +263,8 @@ sdcc3: mmc@12180000 {
 			vmmc-supply = <&vsdcc_fixed>;
 			dmas = <&sdcc3bam 2>, <&sdcc3bam 1>;
 			dma-names = "tx", "rx";
+
+			status = "disabled";
 		};
 
 		sdcc3bam: dma-controller@12182000 {
@@ -405,10 +278,9 @@ sdcc3bam: dma-controller@12182000 {
 		};
 
 		sdcc1: mmc@12400000 {
-			status = "disabled";
 			compatible = "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x00051180>;
 			reg = <0x12400000 0x2000>;
+			arm,primecell-periphid = <0x00051180>;
 			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc SDC1_CLK>, <&gcc SDC1_H_CLK>;
 			clock-names = "mclk", "apb_pclk";
@@ -420,6 +292,8 @@ sdcc1: mmc@12400000 {
 			vmmc-supply = <&vsdcc_fixed>;
 			dmas = <&sdcc1bam 2>, <&sdcc1bam 1>;
 			dma-names = "tx", "rx";
+
+			status = "disabled";
 		};
 
 		sdcc1bam: dma-controller@12402000 {
@@ -432,37 +306,6 @@ sdcc1bam: dma-controller@12402000 {
 			qcom,ee = <0>;
 		};
 
-		tcsr: syscon@1a400000 {
-			compatible = "qcom,tcsr-msm8960", "syscon";
-			reg = <0x1a400000 0x100>;
-		};
-
-		gsbi1: gsbi@16000000 {
-			compatible = "qcom,gsbi-v1.0.0";
-			cell-index = <1>;
-			reg = <0x16000000 0x100>;
-			clocks = <&gcc GSBI1_H_CLK>;
-			clock-names = "iface";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
-
-			status = "disabled";
-
-			gsbi1_spi: spi@16080000 {
-				compatible = "qcom,spi-qup-v1.1.1";
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <0x16080000 0x1000>;
-				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
-				cs-gpios = <&msmgpio 8 0>;
-
-				clocks = <&gcc GSBI1_QUP_CLK>, <&gcc GSBI1_H_CLK>;
-				clock-names = "core", "iface";
-				status = "disabled";
-			};
-		};
-
 		usb1: usb@12500000 {
 			compatible = "qcom,ci-hdrc";
 			reg = <0x12500000 0x200>,
@@ -479,6 +322,7 @@ usb1: usb@12500000 {
 			phys = <&usb_hs1_phy>;
 			phy-names = "usb-phy";
 			#reset-cells = <1>;
+
 			status = "disabled";
 
 			ulpi {
@@ -494,6 +338,34 @@ usb_hs1_phy: phy {
 			};
 		};
 
+		gsbi1: gsbi@16000000 {
+			compatible = "qcom,gsbi-v1.0.0";
+			reg = <0x16000000 0x100>;
+			ranges;
+			cell-index = <1>;
+			clocks = <&gcc GSBI1_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			status = "disabled";
+
+			gsbi1_spi: spi@16080000 {
+				compatible = "qcom,spi-qup-v1.1.1";
+				reg = <0x16080000 0x1000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+				cs-gpios = <&msmgpio 8 0>;
+				clocks = <&gcc GSBI1_QUP_CLK>,
+					 <&gcc GSBI1_H_CLK>;
+				clock-names = "core",
+					      "iface";
+
+				status = "disabled";
+			};
+		};
+
 		gsbi3: gsbi@16200000 {
 			compatible = "qcom,gsbi-v1.0.0";
 			reg = <0x16200000 0x100>;
@@ -503,6 +375,7 @@ gsbi3: gsbi@16200000 {
 			clock-names = "iface";
 			#address-cells = <1>;
 			#size-cells = <1>;
+
 			status = "disabled";
 
 			gsbi3_i2c: i2c@16280000 {
@@ -514,12 +387,154 @@ gsbi3_i2c: i2c@16280000 {
 				interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GSBI3_QUP_CLK>,
 					 <&gcc GSBI3_H_CLK>;
-				clock-names = "core", "iface";
+				clock-names = "core",
+					      "iface";
 				#address-cells = <1>;
 				#size-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
+		gsbi5: gsbi@16400000 {
+			compatible = "qcom,gsbi-v1.0.0";
+			reg = <0x16400000 0x100>;
+			ranges;
+			cell-index = <5>;
+			clocks = <&gcc GSBI5_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			syscon-tcsr = <&tcsr>;
+
+			status = "disabled";
+
+			gsbi5_serial: serial@16440000 {
+				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
+				reg = <0x16440000 0x1000>,
+				      <0x16400000 0x1000>;
+				interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI5_UART_CLK>,
+					 <&gcc GSBI5_H_CLK>;
+				clock-names = "core",
+					      "iface";
+
 				status = "disabled";
 			};
 		};
+
+		gsbi8: gsbi@1a000000 {
+			compatible = "qcom,gsbi-v1.0.0";
+			reg = <0x1a000000 0x100>;
+			ranges;
+			cell-index = <8>;
+			clocks = <&gcc GSBI8_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			syscon-tcsr = <&tcsr>;
+
+			status = "disabled";
+
+			gsbi8_serial: serial@1a040000 {
+				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
+				reg = <0x1a040000 0x1000>,
+				      <0x1a000000 0x1000>;
+				interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI8_UART_CLK>,
+					 <&gcc GSBI8_H_CLK>;
+				clock-names = "core",
+					      "iface";
+
+				status = "disabled";
+			};
+		};
+
+		tcsr: syscon@1a400000 {
+			compatible = "qcom,tcsr-msm8960", "syscon";
+			reg = <0x1a400000 0x100>;
+		};
+
+		rng@1a500000 {
+			compatible = "qcom,prng";
+			reg = <0x1a500000 0x200>;
+			clocks = <&gcc PRNG_CLK>;
+			clock-names = "core";
+		};
+
+		lcc: clock-controller@28000000 {
+			compatible = "qcom,lcc-msm8960";
+			reg = <0x28000000 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			clocks = <&pxo_board>,
+				 <&gcc PLL4_VOTE>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "pxo",
+				      "pll4_vote",
+				      "mi2s_codec_clk",
+				      "codec_i2s_mic_codec_clk",
+				      "spare_i2s_mic_codec_clk",
+				      "codec_i2s_spkr_codec_clk",
+				      "spare_i2s_spkr_codec_clk",
+				      "pcm_codec_clk";
+		};
+	};
+
+	thermal-zones {
+		cpu0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens 0>;
+
+			trips {
+				cpu_alert0: trip0 {
+					temperature = <60000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu_crit0: trip1 {
+					temperature = <95000>;
+					hysteresis = <10000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens 1>;
+
+			trips {
+				cpu_alert1: trip0 {
+					temperature = <60000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+
+				cpu_crit1: trip1 {
+					temperature = <95000>;
+					hysteresis = <10000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
+	/* Temporary fixed regulator */
+	vsdcc_fixed: vsdcc-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "SDCC Power";
+		regulator-min-microvolt = <2700000>;
+		regulator-max-microvolt = <2700000>;
+		regulator-always-on;
 	};
 };
 #include "qcom-msm8960-pins.dtsi"

-- 
2.34.1


