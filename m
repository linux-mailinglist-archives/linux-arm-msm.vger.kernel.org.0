Return-Path: <linux-arm-msm+bounces-46163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD842A1CE90
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 21:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 426EA1624BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 20:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C4A18A6B2;
	Sun, 26 Jan 2025 20:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="0V6L9y/K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BB0156F57;
	Sun, 26 Jan 2025 20:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737925065; cv=none; b=gWcmCGRQSIzVHeLbKZqNGWTsmtVDlfxoUCO1GhkY+/rkwFhh1Eub0RLyDYQ02jVuSeFUocD5LDy2s5SdBEtZNcBvcQh4VCCy8tYrEd5M1IMuHnfl49hbduhC+Zk/aNyaCV8sZE/+i+1FonxyxLJjIgInhTQMFR85i48jKAS6Pyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737925065; c=relaxed/simple;
	bh=M0dUnoMnrf5979PCxwB+SvhWyJ0Vfgi4cFH+JrpLM0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gPUwM3K4L4FeIGmaL4YN4OvWidKftglTq3K3/4vz5Sg/6mhbUePXq+AAeeHpXpKegLZdB46hLwgNer65jXNx3D8fRW8d5tq8xkEQgm6dxXxQEXzzkcF0GZL4Zkb0MlKyVWUATMHAJaeTZmqw5hVYVIYorUgY6GCmSAqjeqB59lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=0V6L9y/K; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1737925054; bh=M0dUnoMnrf5979PCxwB+SvhWyJ0Vfgi4cFH+JrpLM0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=0V6L9y/KkmGcV33zvxF2WjG379CPropOXBe/Bzv3bhFVIXfvjziUrFPPnY37UURIX
	 tBZ/VELqKG2S6xqdK63jBpryyYNqjV3LI3KwNol8p3Pk8NKgIBLzdhZ8HlSdpMQIJw
	 rvjKYfmPb6fe3RdNmuFgDw4A0lo6CndyTzFydLNQ=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 26 Jan 2025 21:57:26 +0100
Subject: [PATCH v2 7/9] ARM: dts: qcom: msm8226: Add modem remoteproc node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250126-msm8226-modem-v2-7-e88d76d6daff@lucaweiss.eu>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
In-Reply-To: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7892; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=M0dUnoMnrf5979PCxwB+SvhWyJ0Vfgi4cFH+JrpLM0I=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnlqG6xyJBCFP1oumhbJlQ5bovWXy6osh/d7VtY
 MVdyf8k582JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5ahugAKCRBy2EO4nU3X
 VlT7EADHKoys8tPsosihH8ShUr+veii4QD6S6B9nUjjrVjnXdMezr1bcJeK2lSlEkjKZVUiS7/b
 pqqXUpRg/u+wRUyjjeoB7G6jYLlHYV7n9mqCMCS5FwgcexutRJnqCAzai4J6BLmoxHGdtppBZln
 ZrtRDkg4vKOL1788zd1VZDEiO3iJ6a24O3+6XNbs0PzVnWj/3PXMXaLXoXWRL5tYa+iquMd4io8
 Sh3Eub24quvjdTzlu6NFSmf4oqwoGlHDXVl4JOMUUtvpZsMI9MwYhd20vJG8lTrOfgCGAZ6OmTR
 1rLpgQ4WIKmKKGLRvcrtpMLJhBdjMuFBQ99sVm/4Vbc6bgdWOWAbkFBYgIqMPWyCIONnmgDcAiz
 hYM9EXbd6we9Zw45vQgs4d2JPEPgoadkU/vM26x/QasaA7+PpYKRrkw1/mn30lFGffrCl0cAUQM
 vrfgWcKoXgQOkhSOqonF1xDmyWVLT0wsIAwL1MyVRHCrNZwZLxdDkf/5QNrhShAATCzonc4HfKl
 Kg/8EdS2bSShEMQGOj9y0klbi12DfTiS6+roulmthmQsEv7zlbcBoFE87DuuohBPf19CpvwnLiL
 6sK/j2xQMuwqDxNKVuYgHnzDnTNLS0OgQqPDR5DAE4Ywo63JUnDPxaLClCZ50BJDdIgh2dM9xm+
 eGoUBhg1PYxc0Hg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add a node for the modem remoteproc found on MSM8226.

For the apq8026 smartwatches, delete the modem reserved-memory again
since they have very little RAM in the first place anyways, and all of
these devices don't have functional modem firmware anyways - these
watches don't even have GPS.

Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../boot/dts/qcom/qcom-apq8026-asus-sparrow.dts    |  7 ++
 .../boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts |  7 ++
 arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts   |  7 ++
 .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |  2 +
 .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |  6 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 80 ++++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  2 +
 7 files changed, 109 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
index a2ca456012f1a070afc2805ae71ddbf6f5aac607..816b61ea504ee80d86dd4ccd1a15db687f6a91ff 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
@@ -9,6 +9,8 @@
 #include "pm8226.dtsi"
 
 /delete-node/ &adsp_region;
+/delete-node/ &mba_region;
+/delete-node/ &mpss_region;
 
 / {
 	model = "ASUS ZenWatch 2";
@@ -82,6 +84,11 @@ bluetooth {
 	};
 };
 
+/* No (useful) modem on this device */
+&modem {
+	/delete-property/ memory-region;
+};
+
 &pm8226_vib {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts
index ac228965a48559cd0e54671b1b80773a34595d1e..06c4dca6c9ea2da4ef0be877d25830c172757fa2 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts
@@ -10,6 +10,8 @@
 #include <dt-bindings/input/ti-drv260x.h>
 
 /delete-node/ &adsp_region;
+/delete-node/ &mba_region;
+/delete-node/ &mpss_region;
 
 / {
 	model = "Huawei Watch";
@@ -141,6 +143,11 @@ bluetooth {
 	};
 };
 
+/* No (useful) modem on this device */
+&modem {
+	/delete-property/ memory-region;
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm8226-regulators";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts
index a70de21bf139bd3f67d9e848f75cac20839335fb..1c3e2d2cd54979d4859196c7003d9543971e53bc 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts
@@ -10,6 +10,8 @@
 #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
 
 /delete-node/ &adsp_region;
+/delete-node/ &mba_region;
+/delete-node/ &mpss_region;
 
 / {
 	model = "LG G Watch R";
@@ -149,6 +151,11 @@ bluetooth {
 	};
 };
 
+/* No (useful) modem on this device */
+&modem {
+	/delete-property/ memory-region;
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm8226-regulators";
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
index 7e0838af6c2d0dc26e0082471b70578bc627491d..f7f57c3f583557830c0a6dc9f0eebc2ddebbbe3c 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -213,6 +213,16 @@ smem_region: smem@3000000 {
 			no-map;
 		};
 
+		mpss_region: mpss@8000000 {
+			reg = <0x08000000 0x5100000>;
+			no-map;
+		};
+
+		mba_region: mba@d100000 {
+			reg = <0x0d100000 0x100000>;
+			no-map;
+		};
+
 		adsp_region: adsp@dc00000 {
 			reg = <0x0dc00000 0x1900000>;
 			no-map;
@@ -253,6 +263,31 @@ adsp_smp2p_in: slave-kernel {
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
@@ -879,6 +914,51 @@ spmi_bus: spmi@fc4cf000 {
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


