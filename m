Return-Path: <linux-arm-msm+bounces-75308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54449BA3911
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 14:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69DEB1BC7977
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 12:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73EF2EC09B;
	Fri, 26 Sep 2025 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozDs8qlV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA042EACFB;
	Fri, 26 Sep 2025 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758888240; cv=none; b=iq6jhkCO09yJwAF0Z1vg8CRFKW+ZoG+aJdejTSD7hwjBoLg56xokWUxfiW7ih/373YsKGJnDJ+bNPLqzSBTzUORadPXhRIHf86Dub1qEmKjPIYxYBp5pbAWnDd86Nv0XoG80dcoKwF3jDGCFyDUTsbW7gvs6sEBia4yKuGz90Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758888240; c=relaxed/simple;
	bh=IEJbYGbgEpg1nRE1/W/3rXUpWM9dXlT6ITf8Pa6D6xE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQWouTmpfl6d5dS5TW/WAps06NsoYHRw5ROU+3moQ3nCtx1Q+hMVqQZEpeEqsmu9KgnCp75jo1eaiFvNBJ/btGJ5Py6QJPBC/PWElifieo9aOOOs1y/hGKpLDygOPUdvy+Bq+eij1f6rlpnZAg0InnAvPC5ap/naG3Kgr80OIEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozDs8qlV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF26C4CEF7;
	Fri, 26 Sep 2025 12:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758888239;
	bh=IEJbYGbgEpg1nRE1/W/3rXUpWM9dXlT6ITf8Pa6D6xE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ozDs8qlVdnDMDWbQwwnQ/vv0f6QDyProCugia4hKM/oEq9aXhN82Ya2iTjuZHjITB
	 b5/kzyJ7C1MjvUuDCsh84F/9VBzQ+bKwqJYbsKq20yKHkxdogAIPlawUbu+/R6Mthe
	 RBAoKj/viEAcBa+kTdUDay378prSbTxAqbIcqllZQ4oigLSwtFpYqGxKMSyYjOlMMT
	 WOIS1arUKbpkRMw5NPiYCIPcvl/pznAP/pGX8TaHKQ/T+/Em5Q0SkGDbWqCyOUCWkc
	 n/41Z6bTXjHYpHhkxluCT3fvazd655l7ay7glb1+rzMEN/RWDAy+Bhly5osZrIaTv9
	 q4hoNns7K91Dg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 26 Sep 2025 14:03:45 +0200
Subject: [PATCH 1/3] dt-bindings: clock: qcom,x1e80100-gcc: Add missing
 USB4 clocks/resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-topic-hamoa_gcc_usb4-v1-1-25cad1700829@oss.qualcomm.com>
References: <20250926-topic-hamoa_gcc_usb4-v1-0-25cad1700829@oss.qualcomm.com>
In-Reply-To: <20250926-topic-hamoa_gcc_usb4-v1-0-25cad1700829@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758888227; l=7844;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=/nhueKg2i0xZS5+UcD6uJtp1uj+JXpggWR0Yv+166Ck=;
 b=b8q1h1tZcQlGer29F7xWPBoJDpidb7YnBb9rmZYSwpenq3YYsqtNB5SvfMgyEJI6SLIXrf9jG
 2Tf2ZX7jMMnCGhbpZLnByIIBENsbOO1EBg6cZDsGXu3dsxpkwO2bJ+2
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some of the USB4 muxes, RCGs and resets were not initially described.

Add indices for them to allow extending the driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../bindings/clock/qcom,x1e80100-gcc.yaml          | 62 ++++++++++++++++++++--
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      | 61 +++++++++++++++++++++
 2 files changed, 119 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
index 68dde0720c711320aa0e7c74040cf3c4422dda72..1b15b507095455c93b1ba39404cafbb6f96be5a9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
@@ -32,9 +32,36 @@ properties:
       - description: PCIe 5 pipe clock
       - description: PCIe 6a pipe clock
       - description: PCIe 6b pipe clock
