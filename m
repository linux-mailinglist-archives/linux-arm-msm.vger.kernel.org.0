Return-Path: <linux-arm-msm+bounces-71289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1BCB3CF6E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 23:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 752AF7A81B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 21:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A661DB125;
	Sat, 30 Aug 2025 21:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rB3rEI3X";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="yWOPAH4l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4983C13774D;
	Sat, 30 Aug 2025 21:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756588546; cv=none; b=fwAQHP9TDSC8n3G8CqqE4ZJrodfKAaZzIBvPGrtumEgekQwfhkiCtBMD1scG0TdlNbIIDIgmXAdf/31WN2Bd2DF/E8L0Kp1T2o+KwO+YjHz0b38fU09+vcR61gGVz19MhXnIoR8hd9iI6feDhSVxOlsOIBXFaFD2dBwmD+BpKXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756588546; c=relaxed/simple;
	bh=6npll6b5ANIK0VzuUhhll83oXULGuK5I1TVnZPyAHqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xs2r9Oe6Xx3I872NzbXCBcRwfMbOC22cOEcwWCcupM3/XGaUHturJaD/l46CYWf3Bj+QZPp3XQmzn8HwcCmcUSO+laOf6CguhsbWztVGZik3hLdyt2qQ0R8gzd9q4ynprG1IqfXyqklTWnuaDtw9yEMUKxEyBmETw3BSL2Hl4is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rB3rEI3X; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=yWOPAH4l; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756588402; bh=MG0nTYr/FlHFSs06D08REUE
	lNCVAQMbcS562HKcVoPI=; b=rB3rEI3XuDI9BjHop5mmCFu94qFmzg7BUdRA1Sq07vBu4OUAEp
	vvlPeKy43KABSqod5Qx+ey54fbzoDKGVg8zJ3NxwB8Ci86dEczZ721zWGEyQa8HKcyaUuQwjSde
	Wzcz9Qlx6VUm4MjtXVekNJ6exjZjhGLk/gE1AK5DcuK0Uv1Bo7FEtH0Vf9AxHXdO8B0axGDxw5+
	9o/u86oTVQxlx/6LCHXi8nHI5/O53gtjlULblLDln9VXFdy3ELCglhFq6sS9S2TVvbeewVI5zrH
	IgYf0syVisvq2yloGO97ftEiRGpaDV65i0KjEGdGEGjIr4CFEb6QXINB1KyVyZmdv2Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756588402; bh=MG0nTYr/FlHFSs06D08REUE
	lNCVAQMbcS562HKcVoPI=; b=yWOPAH4lX2Dex0FjzW/pYQ1IGcD0uVgl5HwYiCAkMs4F8ijY+O
	dx1NwI3beAn3Svqlkoqf0QBQ20u6G4Ky/2Cg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sat, 30 Aug 2025 23:13:19 +0200
Subject: [PATCH 1/3] arm64: dts: qcom: msm8953: fix SPI clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250830-msm8953-spi-fix-v1-1-89950eaf10fe@mainlining.org>
References: <20250830-msm8953-spi-fix-v1-0-89950eaf10fe@mainlining.org>
In-Reply-To: <20250830-msm8953-spi-fix-v1-0-89950eaf10fe@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gianluca Boiano <morf3089@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756588401; l=1726;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=6npll6b5ANIK0VzuUhhll83oXULGuK5I1TVnZPyAHqY=;
 b=xYWATD9i3dL6pwhTP5w97ZYewAha360HyLH52Lv7ArZQwZJdAyHgDW3VQYNHLmCr/w1wxVPgL
 RL1ZqtjvGgvB1KEwuyKDYxnHmbf7PI55yKEbe7TvR3eHQ2xV6LQgtLz
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Fix SPI clocks, accidentally I2C clocks was assigned for SPI interfaces.

Fixes: be69109e93c78 ("arm64: dts: qcom: msm8953: add SPI interfaces")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index c5205d09c442e45e4a0cc3e6d8ff7d9d7bda0034..14dd17278ae0850df1dafad19a569ffc5afb174b 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -1660,7 +1660,7 @@ spi_3: spi@78b7000 {
 			reg = <0x078b7000 0x600>;
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "core", "iface";
-			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
+			clocks = <&gcc GCC_BLSP1_QUP3_SPI_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			dmas = <&blsp1_dma 8>, <&blsp1_dma 9>;
 			dma-names = "tx", "rx";
@@ -1751,7 +1751,7 @@ spi_5: spi@7af5000 {
 			reg = <0x07af5000 0x600>;
 			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "core", "iface";
-			clocks = <&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>,
+			clocks = <&gcc GCC_BLSP2_QUP1_SPI_APPS_CLK>,
 				<&gcc GCC_BLSP2_AHB_CLK>;
 			dmas = <&blsp2_dma 4>, <&blsp2_dma 5>;
 			dma-names = "tx", "rx";
@@ -1791,7 +1791,7 @@ spi_6: spi@7af6000 {
 			reg = <0x07af6000 0x600>;
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "core", "iface";
-			clocks = <&gcc GCC_BLSP2_QUP2_I2C_APPS_CLK>,
+			clocks = <&gcc GCC_BLSP2_QUP2_SPI_APPS_CLK>,
 				 <&gcc GCC_BLSP2_AHB_CLK>;
 			dmas = <&blsp2_dma 6>, <&blsp2_dma 7>;
 			dma-names = "tx", "rx";

-- 
2.51.0


