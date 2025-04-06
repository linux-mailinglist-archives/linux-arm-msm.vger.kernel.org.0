Return-Path: <linux-arm-msm+bounces-53290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEC0A7CE04
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 15:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E057D16DB71
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 13:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C2F218ABC;
	Sun,  6 Apr 2025 13:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="hWf5HCX/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E56120E6FD;
	Sun,  6 Apr 2025 13:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743944974; cv=none; b=tzQAhEO3nNyv42FJTbMjnYEH4EBbpsdAfduF995ti7Ou3ntiKT7gC7fZrQtXcImIwbKou7Lh9Q1IABcjTc/kuGAS8asWkiezc84BSniIPEvDQKLUAh7RyEx5lCiFqZO75KA+zdgvHSxGXV9h8v/rtyCoc40sTCL+GGEXIiZl+3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743944974; c=relaxed/simple;
	bh=13RE6hOUkBqpr+oWU0X4GFlgowxwfHS6noOIRF1dxL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CQaXVFgHheXb0LJTy2an4TlsaMTKY4wzMaNoH665c4MYl3BK1pfeEWakwMt4x2Mp7QVEcP301mRPW3F3C2KsV10Y7V/c60/FBNB2RgGFyIB/a1tVvVwX8YBqoLfYZV3Fsx3Edly0mHB2yGo8EdmuIsU2nJG1zbpJpdazFAMrD/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=hWf5HCX/; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1743944609; bh=13RE6hOUkBqpr+oWU0X4GFlgowxwfHS6noOIRF1dxL0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hWf5HCX/hpiGPOGvRMdVrGdN5nzt1RDEGIFcjSi8abB3p6z0PHpnxwQvcgByCkym1
	 mb2GE3ZPlA0c98b0fASPhWNO9P6xR9HQtmcogC/nbDtbMm9MR5hTFnPIympC0bSpP4
	 0kBf6l1h8PKq1aUdpwlI9yZR/EInG+Tt1hBa8yHU=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 06 Apr 2025 15:03:17 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sdm632-fairphone-fp3: Add AW8898
 amplifier
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-aw8898-v1-3-58a2d554693f@lucaweiss.eu>
References: <20250406-aw8898-v1-0-58a2d554693f@lucaweiss.eu>
In-Reply-To: <20250406-aw8898-v1-0-58a2d554693f@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Weidong Wang <wangweidong.a@awinic.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=13RE6hOUkBqpr+oWU0X4GFlgowxwfHS6noOIRF1dxL0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBn8nug3hQ/lmKr99ZB1IyoVoHBk2fQV0Jhx3Twc
 94SoNwwq26JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ/J7oAAKCRBy2EO4nU3X
 Vh6jEACx7+3OmTqOwvUCEy68KIg0LQXEaR5xfQ2/ClQEJpE5goWzSBCvn7D7cAJ6Ax3HMduCk3i
 FXeUnF78F/3LdJDxPLia0nodi3J0VLmgVGzMsV1oRgXBs0SjABBvB9C9SGvTvQvuUml1vrpF7jV
 Fafjj9Z0A2ge6RWJCLKFelReKAug+ojtoGH/OrTAqnqg0MGLL36JUAyb1WLDvu6sENKclKtSNcw
 J/VzhMcbGweNJONyJqKwIv5W4xItLVdWs5qSM9Qta0rzRTQiK2Ojr+mF22hlhkTMyBJbUyLP70X
 m8HTFjaWLatRJL+eyKwJECVNmAi5ruJDMGSNvymxRORoxKc23w32rEayzTjDVKL2QW4CeuoBwSh
 UkihasT5zhk2fz99lu0AKcvxjXwmPQJufiW+W/hvSOhj7blOqS1BDkJlFVGZDEETxX/xol9y86P
 XZ+mws7AGLwwlGHIVMfq+qua19SB1iBp3j7I5MBcMxplx1sSgb3UkrZk34cS/mrKZleYzngsHmf
 ug9BBVpLkIZsA53EqYbHlh+LOaNeB7WsLoco2Ct8FkVF4O/U03OTgXknZc7TY0vwv2tLBXeiZaY
 JEQb7rzo7lgQaILjazWPpsFbSBdfw2z/4o+lF6bdZz+kdQJKSFRW78K/pSYANgnJq9D+QPwhNr/
 QTLH8YKfz5E8jyQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add a node for the amplifier found on Fairphone 3, receiving sound via
I2S from the SoC and being connected to the speaker.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 31ed26c31e6ea381a8942ccf569513df3300cdeb..ef6f8c2bb4a5eb8e93aba0a4cbfce5f8ae2ba21a 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -81,6 +81,26 @@ nfc@28 {
 	};
 };
 
+&i2c_6 {
+	status = "okay";
+
+	aw8898: audio-amplifier@34 {
+		compatible = "awinic,aw8898";
+		reg = <0x34>;
+
+		reset-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&tlmm 20 IRQ_TYPE_LEVEL_HIGH>;
+
+		dvdd-supply = <&pm8953_l5>;
+		vddio-supply = <&pm8953_l5>;
+		vdd-supply = <&vph_pwr>;
+
+		#sound-dai-cells = <0>;
+	};
+
+	/* Fairphone 3+ only: Speaker amp TAS2557 @ 4c */
+};
+
 &lpass {
 	firmware-name = "qcom/msm8953/fairphone/fp3/adsp.mbn";
 

-- 
2.49.0


