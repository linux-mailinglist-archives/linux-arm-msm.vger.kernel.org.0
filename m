Return-Path: <linux-arm-msm+bounces-53814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41355A8404A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 12:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A11E14A4C14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 10:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EAD26B976;
	Thu, 10 Apr 2025 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Llcx2mod"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6060926B0AB;
	Thu, 10 Apr 2025 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279683; cv=none; b=K8R+/NPjuEusJSj4n1SjA23+7TzjdSFQJC6KVSHwtzmYLx7eoW7rIsF0CiyrCV0B7uznbIsg2XQLozSq7XB5SffZfDzQ0FaCeW/KBKVSG80Y+A43hGIofLUkBWDBPwX45UXqF+wB/sPe4LB7Fikm0JD+15ivbUfdhhsOgtq6zP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279683; c=relaxed/simple;
	bh=WyCopkUlDcDG1qNxKVxDfBYC9H+9p2D6lgc0Nk0spUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K9ppFWCsNFym0K/gOvfFjRTEY7R2gnp9aVlDMpUlrEuoP7X6AFmm44sb7KfThfhSwp6COtkDoQT/RVojPgWWX+ULkfgCyVtu4w0YGAP2mbXETXOGkFykxMJiERc250wKY8l7JE1yvQbadW3XdAoQdrSWxDaA6dn1nr02npkNgWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Llcx2mod; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06CC2C4CEED;
	Thu, 10 Apr 2025 10:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744279683;
	bh=WyCopkUlDcDG1qNxKVxDfBYC9H+9p2D6lgc0Nk0spUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Llcx2modS1glHrK3A84x9zHjRTwwM96MvX9FYt70GOprysEoFQSn2B4MjuHPWDPoX
	 fzBwAVLxUylzp67m4iMPwRiiS4TvaOQh9rhlP2yhw82AwnC28O5AckKpTk81wiGq/R
	 D0uqPujP/UW2Glr0TzCN6LZ1cyURebmj9M9wy25a3zJYfNX3wp22Vr6OHX8ZAgHcHo
	 kjOkq/QaRMNjF4MyUqqNDOrPe/GVVSanQsYaQY68A0r9UG59Q7Y9ZPwWr3BOqLBNpb
	 XBYCoDNjH2bzHumbFxkWcd+CAS/apjOxz6hbZWQEQkjrw2ggYYMM6cnkyves39+qEY
	 9I9nmZ2jf54Xw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B60C369AA;
	Thu, 10 Apr 2025 10:08:02 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 10 Apr 2025 12:07:30 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-hp-x14: amend order of
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-hp-x14-v2-3-d36414704a0a@oldschoolsolutions.biz>
References: <20250410-hp-x14-v2-0-d36414704a0a@oldschoolsolutions.biz>
In-Reply-To: <20250410-hp-x14-v2-0-d36414704a0a@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744279681; l=1222;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=bnPuoslWPgNZvAQ9/Qrw/txzq3JvrErhTj3TzDMEntY=;
 b=kuwVoeZ26n8+Ah4fxp7+P2goDpgr5mMwxtP/V9pTNTnYdmjwxB0NyQdgwbv/++Zb91kI/F6tI
 ShzMvfYqHCAAgX7AM5t0hkPNNahYYrXtAbPhIONVp0IA821IFO/uMGW
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

amend the order of pmk8550_* nodes afte pmc8380_*

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index 6c0e56168eaf133b9500c32b98821fa1fc3e7a2d..b492901f2d8c610e955c95aea60eb6c3d80d4f65 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -1196,17 +1196,6 @@ edp_bl_reg_en: edp-bl-reg-en-state {
 
 };
 
-&pmk8550_gpios {
-	edp_bl_pwm: edp-bl-pwm-state {
-		pins = "gpio5";
-		function = "func3";
-	};
-};
-
-&pmk8550_pwm {
-	status = "okay";
-};
-
 &pmc8380_5_gpios {
 	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 		pins = "gpio8";
@@ -1218,6 +1207,17 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 	};
 };
 
+&pmk8550_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio5";
+		function = "func3";
+	};
+};
+
+&pmk8550_pwm {
+	status = "okay";
+};
+
 &qupv3_0 {
 	status = "okay";
 };

-- 
2.48.1



