Return-Path: <linux-arm-msm+bounces-75309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F0ABA391D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 14:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2869386359
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 12:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66112ECD26;
	Fri, 26 Sep 2025 12:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1OEuFeu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775CB2EA754;
	Fri, 26 Sep 2025 12:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758888246; cv=none; b=DGL4vGlWM8/N3WVYNRn9LrRqWwJOyvKm0saUgSj1CfD77ymLZ1andpGwq/1CIJa2sGaKHJ9K1Ft/rLIyZ+rQe+cGeM68JlCPatY+2+d9yuoa3tnL3s9GDkXHKBaCtui+by6CcxXEfI5iBbslZEG0/gNi9+Em5QFe9UZSDVpHHBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758888246; c=relaxed/simple;
	bh=stQeB9ylI6aGe7mDahnAL7duGKAqL8kD2MmLbD0eA6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TtytfkLsOGOTlb+bC4trivjWh0NMojT91rbFT6rXbuzSDA5kyOEJhX/PFCYX3apytq+c/C+ecbnldoN4tF2Ug1+z4DPaju21DJP9jIBm7lYpYvhmZDHzLTLZrCyuzMQxRVK10Vfnhow6R4aSHmHGAI4727YLAlHT0nK6yJOLIP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1OEuFeu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9423EC4CEF4;
	Fri, 26 Sep 2025 12:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758888246;
	bh=stQeB9ylI6aGe7mDahnAL7duGKAqL8kD2MmLbD0eA6E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a1OEuFeuLiQyRWuaMchLpwpjKCFxHCyI2oClWjUQEJ3e1NWuAhlIDTk9PJoQH5rGz
	 GXBtNzkoPgIyhR06KL4eCHPe90vLrZ8soij6ksHAWLXkMmlVopFvJddV/pYjJCMZg3
	 15vn+uITvwIIv53JSLUGJ6EvBJRuzc3q7Hj1yt4OgOkguoCzv55VnGT7wuSqyX/ueR
	 rajmIt9oy4Kw1Hz+6EF7xgrTdHhCJw4ULxyQGwyCokzt3+LRxXuBvk9F0EBaOFcgBa
	 Q14RPPYS8VJp6rZecCvKDJ/K1X/xkF2C5upH8GeOGm9/aMRemT/t/2E+mKEkil3W9q
	 IlQUzTowzHpdA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 26 Sep 2025 14:03:46 +0200
Subject: [PATCH 2/3] clk: qcom: gcc-x1e80100: Add missing USB4
 clocks/resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-topic-hamoa_gcc_usb4-v1-2-25cad1700829@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758888227; l=41003;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=H9IaRX+ud+xQL6k9v6G5CukDV7Wmt+ihmhYy6TZHsRo=;
 b=ioovdtoFG9dOMKNQ2GlZVx7NzZaG/POlm9KBLYZyNtEruw6C57y/ExL9SYxPT9MYG3WcjMoy3
 Bh3362hFHdAAdm1gixOsCYJImg2tVbw8VBaJ1wsolHLAl470kd2xXmm
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Currently, some of the USB4 clocks/resets are described, but not all
of the back-end muxes are present. Configuring them properly is
necessary for proper operation of the hardware.

