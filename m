Return-Path: <linux-arm-msm+bounces-48295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D84A38E9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0610171FD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119B61B6D1C;
	Mon, 17 Feb 2025 22:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="J2z3uzBF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1B41AF0B0;
	Mon, 17 Feb 2025 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739829962; cv=none; b=F9KA41JAz2v/Z5sBQtf1WgJgU9H3ehCw8rO0LVzbaLA0p2Nv0bqMOFv5EJwCQaV3iFggo0jMBxJ81kYER73IQcGP/IKuiqjqguiHMir99tlN9aERwGVY1rI6T2XArln+YBIrVxH/09kBdjxZgWLS/6XZniaNbGnyF0Zy/KfJZzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739829962; c=relaxed/simple;
	bh=lqkXS5bYpxgP0JNQUtpM7L05DqjrVOACSHBykud/Gn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HhG1YDpzsP9AeVZ8rFJAyeN/9+rSMnAzX/tbHsPSWn42v0mKvUk+o3thIVetFMKai8OzjvgDsfuDRNlk7Yd5sPY/MW4uAFNt+O+VaniKQbmsxQxdZGhp9xPUjhIrFj/D+bQk+YnBrgThRFN0DQ/p+vFiRmQMyy/Au15mraIsng4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=J2z3uzBF; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1739829950; bh=lqkXS5bYpxgP0JNQUtpM7L05DqjrVOACSHBykud/Gn4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=J2z3uzBFG48LSpvXttKn3RNQwgzHbpGsXZ0J8Ta85+WcLspqxKc22pN4aTxMHUvXX
	 CEmQGBPartGRITM1OjOD2Z7qPq8zrvP5baAoEMceIq2XVPP9Y5b/CUhbYrDPqXak9j
	 1ldAGsVYo9CCY/emLq0AQWxaVfJWGt7DRh4JQIu8=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 17 Feb 2025 23:05:23 +0100
Subject: [PATCH v5 09/13] ARM: dts: qcom: msm8226: Add modem remoteproc
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250217-msm8226-modem-v5-9-2bc74b80e0ae@lucaweiss.eu>
References: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
In-Reply-To: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5470; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=lqkXS5bYpxgP0JNQUtpM7L05DqjrVOACSHBykud/Gn4=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBns7K3EiowV6eDD2tzN2RDqcushz2DdZtLG9/Db
 iAbTgLKgL6JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7OytwAKCRBy2EO4nU3X
 ViglD/sFFRp8L8VDAmeuNxowD24eRThxHTvGUD5iC/N4r1pwm2FsJ39evAi4wZ8LE3tPoZ2aCnr
 DFmywiLgG0hIIJibpChTqlNJvf7iPGo7JdLlb2ywtbXuomH4CjzFwAgQ5PQMaJvrqgGjLmq3eBq
 4V/MR7aEXcwgVeBJU/0Ryc9QT6qtqPZOeZsmOTeu0l6AkY/+BHqB7G54jiYiH1k6o85PiaYGv56
 63tdqmklB9Q0jJJpJDP6k4cXZY+lD8+C62/ZB1/Rxw3i+qN+CbUUqHQyjglMWX2fFhQSWCniv8y
 wzI5SatDD8y8Xc3dkWLKzpE5AjGVOrGX/l5Cwk3zhCOCcy/qGSoRnCzDmEUxb5/AIhWywVatylm
 XzTsLAS1jUSZbsfzsqr7UHzP3RcTJe8WW1N7aPbU1Gu3CB87qTMrRM9xS54QmA/Mma0QQaZVqfr
 jDtwAt3X4EWi12e3ycxg/GAmPjSdDTFOCd6mRd/Zt25PevApreY7OFLgm8YZ/XkaQukX6e8ZLhO
 YnituSeZRTKbQr96ZL8nnrv9pKklDtGvgdInqRj6tDjGyi3r3A2oZ+k7WuVgY0LRPcXAZ1WZ+IU
 U3dO+uMwnoK4k3BN8dK19+eM1FXZzbiNOo8+d8Majpc95Q9JdxjFxHXuO+h8K9axYgShV89ickH
 5aaZL42YifWKcPQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add a node for the modem remoteproc found on MSM8226.

Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |  2 +
 .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |  6 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 90 ++++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  2 +
 4 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts
