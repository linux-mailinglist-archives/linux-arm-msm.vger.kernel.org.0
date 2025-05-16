Return-Path: <linux-arm-msm+bounces-58216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6854AB9C3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 14:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEDCF3AAB0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 12:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE6924166D;
	Fri, 16 May 2025 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sarxlvIq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1858823E35B;
	Fri, 16 May 2025 12:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747398971; cv=none; b=gCBWxZo02+iIZe9p0CjR8SkEi9kIdIqtFSpIOagUd3YhVaCXEIi7eMYnkugSTypndzw3ZNKBZ2ElHuwrYGL2t1DcFUTz1706Us+pn0fo9dast93AO8l6o/CSXtUAFikv70jERvYbSZO19bFUj3ucYByR6PnGEcYdkKebDa8qAPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747398971; c=relaxed/simple;
	bh=tH7q3yefPxb4IsooUEN+J7VkPvPiR8uC8TZKq1fLbew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZuS75kgMmHlK9n9EFTiafMoIrTGMMtvD5FSZCFJ+2YodLDnHPiCwNp0azr1AB9W5DGwt9OPxCOa8zigINyUI3fMewszMerWhzYiTWhHSjLhB1LcdRZee6fMmYz4CAR9Jv5PSIKA4/WoNDLt0umvrqDfxIVb2n89pTC+7VEWB2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sarxlvIq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F5A7C4CEEF;
	Fri, 16 May 2025 12:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747398970;
	bh=tH7q3yefPxb4IsooUEN+J7VkPvPiR8uC8TZKq1fLbew=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sarxlvIqDWP0UW1cOCdStom/lRxmOMupQtQ1xVMEOGVJnI/ZE1I8WJ5PSyH+XxiV8
	 75JSjbt6YaqSWtnVxdht18O7TyYA6mAdpA5CWVSc0FxXRpDKzTReLgBb/CdJxjZiJW
	 f1TL5YTL7BX1rGMYg0bH5jNX0vbjz0zn7UzhI8eJAe3fDqgJBZ2Cj+oOtN7ioTTHLV
	 QmGUV4xeCOZlHllRfI58WhtZ4jVLAJ0/7KMr4DVx4AtYbCQrr53YMfPjKmffp9YwUQ
	 aEk35Vo38RqodNdEFRAjZAmjn4/RlN8bijGUimy8kMNGa4lzlNKXsRnOkfvFxJ4HU8
	 LZMFUNL0GlDCw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F9BC3ABD8;
	Fri, 16 May 2025 12:36:10 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Fri, 16 May 2025 16:36:11 +0400
Subject: [PATCH v4 4/5] arm64: dts: ipq5018: Add CMN PLL node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-ipq5018-cmn-pll-v4-4-389a6b30e504@outlook.com>
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
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747398968; l=2487;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=/8MkwsA8tkiEOngrTa6pfTHAzpGz2h90R2FK3FYJTt8=;
 b=XYGqWejlJkkk2QOrQ4iHC4vWGyTQHibWeBLP+ybPHgM+4pWwEHKPBsAsi+8tB1JI7Fzf+TmZu
 mEDeGuE2AtGCDD6oxgjgNAXdj7UMQ2bsRXsZ+UAQFwPLVDgyV9huMHe
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
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 130360014c5e14c778e348d37e601f60325b0b14..632caa94df51197ddaa85d172412553e87cf89f3 100644
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
@@ -182,6 +197,20 @@ pcie0_phy: phy@86000 {
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
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5018-tlmm";
 			reg = <0x01000000 0x300000>;

-- 
2.49.0



