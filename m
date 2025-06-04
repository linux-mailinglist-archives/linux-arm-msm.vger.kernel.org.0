Return-Path: <linux-arm-msm+bounces-60166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D877ACD23E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 03:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A057B7AB3B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 01:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFEE6F2F2;
	Wed,  4 Jun 2025 00:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tzqb1fYD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0633F4AEE0;
	Wed,  4 Jun 2025 00:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748998583; cv=none; b=NpbJvMiMKuDeQkFSEXb+IA/hzWykVPVmGCg+RMHQrd1iEJN/S1EIg7j1nDvmnsUv9IEyHAulHtquwPF+nzbZeuJh7tMNbXu1P1738+jpesJw0hMv5jJ/k+bmqQ17Uy7myd6aYc7nO3EdlJ+5nxKzcUKHrBiLsi5NEwsDcYUUIZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748998583; c=relaxed/simple;
	bh=gx4YVBehIRAHSzzD9Z/3I6JRNKlsQb4dBOkXayYSADA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MvC+rvje0AZwrhAG9cMDrzpwRPtV5XrRA0bBG8BzNzsnp7lCmFRVSSqMkObObyqUaDGm1OqAky3Cl9YOs/qqoclA/JC4zyM/trp94ogNA+egpH7JnUt3Q7F6dwgc+00WuVYVqkt+T1DQraYeB6HXDPMrdYmX5hLoH7zXC266g44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tzqb1fYD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912E4C4CEED;
	Wed,  4 Jun 2025 00:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998582;
	bh=gx4YVBehIRAHSzzD9Z/3I6JRNKlsQb4dBOkXayYSADA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tzqb1fYDgccXXfmj3xwio5VsyJa59JzAW+Lep68rKo+K/FKwynqfT5vlnuJ2nh8K2
	 x+1vDON+Btp4vQIU5ptDMxjkWVBepV67ePO0zE0ugNP7b6DtwIzgp+qfqxevcOFffM
	 h5xyTLmO24gAWd1+tnTaj8E5ntRYaUZ9P1M1IlOFE7pbnaqoaJgi552ssCBaoZK/Yl
	 8Ocwukh4G98bkMYsSRvVdD8ds/ef/nEqm03LvogKUczbLZpkGJOo9Vz06xOliTXWGX
	 bXbR+LSA8wvqIeBaDx1nigWmVhBP8ObRUY3kgn7o6l3Ib9a1md9e9G69J/oQrNPMtg
	 BRSrmnfaAfeMw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Taniya Das <quic_tdas@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 024/108] clk: qcom: gcc-x1e80100: Set FORCE MEM CORE for UFS clocks
Date: Tue,  3 Jun 2025 20:54:07 -0400
Message-Id: <20250604005531.4178547-24-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005531.4178547-1-sashal@kernel.org>
References: <20250604005531.4178547-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Transfer-Encoding: 8bit

From: Taniya Das <quic_tdas@quicinc.com>

[ Upstream commit 201bf08ba9e26eeb0a96ba3fd5c026f531b31aed ]

Update the force mem core bit for UFS ICE clock and UFS PHY AXI clock to
force the core on signal to remain active during halt state of the clk.
If force mem core bit of the clock is not set, the memories of the
subsystem will not retain the logic across power states. This is
required for the MCQ feature of UFS.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
Link: https://lore.kernel.org/r/20250414-gcc_ufs_mem_core-v1-2-67b5529b9b5d@quicinc.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my extensive analysis: ## Key Factors Supporting Backporting: ### 1.
**Bug Fix Nature with Clear Functional Impact** The commit fixes a real
functional bug where UFS memories fail to retain logic across power
states when the FORCE_MEM_CORE_ON bit is not set. This directly impacts
the MCQ (Multi Circular Queue) feature of UFS, which is a performance-
critical functionality for storage operations. ### 2. **Minimal and
Contained Code Changes** The actual code change is extremely small and
surgical: ```c + /bin /bin.usr-is-merged /boot /dev /etc /home /init
/lib /lib.usr-is-merged /lib64 /lost+found /media /mnt /opt /proc /root
/run /sbin /sbin.usr-is-merged /snap /srv /sys /tmp /usr /var
FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks linux/
+ qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk,
true); + qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk,
true); ``` This is just two function calls that set specific register
bits (BIT(14) in the halt registers) to ensure memory retention during
clock halt states. ### 3. **Strong Pattern Match with Accepted
Backports** Looking at the historical examples: - **Similar Commit #2
(YES)**: Nearly identical fix for SC7280 platform setting
FORCE_MEM_CORE_ON for UFS ICE clock - **Similar Commit #5 (YES)**: UFS
clock fixes for MSM8998 that improve UFS functionality The pattern is
clear: UFS clock fixes that address hardware requirements are
consistently backported. ### 4. **Low Regression Risk** - The change
only affects two specific UFS clocks on the x1e80100 platform - Uses an
existing, well-tested function (`qcom_branch_set_force_mem_core`) - Only
sets bits to ensure memory retention - cannot break existing
functionality - Platform-specific change that won't affect other
hardware ### 5. **Critical for Hardware Functionality** The commit
message explicitly states this is "required for the MCQ feature of UFS."
MCQ is not an optional enhancement but a fundamental part of modern UFS
operation for performance and reliability. ### 6. **Follows Established
Qualcomm Pattern** My kernel tree analysis shows this exact pattern
implemented across multiple Qualcomm platforms (SM8650, SM8750, SA8775P,
SC7280), indicating this is a well-understood hardware requirement
rather than an experimental change. ### 7. **Platform-Specific Scope**
The change is confined to `drivers/clk/qcom/gcc-x1e80100.c`, affecting
only the Qualcomm X1E80100 platform. This isolation minimizes any risk
to other systems. ## Code Analysis Details: The fix sets
`CBCR_FORCE_MEM_CORE_ON` (BIT(14)) in the halt registers of: -
`gcc_ufs_phy_ice_core_clk` (halt_reg = 0x77074) - `gcc_ufs_phy_axi_clk`
(halt_reg = 0x77018) This ensures that when these clocks enter halt
state, the core memory remains powered and retains its state, which is
essential for the UFS MCQ feature to function correctly across power
transitions. The change aligns perfectly with stable kernel criteria:
it's a small, contained bug fix that addresses a real hardware
requirement with minimal regression risk.

 drivers/clk/qcom/gcc-x1e80100.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 009f39139b644..3e44757e25d32 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -6753,6 +6753,10 @@ static int gcc_x1e80100_probe(struct platform_device *pdev)
 	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
 	regmap_write(regmap, 0x52224, 0x0);
 
+	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
+
 	return qcom_cc_really_probe(&pdev->dev, &gcc_x1e80100_desc, regmap);
 }
 
-- 
2.39.5


