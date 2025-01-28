Return-Path: <linux-arm-msm+bounces-46437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCE4A21528
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 539C9165E72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4FB1F8660;
	Tue, 28 Jan 2025 23:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="0q38oJ2Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BD11F5618;
	Tue, 28 Jan 2025 23:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738107393; cv=none; b=G7M1ZSZjDLNDGkTW+3SD39Ec7ZtcXuzWDRlkj+alFXLPuBt5bfayVO1Hspr2QZbeqUuP2DED8VRBWtXBM6MZHTqn9Rwf9ew2O5SqUVyNu0T0atfkLs9Fgon5lFN8amiloUKAp+KD6KdsLUa7X+akgjkNaLq24LAkCAApF9/VNWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738107393; c=relaxed/simple;
	bh=Xc7uOFazuo8Cvw0LUVcDkOhpsZEdc66R9DmSNN/w4Mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYDQsjmbpMZnerQVBA9X0l5sPC/OojXqeRAth1tdT6VZhn99k9ak0z/Wxw14dztgsXebMasm4vYdpru7RxaH1/bI0KSi35dJav1KeW1OgXI5HP91IDKtZD2w9aljUsA+9IIPPbbabdKfNPSVsR9V7aHefhzfCr5hYZ/Vat/GNTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=0q38oJ2Y; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738107380; bh=Xc7uOFazuo8Cvw0LUVcDkOhpsZEdc66R9DmSNN/w4Mw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=0q38oJ2YH96awGSqB7PH3p0FivVjbh5eNEsG1SQLg/amOoGJx6go1SUPHmMFAnw5N
	 IdmMnVGe8oJ65hU6uCQ7RgtWqawrydgc/Q2QMQCZpzvIng0LjdFHx9qZFRJ/lMTkJC
	 /k4M1KwaiPDVjRPcflawFT2Fdhvsq4lw3oZ4i3m0=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 29 Jan 2025 00:35:41 +0100
Subject: [PATCH v4 09/13] ARM: dts: qcom: msm8226: Add modem remoteproc
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250129-msm8226-modem-v4-9-2b02ed7b7f1c@lucaweiss.eu>
References: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
In-Reply-To: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5369; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=Xc7uOFazuo8Cvw0LUVcDkOhpsZEdc66R9DmSNN/w4Mw=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmWntZE5aPniqgs+uBFt5iXC9TU2ij8KyOLrI+
 SJQeU/M82SJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5lp7QAKCRBy2EO4nU3X
 VoaID/9bO/jq5cQGQ+jY8iuumlRmjq/PFyRQY7lsfPHbAVPIt1Ibk/y2GMZJsb+mUsXr5AGdV7p
 yIoawTzcgzvBnbUq2/wWviUCYG53EkCNRuYMGdFlG3MhOqNjfXr1+GpMZk7ucauvOfrNCHSqyOb
 E4ikpUhPLMoDB+SnhJ6HglU9cP+3TQ5O4IZOJcezcsN3AafjnXOnyOylWbNU6QHSvutEVvu1+vh
 Ae/1SYiFt1vDhWF7/aob6E3iKOLOszGNCxcx753sxau7DHX9d1OboVsbXhXTQfX0RfcX4t2cIQM
 t1+1YZk8T6LJnQQLmxnaqz4uzs9BZUUi90eBr0IWSna0QY/n3C4XIM8qtyjonZgURIc+FnSqh4M
 Ks7UCBZtzYi73cA/JsGKCQRKjHFwyExo9LuaS0kdRgMibENfn1Y6JrMbIg8JnsQQdBbmgy41Kqg
 b/DehrWB0Hol+c6+XpJ6cT8oPuGS5STjry8+a7/1B8E8oztiguDtjd8rvDs3kA1jFNFOPz9uqGG
 wi2bKuyTk70I4T3RYtUcJ/j6/0bZHUv6cNDcefRMnbzBoGD7t8VOcHE9xi6DR2HyDCCiuEqCWhk
 7bAymsnO8lD3apMSqnzz22Dvfg9V3aJY/Udm2eOBzZgLDyO1cLLzG6GaIWc2QPX5SvRZWH7fJzo
 qXCS/mhJHk7bwsw==
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
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 82 ++++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  2 +
 4 files changed, 90 insertions(+), 2 deletions(-)

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
index 7e0838af6c2d0dc26e0082471b70578bc627491d..55bb070dcf489064f5b14902da1acd2762232ef9 100644
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
@@ -879,6 +916,51 @@ spmi_bus: spmi@fc4cf000 {
 			#interrupt-cells = <4>;
 		};
 
+		modem: remoteproc@fc880000 {
+			compatible = "qcom,msm8226-mss-pil";
+			reg = <0xfc880000 0x100>,
+			      <0xfc820000 0x020>;
+			reg-names = "qdsp6", "rmb";
+
+			interrupts-extended = <&intc GIC_SPI 24 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
+
+			clocks = <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
+				 <&gcc GCC_MSS_CFG_AHB_CLK>,
+				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
+				 <&xo_board>;
+			clock-names = "iface", "bus", "mem", "xo";
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


