Return-Path: <linux-arm-msm+bounces-58208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABAEAB9B50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA2601BA41BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2031B239085;
	Fri, 16 May 2025 11:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSO8GkYH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A241F4CAC;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395788; cv=none; b=TKg/YUonWkX8B7TcADeYM+K1/G/aKlkgi3SaYpwvrE7CT1lwM4ql+L54CDAS5jb41tzcO38uHvID8y9npHvmtb6y0rn+cMulIw3IwodOTo5F5Yt7+2AiPFq8IEVsDYkqIAaiO0vFX1fOeJKAKIJ+PyuNwRRmUD2NNHOgmTELhLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395788; c=relaxed/simple;
	bh=qPbN4OrYfMlLyd6HdjCqdPrZoYX+1ffoO5TvIiXPCME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A6dxcWMOL/hkszDPD1LmSeuvPG1fn0DW6UGQwl0YxQ09j/822b6c8yjQgxuXFjYF+HaEShklBa6wYEf9FXRAK/0QTVp8IjI7MLF/gZ5phFP6H8eaZHwiq2MiR/aGwHz5YFxq0nk8Ac6oCgH9+c6rgbAl3PErI/UM/SeWeX5XVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSO8GkYH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8948EC4CEF1;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747395787;
	bh=qPbN4OrYfMlLyd6HdjCqdPrZoYX+1ffoO5TvIiXPCME=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZSO8GkYHQ9yLUk1oEJXOr5L/4iqGyQM1qSng5/4kolLjLLw90ABg+KOLnUt7Qp31f
	 i88EmRs8t2eq/5wIiQaK/CNvXe1Bpb2LjiFKKYZ30zf4z+aiDJmo3476Hd+AvBhf0S
	 FwYgOMDBBk+ahEfqiuEpWnAe4BQTVrp/SiXv4prbX1cV73uDzBnC4jauFGcQtolOI3
	 ZfWjoFgshC2sj3/5KtWPRH3vrDkCfo/6Ad2HhMlmYVLhKwL3m6MRJfEbMlABxMZ5ST
	 XS3PRiHuRWqZb4JCsKRZnEEAUMI/hRn6gB6zaCDTccdfnt5hzSqRgRK60Q1e3x3t/l
	 JBXp6LQKWQ9Tg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA20C3ABC9;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Fri, 16 May 2025 15:43:07 +0400
Subject: [PATCH v3 4/5] arm64: dts: ipq5018: Add CMN PLL node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-ipq5018-cmn-pll-v3-4-f3867c5a2076@outlook.com>
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
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747395784; l=1868;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=i8rlTNHd6kvpsl8Y56j+yL6A694vfBenSJxiKk+mwOY=;
 b=Ykxm8UWWNr4u121oM6w2fcnntkQq94oohD7NCtZWepN0eqnthG8/eKoKUs0mNtMeg2icbra7j
 dI5u5HMcFe8DaNQ3c7sCVs2dMPkNE5lHbxiefMLvSNfR30co/Wc4X/Y
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Add CMN PLL node for enabling output clocks to the networking
hardware blocks on IPQ5018 devices.

The reference clock of CMN PLL is routed from XO to the CMN PLL
through the internal WiFi block.
.XO (48 MHZ) --> WiFi (multiplier/divider)--> 96 MHZ to CMN PLL.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 130360014c5e14c778e348d37e601f60325b0b14..6d33cc196f8e61e30deb485b0715255c5e833e38 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -2,12 +2,13 @@
 /*
  * IPQ5018 SoC device tree source
  *
- * Copyright (c) 2023 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023-2025 The Linux Foundation. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
-#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-ipq5018.h>
+#include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
 
 / {
@@ -16,6 +17,14 @@ / {
 	#size-cells = <2>;
 
 	clocks {
+		ref_96mhz_clk: ref-96mhz-clk {
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
+			#clock-cells = <0>;
+			clock-div = <1>;
+			clock-mult = <2>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -25,6 +34,12 @@ xo_board_clk: xo-board-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 		};
+
+		xo_clk: xo-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <48000000>;
+		};
 	};
 
 	cpus {

-- 
2.49.0



