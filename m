Return-Path: <linux-arm-msm+bounces-89440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BD2D335A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F1B23025501
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 15:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A9633C18E;
	Fri, 16 Jan 2026 15:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="JyMSeUZr";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="JVPAEds1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26DB33BBC8;
	Fri, 16 Jan 2026 15:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768579006; cv=none; b=fnNdQ1Idw7lzxcwUWhmHOWRO7gcHfkJwQEW62haBi0dANu9Uyai71l45rKylgn70WIClMxQ8DVVnBzQ/XcGjqJMR+5EO03Cmqn2d6uoeKYR/ebuInRLcQ9KwpD8W7tDYIMTyRC9gHNUY07LtNtnZt50eD49Gg1EswFdjgAZ9ZeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768579006; c=relaxed/simple;
	bh=qt3inedUq/MmQoKO9566ag23yZ8vQbct6HmDG26LUVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NP0A2aE11tZfdNx8YERFZMUXuD/KaCzS040hYjAz0zIZOFVbA7irwaLtoDjyYBM4ocSbxpgoUvnL2KHZezlFw7shSmwux83Y5+d7ATFblTHsv+AGk0SpkujdumBF6IYkvjk9Yh5w9kkRK7SXtYt/QnWo1qg+ys/RsbthiTK0X3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=JyMSeUZr; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=JVPAEds1; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768578905; bh=uKgpy2R20j2XQr08PTw877G
	gR32Ngtgrcb0QG9cVHRc=; b=JyMSeUZraSyAu4hGlEFqT1dCfJgkjCGPd4duYSyg5vjim1rohF
	xt8zdweztXkUEOlhtqBUhQqVLupOTS5ScRjqiuXk4t3lBJODJ7LgkZonClKC8y1KlVHEJER4IhG
	E0za1FVCUa5pDX8juoTr/Lh6OPgQvAiS7EJCA7J7kl38oeaIZ9w/0zskbNSQwYIvKNiPmmfnd/W
	BFakq48WN1b9pguwoXJ9S/EQbZaO8Adlg9adGVzoMGJAZtgGM7rDbEMCdwhzzSCaxXu7BHJ/Vsk
	hh0r0NkKXToiGyUeYA6hUbKXp+JDNCxvDO1dR6KoYgh9SBeKBOflt+BZt0WNlsoTpew==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768578905; bh=uKgpy2R20j2XQr08PTw877G
	gR32Ngtgrcb0QG9cVHRc=; b=JVPAEds1t9FOW2kbOFlr1gCur/F1vUz3+YT62QtovBOfSqVvjg
	0vRHGStPLYP4UABeP1gGw0b7NSjckyX/I4DQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 16 Jan 2026 16:54:47 +0100
Subject: [PATCH v2 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix
 reserved gpio ranges
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-xiaomi-willow-v2-5-4694feb70cdb@mainlining.org>
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
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768578900; l=891;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=qt3inedUq/MmQoKO9566ag23yZ8vQbct6HmDG26LUVU=;
 b=hPOatdeWy0rnjVlIQcz/OaED0jutOeuKhbzkOL+quAmxNk/RYlYnT/3zu5nWmsZkkdoIaJOR6
 9X6Db66fW0NB/lGI0M1nNqwlpOEVTJAVo1Nv2OGeuTgk8rYRPsE+iah
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

The device was crashing on boot because the reserved gpio ranges
was wrongly defined. Correct the ranges for avoid pinctrl crashing.

Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
Tested-by: Biswapriyo Nath <nathbappai@gmail.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
index a9b6e648fe3b..2605d0c942fe 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
@@ -293,7 +293,7 @@ &sdhc_2 {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <22 2>, <28 6>;
+	gpio-reserved-ranges = <0 4>, <30 4>;
 };
 
 &usb3 {

-- 
2.52.0


