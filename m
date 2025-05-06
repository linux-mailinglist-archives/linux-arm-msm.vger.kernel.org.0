Return-Path: <linux-arm-msm+bounces-56895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C763AABB13
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 09:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60D9E1C403D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 07:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A88B29553D;
	Tue,  6 May 2025 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFDf32Jh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40931295509;
	Tue,  6 May 2025 05:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510261; cv=none; b=OCdp89/2hwABbTYONKJEuJQ1r5cGnZzf237PPs1jRWkABK9oJ+4Fp3/EQD4B2X4Sbc8IHRjI6yM1TpYgoDXidZKG3yeG/nLxTeWiXf+rG+Z0P1w9C2Tqpoyq5onfzmjyLasPZe+RqRaBxj0UFkVJrABLZDRGg/WA7X+CvBrcK48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510261; c=relaxed/simple;
	bh=dj7hW8ZgQnAwcNBQPjqhjJ+Z9E/QQA3KSfq7G5Qk+u8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ACoHoZNTS/L9eqavzoZ4HQ/6HvYvtaplkvHcwymqcalsZrb0WQw3voWwwSsQbu7dXyCrHPHPRQ2FLoaoKXEkhPECoz9CuCbRJLcoWM/JQu/Mac3EGqMtPAsP09A06+PcQIezmKQ6zZCg60nga+ckzAtNoMGDfD8to07bzh8MY/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFDf32Jh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE03CC4CEEF;
	Tue,  6 May 2025 05:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746510260;
	bh=dj7hW8ZgQnAwcNBQPjqhjJ+Z9E/QQA3KSfq7G5Qk+u8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BFDf32Jh9LaKV9E2hBNyHcmixw5Klr9Am73NWTku67gTPq2aM3ShaBK5SADdUKj2R
	 fi5sDZqU3Tpe9lufguspc+26sPoxbDXbcybAYOukqA48muzrJtfGyV+QWXrxl1OID+
	 aCTkswJ2Rmwrz0r9BHYjCKeCNbs4xQbVRZFdgUTOAKFBrD9Uxk5k+fL9zGLJc0TYB1
	 HAf4+soL9MMTLmpkB/7BHHPreS4iLoGrS+TKjLbsCKvNkokO6mpkMascSxFUJ0am6V
	 LKf/hz+mGeLwDNY3ExlU2+AlKLal4ivB34lh6K1Hi0okT/yC4vFn/raWT6xR56+AE+
	 bBAxbwhrb4MoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2790C3ABBE;
	Tue,  6 May 2025 05:44:20 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 06 May 2025 09:43:33 +0400
Subject: [PATCH v2 1/6] clk: qcom: ipq5018: keep XO clock always on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-ipq5018-cmn-pll-v2-1-c0a9fcced114@outlook.com>
References: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
In-Reply-To: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746510258; l=5615;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=Y1JlY5oRKJOTEFrLvYYyqkZKWEAjiaHbxNE3QfYsj7s=;
 b=7CAurtbrS7p+d9AmNJBBdWw47Qgb4EgUhnD0StVBj9e6Zk5wLuUQdqTjmk33RhcD7G9omq0dG
 XBXKG7O/8QJDQK4vSx9gJexdYrsA2h4YWsS0dZofuiIag9LGG/h8u40
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The XO clock must not be disabled to avoid the kernel trying to disable
the it (when parenting it under the CMN PLL reference clock), else the
kernel will panic and the below message will appear in the kernel logs.
So let's enable the XO and its source CLK and keep them always on.

