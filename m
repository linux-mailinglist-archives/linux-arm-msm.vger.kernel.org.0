Return-Path: <linux-arm-msm+bounces-89435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A17D3357F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0A11C301F9CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 15:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5A833E372;
	Fri, 16 Jan 2026 15:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="AYHUiOts";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="sQTqPHWy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028E433EB19;
	Fri, 16 Jan 2026 15:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768578937; cv=none; b=nNEienPado3hi5AwYwwAuG7wG4QnJvw6OiIFdl2+wDdKH4QyJqd82ef0MnlPRHVemcJ6zJKbJaT0+tJXn91u3itJo9e67mgcuk+XwDK6gLmDEg5cyaN7edVKG3Ois6WRPgSmNJ7rhEzOEgEpYixP5lZ/qvMiwFvCAokAQJQW95g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768578937; c=relaxed/simple;
	bh=AI08IkOBl0qOSd+3jS8CDcsc00XmegnRfZyCxiTlrCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GiM3VCwHwUBNVemSV+9fNbwT9FKKMGPUC89t3YcgbtjsFlxnAohUpI0WTS+6LsD7G0ICyPy0fmoRa4MW02HL4D+0QcJysZhOB4hSa0EIOgNPGlHDkoAHy7T6YRNvt5omVIL8Vlm4uEXGeg5079MU4rzoyszHvWACZAhtj/2k8Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=AYHUiOts; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=sQTqPHWy; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768578904; bh=B9kHDeY0RRWjO0vnPw/JSqR
	ut4T9DvCelaqB2mnG9v0=; b=AYHUiOts+w7Zo4bGl2fBauAkVMiMgLKPdbizdpOyJmaSu4Zzp3
	4rkzUXc9spbX1uQIAHOMgnyXivKT+R89xKcCc3trP9ql3j32kY384bmmHqyRNoGIjWtwSYXl36A
	MsvZpXK0c0LtfeFz50YZ75AyADcT42vMA8Y/V95bBw0B5ccPmeWZjsBzgvzTYazt+VbD6AiwceR
	MYDhXUk74vvEAu9qjD7dCjjn61czCbQstbih+9U1J4+7qFEM0/ea14YF/iiQEdYR0Rl2kThrccX
	QkR64eDWTOX13WyDfCYSmlzxTzj3LfoAIUXxUfh7tnM2lgk7u2rZ8ytvD5pn1d2gZvg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768578904; bh=B9kHDeY0RRWjO0vnPw/JSqR
	ut4T9DvCelaqB2mnG9v0=; b=sQTqPHWy+Xu/WMreQjbMKiuKcl6iK4SCcAWgaogBWx55nS8ifA
	HvB+fdchq3PckgwDlPiIIDv+GcX8ciXimHBQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 16 Jan 2026 16:54:46 +0100
Subject: [PATCH v2 4/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove
 extcon
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-xiaomi-willow-v2-4-4694feb70cdb@mainlining.org>
References: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
In-Reply-To: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gabriel Gonzales <semfault@disroot.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768578900; l=1174;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=AI08IkOBl0qOSd+3jS8CDcsc00XmegnRfZyCxiTlrCE=;
 b=z9/1qgfGUmndHIinosZRN5cIaL7w5mLgMT3QEqA6U4UGOl/8Dj8bFpDlTA9NqSzQbJRH654a/
 m6u3SxTc4P5DatFBCHbisO26OAiYP9jCHpnBm7eEn8QLttuLYUM2CS6
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

GPIO pin 102 is related to DisplayPort what is not supported
by this device and it is also disabled at downstream,
remove the unnecessary extcon-usb node.

Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
index 4e1444abc29b..a9b6e648fe3b 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
@@ -77,11 +77,6 @@ ramoops@61600000 {
 		};
 	};
 
-	extcon_usb: extcon-usb {
-		compatible = "linux,extcon-usb-gpio";
-		id-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -304,7 +299,3 @@ &tlmm {
 &usb3 {
 	status = "okay";
 };
-
-&usb3_dwc3 {
-	extcon = <&extcon_usb>;
-};

-- 
2.52.0