Add all the resets & muxes and wire up any unaccounted USB4 clock paths.

Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 803 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 786 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 301fc9fc32d8e6e1ddf59c1d3350d84f6c06e4b6..1f866fb4a53ad4cca51d586e92aa96acab58ef0b 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -32,6 +32,33 @@ enum {
 	DT_USB3_PHY_0_WRAPPER_GCC_USB30_PIPE,
 	DT_USB3_PHY_1_WRAPPER_GCC_USB30_PIPE,
 	DT_USB3_PHY_2_WRAPPER_GCC_USB30_PIPE,
+	DT_GCC_USB4_0_PHY_DP0_GMUX_CLK_SRC,
+	DT_GCC_USB4_0_PHY_DP1_GMUX_CLK_SRC,
+	DT_GCC_USB4_0_PHY_PCIE_PIPEGMUX_CLK_SRC,
+	DT_GCC_USB4_0_PHY_PIPEGMUX_CLK_SRC,
+	DT_GCC_USB4_0_PHY_SYS_PIPEGMUX_CLK_SRC,
+	DT_GCC_USB4_1_PHY_DP0_GMUX_CLK_SRC,
+	DT_GCC_USB4_1_PHY_DP1_GMUX_CLK_SRC,
+	DT_GCC_USB4_1_PHY_PCIE_PIPEGMUX_CLK_SRC,
+	DT_GCC_USB4_1_PHY_PIPEGMUX_CLK_SRC,
+	DT_GCC_USB4_1_PHY_SYS_PIPEGMUX_CLK_SRC,
+	DT_GCC_USB4_2_PHY_DP0_GMUX_CLK_SRC,
+	DT_GCC_USB4_2_PHY_DP1_GMUX_CLK_SRC,
+	DT_GCC_USB4_2_PHY_PCIE_PIPEGMUX_CLK_SRC,
+	DT_GCC_USB4_2_PHY_PIPEGMUX_CLK_SRC,
+	DT_GCC_USB4_2_PHY_SYS_PIPEGMUX_CLK_SRC,
+	DT_QUSB4PHY_0_GCC_USB4_RX0_CLK,
+	DT_QUSB4PHY_0_GCC_USB4_RX1_CLK,
+	DT_QUSB4PHY_1_GCC_USB4_RX0_CLK,
+	DT_QUSB4PHY_1_GCC_USB4_RX1_CLK,
+	DT_QUSB4PHY_2_GCC_USB4_RX0_CLK,
+	DT_QUSB4PHY_2_GCC_USB4_RX1_CLK,
+	DT_USB4_0_PHY_GCC_USB4_PCIE_PIPE_CLK,
+	DT_USB4_0_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
+	DT_USB4_1_PHY_GCC_USB4_PCIE_PIPE_CLK,
+	DT_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
+	DT_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK,
+	DT_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
 };
 
 enum {
@@ -42,10 +69,40 @@ enum {
 	P_GCC_GPLL7_OUT_MAIN,
 	P_GCC_GPLL8_OUT_MAIN,
 	P_GCC_GPLL9_OUT_MAIN,
+	P_GCC_USB3_PRIM_PHY_PIPE_CLK_SRC,
+	P_GCC_USB3_SEC_PHY_PIPE_CLK_SRC,
+	P_GCC_USB3_TERT_PHY_PIPE_CLK_SRC,
+	P_GCC_USB4_0_PHY_DP0_GMUX_CLK_SRC,
+	P_GCC_USB4_0_PHY_DP1_GMUX_CLK_SRC,
+	P_GCC_USB4_0_PHY_PCIE_PIPEGMUX_CLK_SRC,
+	P_GCC_USB4_0_PHY_PIPEGMUX_CLK_SRC,
+	P_GCC_USB4_0_PHY_SYS_PIPEGMUX_CLK_SRC,
+	P_GCC_USB4_1_PHY_DP0_GMUX_CLK_SRC,
+	P_GCC_USB4_1_PHY_DP1_GMUX_CLK_SRC,
+	P_GCC_USB4_1_PHY_PCIE_PIPEGMUX_CLK_SRC,
+	P_GCC_USB4_1_PHY_PIPEGMUX_CLK_SRC,
+	P_GCC_USB4_1_PHY_SYS_PIPEGMUX_CLK_SRC,
+	P_GCC_USB4_2_PHY_DP0_GMUX_CLK_SRC,
+	P_GCC_USB4_2_PHY_DP1_GMUX_CLK_SRC,
+	P_GCC_USB4_2_PHY_PCIE_PIPEGMUX_CLK_SRC,
+	P_GCC_USB4_2_PHY_PIPEGMUX_CLK_SRC,
+	P_GCC_USB4_2_PHY_SYS_PIPEGMUX_CLK_SRC,
+	P_QUSB4PHY_0_GCC_USB4_RX0_CLK,
+	P_QUSB4PHY_0_GCC_USB4_RX1_CLK,
+	P_QUSB4PHY_1_GCC_USB4_RX0_CLK,
+	P_QUSB4PHY_1_GCC_USB4_RX1_CLK,
+	P_QUSB4PHY_2_GCC_USB4_RX0_CLK,
+	P_QUSB4PHY_2_GCC_USB4_RX1_CLK,
 	P_SLEEP_CLK,
 	P_USB3_PHY_0_WRAPPER_GCC_USB30_PIPE_CLK,
 	P_USB3_PHY_1_WRAPPER_GCC_USB30_PIPE_CLK,
 	P_USB3_PHY_2_WRAPPER_GCC_USB30_PIPE_CLK,
+	P_USB4_0_PHY_GCC_USB4_PCIE_PIPE_CLK,
+	P_USB4_0_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
+	P_USB4_1_PHY_GCC_USB4_PCIE_PIPE_CLK,
+	P_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
+	P_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK,
+	P_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
 };
 
 static struct clk_alpha_pll gcc_gpll0 = {
@@ -320,6 +377,447 @@ static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
 	{ }
 };
 
+static const struct parent_map gcc_parent_map_13[] = {
+	{ P_GCC_USB4_0_PHY_DP0_GMUX_CLK_SRC, 0 },
+	{ P_USB4_0_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_13[] = {
+	{ .index = DT_GCC_USB4_0_PHY_DP0_GMUX_CLK_SRC },
+	{ .index = DT_USB4_0_PHY_GCC_USB4RTR_MAX_PIPE_CLK },
+};
+
+static const struct parent_map gcc_parent_map_14[] = {
+	{ P_GCC_USB4_0_PHY_DP1_GMUX_CLK_SRC, 0 },
+	{ P_USB4_0_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_14[] = {
+	{ .index = DT_GCC_USB4_0_PHY_DP1_GMUX_CLK_SRC },
+	{ .index = DT_USB4_0_PHY_GCC_USB4RTR_MAX_PIPE_CLK },
+};
+
+static const struct parent_map gcc_parent_map_15[] = {
+	{ P_USB4_0_PHY_GCC_USB4_PCIE_PIPE_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_15[] = {
+	{ .index = DT_USB4_0_PHY_GCC_USB4_PCIE_PIPE_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map gcc_parent_map_16[] = {
+	{ P_GCC_USB4_0_PHY_PCIE_PIPEGMUX_CLK_SRC, 0 },
+	{ P_USB4_0_PHY_GCC_USB4_PCIE_PIPE_CLK, 1 },
+};
+
+static const struct clk_parent_data gcc_parent_data_16[] = {
+	{ .index = DT_GCC_USB4_0_PHY_PCIE_PIPEGMUX_CLK_SRC },
+	{ .index = DT_USB4_0_PHY_GCC_USB4_PCIE_PIPE_CLK },
+};
+
+static const struct parent_map gcc_parent_map_17[] = {
+	{ P_QUSB4PHY_0_GCC_USB4_RX0_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_17[] = {
+	{ .index = DT_QUSB4PHY_0_GCC_USB4_RX0_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map gcc_parent_map_18[] = {
+	{ P_QUSB4PHY_0_GCC_USB4_RX1_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_18[] = {
+	{ .index = DT_QUSB4PHY_0_GCC_USB4_RX1_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map gcc_parent_map_19[] = {
+	{ P_GCC_USB4_0_PHY_SYS_PIPEGMUX_CLK_SRC, 0 },
+	{ P_USB4_0_PHY_GCC_USB4_PCIE_PIPE_CLK, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_19[] = {
+	{ .index = DT_GCC_USB4_0_PHY_SYS_PIPEGMUX_CLK_SRC },
+	{ .index = DT_USB4_0_PHY_GCC_USB4_PCIE_PIPE_CLK },
+};
+
+static const struct parent_map gcc_parent_map_20[] = {
+	{ P_GCC_USB4_1_PHY_DP0_GMUX_CLK_SRC, 0 },
+	{ P_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_20[] = {
+	{ .index = DT_GCC_USB4_1_PHY_DP0_GMUX_CLK_SRC },
+	{ .index = DT_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK },
+};
+
+static const struct parent_map gcc_parent_map_21[] = {
+	{ P_GCC_USB4_1_PHY_DP1_GMUX_CLK_SRC, 0 },
+	{ P_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_21[] = {
+	{ .index = DT_GCC_USB4_1_PHY_DP1_GMUX_CLK_SRC },
+	{ .index = DT_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK },
+};
+
+static const struct parent_map gcc_parent_map_22[] = {
+	{ P_USB4_1_PHY_GCC_USB4_PCIE_PIPE_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_22[] = {
+	{ .index = DT_USB4_1_PHY_GCC_USB4_PCIE_PIPE_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map gcc_parent_map_23[] = {
+	{ P_GCC_USB4_1_PHY_PCIE_PIPEGMUX_CLK_SRC, 0 },
+	{ P_USB4_1_PHY_GCC_USB4_PCIE_PIPE_CLK, 1 },
+};
+
+static const struct clk_parent_data gcc_parent_data_23[] = {
+	{ .index = DT_GCC_USB4_1_PHY_PCIE_PIPEGMUX_CLK_SRC },
+	{ .index = DT_USB4_1_PHY_GCC_USB4_PCIE_PIPE_CLK },
+};
+
+static const struct parent_map gcc_parent_map_24[] = {
+	{ P_QUSB4PHY_1_GCC_USB4_RX0_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_24[] = {
+	{ .index = DT_QUSB4PHY_1_GCC_USB4_RX0_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map gcc_parent_map_25[] = {
+	{ P_QUSB4PHY_1_GCC_USB4_RX1_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_25[] = {
+	{ .index = DT_QUSB4PHY_1_GCC_USB4_RX1_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map gcc_parent_map_26[] = {
+	{ P_GCC_USB4_1_PHY_SYS_PIPEGMUX_CLK_SRC, 0 },
+	{ P_USB4_1_PHY_GCC_USB4_PCIE_PIPE_CLK, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_26[] = {
+	{ .index = DT_GCC_USB4_1_PHY_SYS_PIPEGMUX_CLK_SRC },
+	{ .index = DT_USB4_1_PHY_GCC_USB4_PCIE_PIPE_CLK },
+};
+
+static const struct parent_map gcc_parent_map_27[] = {
+	{ P_GCC_USB4_2_PHY_DP0_GMUX_CLK_SRC, 0 },
+	{ P_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_27[] = {
+	{ .index = DT_GCC_USB4_2_PHY_DP0_GMUX_CLK_SRC },
+	{ .index = DT_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK },
+};
+
+static const struct parent_map gcc_parent_map_28[] = {
+	{ P_GCC_USB4_2_PHY_DP1_GMUX_CLK_SRC, 0 },
+	{ P_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_28[] = {
+	{ .index = DT_GCC_USB4_2_PHY_DP1_GMUX_CLK_SRC },
+	{ .index = DT_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK },
+};
+
+static const struct parent_map gcc_parent_map_29[] = {
+	{ P_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_29[] = {
+	{ .index = DT_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map gcc_parent_map_30[] = {
+	{ P_GCC_USB4_2_PHY_PCIE_PIPEGMUX_CLK_SRC, 0 },
+	{ P_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK, 1 },
+};
+
+static const struct clk_parent_data gcc_parent_data_30[] = {
+	{ .index = DT_GCC_USB4_2_PHY_PCIE_PIPEGMUX_CLK_SRC },
+	{ .index = DT_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK },
+};
+
+static const struct parent_map gcc_parent_map_31[] = {
+	{ P_QUSB4PHY_2_GCC_USB4_RX0_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_31[] = {
+	{ .index = DT_QUSB4PHY_2_GCC_USB4_RX0_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map gcc_parent_map_32[] = {
+	{ P_QUSB4PHY_2_GCC_USB4_RX1_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_32[] = {
+	{ .index = DT_QUSB4PHY_2_GCC_USB4_RX1_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map gcc_parent_map_33[] = {
+	{ P_GCC_USB4_2_PHY_SYS_PIPEGMUX_CLK_SRC, 0 },
+	{ P_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_33[] = {
+	{ .index = DT_GCC_USB4_2_PHY_SYS_PIPEGMUX_CLK_SRC },
+	{ .index = DT_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK },
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_0_phy_dp0_clk_src = {
+	.reg = 0x9f06c,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_0_phy_dp0_clk_src",
+			.parent_data = gcc_parent_data_13,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_0_phy_dp1_clk_src = {
+	.reg = 0x9f114,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_0_phy_dp1_clk_src",
+			.parent_data = gcc_parent_data_14,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_0_phy_p2rr2p_pipe_clk_src = {
+	.reg = 0x9f0d4,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_0_phy_p2rr2p_pipe_clk_src",
+			.parent_data = gcc_parent_data_15,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_0_phy_pcie_pipe_mux_clk_src = {
+	.reg = 0x9f104,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_0_phy_pcie_pipe_mux_clk_src",
+			.parent_data = gcc_parent_data_16,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_0_phy_rx0_clk_src = {
+	.reg = 0x9f0ac,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_0_phy_rx0_clk_src",
+			.parent_data = gcc_parent_data_17,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_0_phy_rx1_clk_src = {
+	.reg = 0x9f0bc,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_0_phy_rx1_clk_src",
+			.parent_data = gcc_parent_data_18,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_0_phy_sys_clk_src = {
+	.reg = 0x9f0e4,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_0_phy_sys_clk_src",
+			.parent_data = gcc_parent_data_19,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_1_phy_dp0_clk_src = {
+	.reg = 0x2b06c,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_1_phy_dp0_clk_src",
+			.parent_data = gcc_parent_data_20,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_1_phy_dp1_clk_src = {
+	.reg = 0x2b114,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_1_phy_dp1_clk_src",
+			.parent_data = gcc_parent_data_21,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_1_phy_p2rr2p_pipe_clk_src = {
+	.reg = 0x2b0d4,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_1_phy_p2rr2p_pipe_clk_src",
+			.parent_data = gcc_parent_data_22,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_1_phy_pcie_pipe_mux_clk_src = {
+	.reg = 0x2b104,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_1_phy_pcie_pipe_mux_clk_src",
+			.parent_data = gcc_parent_data_23,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_1_phy_rx0_clk_src = {
+	.reg = 0x2b0ac,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_1_phy_rx0_clk_src",
+			.parent_data = gcc_parent_data_24,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_1_phy_rx1_clk_src = {
+	.reg = 0x2b0bc,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_1_phy_rx1_clk_src",
+			.parent_data = gcc_parent_data_25,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_1_phy_sys_clk_src = {
+	.reg = 0x2b0e4,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_1_phy_sys_clk_src",
+			.parent_data = gcc_parent_data_26,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_2_phy_dp0_clk_src = {
+	.reg = 0x1106c,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_2_phy_dp0_clk_src",
+			.parent_data = gcc_parent_data_27,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_2_phy_dp1_clk_src = {
+	.reg = 0x11114,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_2_phy_dp1_clk_src",
+			.parent_data = gcc_parent_data_28,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_2_phy_p2rr2p_pipe_clk_src = {
+	.reg = 0x110d4,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_2_phy_p2rr2p_pipe_clk_src",
+			.parent_data = gcc_parent_data_29,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_2_phy_pcie_pipe_mux_clk_src = {
+	.reg = 0x11104,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_2_phy_pcie_pipe_mux_clk_src",
+			.parent_data = gcc_parent_data_30,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_2_phy_rx0_clk_src = {
+	.reg = 0x110ac,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_2_phy_rx0_clk_src",
+			.parent_data = gcc_parent_data_31,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_2_phy_rx1_clk_src = {
+	.reg = 0x110bc,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_2_phy_rx1_clk_src",
+			.parent_data = gcc_parent_data_32,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_usb4_2_phy_sys_clk_src = {
+	.reg = 0x110e4,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb4_2_phy_sys_clk_src",
+			.parent_data = gcc_parent_data_33,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
 static struct clk_rcg2 gcc_gp1_clk_src = {
 	.cmd_rcgr = 0x64004,
 	.mnd_width = 16,
@@ -2790,6 +3288,11 @@ static struct clk_branch gcc_pcie_0_pipe_clk = {
 		.enable_mask = BIT(25),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pcie_0_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_0_phy_pcie_pipe_mux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2879,6 +3382,11 @@ static struct clk_branch gcc_pcie_1_pipe_clk = {
 		.enable_mask = BIT(30),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pcie_1_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_1_phy_pcie_pipe_mux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2968,6 +3476,11 @@ static struct clk_branch gcc_pcie_2_pipe_clk = {
 		.enable_mask = BIT(23),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pcie_2_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_2_phy_pcie_pipe_mux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5156,6 +5669,33 @@ static struct clk_regmap_mux gcc_usb3_prim_phy_pipe_clk_src = {
 	},
 };
 
+static const struct parent_map gcc_parent_map_34[] = {
+	{ P_GCC_USB3_PRIM_PHY_PIPE_CLK_SRC, 0 },
+	{ P_USB4_0_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 1 },
+	{ P_GCC_USB4_0_PHY_PIPEGMUX_CLK_SRC, 3 },
+};
+
+static const struct clk_parent_data gcc_parent_data_34[] = {
+	{ .hw = &gcc_usb3_prim_phy_pipe_clk_src.clkr.hw },
+	{ .index = DT_USB4_0_PHY_GCC_USB4RTR_MAX_PIPE_CLK },
+	{ .index = DT_GCC_USB4_0_PHY_PIPEGMUX_CLK_SRC },
+};
+
+static struct clk_regmap_mux gcc_usb34_prim_phy_pipe_clk_src = {
+	.reg = 0x39070,
+	.shift = 0,
+	.width = 2,
+	.parent_map = gcc_parent_map_34,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb34_prim_phy_pipe_clk_src",
+			.parent_data = gcc_parent_data_34,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_34),
+			.ops = &clk_regmap_mux_closest_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_usb3_prim_phy_pipe_clk = {
 	.halt_reg = 0x39068,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -5167,7 +5707,7 @@ static struct clk_branch gcc_usb3_prim_phy_pipe_clk = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb3_prim_phy_pipe_clk",
 			.parent_hws = (const struct clk_hw*[]) {
-				&gcc_usb3_prim_phy_pipe_clk_src.clkr.hw,
+				&gcc_usb34_prim_phy_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -5227,6 +5767,33 @@ static struct clk_regmap_mux gcc_usb3_sec_phy_pipe_clk_src = {
 	},
 };
 
+static const struct parent_map gcc_parent_map_35[] = {
+	{ P_GCC_USB3_SEC_PHY_PIPE_CLK_SRC, 0 },
+	{ P_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 1 },
+	{ P_GCC_USB4_1_PHY_PIPEGMUX_CLK_SRC, 3 },
+};
+
+static const struct clk_parent_data gcc_parent_data_35[] = {
+	{ .hw = &gcc_usb3_sec_phy_pipe_clk_src.clkr.hw },
+	{ .index = DT_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK },
+	{ .index = DT_GCC_USB4_1_PHY_PIPEGMUX_CLK_SRC },
+};
+
+static struct clk_regmap_mux gcc_usb34_sec_phy_pipe_clk_src = {
+	.reg = 0xa1070,
+	.shift = 0,
+	.width = 2,
+	.parent_map = gcc_parent_map_35,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb34_sec_phy_pipe_clk_src",
+			.parent_data = gcc_parent_data_35,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_35),
+			.ops = &clk_regmap_mux_closest_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_usb3_sec_phy_pipe_clk = {
 	.halt_reg = 0xa1068,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -5238,7 +5805,7 @@ static struct clk_branch gcc_usb3_sec_phy_pipe_clk = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb3_sec_phy_pipe_clk",
 			.parent_hws = (const struct clk_hw*[]) {
-				&gcc_usb3_sec_phy_pipe_clk_src.clkr.hw,
+				&gcc_usb34_sec_phy_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -5298,6 +5865,33 @@ static struct clk_regmap_mux gcc_usb3_tert_phy_pipe_clk_src = {
 	},
 };
 
+static const struct parent_map gcc_parent_map_36[] = {
+	{ P_GCC_USB3_TERT_PHY_PIPE_CLK_SRC, 0 },
+	{ P_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 1 },
+	{ P_GCC_USB4_2_PHY_PIPEGMUX_CLK_SRC, 3 },
+};
+
+static const struct clk_parent_data gcc_parent_data_36[] = {
+	{ .hw = &gcc_usb3_tert_phy_pipe_clk_src.clkr.hw },
+	{ .index = DT_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK },
+	{ .index = DT_GCC_USB4_2_PHY_PIPEGMUX_CLK_SRC },
+};
+
+static struct clk_regmap_mux gcc_usb34_tert_phy_pipe_clk_src = {
+	.reg = 0xa2070,
+	.shift = 0,
+	.width = 2,
+	.parent_map = gcc_parent_map_36,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_usb34_tert_phy_pipe_clk_src",
+			.parent_data = gcc_parent_data_36,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_36),
+			.ops = &clk_regmap_mux_closest_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_usb3_tert_phy_pipe_clk = {
 	.halt_reg = 0xa2068,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -5309,7 +5903,7 @@ static struct clk_branch gcc_usb3_tert_phy_pipe_clk = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb3_tert_phy_pipe_clk",
 			.parent_hws = (const struct clk_hw*[]) {
-				&gcc_usb3_tert_phy_pipe_clk_src.clkr.hw,
+				&gcc_usb34_tert_phy_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -5335,12 +5929,17 @@ static struct clk_branch gcc_usb4_0_cfg_ahb_clk = {
 
 static struct clk_branch gcc_usb4_0_dp0_clk = {
 	.halt_reg = 0x9f060,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x9f060,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_0_dp0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_0_phy_dp0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5348,12 +5947,17 @@ static struct clk_branch gcc_usb4_0_dp0_clk = {
 
 static struct clk_branch gcc_usb4_0_dp1_clk = {
 	.halt_reg = 0x9f108,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x9f108,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_0_dp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_0_phy_dp1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5385,6 +5989,11 @@ static struct clk_branch gcc_usb4_0_phy_p2rr2p_pipe_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_0_phy_p2rr2p_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_0_phy_p2rr2p_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5398,6 +6007,11 @@ static struct clk_branch gcc_usb4_0_phy_pcie_pipe_clk = {
 		.enable_mask = BIT(19),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_0_phy_pcie_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_0_phy_pcie_pipe_mux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5405,12 +6019,17 @@ static struct clk_branch gcc_usb4_0_phy_pcie_pipe_clk = {
 
 static struct clk_branch gcc_usb4_0_phy_rx0_clk = {
 	.halt_reg = 0x9f0b0,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x9f0b0,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_0_phy_rx0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_0_phy_rx0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5418,12 +6037,17 @@ static struct clk_branch gcc_usb4_0_phy_rx0_clk = {
 
 static struct clk_branch gcc_usb4_0_phy_rx1_clk = {
 	.halt_reg = 0x9f0c0,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x9f0c0,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_0_phy_rx1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_0_phy_rx1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5439,6 +6063,11 @@ static struct clk_branch gcc_usb4_0_phy_usb_pipe_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_0_phy_usb_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb34_prim_phy_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5470,6 +6099,11 @@ static struct clk_branch gcc_usb4_0_sys_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_0_sys_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_0_phy_sys_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5512,12 +6146,17 @@ static struct clk_branch gcc_usb4_1_cfg_ahb_clk = {
 
 static struct clk_branch gcc_usb4_1_dp0_clk = {
 	.halt_reg = 0x2b060,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2b060,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_1_dp0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_1_phy_dp0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5525,12 +6164,17 @@ static struct clk_branch gcc_usb4_1_dp0_clk = {
 
 static struct clk_branch gcc_usb4_1_dp1_clk = {
 	.halt_reg = 0x2b108,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2b108,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_1_dp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_1_phy_dp1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5562,6 +6206,11 @@ static struct clk_branch gcc_usb4_1_phy_p2rr2p_pipe_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_1_phy_p2rr2p_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_1_phy_p2rr2p_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5575,6 +6224,11 @@ static struct clk_branch gcc_usb4_1_phy_pcie_pipe_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_1_phy_pcie_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_1_phy_pcie_pipe_mux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5582,12 +6236,17 @@ static struct clk_branch gcc_usb4_1_phy_pcie_pipe_clk = {
 
 static struct clk_branch gcc_usb4_1_phy_rx0_clk = {
 	.halt_reg = 0x2b0b0,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2b0b0,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_1_phy_rx0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_1_phy_rx0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5595,12 +6254,17 @@ static struct clk_branch gcc_usb4_1_phy_rx0_clk = {
 
 static struct clk_branch gcc_usb4_1_phy_rx1_clk = {
 	.halt_reg = 0x2b0c0,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2b0c0,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_1_phy_rx1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_1_phy_rx1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5616,6 +6280,11 @@ static struct clk_branch gcc_usb4_1_phy_usb_pipe_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_1_phy_usb_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb34_sec_phy_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5647,6 +6316,11 @@ static struct clk_branch gcc_usb4_1_sys_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_1_sys_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_1_phy_sys_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5689,12 +6363,17 @@ static struct clk_branch gcc_usb4_2_cfg_ahb_clk = {
 
 static struct clk_branch gcc_usb4_2_dp0_clk = {
 	.halt_reg = 0x11060,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x11060,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_2_dp0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_2_phy_dp0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5702,12 +6381,17 @@ static struct clk_branch gcc_usb4_2_dp0_clk = {
 
 static struct clk_branch gcc_usb4_2_dp1_clk = {
 	.halt_reg = 0x11108,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x11108,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_2_dp1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_2_phy_dp1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5739,6 +6423,11 @@ static struct clk_branch gcc_usb4_2_phy_p2rr2p_pipe_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_2_phy_p2rr2p_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_2_phy_p2rr2p_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5752,6 +6441,11 @@ static struct clk_branch gcc_usb4_2_phy_pcie_pipe_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_2_phy_pcie_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_2_phy_pcie_pipe_mux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5759,12 +6453,17 @@ static struct clk_branch gcc_usb4_2_phy_pcie_pipe_clk = {
 
 static struct clk_branch gcc_usb4_2_phy_rx0_clk = {
 	.halt_reg = 0x110b0,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x110b0,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_2_phy_rx0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_2_phy_rx0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5772,12 +6471,17 @@ static struct clk_branch gcc_usb4_2_phy_rx0_clk = {
 
 static struct clk_branch gcc_usb4_2_phy_rx1_clk = {
 	.halt_reg = 0x110c0,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x110c0,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_2_phy_rx1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb4_2_phy_rx1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5793,6 +6497,11 @@ static struct clk_branch gcc_usb4_2_phy_usb_pipe_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_usb4_2_phy_usb_pipe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_usb34_tert_phy_pipe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -6483,6 +7192,9 @@ static struct clk_regmap *gcc_x1e80100_clocks[] = {
 	[GCC_USB30_TERT_MOCK_UTMI_CLK_SRC] = &gcc_usb30_tert_mock_utmi_clk_src.clkr,
 	[GCC_USB30_TERT_MOCK_UTMI_POSTDIV_CLK_SRC] = &gcc_usb30_tert_mock_utmi_postdiv_clk_src.clkr,
 	[GCC_USB30_TERT_SLEEP_CLK] = &gcc_usb30_tert_sleep_clk.clkr,
+	[GCC_USB34_PRIM_PHY_PIPE_CLK_SRC] = &gcc_usb34_prim_phy_pipe_clk_src.clkr,
+	[GCC_USB34_SEC_PHY_PIPE_CLK_SRC] = &gcc_usb34_sec_phy_pipe_clk_src.clkr,
+	[GCC_USB34_TERT_PHY_PIPE_CLK_SRC] = &gcc_usb34_tert_phy_pipe_clk_src.clkr,
 	[GCC_USB3_MP_PHY_AUX_CLK] = &gcc_usb3_mp_phy_aux_clk.clkr,
 	[GCC_USB3_MP_PHY_AUX_CLK_SRC] = &gcc_usb3_mp_phy_aux_clk_src.clkr,
 	[GCC_USB3_MP_PHY_COM_AUX_CLK] = &gcc_usb3_mp_phy_com_aux_clk.clkr,
@@ -6508,11 +7220,18 @@ static struct clk_regmap *gcc_x1e80100_clocks[] = {
 	[GCC_USB4_0_DP1_CLK] = &gcc_usb4_0_dp1_clk.clkr,
 	[GCC_USB4_0_MASTER_CLK] = &gcc_usb4_0_master_clk.clkr,
 	[GCC_USB4_0_MASTER_CLK_SRC] = &gcc_usb4_0_master_clk_src.clkr,
+	[GCC_USB4_0_PHY_DP0_CLK_SRC] = &gcc_usb4_0_phy_dp0_clk_src.clkr,
+	[GCC_USB4_0_PHY_DP1_CLK_SRC] = &gcc_usb4_0_phy_dp1_clk_src.clkr,
 	[GCC_USB4_0_PHY_P2RR2P_PIPE_CLK] = &gcc_usb4_0_phy_p2rr2p_pipe_clk.clkr,
+	[GCC_USB4_0_PHY_P2RR2P_PIPE_CLK_SRC] = &gcc_usb4_0_phy_p2rr2p_pipe_clk_src.clkr,
 	[GCC_USB4_0_PHY_PCIE_PIPE_CLK] = &gcc_usb4_0_phy_pcie_pipe_clk.clkr,
 	[GCC_USB4_0_PHY_PCIE_PIPE_CLK_SRC] = &gcc_usb4_0_phy_pcie_pipe_clk_src.clkr,
+	[GCC_USB4_0_PHY_PCIE_PIPE_MUX_CLK_SRC] = &gcc_usb4_0_phy_pcie_pipe_mux_clk_src.clkr,
 	[GCC_USB4_0_PHY_RX0_CLK] = &gcc_usb4_0_phy_rx0_clk.clkr,
+	[GCC_USB4_0_PHY_RX0_CLK_SRC] = &gcc_usb4_0_phy_rx0_clk_src.clkr,
 	[GCC_USB4_0_PHY_RX1_CLK] = &gcc_usb4_0_phy_rx1_clk.clkr,
+	[GCC_USB4_0_PHY_RX1_CLK_SRC] = &gcc_usb4_0_phy_rx1_clk_src.clkr,
+	[GCC_USB4_0_PHY_SYS_CLK_SRC] = &gcc_usb4_0_phy_sys_clk_src.clkr,
 	[GCC_USB4_0_PHY_USB_PIPE_CLK] = &gcc_usb4_0_phy_usb_pipe_clk.clkr,
 	[GCC_USB4_0_SB_IF_CLK] = &gcc_usb4_0_sb_if_clk.clkr,
 	[GCC_USB4_0_SB_IF_CLK_SRC] = &gcc_usb4_0_sb_if_clk_src.clkr,
@@ -6524,11 +7243,18 @@ static struct clk_regmap *gcc_x1e80100_clocks[] = {
 	[GCC_USB4_1_DP1_CLK] = &gcc_usb4_1_dp1_clk.clkr,
 	[GCC_USB4_1_MASTER_CLK] = &gcc_usb4_1_master_clk.clkr,
 	[GCC_USB4_1_MASTER_CLK_SRC] = &gcc_usb4_1_master_clk_src.clkr,
+	[GCC_USB4_1_PHY_DP0_CLK_SRC] = &gcc_usb4_1_phy_dp0_clk_src.clkr,
+	[GCC_USB4_1_PHY_DP1_CLK_SRC] = &gcc_usb4_1_phy_dp1_clk_src.clkr,
 	[GCC_USB4_1_PHY_P2RR2P_PIPE_CLK] = &gcc_usb4_1_phy_p2rr2p_pipe_clk.clkr,
+	[GCC_USB4_1_PHY_P2RR2P_PIPE_CLK_SRC] = &gcc_usb4_1_phy_p2rr2p_pipe_clk_src.clkr,
 	[GCC_USB4_1_PHY_PCIE_PIPE_CLK] = &gcc_usb4_1_phy_pcie_pipe_clk.clkr,
 	[GCC_USB4_1_PHY_PCIE_PIPE_CLK_SRC] = &gcc_usb4_1_phy_pcie_pipe_clk_src.clkr,
+	[GCC_USB4_1_PHY_PCIE_PIPE_MUX_CLK_SRC] = &gcc_usb4_1_phy_pcie_pipe_mux_clk_src.clkr,
 	[GCC_USB4_1_PHY_RX0_CLK] = &gcc_usb4_1_phy_rx0_clk.clkr,
+	[GCC_USB4_1_PHY_RX0_CLK_SRC] = &gcc_usb4_1_phy_rx0_clk_src.clkr,
 	[GCC_USB4_1_PHY_RX1_CLK] = &gcc_usb4_1_phy_rx1_clk.clkr,
+	[GCC_USB4_1_PHY_RX1_CLK_SRC] = &gcc_usb4_1_phy_rx1_clk_src.clkr,
+	[GCC_USB4_1_PHY_SYS_CLK_SRC] = &gcc_usb4_1_phy_sys_clk_src.clkr,
 	[GCC_USB4_1_PHY_USB_PIPE_CLK] = &gcc_usb4_1_phy_usb_pipe_clk.clkr,
 	[GCC_USB4_1_SB_IF_CLK] = &gcc_usb4_1_sb_if_clk.clkr,
 	[GCC_USB4_1_SB_IF_CLK_SRC] = &gcc_usb4_1_sb_if_clk_src.clkr,
@@ -6540,11 +7266,18 @@ static struct clk_regmap *gcc_x1e80100_clocks[] = {
 	[GCC_USB4_2_DP1_CLK] = &gcc_usb4_2_dp1_clk.clkr,
 	[GCC_USB4_2_MASTER_CLK] = &gcc_usb4_2_master_clk.clkr,
 	[GCC_USB4_2_MASTER_CLK_SRC] = &gcc_usb4_2_master_clk_src.clkr,
+	[GCC_USB4_2_PHY_DP0_CLK_SRC] = &gcc_usb4_2_phy_dp0_clk_src.clkr,
+	[GCC_USB4_2_PHY_DP1_CLK_SRC] = &gcc_usb4_2_phy_dp1_clk_src.clkr,
 	[GCC_USB4_2_PHY_P2RR2P_PIPE_CLK] = &gcc_usb4_2_phy_p2rr2p_pipe_clk.clkr,
+	[GCC_USB4_2_PHY_P2RR2P_PIPE_CLK_SRC] = &gcc_usb4_2_phy_p2rr2p_pipe_clk_src.clkr,
 	[GCC_USB4_2_PHY_PCIE_PIPE_CLK] = &gcc_usb4_2_phy_pcie_pipe_clk.clkr,
 	[GCC_USB4_2_PHY_PCIE_PIPE_CLK_SRC] = &gcc_usb4_2_phy_pcie_pipe_clk_src.clkr,
+	[GCC_USB4_2_PHY_PCIE_PIPE_MUX_CLK_SRC] = &gcc_usb4_2_phy_pcie_pipe_mux_clk_src.clkr,
 	[GCC_USB4_2_PHY_RX0_CLK] = &gcc_usb4_2_phy_rx0_clk.clkr,
+	[GCC_USB4_2_PHY_RX0_CLK_SRC] = &gcc_usb4_2_phy_rx0_clk_src.clkr,
 	[GCC_USB4_2_PHY_RX1_CLK] = &gcc_usb4_2_phy_rx1_clk.clkr,
+	[GCC_USB4_2_PHY_RX1_CLK_SRC] = &gcc_usb4_2_phy_rx1_clk_src.clkr,
+	[GCC_USB4_2_PHY_SYS_CLK_SRC] = &gcc_usb4_2_phy_sys_clk_src.clkr,
 	[GCC_USB4_2_PHY_USB_PIPE_CLK] = &gcc_usb4_2_phy_usb_pipe_clk.clkr,
 	[GCC_USB4_2_SB_IF_CLK] = &gcc_usb4_2_sb_if_clk.clkr,
 	[GCC_USB4_2_SB_IF_CLK_SRC] = &gcc_usb4_2_sb_if_clk_src.clkr,
@@ -6660,16 +7393,52 @@ static const struct qcom_reset_map gcc_x1e80100_resets[] = {
 	[GCC_USB3_UNIPHY_MP0_BCR] = { 0x19000 },
 	[GCC_USB3_UNIPHY_MP1_BCR] = { 0x54000 },
 	[GCC_USB3PHY_PHY_PRIM_BCR] = { 0x50004 },
+	[GCC_USB4PHY_PHY_PRIM_BCR] = { 0x5000c },
 	[GCC_USB3PHY_PHY_SEC_BCR] = { 0x2a004 },
+	[GCC_USB4PHY_PHY_SEC_BCR] = { 0x2a00c },
 	[GCC_USB3PHY_PHY_TERT_BCR] = { 0xa3004 },
+	[GCC_USB4PHY_PHY_TERT_BCR] = { 0xa300c },
 	[GCC_USB3UNIPHY_PHY_MP0_BCR] = { 0x19004 },
 	[GCC_USB3UNIPHY_PHY_MP1_BCR] = { 0x54004 },
 	[GCC_USB4_0_BCR] = { 0x9f000 },
 	[GCC_USB4_0_DP0_PHY_PRIM_BCR] = { 0x50010 },
-	[GCC_USB4_1_DP0_PHY_SEC_BCR] = { 0x2a010 },
-	[GCC_USB4_2_DP0_PHY_TERT_BCR] = { 0xa3010 },
+	[GCC_USB4_0_MISC_USB4_SYS_BCR] = { .reg = 0xad0f8, .bit = 0 },
+	[GCC_USB4_0_MISC_RX_CLK_0_BCR] = { .reg = 0xad0f8, .bit = 1 },
+	[GCC_USB4_0_MISC_RX_CLK_1_BCR] = { .reg = 0xad0f8, .bit = 2 },
+	[GCC_USB4_0_MISC_USB_PIPE_BCR] = { .reg = 0xad0f8, .bit = 3 },
+	[GCC_USB4_0_MISC_PCIE_PIPE_BCR] = { .reg = 0xad0f8, .bit = 4 },
+	[GCC_USB4_0_MISC_TMU_BCR] = { .reg = 0xad0f8, .bit = 5 },
+	[GCC_USB4_0_MISC_SB_IF_BCR] = { .reg = 0xad0f8, .bit = 6 },
+	[GCC_USB4_0_MISC_HIA_MSTR_BCR] = { .reg = 0xad0f8, .bit = 7 },
+	[GCC_USB4_0_MISC_AHB_BCR] = { .reg = 0xad0f8, .bit = 8 },
+	[GCC_USB4_0_MISC_DP0_MAX_PCLK_BCR] = { .reg = 0xad0f8, .bit = 9 },
+	[GCC_USB4_0_MISC_DP1_MAX_PCLK_BCR] = { .reg = 0xad0f8, .bit = 10 },
 	[GCC_USB4_1_BCR] = { 0x2b000 },
+	[GCC_USB4_1_DP0_PHY_SEC_BCR] = { 0x2a010 },
+	[GCC_USB4_1_MISC_USB4_SYS_BCR] = { .reg = 0xae0f8, .bit = 0 },
+	[GCC_USB4_1_MISC_RX_CLK_0_BCR] = { .reg = 0xae0f8, .bit = 1 },
+	[GCC_USB4_1_MISC_RX_CLK_1_BCR] = { .reg = 0xae0f8, .bit = 2 },
+	[GCC_USB4_1_MISC_USB_PIPE_BCR] = { .reg = 0xae0f8, .bit = 3 },
+	[GCC_USB4_1_MISC_PCIE_PIPE_BCR] = { .reg = 0xae0f8, .bit = 4 },
+	[GCC_USB4_1_MISC_TMU_BCR] = { .reg = 0xae0f8, .bit = 5 },
+	[GCC_USB4_1_MISC_SB_IF_BCR] = { .reg = 0xae0f8, .bit = 6 },
+	[GCC_USB4_1_MISC_HIA_MSTR_BCR] = { .reg = 0xae0f8, .bit = 7 },
+	[GCC_USB4_1_MISC_AHB_BCR] = { .reg = 0xae0f8, .bit = 8 },
+	[GCC_USB4_1_MISC_DP0_MAX_PCLK_BCR] = { .reg = 0xae0f8, .bit = 9 },
+	[GCC_USB4_1_MISC_DP1_MAX_PCLK_BCR] = { .reg = 0xae0f8, .bit = 10 },
 	[GCC_USB4_2_BCR] = { 0x11000 },
+	[GCC_USB4_2_DP0_PHY_TERT_BCR] = { 0xa3010 },
+	[GCC_USB4_2_MISC_USB4_SYS_BCR] = { .reg = 0xaf0f8, .bit = 0 },
+	[GCC_USB4_2_MISC_RX_CLK_0_BCR] = { .reg = 0xaf0f8, .bit = 1 },
+	[GCC_USB4_2_MISC_RX_CLK_1_BCR] = { .reg = 0xaf0f8, .bit = 2 },
+	[GCC_USB4_2_MISC_USB_PIPE_BCR] = { .reg = 0xaf0f8, .bit = 3 },
+	[GCC_USB4_2_MISC_PCIE_PIPE_BCR] = { .reg = 0xaf0f8, .bit = 4 },
+	[GCC_USB4_2_MISC_TMU_BCR] = { .reg = 0xaf0f8, .bit = 5 },
+	[GCC_USB4_2_MISC_SB_IF_BCR] = { .reg = 0xaf0f8, .bit = 6 },
+	[GCC_USB4_2_MISC_HIA_MSTR_BCR] = { .reg = 0xaf0f8, .bit = 7 },
+	[GCC_USB4_2_MISC_AHB_BCR] = { .reg = 0xaf0f8, .bit = 8 },
+	[GCC_USB4_2_MISC_DP0_MAX_PCLK_BCR] = { .reg = 0xaf0f8, .bit = 9 },
+	[GCC_USB4_2_MISC_DP1_MAX_PCLK_BCR] = { .reg = 0xaf0f8, .bit = 10 },
 	[GCC_USB_0_PHY_BCR] = { 0x50020 },
 	[GCC_USB_1_PHY_BCR] = { 0x2a020 },
 	[GCC_USB_2_PHY_BCR] = { 0xa3020 },

-- 
2.51.0


