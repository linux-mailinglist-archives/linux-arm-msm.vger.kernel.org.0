Return-Path: <linux-arm-msm+bounces-67787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D240B1B430
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 15:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B7FC18A133F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 13:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AAFC274FD1;
	Tue,  5 Aug 2025 13:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N13vne+j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BFD274B5B;
	Tue,  5 Aug 2025 13:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399414; cv=none; b=rLXHH00qZtcKacu05jJybdVQuToWqV5dJ2ybBNkivDxf+aRwWlW+6bF1dRvqsm9TaRuN7O2ZRb/Jls3lJJfX9HpMgeMEckWalCZyEDcDGnwpFtX6BK4rE31IWpXPCZO44Pjv3hD2u26HeBsVYfi80IwfZ6BbpSYCmtFbywKw+vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399414; c=relaxed/simple;
	bh=ImGK6+9/NKY2TixRIRd0Rz8GIvh6fvxsWjgXbN75x2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JKrJ3bjtmpa0ovYbz6f9UgCOGOinAqAnNV27mE83f6YD8qHlnqUrwvzWw049QUeD0C3pujSWdj/DhMKFHj8Muysh//lqSxCkFgNVtRS7JLgYMQaAq6NbA+wdIJn0503oH07gc5jawT2z59dEQbXdC71rZrrn+vYZRhzBRc5V91g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N13vne+j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C26BC4CEF0;
	Tue,  5 Aug 2025 13:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399414;
	bh=ImGK6+9/NKY2TixRIRd0Rz8GIvh6fvxsWjgXbN75x2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N13vne+jmcqPjJ8wyNk7aqn/Cn4V5nmwI5XP5qaIYuNbAnDfAcZ7tplU2Nr/jUZVu
	 0kAXTE6KrY36jM9BMoMsDLsRubMNlrKGVHM/Lez0HsSf4giKsAqKun2mfuBnsXSI0m
	 t/25H+tORm9Es1G0wZSUCwGXLFKqKKdF+JKgXDFTcmJutuFT2VBUjgUPCQPwlkgziY
	 BiLXjUUsxtxrScDZHldn7OAFogx93MkqK/x4v9mb/NScS1Nz8Erq15WsWcII3VhrpU
	 +JW7np+9sX/AmMhkMHka67eJ0r4ILIGCCeHaJfPgGCv3PzReoaJSG8NFwBflBkQVqY
	 c0I3YY3gNIJaA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-6.6] clk: qcom: ipq5018: keep XO clock always on
Date: Tue,  5 Aug 2025 09:08:48 -0400
Message-Id: <20250805130945.471732-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: George Moussalem <george.moussalem@outlook.com>

[ Upstream commit 693a723291d0634eaea24cff2f9d807f3223f204 ]

The XO clock must not be disabled to avoid the kernel trying to disable
the it. As such, keep the XO clock always on by flagging it as critical.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20250516-ipq5018-cmn-pll-v4-1-389a6b30e504@outlook.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis of the commit and the kernel repository context,
here's my assessment:

**Backport Status: YES**

## Extensive Explanation:

This commit should be backported to stable kernel trees for the
following reasons:

### 1. **Critical Bug Fix**
The commit fixes a critical issue where the XO (crystal oscillator)
clock could be disabled by the kernel's clock framework. The XO clock is
fundamental to the SoC's operation - it's the primary reference clock
that drives many other clocks in the system. The commit message
explicitly states "The XO clock must not be disabled to avoid the kernel
trying to disable it."

### 2. **Small and Contained Change**
The code change is minimal - only adding the `CLK_IS_CRITICAL` flag to
line 1374:
```c
.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
```
This is a one-line change that only affects the `gcc_xo_clk` structure
initialization. It doesn't modify any logic, algorithms, or introduce
new features.

### 3. **Clear Problem and Solution**
The problem is straightforward: without the `CLK_IS_CRITICAL` flag, the
clock framework may attempt to disable the XO clock when it appears
unused, which could cause system instability or crashes on IPQ5018
platforms. The solution is equally clear: marking the clock as critical
prevents it from ever being disabled.

### 4. **Pattern Established in Other Qualcomm Drivers**
From the git history analysis, I can see similar patterns where critical
clocks are marked with `CLK_IS_CRITICAL` in other Qualcomm clock drivers
(gcc-sm7150.c, gcc-qcm2290.c, gcc-sm6375.c, etc.). This is a well-
established practice for clocks that must remain always-on.

### 5. **Platform-Specific Fix with No Side Effects**
This change only affects the IPQ5018 platform and has no impact on other
SoCs or subsystems. The modification is contained within the platform-
specific driver file `gcc-ipq5018.c`.

### 6. **Potential System Stability Impact**
Without this fix, IPQ5018-based systems could experience:
- Random crashes when the clock framework attempts to disable the XO
  clock
- System hangs or freezes
- Unpredictable behavior when power management features are active

### 7. **Recent Driver with Active Bug Fixes**
Looking at the commit history for gcc-ipq5018.c, there have been several
recent bug fixes:
- `f6a4a55ae5d9` - fix GE PHY reset
- `7d474b43087a` - fix register offset for GCC_UBI0_AXI_ARES reset
- `11b752ac5a07` - fix 'halt_reg' offset of 'gcc_pcie1_pipe_clk'
- `f982adcc1b1c` - fix 'enable_reg' offset of 'gcc_gmac0_sys_clk'

This indicates the driver is still being stabilized, and this XO clock
fix is part of that stabilization effort.

### 8. **No Architectural Changes**
The commit doesn't introduce any architectural changes or new features.
It's purely a bug fix that ensures correct hardware behavior by
preventing an essential clock from being disabled.

The commit meets all the criteria for stable backporting: it fixes an
important bug that affects users, is small and contained, has minimal
risk of regression, and doesn't introduce new features or architectural
changes.

 drivers/clk/qcom/gcc-ipq5018.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index 70f5dcb96700..24eb4c40da63 100644
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
2.39.5


