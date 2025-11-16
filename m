Return-Path: <linux-arm-msm+bounces-82007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D3CC61E50
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 23:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5E41435EFBD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 22:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2DB30CDA8;
	Sun, 16 Nov 2025 22:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CeKC6oGf";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="KgYNLYpj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB5E275AF0;
	Sun, 16 Nov 2025 22:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763331031; cv=none; b=fZkeUeoh+32fzOv/DE8RIOM/yggOREf71E2fyALqrT+wiPRVAq2Tc0O6EeqOGAQsWqA04UAKJ90U8i0ePY4Tr8AikLFkbozMSTUpHYJnWI6+QUHYWScOtHr7m/aDRyLyfPPlN8PwLOLnrwxdK5Ep4M857Uk0u3AvjQFsUA8QITc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763331031; c=relaxed/simple;
	bh=NFRPI4skgtybHULeMX7W4qS21s86nT/R4fnKE48z97c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rCbMg8JN10Zcg5S5d5V8Way9P3GD20wsuISaIqS+qK/v7ECAStya4sBnsKpFoA7j9LTNY6gZl+ryvxadmnJ0ES1DW79OHXDKg1qrx5jDemmIc4t5n4jcYyWOe3JuuolxNdKqHSw8hZuf0Y3xXchQupgnvRhvRxwnhbNr04Xj5eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=CeKC6oGf; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=KgYNLYpj; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763331020; bh=tsucLZhpzyT8gHEL+OHI0T8
	2dZvoZbQt0TQWXAk2AAo=; b=CeKC6oGfvLr/b5F9TrVdssM0YT2gLtlmPDHhTUSPjUr52WvTbv
	5H4LElOZm5ksXdT15lvAh9UUZoMG0wiNQjrcRgzneZoqkAMVXDDfdqPbc3o2fbv+eRmiKS2D6Tr
	vsbdCuGP1wwv2tGOwIUYtlsgNGXwV/VXxoNomm5KO4qsECKQXhosD0VxHNus5bcJ9RNUz/98xzd
	PuOL4RedLUoB3UYLQ/zLWcifi++z+vr6FOYDIQBXsC9dDqVViYyJRL3L4cUKovIwuphHYXlXlCc
	CCC6HD7Uec0Q1eNIG7IJpncwUth++IGekdQHzrvFZDlR760LtIOsZFRdoFqklPpVXOA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763331020; bh=tsucLZhpzyT8gHEL+OHI0T8
	2dZvoZbQt0TQWXAk2AAo=; b=KgYNLYpjCJIJJHYUY9pfGY5iS/Z6wjZKvGweFTiGQghNt316hk
	RLhDbSSMoTom30t7UDKD8S1fgBXCREpI4bCA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 16 Nov 2025 23:10:19 +0100
Subject: [PATCH 3/4] arm64: dts: qcom: msm8917: add reset for display
 subsystem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251116-mdss-resets-msm8917-msm8937-v1-3-08051386779b@mainlining.org>
References: <20251116-mdss-resets-msm8917-msm8937-v1-0-08051386779b@mainlining.org>
In-Reply-To: <20251116-mdss-resets-msm8917-msm8937-v1-0-08051386779b@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763331018; l=722;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=NFRPI4skgtybHULeMX7W4qS21s86nT/R4fnKE48z97c=;
 b=iE+UsSpYQZ1fomhsflywpopK7tonNLTOISTfkMOX6222eSRSzv8lqKBHD3yFLbkLt9z8znx9u
 OpaLPzehPPOAeQPNknHkApzSayok66u6P3i8D/k5eUhfY9z/QxbcG3I
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add reset for display subsystem, make sure it gets
properly reset.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index 8a642fce2e40..6251189b8e6d 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -996,7 +996,7 @@ mdss: display-subsystem@1a00000 {
 			clock-names = "iface",
 				      "bus",
 				      "vsync";
-
+			resets = <&gcc GCC_MDSS_BCR>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 
 			interrupt-controller;

-- 
2.51.2


