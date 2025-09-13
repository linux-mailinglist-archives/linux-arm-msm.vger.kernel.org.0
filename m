Return-Path: <linux-arm-msm+bounces-73409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB83B563CB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 01:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2098189D6E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Sep 2025 23:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808022C21D1;
	Sat, 13 Sep 2025 23:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="qvqTBgBE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC012C1585
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Sep 2025 23:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757807855; cv=none; b=mqheltCVIpYXQXd68VzgXmOLEWoXEMyvsn/CPxfGljGks7doN4wwC3hRv2z5//MF89cpwgGznB9XGJR8E6QBvzXY5BWARZo931EcMS2NcpIEBAhUdDd+7xIIAeQzSqUISjpzG2JmfFgIDIpGNYTudf587uyxIERvNVsgzHgTP+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757807855; c=relaxed/simple;
	bh=YWNQKW2mY/mX40rk96UP4xcATRuNm/HModDfkRFKZnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rltpcnzxbgfX1Ik3oPlKfv1LQMeTRk/RNeW0ksXh+EvXXa3YVqanpquDknq99Ajb6656gFHpBP2VT8jqQHIL1CvFpp/vwWm55Il5h7IU5ydHuzlOa8MDC743nD6P3bKCD23iYX3fA+a40oU0vd1ViZR3gDkkhAH2b22dP7+eQ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=qvqTBgBE; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1757807850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/pfxdAxGC8INtUKmqJWgCIiLBL8/PfLqbkGQkptiog=;
	b=qvqTBgBEBqNXlE5zjREFpUaMuSrfANPZ3sZQEb81G3mVSjTSiBIlcqhpfw19RL+D8gI2Id
	/zpcIUYKyK33m6STdiYCn6kro8IIzFEwbLjzPGSKo0dlGwlpwPeMQLKFtqcxM2FMySbMil
	6L7BHSEcsUEn+ykRFdXXnpRUkCgJyggkGLLBYY//XSVUuw3SK5eM7KketRuhZeY56oujBn
	cn6z3LWncU+UrEQYDr9XWNjC8uVKz7pu28VtG237vkpnkDYuC++9V14xnoSVT5ItjFpHuG
	60lnb/6wYA9PeDcLUfujfqwGk2LHX/QKnXCdZRlCtGqVxsT4aPtUKxiiQ/Ry0g==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sat, 13 Sep 2025 16:56:36 -0700
Subject: [PATCH 03/11] arm64: dts: qcom: sdm845-lg-common: Add leds
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-judyln-dts-v1-3-23b4b7790dce@postmarketos.org>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
In-Reply-To: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757807839; l=1393;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=YWNQKW2mY/mX40rk96UP4xcATRuNm/HModDfkRFKZnU=;
 b=3jze1obXBG/8AFnh6OZXb/TaZTbxsmYBzPf1Uxb9/aPb4f0PtXWMPfPjRw3oDk9PddScchJ2D
 5sVrJvOPU6GCv+Keh5wqlogEll0t41+xsuJuMyEREzcp5J89tRR6TPh
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Add the multicolor status led in the phone's notch

Co-authored-by: Amir Dahan <system64fumo@protonmail.com>
Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 1acc418b943443f3ba4f8a8a1cfe2c575da11876..d6129ce03f537f0c8c78c2ae5f39be6146cab7dc 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -603,6 +604,31 @@ vol_up_pin_a: vol-up-active-state {
 	};
 };
 
+&pmi8998_lpg {
+	status = "okay";
+
+	led@0 {
+		label = "blue";
+		reg = <3>;
+		color = <LED_COLOR_ID_BLUE>;
+		default-state = "off";
+	};
+
+	led@1 {
+		label = "green";
+		reg = <4>;
+		color = <LED_COLOR_ID_GREEN>;
+		default-state = "off";
+	};
+
+	led@2 {
+		label = "red";
+		reg = <5>;
+		color = <LED_COLOR_ID_RED>;
+		default-state = "off";
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.51.0


