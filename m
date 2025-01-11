Return-Path: <linux-arm-msm+bounces-44803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B449BA0A4E0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 17:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79E721889614
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 16:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7851B4235;
	Sat, 11 Jan 2025 16:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Avke+tay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C01010F1;
	Sat, 11 Jan 2025 16:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736614481; cv=none; b=Q6wBqQakHEa74GpAPuOM3hB3buh7MmeUdme9oIpFO7BvhZZbfJxjg08wyKyqAqlv9v48Cyh497bVqtfnFBCFKxfhwqGbmDJSD+uqpa79vsUYd6YhQnVb2EjKAfVoTYuPt0en+D+xFz8BEy1dVqHjFTKsCsAnlMCOPQomDY0phLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736614481; c=relaxed/simple;
	bh=kmNqKEXU6HzXxUvqt51wD3/VWp4ZRsevLIkGwdulYR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K9XlOLhcHJQX+8oDJb035DTyPEbMSkv59E1GYBzwg77hzYb9NgWoiumIEqP0KNKPWAb8oU9XQGl+uz9genocOS+dzHliFXdCuuLONQakCHbIRzKydfn8I4DwcLPQQtMwf2SWLQxgDkWt5IYpQH/+jC9ptoSeeEthp5+YWxHW0ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Avke+tay; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCFBC4CED3;
	Sat, 11 Jan 2025 16:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736614480;
	bh=kmNqKEXU6HzXxUvqt51wD3/VWp4ZRsevLIkGwdulYR4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Avke+taydX/NAe7wA6C3ku4pYS++cFbdzSbIf9Lc/uRGehZwYENABeilPtMTfdcHO
	 4EbZsE6riGiEeAoGXv+wrnTdL4KmMbnLheQmvHrDh1cWerHo6awuIDvTwt2r/i5Ln9
	 Nnzq/H7XaTEvmZVZvhzUz2ks15ByTqaZ7bRBkb1GpCBtFyKIpICYpJk4vegRuwyvSY
	 ASgcMwWvpSFu/k+LEW8Ie1U9AX/xW+Cie2X2DwWYdT1ViXX7TzFQydqs5GDOnMVgrQ
	 dmuss9WdBrKMp8Z4GGn9C6t/i+nkyK6vgj9zL+f+XeCya+htJqe/BbzLmtpF8uCwjd
	 bvGzpnKsWpong==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 11 Jan 2025 17:54:18 +0100
Subject: [PATCH 1/2] clk: qcom: gcc-x1e80100: Unregister
 GCC_GPU_CFG_AHB_CLK/GCC_DISP_XO_CLK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-topic-x1e_fixups-v1-1-77dc39237c12@oss.qualcomm.com>
References: <20250111-topic-x1e_fixups-v1-0-77dc39237c12@oss.qualcomm.com>
In-Reply-To: <20250111-topic-x1e_fixups-v1-0-77dc39237c12@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736614468; l=3066;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=mgN0lEUN6/DQ3nCd73qB0maAURy0cjyOUBWcGGsTlLs=;
 b=BQRTH8fpMezdq4Ezuk7sMK4nGlMNR55cXDWTFImN4BeHe4jTeWgfejjtkr3Pl/4X1zex01h+g
 wAqT8xgueJEAuB1gDWdFRUy4qnsWhhn9cfQDkXCJsS7kT/cH2hFl5dN
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The GPU clock is required for CPU access to GPUSS registers. It was
previously decided (on this and many more platforms) that the added
overhead/hassle introduced by keeping track of it would not bring much
measurable improvement in the power department.

The display clock is basically the same story over again.

Now, we're past that discussion and this commit is not trying to change
that. Instead, the clocks are both force-enabled in .probe *and*
registered with the common clock framework, resulting in them being
toggled off after ignore_unused.

Unregister said clocks to fix breakage when clk_ignore_unused is absent
(as it should be).

Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 7288af845434d824eb91489ab97be25d665cad3a..009f39139b6440e80fca8f9474be86ca17d9775b 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -2564,19 +2564,6 @@ static struct clk_branch gcc_disp_hf_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_disp_xo_clk = {
-	.halt_reg = 0x27018,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x27018,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_disp_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_gp1_clk = {
 	.halt_reg = 0x64000,
 	.halt_check = BRANCH_HALT,
@@ -2631,21 +2618,6 @@ static struct clk_branch gcc_gp3_clk = {
 	},
 };
 
-static struct clk_branch gcc_gpu_cfg_ahb_clk = {
-	.halt_reg = 0x71004,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x71004,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x71004,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_gpu_cfg_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_gpu_gpll0_cph_clk_src = {
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
@@ -6268,7 +6240,6 @@ static struct clk_regmap *gcc_x1e80100_clocks[] = {
 	[GCC_CNOC_PCIE_TUNNEL_CLK] = &gcc_cnoc_pcie_tunnel_clk.clkr,
 	[GCC_DDRSS_GPU_AXI_CLK] = &gcc_ddrss_gpu_axi_clk.clkr,
 	[GCC_DISP_HF_AXI_CLK] = &gcc_disp_hf_axi_clk.clkr,
-	[GCC_DISP_XO_CLK] = &gcc_disp_xo_clk.clkr,
 	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
 	[GCC_GP1_CLK_SRC] = &gcc_gp1_clk_src.clkr,
 	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
@@ -6281,7 +6252,6 @@ static struct clk_regmap *gcc_x1e80100_clocks[] = {
 	[GCC_GPLL7] = &gcc_gpll7.clkr,
 	[GCC_GPLL8] = &gcc_gpll8.clkr,
 	[GCC_GPLL9] = &gcc_gpll9.clkr,
-	[GCC_GPU_CFG_AHB_CLK] = &gcc_gpu_cfg_ahb_clk.clkr,
 	[GCC_GPU_GPLL0_CPH_CLK_SRC] = &gcc_gpu_gpll0_cph_clk_src.clkr,
 	[GCC_GPU_GPLL0_DIV_CPH_CLK_SRC] = &gcc_gpu_gpll0_div_cph_clk_src.clkr,
 	[GCC_GPU_MEMNOC_GFX_CLK] = &gcc_gpu_memnoc_gfx_clk.clkr,

-- 
2.47.1


