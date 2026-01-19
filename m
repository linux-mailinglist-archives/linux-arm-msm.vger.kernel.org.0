Return-Path: <linux-arm-msm+bounces-89702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF17ED3AEB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECDB23045385
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9A5389E0A;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkhK64mq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AC3366DDC;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835585; cv=none; b=nCtQVGQRBuo6N3JJhTlIAPnqiuWbe28+mQTTt2m3aPrpD/l25ATRvI08I1cl+hmsbzSvLty+EOo4d/BTivJSVguUDwwbfXWxxOx9bRLvabkXP2TBI+gv2LdT8M87w65EmO3OpHktLIPtAyZuuDqjunHvX1vFXJbXLB6Px2bOkcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835585; c=relaxed/simple;
	bh=W+9ijkkJhTYiHFopGcueOSZSPabGwVoJtbKipPRrHJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aqSZam/JGyuQbwABgknl0em7PpniAD/NqzYeGbLCc70BLFAYteFmgc+jUlxmyGfIXDPG/U35Lv/rtMERcTVNGYQj37vZpD+CoawOAfc4OHRBHH7WJYZgInh7F3IyJFaLeSFtjEoov4tmGkn2rNjbScnJ9hXTtnLXTluzc1FuWmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkhK64mq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4139CC2BCB2;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768835585;
	bh=W+9ijkkJhTYiHFopGcueOSZSPabGwVoJtbKipPRrHJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IkhK64mqwYrQQE9gwGOTcEqxSJlMGndaI8MRaUQo3Mhv3R+bKeadVuLCkJ8t/61fD
	 hSbbEPy31qb04DRdgGWfnj/BmhsnhTE5V+3n8AhuDZ0jlTxEAUrRz3N+zIWHmNo663
	 bY5IhfY6UQ3bppSKKoIwKf6kl3yf2eIDUE0ACHpksPZ8qo+rjXJjP+iJO3WuV1id6A
	 XdHy3/GcJnS+1ge9RiOsx0zYKzqx4QcbaQCETTyhTp4S8tU/x/h3RNwldhIjWrNMVq
	 TgqtY/4n8qFUuC3QConvHtZ+M2xr1OWeNidsOuwQ/Zg0hwpGUFxYa3ArxzJ7GMqweU
	 g45MTHSK8SdoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B2BD29C39;
	Mon, 19 Jan 2026 15:13:05 +0000 (UTC)
From: Biswapriyo Nath via B4 Relay <devnull+nathbappai.gmail.com@kernel.org>
Date: Mon, 19 Jan 2026 15:13:06 +0000
Subject: [PATCH 4/5] arm64: dts: qcom: sm6125: Add debug UART node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-xiaomi-ginkgo-features-v1-4-3c8fae984bda@gmail.com>
References: <20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com>
In-Reply-To: <20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768835583; l=1329;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=KVbPa/81u22X0TJfXKboPaS8uo5cWF/0FGi0WwZiud4=;
 b=8CS0UHk41J+yopC7u3ggV4qCUDLXebRujYHuB94+f/0iHUIwbQ2uv8MVaUsCWyG6WWZDfEiRj
 3J+7nsQ+7r5CCYcYnNJzNPESksVCuwf/7dWBfjHAOn0HdbUIqSlKj9b
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Endpoint-Received: by B4 Relay for nathbappai@gmail.com/20260118 with
 auth_id=607
X-Original-From: Biswapriyo Nath <nathbappai@gmail.com>
Reply-To: nathbappai@gmail.com

From: Biswapriyo Nath <nathbappai@gmail.com>

qup0 on sm6125 has 6 SEs and SE4 is used as debug uart. The uart node
and the associated pinctrl are added here.

Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index e60d4d74c..0540fb865 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -661,6 +661,13 @@ qup_spi9_sleep: qup-spi9-sleep-state {
 				drive-strength = <6>;
 				bias-disable;
 			};
+
+			qup_uart4_default: qup-uart4-default-state {
+				pins = "gpio16", "gpio17";
+				function = "qup04";
+				drive-strength = <2>;
+				bias-disable;
+			};
 		};
 
 		gcc: clock-controller@1400000 {
@@ -985,6 +992,17 @@ i2c4: i2c@4a90000 {
 				#size-cells = <0>;
 				status = "disabled";
 			};
+
+			uart4: serial@4a90000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x04a90000 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&qup_uart4_default>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
 		};
 
 		gpi_dma1: dma-controller@4c00000 {

-- 
2.52.0



