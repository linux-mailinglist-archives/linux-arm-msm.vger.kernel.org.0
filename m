Return-Path: <linux-arm-msm+bounces-82006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F975C61E41
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 23:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CB9F435EAF1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 22:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D839F3090E8;
	Sun, 16 Nov 2025 22:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="U9+rOA40";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mfV89pqu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFD42857FA;
	Sun, 16 Nov 2025 22:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763331030; cv=none; b=Yz27BW3rQwYwFKEfH/hfbqxwBOMa7lADWiIyKdeBnSiIsCOe0N2EZRkGCSvt43VLc6lfvGpovrNh7ANYn3N+CMxwPtbjNh24nEh7ab/tbJLCf8iqxzrEV077QcFrnrkwf8MvC2YPoYVGbpU5jTdA3LBQlejlzH8R4thh7KZU9LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763331030; c=relaxed/simple;
	bh=211dG0nlWFiyJgaP5mvAIBwKf2Q+qtWHJaKL6tYsZc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ofjeQoXzXS6nEJy+jDY4MFvB5at/HViTB9nqbNzKEtM2bu+VisCbr9FgVsuuiAUE6PimQcWUbugZm2QTiwrmAC73VM/rHlEf+YUOAGENeT3F/ia7759i0Ujxb7BcmbKCYShpKjbAbUuqzVI3P1zKN3bUs/oCS2o7d4KxPuOeINM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=U9+rOA40; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mfV89pqu; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763331021; bh=2kqASJ9zICL5T++fch8uFby
	XaxYHHj3pmTZEZ7bbymI=; b=U9+rOA40LYnhly1oY0c+OBibCcIBRpJWKX21MM4reV3jECzl0p
	rfe7xpGAyn63QgBV/KrCHVVGjrrHDQLXOOKzUnKM71C31ifLV9J4h8U2Dx/uRL7yxnRESWZYUal
	JGYURERoJyWNbnq7zNB8vOKGwrEEPiSgOkbC/i06xO4IbFB1Q6oHLhD40LYB/FJUrXBHg/lvZ3m
	lDFQxge/zB2z+5T2v2K8tXWHkXj6Bv+Bl3ddrJ1R9u9z2u4N8G0Zp6ovmv8vj63KHD4Fq8jVfIQ
	xCOJDugUj+v+6nxudGk9DdgGdiuPD/Rgn/IQPV/tyLm1o/3DOJunZPkyA3JxIggh5qw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763331021; bh=2kqASJ9zICL5T++fch8uFby
	XaxYHHj3pmTZEZ7bbymI=; b=mfV89pqu0VLbbJDUw3tn5z/krtHqUC0p1WqcI4tC4iknWnCUvA
	3u2G8ie99Kt3FuquzVKnqZbL/Ut8LpyluiCQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 16 Nov 2025 23:10:20 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: msm8937: add reset for display
 subsystem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251116-mdss-resets-msm8917-msm8937-v1-4-08051386779b@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763331018; l=705;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=211dG0nlWFiyJgaP5mvAIBwKf2Q+qtWHJaKL6tYsZc0=;
 b=9bMNa+SCriITbf/1nIYrm29pu4+WqI9sEwkfI46NMDNy7v8f8z4mHByN59xgjmigQbbH1YHB0
 Ov3LGVV80OKCLl9HQpug/iyggXiDvr7xTTtmdgfFgSRQrwTf4NmZ6g+
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add reset for display subsystem, make sure it gets
properly reset.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi b/arch/arm64/boot/dts/qcom/msm8937.dtsi
index b93621080989..c94eb14e31bd 100644
--- a/arch/arm64/boot/dts/qcom/msm8937.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
@@ -1044,6 +1044,7 @@ mdss: display-subsystem@1a00000 {
 			clock-names = "iface",
 				      "bus",
 				      "vsync";
+			resets = <&gcc GCC_MDSS_BCR>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 
 			interrupt-controller;

-- 
2.51.2