[    0.916515] ------------[ cut here ]------------
[    0.918890] gcc_xo_clk_src status stuck at 'on'
[    0.918944] WARNING: CPU: 0 PID: 8 at drivers/clk/qcom/clk-branch.c:86 clk_branch_wait+0x114/0x124
[    0.927926] Modules linked in:
[    0.936945] CPU: 0 PID: 8 Comm: kworker/0:0 Not tainted 6.6.74 #0
[    0.939982] Hardware name: Linksys MX2000 (DT)
[    0.946151] Workqueue: pm pm_runtime_work
[    0.950489] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.954566] pc : clk_branch_wait+0x114/0x124
[    0.961335] lr : clk_branch_wait+0x114/0x124
[    0.965849] sp : ffffffc08181bb50
[    0.970101] x29: ffffffc08181bb50 x28: 0000000000000000 x27: 61c8864680b583eb
[    0.973317] x26: ffffff801fec2168 x25: ffffff800000abc0 x24: 0000000000000002
[    0.980437] x23: ffffffc0809f6fd8 x22: 0000000000000000 x21: ffffffc08044193c
[    0.985276] loop: module loaded
[    0.987554] x20: 0000000000000000 x19: ffffffc081749278 x18: 000000000000007c
[    0.987573] x17: 0000000091706274 x16: 000000001985c4f7 x15: ffffffc0816bbdf0
[    0.987587] x14: 0000000000000174 x13: 000000000000007c x12: 00000000ffffffea
[    0.987601] x11: 00000000ffffefff x10: ffffffc081713df0 x9 : ffffffc0816bbd98
[    0.987615] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000057fa8
[    1.026268] x5 : 0000000000000fff x4 : 0000000000000000 x3 : ffffffc08181b950
[    1.033385] x2 : ffffffc0816bbd30 x1 : ffffffc0816bbd30 x0 : 0000000000000023
[    1.040507] Call trace:
[    1.047618]  clk_branch_wait+0x114/0x124
[    1.049875]  clk_branch2_disable+0x2c/0x3c
[    1.054043]  clk_core_disable+0x60/0xac
[    1.057948]  clk_core_disable+0x68/0xac
[    1.061681]  clk_disable+0x30/0x4c
[    1.065499]  pm_clk_suspend+0xd4/0xfc
[    1.068971]  pm_generic_runtime_suspend+0x2c/0x44
[    1.072705]  __rpm_callback+0x40/0x1bc
[    1.077392]  rpm_callback+0x6c/0x78
[    1.081038]  rpm_suspend+0xf0/0x5c0
[    1.084423]  pm_runtime_work+0xf0/0xfc
[    1.087895]  process_one_work+0x17c/0x2f8
[    1.091716]  worker_thread+0x2e8/0x4d4
[    1.095795]  kthread+0xdc/0xe0
[    1.099440]  ret_from_fork+0x10/0x20
[    1.102480] ---[ end trace 0000000000000000 ]---

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/clk/qcom/gcc-ipq5018.c | 50 +++++-------------------------------------
 1 file changed, 6 insertions(+), 44 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index 70f5dcb96700f55da1fb19fc893d22350a7e63bf..32c3e72429039dfb7adb1e956fba18bd2bc06557 100644
--- a/drivers/clk/qcom/gcc-ipq5018.c
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -1345,38 +1345,6 @@ static struct clk_branch gcc_sleep_clk_src = {
 	},
 };
 
-static struct clk_branch gcc_xo_clk_src = {
-	.halt_reg = 0x30018,
-	.clkr = {
-		.enable_reg = 0x30018,
-		.enable_mask = BIT(1),
-		.hw.init = &(struct clk_init_data) {
-			.name = "gcc_xo_clk_src",
-			.parent_data = gcc_xo_data,
-			.num_parents = ARRAY_SIZE(gcc_xo_data),
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_xo_clk = {
-	.halt_reg = 0x30030,
-	.clkr = {
-		.enable_reg = 0x30030,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
-			.name = "gcc_xo_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&gcc_xo_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_adss_pwm_clk = {
 	.halt_reg = 0x1f020,
 	.clkr = {
@@ -1584,11 +1552,7 @@ static struct clk_branch gcc_cmn_blk_sys_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "gcc_cmn_blk_sys_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&gcc_xo_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.num_parents = 0,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2980,11 +2944,7 @@ static struct clk_branch gcc_uniphy_sys_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "gcc_uniphy_sys_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&gcc_xo_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.num_parents = 0,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -3504,8 +3464,6 @@ static struct clk_regmap *gcc_ipq5018_clks[] = {
 	[GCC_WCSS_DBG_IFC_NTS_BDG_CLK] = &gcc_wcss_dbg_ifc_nts_bdg_clk.clkr,
 	[GCC_WCSS_DBG_IFC_NTS_CLK] = &gcc_wcss_dbg_ifc_nts_clk.clkr,
 	[GCC_WCSS_ECAHB_CLK] = &gcc_wcss_ecahb_clk.clkr,
-	[GCC_XO_CLK] = &gcc_xo_clk.clkr,
-	[GCC_XO_CLK_SRC] = &gcc_xo_clk_src.clkr,
 	[GMAC0_RX_CLK_SRC] = &gmac0_rx_clk_src.clkr,
 	[GMAC0_RX_DIV_CLK_SRC] = &gmac0_rx_div_clk_src.clkr,
 	[GMAC0_TX_CLK_SRC] = &gmac0_tx_clk_src.clkr,
@@ -3696,6 +3654,10 @@ static int gcc_ipq5018_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	/* Keep some clocks always-on */
+	qcom_branch_set_clk_en(regmap, 0x30018); /* GCC_XO_CLK_SRC */
+	qcom_branch_set_clk_en(regmap, 0x30030); /* GCC_XO_CLK */
+
 	clk_alpha_pll_configure(&ubi32_pll_main, regmap, &ubi32_pll_config);
 
 	return qcom_cc_really_probe(&pdev->dev, &ipq5018_desc, regmap);

-- 
2.49.0