index 7d519156d91d156d801c477711751aba66cc3224..a8543ca7b5569549418683b6be320784eba1768c 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts
@@ -12,6 +12,8 @@
 #include "pm8226.dtsi"
 
 /delete-node/ &adsp_region;
+/delete-node/ &mba_region;
+/delete-node/ &mpss_region;
 /delete-node/ &smem_region;
 
 / {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
index a15a44fc0181bf23e7531ecdc8978505ca48189d..fbd568c7d6b7415d240aa1a2329d07cf9135274c 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
@@ -8,6 +8,8 @@
 #include "pm8226.dtsi"
 
 /delete-node/ &adsp_region;
+/delete-node/ &mba_region;
+/delete-node/ &mpss_region;
 /delete-node/ &smem_region;
 
 / {
@@ -145,12 +147,12 @@ framebuffer@3200000 {
 			no-map;
 		};
 
-		mpss@8400000 {
+		mpss_region: mpss@8400000 {
 			reg = <0x08400000 0x1f00000>;
 			no-map;
 		};
 
-		mba@a300000 {
+		mba_region: mba@a300000 {
 			reg = <0x0a300000 0x100000>;
 			no-map;
 		};
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index 7e0838af6c2d0dc26e0082471b70578bc627491d..662911f4cf163c3a5bdd1a4d5d79713074accc20 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -213,6 +213,18 @@ smem_region: smem@3000000 {
 			no-map;
 		};
 
+		mpss_region: mpss@8000000 {
+			reg = <0x08000000 0x5100000>;
+			no-map;
+			status = "disabled";
+		};
+
+		mba_region: mba@d100000 {
+			reg = <0x0d100000 0x100000>;
+			no-map;
+			status = "disabled";
+		};
+
 		adsp_region: adsp@dc00000 {
 			reg = <0x0dc00000 0x1900000>;
 			no-map;
@@ -253,6 +265,31 @@ adsp_smp2p_in: slave-kernel {
 		};
 	};
 
+	smp2p-modem {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs 14>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	smsm {
 		compatible = "qcom,smsm";
 		#address-cells = <1>;
@@ -879,6 +916,59 @@ spmi_bus: spmi@fc4cf000 {
 			#interrupt-cells = <4>;
 		};
 
+		modem: remoteproc@fc880000 {
+			compatible = "qcom,msm8226-mss-pil";
+			reg = <0xfc880000 0x4040>,
+			      <0xfc820000 0x10000>;
+			reg-names = "qdsp6",
+				    "rmb";
+
+			interrupts-extended = <&intc GIC_SPI 24 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
+				 <&gcc GCC_MSS_CFG_AHB_CLK>,
+				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface",
+				      "bus",
+				      "mem",
+				      "xo";
+
+			resets = <&gcc GCC_MSS_RESTART>;
+			reset-names = "mss_restart";
+
+			power-domains = <&rpmpd MSM8226_VDDCX>;
+			power-domain-names = "cx";
+
+			qcom,ext-bhs-reg = <&tcsr_regs_1 0x194>;
+			qcom,halt-regs = <&tcsr_regs_1 0x180 0x200 0x280>;
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			memory-region = <&mba_region>, <&mpss_region>;
+
+			status = "disabled";
+
+			smd-edge {
+				interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
+
+				mboxes = <&apcs 12>;
+				qcom,smd-edge = <0>;
+
+				label = "modem";
+			};
+		};
+
 		tcsr_mutex: hwlock@fd484000 {
 			compatible = "qcom,msm8226-tcsr-mutex", "qcom,tcsr-mutex";
 			reg = <0xfd484000 0x1000>;
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
index 3037344eb24055071cc77c9cfce0f1d0f95de921..18396623a91dd4bf4b66f01c1d983c391722f3b5 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
@@ -9,6 +9,8 @@
 #include "pm8226.dtsi"
 
 /delete-node/ &adsp_region;
+/delete-node/ &mba_region;
+/delete-node/ &mpss_region;
 /delete-node/ &smem_region;
 
 / {

-- 
2.48.1


