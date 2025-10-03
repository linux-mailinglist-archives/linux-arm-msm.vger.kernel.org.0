Return-Path: <linux-arm-msm+bounces-75934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 555BCBB7DB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 20:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D978319E1395
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 18:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D842DEA86;
	Fri,  3 Oct 2025 18:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOEjWnat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979772DAFDF;
	Fri,  3 Oct 2025 18:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759515289; cv=none; b=Gkq6tpZ86Oq134JgX9+OHvGGUdRrYUuqykfbIJkQ2b6YqnYTwbly2o5RkdjivalyWB7jBumRC9expObFeGMBJ/1X8jJWFTzVWlJ2+e5VUOhbWvk4b/HDh8P0kc/pBV1OJ87mINcaDLU/Y1ShrJzb6rOpV4L9H4wkhYMiNz6TCKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759515289; c=relaxed/simple;
	bh=NJjpR537809gru4uaUWcWs1RQpcRApH8GUSWZ8RplEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUVzgfyUWqeUMkeeFq8+GtrLmSwgG+pPVFVoYt6mtgeqvzovlAGgnK3AMFetoaj2ocVBnuS8nGvoS5613acGDwtaWnWnUPutgmWqNclmQgOLtjfCjyME3KRXYvXX7PnGSBbHKJfsKJtbYDOFwc53UcheyhtJ/SjWecmV05kmNPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOEjWnat; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5F2C4CEF9;
	Fri,  3 Oct 2025 18:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759515289;
	bh=NJjpR537809gru4uaUWcWs1RQpcRApH8GUSWZ8RplEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SOEjWnatsv6hESw1a7uQ9eWq2oamCVaXt5F6l3kRStEloSFUx6oma93YvPrj9M7QN
	 8xSCNIfEYKSPAemh7Vw+pv7fjh6C9ukq7TaGpx2GE5WWpfn05Zh171W0X1DYEgZnnK
	 KFITRuZVE40Ox7JWRy26pqkWuhfNphnp41T3KP/Xq4cHMbo7FFVTvRSoMIpndSaPO8
	 0d+ba4KubpmW5qmu6fMOnZq5DF1INrLB7Xb7wPJMT4qvHYZ0Owyk4CxuVcCtF7hCbn
	 juln0489bKim7TsyHCLrhcMeiuOw7rzLI+7jahoKZJ41t864pTTgwtDXv8uO+SqSkS
	 FsI/MPvmoPQyw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 03 Oct 2025 20:14:38 +0200
Subject: [PATCH v2 1/3] dt-bindings: clock: qcom,x1e80100-gcc: Add missing
 USB4 clocks/resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-topic-hamoa_gcc_usb4-v2-1-61d27a14ee65@oss.qualcomm.com>
References: <20251003-topic-hamoa_gcc_usb4-v2-0-61d27a14ee65@oss.qualcomm.com>
In-Reply-To: <20251003-topic-hamoa_gcc_usb4-v2-0-61d27a14ee65@oss.qualcomm.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759515280; l=7939;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=2SEYKECbMAw1/v9/+aajX73j5K02QruptY1QjzSZwBE=;
 b=naTwxckpKit1VGk/nXHB3hYQC41U7uzVKRKZlrliFfTdfmwZvAtvYe4MnctDtTmImzrNsDZMX
 75Fw0QmhhjRCEyEF+thFk8awPhZIiS0njvaRwXQ0Nb2vaUZ67w5Hx1E
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some of the USB4 muxes, RCGs and resets were not initially described.

Add indices for them to allow extending the driver.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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


