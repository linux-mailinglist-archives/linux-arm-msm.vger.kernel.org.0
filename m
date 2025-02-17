Return-Path: <linux-arm-msm+bounces-48292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E35AA38EAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F1203A665A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC251B4152;
	Mon, 17 Feb 2025 22:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="CgXwaQk7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3B51AF0B8;
	Mon, 17 Feb 2025 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739829962; cv=none; b=nCwJZZdAl9qkt4RlxQQHhL2BB0zk926zzdw1bc2UrGSnrDfg2yq6zG34f4anvv2ugSxBUpewlYCmzzbb1QKUJrKRAX11wSj8kQFnnd0hU+bA1XvpU9aSZ3WDEMC5fWErU1WW3Oe2F5dqnSkhGCwAT2lDDornIBDJnyeLQbu8VPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739829962; c=relaxed/simple;
	bh=c3OdZXsHQl8Hpj942CA3+f4fIQmaWKu9wILF5OxwWc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qsgcBh53kpmLuIXbVxQSYsvA9DFWBZ3oJZUSfwjRzgq1aOBC6ZS3EJp4AQF4YPJQ4oX7TBApoKiC3ez6STc0ATQhRLsneLrgA7zKmlC/CSIphmPNmUtszfNHxlEqyiiTAr+lh+p/+f1TmfXCshTM9YroaNUaPoBVmDOWfEqJXVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=CgXwaQk7; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1739829950; bh=c3OdZXsHQl8Hpj942CA3+f4fIQmaWKu9wILF5OxwWc8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CgXwaQk7cADGv53QDsnXhsjJGIMO7YbnS5LycnugXlnTnqSt7MxT9MQmi6CyUHyx7
	 dHmIwwmwmcl28kTcBgXqCb2kHeoP3dAgKKPlkNRIbHKde+J3ygj4IbgSTDWZj2LeRH
	 BUeY1VdXNOSQP/R6/dkMUrqrTzGVd71wiNUrYT5k=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 17 Feb 2025 23:05:22 +0100
Subject: [PATCH v5 08/13] ARM: dts: qcom: msm8226: Add smsm node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250217-msm8226-modem-v5-8-2bc74b80e0ae@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=eoHX87/Yfz6a9HStDewruF7nDlvvxRzf55C1aXv2xuE=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBns7K2Ehl12Gf4BDTiHen3xgTdq7MqB7K2BsV64
 O60M3MlRP6JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7OytgAKCRBy2EO4nU3X
 VpUBEACeBtYEOeRYSJ0gKjXahxWLUUvKV/LLHwevWDlt9oeIIr52/q3sRBCXFeBZOLAloUcr3en
 +pDO3NxZEyrD8/cN4PfTOSmtvb0cUDpY5SZ0cgLHOqOHPw0v+tm1WleQkJZFO+lFADNvsn0GkeV
 Yx+WCd7qXm/ZuzyCM08Dh0QbEjsq5usY0jQ9civUkfYnxMpZMXFdIXvLjgtSBCasp+mkv+cKqpu
 qkQafK928eGqttUXVSV2Sb0hLPggnbeIlaA7GJZUPYZrkeDjJ97US+h8NkBTiFY5NKpUJ6Cna8L
 yY6i17x7U+2CsWRTkwNKUU4f/+5Sezay4+4slDxc8hAanpGJzNvpO0//BE+rjP4Yv9RzY/cRSbw
 oMPcrbMVUJpBxbZvBgvR1MaSGySXqkZSFyT/PxJOX1Gt3gdoHrDLIut64a24xcHbSprXRm1Fkse
 ypEOyl9rZ7EP44XDUP0NCrHUTwDKuc6HqNlqwlAGjdcb5Xa0UzmSJa9Pr4Gk1nh+a/r3/dp8JvD
 TYP5lKL3rVmEzteNu3neN2/pvwN8fHjQ8H4aSqNE0Q6VJvfareArlF8KnKXRXrzn/aSB0nugkrr
 2+HUrjFkyir1Z/OQwqCiDKidXfufeAPDd8SPQ+MtZX0GWcAWe2s0NFsXPuGIRKY1klxZ4ZrzzWG
 CKn8CYlosfLcYLA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Add smsm node for remoteproc cores.

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
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


