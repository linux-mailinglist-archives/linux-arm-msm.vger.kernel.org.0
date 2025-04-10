Return-Path: <linux-arm-msm+bounces-53795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D553A83E48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62BE216E05E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA17920FAAB;
	Thu, 10 Apr 2025 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tj9HWA3f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D0820E032;
	Thu, 10 Apr 2025 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276410; cv=none; b=CKW8/fsPeLQw8be/udumxH3hED7OYrIZdnEP4EQoGge+Sx+QCEgIBEzBgIIeqqRmcZxGdM3CUaMtuIQY4T4q+WSQNuzSwN5zbBZLzrxZElRJ3rGQOX0Pa1KaIPFehHsPdy2Pq6AqxSqjM3schRR8vKRiKUZCOqRL3A8o+z2AdJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276410; c=relaxed/simple;
	bh=WyCopkUlDcDG1qNxKVxDfBYC9H+9p2D6lgc0Nk0spUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eqHnoAOMaHPU60LyHa/p/+5q5hmsolTCbU+h+lzOMkUEIc8EGv1/PVkOtfdaRRJxongm958tqxt/VARv5LxCPPvwElm8XgPBAcRwwQKRmlqgBrDT6h+pnxikU+j5DlniVeiPpu8R44UYx0lJOBTYV8GS9C1G1khp1ZF4AvGuNRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tj9HWA3f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0917FC4CEF1;
	Thu, 10 Apr 2025 09:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744276410;
	bh=WyCopkUlDcDG1qNxKVxDfBYC9H+9p2D6lgc0Nk0spUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tj9HWA3fWDwnz1R7lf/diWWKO6vvIXAXWxXOtGvTWe67W5I8+ak3SoJqf6cIRRLjg
	 6BWm0uLcQb+96nG0Wo4h52ho2dw5uekG8C+qVrDFhjXccs29eLLLPEB5ru2Vz8K7aR
	 hyfkQo9ivnRKOZAdE5aTu5DH9m7I3V2+xBypCPCQS8OzgKUlgD00i8EbH18f5NnVvC
	 yPvXCBus2gwHq8lOw9v4n4/rF1GKUFWfl35K3lNePemSOOz4nq4nwMip3Vo6fc3gFz
	 ObUSpF/W0y2lP60rQof7SNam7CHHSldcv2sMQWCIEbuc0tZuKUcWR+1ME3czp8JT5S
	 q5cxR4p4qcv8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFCDC369A4;
	Thu, 10 Apr 2025 09:13:29 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 10 Apr 2025 11:13:25 +0200
Subject: [PATCH 4/5] arm64: dts: qcom: x1e80100-hp-x14: amend order of
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-hp-x14-v1-4-b4e5ca253ec9@oldschoolsolutions.biz>
References: <20250410-hp-x14-v1-0-b4e5ca253ec9@oldschoolsolutions.biz>
In-Reply-To: <20250410-hp-x14-v1-0-b4e5ca253ec9@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744276408; l=1222;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=bnPuoslWPgNZvAQ9/Qrw/txzq3JvrErhTj3TzDMEntY=;
 b=cendNp8aNTxgK/MVR/XYSiVqTW3wlM9zjBkpfTDKn6+cJ4qfzKaaIaZeLTFWd7SNw9oOW+5q/
 +iVr2tcss/3AZAjzbcmMLdYrQXoCe7IdSVC42jqQXvys3a0Mtui6hfa
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



