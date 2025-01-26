Return-Path: <linux-arm-msm+bounces-46161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2051A1CE89
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 21:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66B2F3A3E96
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 20:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72347172767;
	Sun, 26 Jan 2025 20:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="1Cl4cwA4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62A5152532;
	Sun, 26 Jan 2025 20:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737925064; cv=none; b=FZvBIbScKd8kXGsI+Vk/5PO0JQZdvtwcLp2cGB4o4jRyzdZLNKzI7TLSRk87j2QLqVBOdIv8lguJoSuYWHgba+kvflBPVr6Z5Fo6U+MUGhK6+h6BQOjkUSfOrS3dLnOBhAMM8gXCswAV7/va/HUnHpKnfHi4D50YVEsPzMyvDxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737925064; c=relaxed/simple;
	bh=j7879PuyHYg2Ywl1rW/OqZXKKALM0KAOmN7JVaFFJCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WPGd4owLFLedz+QvdHAf+Q5wYnBV/H0kpFSPHiWCbNZgVstBr5oKSKv3MVqM6Kx1C+BdirtewOVksorHfSx/x+Gd5oOdQRhRjJZ6Wzh9j7t9WFw5cdQZS4cfrWV0GBMc2JSn1UnF46HhYMNtxJG3k46gAGLiRwargzSaqQOjeGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=1Cl4cwA4; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1737925054; bh=j7879PuyHYg2Ywl1rW/OqZXKKALM0KAOmN7JVaFFJCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=1Cl4cwA4FjEjCKO/cCAraXXiau4lX9ClNBrUzOF1eu+YU6E6oVmlGXb74BBe/Nv+b
	 TKn3ngKwSc20LyALYcuxdBvuXilA/dikCNH6Sg3QuS2yzXjdXT86WeKMYb63IAfKXV
	 IFT+BJFUvP3MYt4xdmvgR/+kftcmwROqrfhbNHm8=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 26 Jan 2025 21:57:25 +0100
Subject: [PATCH v2 6/9] ARM: dts: qcom: msm8226: Add smsm node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250126-msm8226-modem-v2-6-e88d76d6daff@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1486; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=jTBk8OT0/wnmRBAf2FFY5Bw2UG5DbUKF8KdM2H91kYE=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnlqG5DUq7qDFxTAGFN6Qt3jknUSEE1+2hX2Ofe
 uJAbYGOYdCJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5ahuQAKCRBy2EO4nU3X
 VpsoD/9GdtKdRuIZ5w3Wllocx78ejPUM1OBjr2+jSEjhi3UXMV3mB5BTRSnrCpeHPbr+fUOzImT
 q32FD7OjbK4+ZRDo5/UU30ShH6y+WdVJOAO6YE0V/JuDOAm5w9oMSzEI3+Vs+CYnfPKjr9KjSW0
 uBpJDgEDER8JHreXqd32XjtNF8UFmk3yrDX594DRsor9PY+m2PMqG1RA902rGy7bhy5mLCpXLsj
 EsoAU0KKbQm73xktKQ381fTl0kMVbbrZ3oICCBgSlo2NUpWhVjwvL1DdL6/TvgL8dqxNe0dqcjp
 aFGLUHIQKWuflpYjwqmOjLi1pnRXQkPRrwRoYEfIRKQaKaHybX/gt3E67OBHy1t5ZD6ZXeOn1OF
 nY+sST+5Gj+xddTvCFUzaWKiHfXhU/rvGOPnAbdPcGczwUmMRd+db6MFWTXnu8HPcp9YCsYkSCc
 9HBKgjf6hIWdhmkN/QbnM36R4pHgf96+p1HZbIOVc655pwDJo/9otD7T2Tv7cToTJJFvp9B37Qs
 vnF04/TfDhrWgGnd/oJ+2Rh7HM84Xtdan8bR+8l+CRiWW2JTpv9HK1TFgltcSDKk46Dbgyq9kmu
 KRUZQs9HJjRP1vhUy2WNOF+lXAENSWZOBWLmcTppPbNoCbuOTjfIxI/UK08ya4vbBGtnU/10+QH
 UuF433SXEpoU2SA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Add smsm node for remoteproc cores.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Co-developed-by: Luca Weiss <luca@lucaweiss.eu>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
index caaeeadf289f78d29403312738bbb714eaad74d2..7e0838af6c2d0dc26e0082471b70578bc627491d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
@@ -253,6 +253,40 @@ adsp_smp2p_in: slave-kernel {
 		};
 	};
 
+	smsm {
+		compatible = "qcom,smsm";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;
+
+		apps_smsm: apps@0 {
+			reg = <0>;
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smsm: modem@1 {
+			reg = <1>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		adsp_smsm: adsp@2 {
+			reg = <2>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		wcnss_smsm: wcnss@7 {
+			reg = <7>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.48.1


