Return-Path: <linux-arm-msm+bounces-76165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DF314BC0459
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 07:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4BC9F34C620
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 05:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DA8227BA4;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYKlUm1o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B269226CF0;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759816549; cv=none; b=Qlrvkqgg+wGoGQe8piICLu1cmw5uM5q8+s4llJGiz4yOeiXs6Nm0YT/JOXfJW6EDxlP8S6JfWpt28q1G5TS3+O4M1vrOS2d2/js9YqacWANYG141/nC4wfJY77YCIgbKOWC0zbBJEp+ClMF0NyBM7U9puR1DlngHiX68LKmH4OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759816549; c=relaxed/simple;
	bh=K+mV0LA83Am8H34UCJxxQEo/9VCQGbqlqQLtnpW2bCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V/jD21w4wouXP8CiJnu4CizVdgiSSArn2d/bw1R27JH+pL4y753Ugve4zKZluNSGO1Q2Z34HFmdssS8JCdtbuGW5++dw+Xr6RFVPVmf3FJ94zu3e00zw3N4fu79DTsm68uULEhx+4YwpE+zSekILzT805Klhwsk20NA1r6xB7Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYKlUm1o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09983C4CEF1;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759816549;
	bh=K+mV0LA83Am8H34UCJxxQEo/9VCQGbqlqQLtnpW2bCU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OYKlUm1oyajR1y/HK+mhaJwzbrb3QZzsDTEKnnjQVXC7dvROMyBsv8hlrFYM80Nxh
	 rapEKkyu4AHdX2yNllKQVWL5TAkXE4eCkEolyULClXiju6MSWg2JEeVyi+mNT7KcV2
	 r1EczcEi3WmDuydxpb5IQBDmXQi+PY8w2MTOTefU+F7W8cLQbvXmqzfhLkFVDGizhJ
	 d3C2cF3Vwd3wYv0SGfqhgy1KretVsoYq2EwPuYE1FqXi0HtVdmn+GqhHRXiONFb7/j
	 otkpmnb500TjxVVTnoNbJdHLU9t0AcZ3S6WPGN7QoxbUNsNFTbP5fDGd8bc3LZckZR
	 5WnCdHACmoB9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BE8CCA476;
	Tue,  7 Oct 2025 05:55:48 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Date: Tue, 07 Oct 2025 01:55:43 -0400
Subject: [PATCH 2/4] ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-m8-dts-additions-v1-2-53d7ab3594e7@me.ssier.org>
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
In-Reply-To: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759816548; l=940;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=TAZ8h+Se0PSb3XgiQbE/VSfox9PXBzmPNJ0YRRHz/Ic=;
 b=dHmobOe9t9LEcaj7OJicda0qIXVIGW8QxfHvSJM2RW4OYPe8bRJQQ/yfkyt5y855RCSiokiLH
 /3r7LFYUvIZBEX68feWyq3hdrRzsJx6i3KvApe3r+Imp0Lus9NqYYFS
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
Reply-To: alex@me.ssier.org

From: Alexandre Messier <alex@me.ssier.org>

Add the NFC chip used in the HTC One M8 to its device tree.

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index 9c3859069aba..4026d6fedfbe 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
@@ -65,6 +65,22 @@ vreg_vph_pwr: vreg-vph-pwr {
 	};
 };
 
+&blsp1_i2c3 {
+	clock-frequency = <384000>;
+
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,pn544-i2c";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 144 IRQ_TYPE_LEVEL_HIGH>;
+
+		enable-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+		firmware-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &pm8941_lpg {
 	qcom,power-source = <1>;
 

-- 
2.51.0



