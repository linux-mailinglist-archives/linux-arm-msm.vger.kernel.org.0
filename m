Return-Path: <linux-arm-msm+bounces-58211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE35AB9B58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39F6D4E4D79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF09239E74;
	Fri, 16 May 2025 11:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFWZkolJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B3F23771E;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395788; cv=none; b=VdUEf2/LRFwK7uQikTciS6x+VcrSsJAlnDy77A5VjIyX8JFceS2RM5jnP/mehj2fqqGx0Wv39HC4b5yNxja90s2cc5Kkl4+EAIxTJDP1u7/LrzP0cNG1/Ph80SUZSuEVdAoqEfVtxTBweZWU8YGWFxhntL4vdDv1+b/NSBS3yMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395788; c=relaxed/simple;
	bh=JWoWSWI2iFDqq31hCJJ8HrX1GSFoCvibN7mj9LxkFS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fFshRhajjuby0zuPAB4vY2QnhQAddLIwcb65cgqZJe3e+F4AU3zTyLeCxhq0sCPA8cTShtBxhyE3sVzcpekX1jMyVV8+fRmbrk3ABFBGAyrvcii1b6DMBwF0NzfpRyWm/j5atngFTH+jdNflsjBGe3fy67snUd4ehrwg1b29v/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFWZkolJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 698AFC4CEEB;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747395787;
	bh=JWoWSWI2iFDqq31hCJJ8HrX1GSFoCvibN7mj9LxkFS0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RFWZkolJyy8sEv1iPgdNonksCqMhpINt97f3PoViysX0o+BSqRFMWfIrtIz82O46I
	 qVqp6mMwuYRCQ90I7VG9vgESKSRlI9YTXaS+xhehuUJqPFIQiQZQHTjzv/VqMqr8Ij
	 SFqVfvEr1cCooIFVCO/7f0qgFQcX5+zFZ0gDAxljXbTlwJH24bzhJgjcqr5bbTEfsZ
	 qFWPDWcdECCgIoTYB4hq6etFR92TPaq35OQTZu3ZnhK1elal0v296CmpGPKPTuncNl
	 xW//qowS6a6aB4//9I1CRE20bXE6f2TT29zFIIoS5NTUYubB+gjpJQVAiOI455v1Ka
	 r3ZTbAvPy2+yg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56661C3ABD8;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Fri, 16 May 2025 15:43:04 +0400
Subject: [PATCH v3 1/5] clk: qcom: ipq5018: keep XO clock always on
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-ipq5018-cmn-pll-v3-1-f3867c5a2076@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747395784; l=3176;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=76iGGwYN7iao5R8Jw8ULkb9PNnmzQQ/WRzYbsqPI52M=;
 b=lRIKoG4O8Y6ZVZLIGRnXWA908cm1Q2k3Ghla9NIw/CI/f/mohI6TgZUlEDOcikSxo0Shbripz
 IMv57YIbhUHCkV+wZTR2lD7gbTgNrcWAt7Hi0ce9sf9kon1+SDIzEBp
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The XO clock must not be disabled to avoid the kernel trying to disable
the it. As such, keep the XO clock always on by flagging it as critical.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
The kernel will panic when parenting it under the CMN PLL reference
clock and the below message will appear in the kernel logs.

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
---
 drivers/clk/qcom/gcc-ipq5018.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index 70f5dcb96700f55da1fb19fc893d22350a7e63bf..24eb4c40da63462077ee2e5714e838aa30ced2e3 100644
--- a/drivers/clk/qcom/gcc-ipq5018.c
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -1371,7 +1371,7 @@ static struct clk_branch gcc_xo_clk = {
 				&gcc_xo_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},

-- 
2.49.0