-      - description: USB QMP Phy 0 clock source
-      - description: USB QMP Phy 1 clock source
-      - description: USB QMP Phy 2 clock source
+      - description: USB4_0 QMPPHY clock source
+      - description: USB4_1 QMPPHY clock source
+      - description: USB4_2 QMPPHY clock source
+      - description: USB4_0 PHY DP0 GMUX clock source
+      - description: USB4_0 PHY DP1 GMUX clock source
+      - description: USB4_0 PHY PCIE PIPEGMUX clock source
+      - description: USB4_0 PHY PIPEGMUX clock source
+      - description: USB4_0 PHY SYS PCIE PIPEGMUX clock source
+      - description: USB4_1 PHY DP0 GMUX 2 clock source
+      - description: USB4_1 PHY DP1 GMUX 2 clock source
+      - description: USB4_1 PHY PCIE PIPEGMUX clock source
+      - description: USB4_1 PHY PIPEGMUX clock source
+      - description: USB4_1 PHY SYS PCIE PIPEGMUX clock source
+      - description: USB4_2 PHY DP0 GMUX 2 clock source
+      - description: USB4_2 PHY DP1 GMUX 2 clock source
+      - description: USB4_2 PHY PCIE PIPEGMUX clock source
+      - description: USB4_2 PHY PIPEGMUX clock source
+      - description: USB4_2 PHY SYS PCIE PIPEGMUX clock source
+      - description: USB4_0 PHY RX 0 clock source
+      - description: USB4_0 PHY RX 1 clock source
+      - description: USB4_1 PHY RX 0 clock source
+      - description: USB4_1 PHY RX 1 clock source
+      - description: USB4_2 PHY RX 0 clock source
+      - description: USB4_2 PHY RX 1 clock source
+      - description: USB4_0 PHY PCIE PIPE clock source
+      - description: USB4_0 PHY max PIPE clock source
+      - description: USB4_1 PHY PCIE PIPE clock source
+      - description: USB4_1 PHY max PIPE clock source
+      - description: USB4_2 PHY PCIE PIPE clock source
+      - description: USB4_2 PHY max PIPE clock source
 
   power-domains:
     description:
@@ -67,7 +94,34 @@ examples:
                <&pcie6b_phy>,
                <&usb_1_ss0_qmpphy 0>,
                <&usb_1_ss1_qmpphy 1>,
-               <&usb_1_ss2_qmpphy 2>;
+               <&usb_1_ss2_qmpphy 2>,
+               <&usb4_0_phy_dp0_gmux_clk>,
+               <&usb4_0_phy_dp1_gmux_clk>,
+               <&usb4_0_phy_pcie_pipegmux_clk>,
+               <&usb4_0_phy_pipegmux_clk>,
+               <&usb4_0_phy_sys_pcie_pipegmux_clk>,
+               <&usb4_1_phy_dp0_gmux_2_clk>,
+               <&usb4_1_phy_dp1_gmux_2_clk>,
+               <&usb4_1_phy_pcie_pipegmux_clk>,
+               <&usb4_1_phy_pipegmux_clk>,
+               <&usb4_1_phy_sys_pcie_pipegmux_clk>,
+               <&usb4_2_phy_dp0_gmux_2_clk>,
+               <&usb4_2_phy_dp1_gmux_2_clk>,
+               <&usb4_2_phy_pcie_pipegmux_clk>,
+               <&usb4_2_phy_pipegmux_clk>,
+               <&usb4_2_phy_sys_pcie_pipegmux_clk>,
+               <&usb4_0_phy_rx_0_clk>,
+               <&usb4_0_phy_rx_1_clk>,
+               <&usb4_1_phy_rx_0_clk>,
+               <&usb4_1_phy_rx_1_clk>,
+               <&usb4_2_phy_rx_0_clk>,
+               <&usb4_2_phy_rx_1_clk>,
+               <&usb4_0_phy_pcie_pipe_clk>,
+               <&usb4_0_phy_max_pipe_clk>,
+               <&usb4_1_phy_pcie_pipe_clk>,
+               <&usb4_1_phy_max_pipe_clk>,
+               <&usb4_2_phy_pcie_pipe_clk>,
+               <&usb4_2_phy_max_pipe_clk>;
       power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
diff --git a/include/dt-bindings/clock/qcom,x1e80100-gcc.h b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
index 710c340f24a57d799ac04650fbe9d4ea0f294bde..62aa1242559270dd3bd31cd10322ee265468b8e4 100644
--- a/include/dt-bindings/clock/qcom,x1e80100-gcc.h
+++ b/include/dt-bindings/clock/qcom,x1e80100-gcc.h
@@ -363,6 +363,30 @@
 #define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				353
 #define GCC_USB3_SEC_PHY_PIPE_CLK_SRC				354
 #define GCC_USB3_TERT_PHY_PIPE_CLK_SRC				355
