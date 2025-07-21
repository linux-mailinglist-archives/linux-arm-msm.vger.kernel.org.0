Return-Path: <linux-arm-msm+bounces-65839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE11B0BC42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 08:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D26823A4B32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 06:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482C521D3C6;
	Mon, 21 Jul 2025 06:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQ8ibeKK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198D21F3BB5;
	Mon, 21 Jul 2025 06:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753077890; cv=none; b=NeKmOUF/MVokb6BdiBhXmnzr+POhl92T4lQLPWag/z2JOvoGOV6s7370gynX+DonTHrT0iuWg2TI5GnZs1mj0nIMtAuye1Pj8sjRYYO3cGdO2DRg96go1ZCOtkzMuEZnNQ1Dx5LYX+agYpLGQ1/SKPjMbARYWrT38sDdLvTjwyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753077890; c=relaxed/simple;
	bh=3RIKLCbpXuG5IzWRYoD9BqTheBfbi8XdnTcRob2v7tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nfVDfZT96HZnGRZ58OTbuIISaJZ6x09jzze/1TGFLtcw0BsRt8rySuZc8P3pdMYzZ0ghT8sIrzR4lzzHU8ZCJBL7W2vMi3KrnL+WKEopn9hxdgiFKicKVXQJDBw8Z8P6uq34zov1/0hbDM8Xk3rloLJCkq7j92vymw2AY9BPJ6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQ8ibeKK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD802C4CEF5;
	Mon, 21 Jul 2025 06:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753077889;
	bh=3RIKLCbpXuG5IzWRYoD9BqTheBfbi8XdnTcRob2v7tg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HQ8ibeKKn4et6M8mJGRuHhq6Rg92YMAyOFrcOaChWL8ZYIO9VQKiynuBY4JUNXkvC
	 wZfJQ+g73+BWoRp3RhJz6cMqvhgNu60JwLXPatwifPhbU4CXEv6YDnIc50eT3x4H9k
	 XlVfYoQMc7jrxdsS3JMof70K3ZG2obnWVBMUknZepTGXS5Pd5PNbEzCU5r+lpuy+bP
	 kVdlOKGYtnaoeAH+Fcz5HX7PEQ0WvF7Jf9J4KckZmNMsrB2qP8XXGNZwK077oeYNcr
	 tP9UTIpC8533RGcNiYhmQelgC2QWXmqx+SUrKFdM8MWGQSMi3dxN+i4TzbBZb+veVM
	 IyTvv4YkEyIQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AB2C83F27;
	Mon, 21 Jul 2025 06:04:49 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 21 Jul 2025 10:04:35 +0400
Subject: [PATCH v5 1/2] arm64: dts: ipq5018: Add CMN PLL node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-ipq5018-cmn-pll-v5-1-4cbf3479af65@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753077887; l=2619;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=Jc7mpYMgCxpITcEYnscgFXztbHy0Q20lBLLi8g9IFDY=;
 b=ZlhpHZYcU/pvY451fXhFyhUUQlQkmIA98V5BkMy/NBGcOpKwYuiesMbF60fN8bh1mFZ/AtuOO
 Nq0FP0/K73kAehBojSK3M402uuZSqXJOoXmo+NGqzQZdJPgAdwtfTRD
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 9ce73682e4ae7cde90f151dfcd41a5201ced2aa6..3ddcceaf760dccb39914a117d5dcc8955fdb94fe 100644
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
 #include <dt-bindings/thermal/thermal.h>
 
@@ -29,6 +30,14 @@ gephy_tx_clk: gephy-tx-clk {
 			#clock-cells = <0>;
 		};
 
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
@@ -38,6 +47,12 @@ xo_board_clk: xo-board-clk {
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
@@ -229,6 +244,20 @@ mdio1: mdio@90000 {
 			status = "disabled";
 		};
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq5018-cmn-pll";
+			reg = <0x0009b000 0x800>;
+			clocks = <&ref_96mhz_clk>,
+				 <&gcc GCC_CMN_BLK_AHB_CLK>,
+				 <&gcc GCC_CMN_BLK_SYS_CLK>;
+			clock-names = "ref",
+				      "ahb",
+				      "sys";
+			#clock-cells = <1>;
+			assigned-clocks = <&cmn_pll IPQ5018_CMN_PLL_CLK>;
+			assigned-clock-rates-u64 = /bits/ 64 <9600000000>;
+		};
+
 		qfprom: qfprom@a0000 {
 			compatible = "qcom,ipq5018-qfprom", "qcom,qfprom";
 			reg = <0x000a0000 0x1000>;

-- 
2.50.1



