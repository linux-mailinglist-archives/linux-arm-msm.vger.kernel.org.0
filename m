Return-Path: <linux-arm-msm+bounces-58218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC02AB9C3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 14:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E77BD1B68188
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 12:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD33D242D67;
	Fri, 16 May 2025 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRWj3jFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBBC23F42A;
	Fri, 16 May 2025 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747398971; cv=none; b=HIR0WKZIPSV2PYPe6MT7O7dU1abJN5WXQQlGxJp2ilxDcB9yJqAJD4dvqT1cw6sO6zGUt+b/4ZKGBBszOwc8ctsxGq7TAJoO9YIfJuUS8UmyzLgr0Cty8YXyb7Zp+KTPr3C/OyodVnUKYlMCV2btjfwaxSVCDdVc+AWaawhwOp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747398971; c=relaxed/simple;
	bh=NlcddhlIsvALpOymexjZNwlcKloZ+Zh8gzl7Vb1hliA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BqNTAkJQQmrWVwsqugX9YDcCxepVLkOQJy8QjhOFRS7f0+8nVigBcvSlWzyXykF9UPB5GNV6pWNtDSS+d8z/dktF580QUureWScQNH7fNYaeY/xigWUV+gsmQ4gHyZDnwNS4ZKcG+hpXdjskX026BDUnyTU4JDOiJ6bh6K4xpi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRWj3jFx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0FF6C4CEF1;
	Fri, 16 May 2025 12:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747398970;
	bh=NlcddhlIsvALpOymexjZNwlcKloZ+Zh8gzl7Vb1hliA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CRWj3jFxm2/pMxV2zXXL7ANY/b5ILysunUlbfZ0N0ZrvBHbiuqejWrxzLDTpTjL9m
	 Gn3wZFtkNqgrZfh412enTTkLfKSPxpqt6opJIwZXYBApZ3H+2/syM+Z+p049YI75T/
	 wfB3VtmRNedmQ53n2uryhl+EOUz4+HVAG6m2e7otJCj0FdybzGx/WOVp2WXAt2dg98
	 RYLkGoTJDKfNd2aaNIfKizWGySmqtheeO7DW5K7cHYSBL5PN/zs3zfKdVa9w2dncdA
	 0J9psMCxCEephZyGmkXbTjxqNdUzbtCEE/TaWvC/znjHopE571lAGH83A0HALibuNN
	 RjhbMh/MjNLyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9710EC54756;
	Fri, 16 May 2025 12:36:10 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Fri, 16 May 2025 16:36:12 +0400
Subject: [PATCH v4 5/5] arm64: dts: qcom: Update IPQ5018 xo_board_clk to
 use fixed factor clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-ipq5018-cmn-pll-v4-5-389a6b30e504@outlook.com>
References: <20250516-ipq5018-cmn-pll-v4-0-389a6b30e504@outlook.com>
In-Reply-To: <20250516-ipq5018-cmn-pll-v4-0-389a6b30e504@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>, 
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747398968; l=2156;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=58pP2s4zb8WJ+mE2mDMygGM8IPCe9qeMD2Y23FgyIbQ=;
 b=FrSDQbOUgaNz6XJgeVsJrqrOzsAP/Gx3Bvptqc1MTQZ25bxlsplT7WTiNYh5xjzGEOyEirs9h
 OQrb5PrZBcHA1VmV+tRgvM/4VOr2ca+pwWtRi1YDadeAAqslHVyAg81
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The xo_board_clk is fixed to 24 MHZ, which is routed from WiFi output
clock 96 MHZ (also being the reference clock of CMN PLL) divided by 4
to the analog block routing channel. Update the xo_board_clk nodes in
the board DTS files to use clock-div/clock-mult accordingly.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts             | 3 ++-
 arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts | 3 ++-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi                      | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
index 43def95e9275258041e7522ba4098a3767be3df1..df3cbb7c79c4e6c58cba7695691827fb8b84e451 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
@@ -120,5 +120,6 @@ &usbphy0 {
 };
 
 &xo_board_clk {
-	clock-frequency = <24000000>;
+	clock-div = <4>;
+	clock-mult = <1>;
 };
diff --git a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
index 5bb021cb29cd39cb95035bfac1bdbc976439838b..7a25af57749c8e8c9a6a185437886b04b0d99e8e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
@@ -124,5 +124,6 @@ uart_pins: uart-pins-state {
 };
 
 &xo_board_clk {
-	clock-frequency = <24000000>;
+	clock-div = <4>;
+	clock-mult = <1>;
 };
diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 632caa94df51197ddaa85d172412553e87cf89f3..8b5203554b170619f0c796c832ba688ed45e656d 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -31,7 +31,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board_clk: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&ref_96mhz_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.49.0



