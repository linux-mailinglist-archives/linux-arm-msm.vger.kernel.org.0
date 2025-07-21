Return-Path: <linux-arm-msm+bounces-65840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E43DB0BC44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 08:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF28118998CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 06:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCF421D3F8;
	Mon, 21 Jul 2025 06:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frGXxaEV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E14213E74;
	Mon, 21 Jul 2025 06:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753077890; cv=none; b=DhmhPjLtEqqqg2FatIkuoTszyNaZu1EO0oVdxYaxUKcsi2D4YwLqt7r1C6XH0PP6aonlaPeMlDHAn+enX8Vm+V55aur5OFk0zAAnfSWUQaRGcTas7V6mEfe03NgokqXZ2IFIWrkl1T3pIUjj1UJVCPHVTVTEkbIiNE5BQkni8Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753077890; c=relaxed/simple;
	bh=0YX/Lk0pR9kxlmL83u2hznqW/tfN7vcR/ymMlrSLwXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fB/tbphqZqexo+hq9uBkLmAfwFQHHFVmLRkw3l8G6j5DW8C8Gs/eHlDUYpW+tty+lU5b4WWg2UMYjoOZHT07By4iWfrXGIbo7EOW+9KGI7qM6keqC5pgqb4JQvpO2mHVXwM6f3DdI5qcy2WNozSLJZpTY18/f7DZl2Kgknosp5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frGXxaEV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9947C4CEF7;
	Mon, 21 Jul 2025 06:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753077889;
	bh=0YX/Lk0pR9kxlmL83u2hznqW/tfN7vcR/ymMlrSLwXM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=frGXxaEVRluzpY+p76k4xE/LzLAk1GCjRwYFW1YSQRuJ/s0x863+GrQFCUFpKf+UO
	 mQJG6VHTqfn6GoG0rdCTaoQWk5B9roIKlznQB42m5bxn09i+janH4ItHFEr50e0nHL
	 lzBA4j3NTmW7OvM18gYt6o0vf5++Wb0RnWudLR4dE/ugPON2A45iHAgsiaiB8Ko4Sy
	 dpH8Vd8+IoFK7VUmL3gtukVRz+i2t26sGoEcl4C1CjFiPRSP7gW1ud+FO4bChyL5Jk
	 Svq+a2qWv0YMBpqGZX8C+FxwVol115pmvr8OJ3ldkq6aLIC+nPTdLJ953phSz+GgsD
	 Gm871O3IS0l0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0775C87FC8;
	Mon, 21 Jul 2025 06:04:49 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 21 Jul 2025 10:04:36 +0400
Subject: [PATCH v5 2/2] arm64: dts: qcom: Update IPQ5018 xo_board_clk to
 use fixed factor clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-ipq5018-cmn-pll-v5-2-4cbf3479af65@outlook.com>
References: <20250721-ipq5018-cmn-pll-v5-0-4cbf3479af65@outlook.com>
In-Reply-To: <20250721-ipq5018-cmn-pll-v5-0-4cbf3479af65@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753077887; l=2156;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=HWWUllR1trQyCJksWvP6XbezGjzhmGW/ycqYEMYXU0o=;
 b=utsEdfaeW7XHg+/IZpxEEnjkjK+t4jZoXJqHhi9Ol8NQinAfkXtaSRPf8RipZ+r6yZdb2GSZt
 bOIEvsohy5WBiun+EUBgi9NQvFNjkQcKL/VQvSvv8nkZNdfr1edgIpA
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
index 3ddcceaf760dccb39914a117d5dcc8955fdb94fe..8ae7d76e29c90cb27fae4904aec6442edada885e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -44,7 +44,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board_clk: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&ref_96mhz_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.50.1



