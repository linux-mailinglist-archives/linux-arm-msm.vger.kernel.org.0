Return-Path: <linux-arm-msm+bounces-78641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F81C033A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 21:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22A701A68028
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 19:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2A234DB4C;
	Thu, 23 Oct 2025 19:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fJyvpxHW";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="yEbgmDmy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167B434E765;
	Thu, 23 Oct 2025 19:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761249146; cv=none; b=LSisaIl51oTaHpHYM2FVuNsNPCIN1EvB3Jbq7ZjJC7Y1+quBufB3+F61ssAoAe2NeNOyFxr38WfgGdcPTHElx/Ho+XW/zZJ9sE9kvhfwBJEHKwjwMxptXsnfS53zmGMuiSYw3gTwxP6nrSKDy27iLYFTIKMK7w5qR3jIqEUCZcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761249146; c=relaxed/simple;
	bh=DiXEeBLmW54fhAAmxJ5HhLS0zDYlt5h2rZJxm7LGak8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A4vRWTmH5rxHz47FfrhkQ5m2xHkrfr1qLcdV7m5tjG1i4QcSGs33UBp1NQIgJzkHDgM0zEqsvgSF2J2zCyvgVzPdJYJGn8RqZn88KU5t56LAIcX2KmTjxJTR/SffElevYiqn34Ypma8kx/LJvOU9gsSwdtWKbpJFANmTovjlJms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fJyvpxHW; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=yEbgmDmy; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1761249130; bh=2eVH9tExxFIiMKzVTFLkdqw
	kS4noX3l5pWBg585Afig=; b=fJyvpxHWiDv5zviW820sbjEyHAaWdbH4IDk2l8DBfRUiHiNSK1
	llmJOCQEud+NenLWERvGDbg9MSZ591ICWGVG0fSvY7xECjcWmKfF8sk05J3TiAuvgzI8gN5Ex1d
	D54pDQ00TqhGhiMcGFi3H+UR+9KUr57qdirxfrT3GA6UrUjEeUqPtSQR8Mr/omN6iGOLhIiuwbr
	EZ/U25g36EUYamX4yLUvuwXfEhBlOfNUaOgaOs9X/3SiIO6YA7DD+TLuGBVsqyVsN5kpR1+Cy4V
	VHtdIbwsoSXef6vNh8MRf8iAQcj5v5qiPwM+a/I2mIN6pDKI3pTJcYrd1agSgxq5G3A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1761249130; bh=2eVH9tExxFIiMKzVTFLkdqw
	kS4noX3l5pWBg585Afig=; b=yEbgmDmy43Oob73QxpMIh62bvDGBrWxYXyzC5Umm0RjmWhaguC
	Ct1afIphuWHFaI4aQRNZdeCaZgggssWLUzCA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Thu, 23 Oct 2025 22:52:00 +0300
Subject: [PATCH v2 2/3] arm64: dts: qcom: sdm630: Add missing vote clock
 and GDSC to lpass_smmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-2-895ffe50ab5f@mainlining.org>
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
In-Reply-To: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761249128; l=829;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=DiXEeBLmW54fhAAmxJ5HhLS0zDYlt5h2rZJxm7LGak8=;
 b=7F6OhrPtnsQ7FfINW7OKIEeOEWD7t/ZL5glldF/PW8Fn/6UtDKS2DDywqRpU7qKQcFbS2SZiP
 3z/IrauymvYAJW1Yuoa2GS3pERGMvfZvJudrWGF5MscUtrgZuEtp74K
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Add missing vote clock and GDSC to lpass_smmu node to allow FastRPC
services to probe properly.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index a6a1933229b9..f4906ee3f0c3 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1217,6 +1217,11 @@ lpass_smmu: iommu@5100000 {
 			reg = <0x05100000 0x40000>;
 			#iommu-cells = <1>;
 
+			clocks = <&gcc GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>;
+			clock-names = "bus";
+
+			power-domains = <&gcc HLOS1_VOTE_LPASS_ADSP_GDSC>;
+
 			#global-interrupts = <2>;
 			interrupts =
 				<GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,

-- 
2.51.1


