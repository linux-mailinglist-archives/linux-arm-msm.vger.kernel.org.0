Return-Path: <linux-arm-msm+bounces-60473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2B8AD0101
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 13:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 069C616BE66
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 11:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950692045AD;
	Fri,  6 Jun 2025 11:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0XLWXkv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539C217E4;
	Fri,  6 Jun 2025 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749207933; cv=none; b=Px6L+jbpRTPeY+c8+Xa2ehHbkh0TdPeTMPT4vacPhXRdOj+OccheNfcOwUZx9G2t4FfG0mrxMG9ha1FSPddxzkoybGxNXrgEMLTYMvunTVfGnBbMgX7WH3KW37s65Gh8A9ikwpoE5ob9vwPyLMSTPIKOy3GzlDxy01N4WpeJ+HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749207933; c=relaxed/simple;
	bh=hZBSXY9Vfts7VOCEcp7eKY+x8Ag3TrY9gexhqvO72E4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L2h0bbqbJlGyeYKKZZLU62xfXnyNGN5d/22U9UpWmuXdPdwqEtMyN1DY+QsPgkXexR+KF8qwObbDCp+iusQZ/vYK+flFXm8mvJtgODN9MQHyWyVS3C5bCHx7dIQke0M1BsQ7An7v6TGxjGsSeyCuox2JLwG97M5cktXUewGPqpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0XLWXkv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2A2BC4CEEB;
	Fri,  6 Jun 2025 11:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749207932;
	bh=hZBSXY9Vfts7VOCEcp7eKY+x8Ag3TrY9gexhqvO72E4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=D0XLWXkv5j8Ur8ZWqDST4zOCU0ME19lj286d89dSz2jrO6PtapqMJ7MF8IR52wMGB
	 PzMEM7btO1gvNqTOhdNJvf+VaVXUwikHnn5Q2HDTMsjmS2AU236MyFTCgrMz0owxxI
	 QmwnuK0xYXqbrnMRHSNhdRWqjagddIKqhOyiXE8Bq7xzcedw9z4YqdhvAARrrVMjz5
	 ioXWICmHiuci89rmImYvv80nmzrFRr7c5ylUCBYuGg/+8ZWdoXxjHwbqEWyVoiS0Nj
	 iw361LGk2oITDR+P1L00SCfNHP5t70JVikd15dS7U4zB8cVkqAJsipzqZpvjrXDfoI
	 MnlJ7Y4Cfwxhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CAAC61CE8;
	Fri,  6 Jun 2025 11:05:32 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Fri, 06 Jun 2025 14:03:51 +0300
Subject: [PATCH] ARM: dts: qcom: msm8960: use macros for interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-msm8960-irq-macros-v1-1-03e573ba26d6@proton.me>
X-B4-Tracking: v=1; b=H4sIABbLQmgC/x3MOQqAQAxA0atIagOj4rhcRSyGGDXFuCQggnh3B
 8tX/P+AsQob9NkDypeY7FtCkWdAa9gWRpmSoXRl7byrMFpsO+9Q9MQYSHdDP4U5NFVNTAQpPJR
 nuf/pML7vB7fCB+pkAAAA
X-Change-ID: 20250603-msm8960-irq-macros-6dafa735cecc
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749207931; l=1869;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=l1evEWFE+2Uf0Gr0r6+BEZUpSHC16rDD8Dp6L4gRpfc=;
 b=iXp2CCnLaRMORs4EWNbaiKAzYZqjClpnHL9udO16ISe6xbWYOTjTHMcvkK0RQ7eu2tV5lZumC
 AxH6g0l/f/sCI9FB0bbAtIGTHQDFnd44Kpt1E8qadSy7WMFfoM73DdJ
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
Reply-To: wctrl@proton.me

From: Max Shevchenko <wctrl@proton.me>

Replace the raw values with macros. No changes to the output

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
Replace the raw values with macros. No changes to the output
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 865fe7cc39511d7cb9ec5c4b12100404f77e2989..13572d0b1d5572cc5b9c3a136a6ea6267b8625da 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -18,7 +18,7 @@ / {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		interrupts = <GIC_PPI 14 0x304>;
+		interrupts = <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
 
 		cpu@0 {
 			compatible = "qcom,krait";
@@ -54,7 +54,7 @@ memory@80000000 {
 
 	cpu-pmu {
 		compatible = "qcom,krait-pmu";
-		interrupts = <GIC_PPI 10 0x304>;
+		interrupts = <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
 		qcom,no-pc-write;
 	};
 
@@ -107,9 +107,9 @@ intc: interrupt-controller@2000000 {
 		timer@200a000 {
 			compatible = "qcom,kpss-wdt-msm8960", "qcom,kpss-timer",
 				     "qcom,msm-timer";
-			interrupts = <GIC_PPI 1 0x301>,
-				     <GIC_PPI 2 0x301>,
-				     <GIC_PPI 3 0x301>;
+			interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
+				     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>,
+				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
 			reg = <0x0200a000 0x100>;
 			clock-frequency = <27000000>;
 			cpu-offset = <0x80000>;

---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250603-msm8960-irq-macros-6dafa735cecc

Best regards,
-- 
Max Shevchenko <wctrl@proton.me>