+#define GCC_USB34_PRIM_PHY_PIPE_CLK_SRC				356
+#define GCC_USB34_SEC_PHY_PIPE_CLK_SRC				357
+#define GCC_USB34_TERT_PHY_PIPE_CLK_SRC				358
+#define GCC_USB4_0_PHY_DP0_CLK_SRC				359
+#define GCC_USB4_0_PHY_DP1_CLK_SRC				360
+#define GCC_USB4_0_PHY_P2RR2P_PIPE_CLK_SRC			361
+#define GCC_USB4_0_PHY_PCIE_PIPE_MUX_CLK_SRC			362
+#define GCC_USB4_0_PHY_RX0_CLK_SRC				363
+#define GCC_USB4_0_PHY_RX1_CLK_SRC				364
+#define GCC_USB4_0_PHY_SYS_CLK_SRC				365
+#define GCC_USB4_1_PHY_DP0_CLK_SRC				366
+#define GCC_USB4_1_PHY_DP1_CLK_SRC				367
+#define GCC_USB4_1_PHY_P2RR2P_PIPE_CLK_SRC			368
+#define GCC_USB4_1_PHY_PCIE_PIPE_MUX_CLK_SRC			369
+#define GCC_USB4_1_PHY_RX0_CLK_SRC				370
+#define GCC_USB4_1_PHY_RX1_CLK_SRC				371
+#define GCC_USB4_1_PHY_SYS_CLK_SRC				372
+#define GCC_USB4_2_PHY_DP0_CLK_SRC				373
+#define GCC_USB4_2_PHY_DP1_CLK_SRC				374
+#define GCC_USB4_2_PHY_P2RR2P_PIPE_CLK_SRC			375
+#define GCC_USB4_2_PHY_PCIE_PIPE_MUX_CLK_SRC			376
+#define GCC_USB4_2_PHY_RX0_CLK_SRC				377
+#define GCC_USB4_2_PHY_RX1_CLK_SRC				378
+#define GCC_USB4_2_PHY_SYS_CLK_SRC				379
 
 /* GCC power domains */
 #define GCC_PCIE_0_TUNNEL_GDSC					0
@@ -484,4 +508,41 @@
 #define GCC_VIDEO_BCR						87
 #define GCC_VIDEO_AXI0_CLK_ARES					88
 #define GCC_VIDEO_AXI1_CLK_ARES					89
+#define GCC_USB4_0_MISC_USB4_SYS_BCR				90
+#define GCC_USB4_0_MISC_RX_CLK_0_BCR				91
+#define GCC_USB4_0_MISC_RX_CLK_1_BCR				92
+#define GCC_USB4_0_MISC_USB_PIPE_BCR				93
+#define GCC_USB4_0_MISC_PCIE_PIPE_BCR				94
+#define GCC_USB4_0_MISC_TMU_BCR					95
+#define GCC_USB4_0_MISC_SB_IF_BCR				96
+#define GCC_USB4_0_MISC_HIA_MSTR_BCR				97
+#define GCC_USB4_0_MISC_AHB_BCR					98
+#define GCC_USB4_0_MISC_DP0_MAX_PCLK_BCR			99
+#define GCC_USB4_0_MISC_DP1_MAX_PCLK_BCR			100
+#define GCC_USB4_1_MISC_USB4_SYS_BCR				101
+#define GCC_USB4_1_MISC_RX_CLK_0_BCR				102
+#define GCC_USB4_1_MISC_RX_CLK_1_BCR				103
+#define GCC_USB4_1_MISC_USB_PIPE_BCR				104
+#define GCC_USB4_1_MISC_PCIE_PIPE_BCR				105
+#define GCC_USB4_1_MISC_TMU_BCR					106
+#define GCC_USB4_1_MISC_SB_IF_BCR				107
+#define GCC_USB4_1_MISC_HIA_MSTR_BCR				108
+#define GCC_USB4_1_MISC_AHB_BCR					109
+#define GCC_USB4_1_MISC_DP0_MAX_PCLK_BCR			110
+#define GCC_USB4_1_MISC_DP1_MAX_PCLK_BCR			111
+#define GCC_USB4_2_MISC_USB4_SYS_BCR				112
+#define GCC_USB4_2_MISC_RX_CLK_0_BCR				113
+#define GCC_USB4_2_MISC_RX_CLK_1_BCR				114
+#define GCC_USB4_2_MISC_USB_PIPE_BCR				115
+#define GCC_USB4_2_MISC_PCIE_PIPE_BCR				116
+#define GCC_USB4_2_MISC_TMU_BCR					117
+#define GCC_USB4_2_MISC_SB_IF_BCR				118
+#define GCC_USB4_2_MISC_HIA_MSTR_BCR				119
+#define GCC_USB4_2_MISC_AHB_BCR					120
+#define GCC_USB4_2_MISC_DP0_MAX_PCLK_BCR			121
+#define GCC_USB4_2_MISC_DP1_MAX_PCLK_BCR			122
+#define GCC_USB4PHY_PHY_PRIM_BCR				123
+#define GCC_USB4PHY_PHY_SEC_BCR					124
+#define GCC_USB4PHY_PHY_TERT_BCR				125
+
 #endif

-- 
2.51.0


