Return-Path: <linux-arm-msm+bounces-58212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C71AB9B62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 295F84E74EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB49023D28C;
	Fri, 16 May 2025 11:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cf73/0jB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABF523C50B;
	Fri, 16 May 2025 11:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395788; cv=none; b=hzwswlPOa+mkJA3ik6cSciXo61SgeCw5FrLwbMefPgElFn+LzYjigtzFv4+CQHPMX/YTiKot9zrOcaW+21QAOG12bBkOFt5bWOI/53xp+061SlmoxyqPJhIpYr5izkb6FtIdG10IR/tKnc1VBMlXUq5CWYHHB0bwNAd3w9MzCiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395788; c=relaxed/simple;
	bh=37F8XH+GAKZ//Tj61nrwPRcylir/pNEVzfMJfqa3dVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uATQq50tPELjBmZ2f0nuV/fVx6w0ZOJSjk2UNY6aC7bUgd+TApoqHuyvfoSjySK6MBlQ+3DKVPZ4cYdVN09SRM1X8Rn42QWGiZNAOIAd8rlSzZbAyTAJSx2n5rfkMGzfbvCF9pJTmLCH6Yge4rKmr3lMmrtzfK+0aBa8C4CzDfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cf73/0jB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97792C4AF1B;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747395787;
	bh=37F8XH+GAKZ//Tj61nrwPRcylir/pNEVzfMJfqa3dVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cf73/0jBEXl0G0qXWNj2P5vV9DisDxxfBC+NfDvScoSxDB7Mb3shrXx1aFpVJ2Wwg
	 +z6MGwv2kYUld1l9CMEX+0OcYMCIKXG3I7pI1odT5o+RYle3QZCrN01fFQl/W5z65B
	 UwiwK0U4blRKDtwxXeYBQVjoOc+PC596r3cfvfR/QsRBSHnwf93wwJW/imDc39MRCa
	 hpECFOHaPgCTylVGCmqqGlcHoOZ2V+S0hkUKT83hvJM4UQRQ8TzpfLAsQcGFJhweLh
	 ojkOmfcAlLKvRoYlkB2p3adNs/nE/35cOjeZnrxguhdVnIkqALOs1IT9rLNmrF6qBj
	 M1BPHjWAtZTDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D692C3ABD8;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Fri, 16 May 2025 15:43:08 +0400
Subject: [PATCH v3 5/5] arm64: dts: qcom: Update IPQ5018 xo_board_clk to
 use fixed factor clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-ipq5018-cmn-pll-v3-5-f3867c5a2076@outlook.com>
References: <20250516-ipq5018-cmn-pll-v3-0-f3867c5a2076@outlook.com>
In-Reply-To: <20250516-ipq5018-cmn-pll-v3-0-f3867c5a2076@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747395784; l=2156;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=Kavlla7VqPYVz8RPprQ6zbDxT2pqDYQ1B/kyLZsoD2U=;
 b=VFJNeLuEWwF+md2+fD/y3r4F6cnclXmET2DLsNq5Zi2l8RPBeJ82mK/NpVIATCI0RX2LNURaO
 psPl7qt5+zvCJLA+pWBkpSNbY44FHwAlkYbT2V0BlRThD5V7f3DZ+BA
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
index 6d33cc196f8e61e30deb485b0715255c5e833e38..36429730815d4b740511a2ec1b50f823a730262b 100644
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



