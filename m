Return-Path: <linux-arm-msm+bounces-104960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mALvNLST8GnnVAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:02:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A299D483383
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 444E83087613
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0461C423A9E;
	Tue, 28 Apr 2026 10:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwfN6GIu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C8C423A9A;
	Tue, 28 Apr 2026 10:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372983; cv=none; b=uZVa0SrSzNBdUT29PR2IQlob1wa2FZc69i8YfDkRitSSVFPnvw7+2hznJCs2+YaKy9Eds02YMGnGEkjIidl3ZM5eQB4PhbRS2Z8rijCi408HHAeTgnG3fMT656jERy33H6qleEkPlwAM/Ncq7nioRWdv8LeeqnN8KMq2ubXT2RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372983; c=relaxed/simple;
	bh=+ZRNSpMxbtL6pi+004vKl0lGTMAHazGZBWSYX+mLXR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WCJhcGF8ncNAo5ltQG4KXy8KiwI3ggb3Up+uUYknR8FyzmJkKnF7OpkB7v5I6IEM5kBkfrM4weaenpiCOuSGgyp/VyA4N7xIfWvHPCE/Trgff+SVK/TO1U+bUVb5O+kSf3TpgTJfvLqRQSEL0Gi+lw9G/TyRxUQTeEExkdMuskM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qwfN6GIu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495F7C2BCB7;
	Tue, 28 Apr 2026 10:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777372983;
	bh=+ZRNSpMxbtL6pi+004vKl0lGTMAHazGZBWSYX+mLXR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qwfN6GIuenPNQYzZ38EI2quHWFLfR8Eqvu20YmsSn1X9U3z4iK1LxIjPOBfUoFXAe
	 6YJwtOW/MK1fcXT9SmrllL7zPC9XKk+8ZgpS6ko7aQCz/qxXhu7EaareypFmkDv/KB
	 J4dYX68yNg9ChNdvtWZ6d/w9QO+kw/MgScedRxTuFUudbsYVSgV12yKZP0wCCh+ohw
	 605Vem7+MfIa/PmPMiTtzrRQXCKM6bcS34N3K+vl9636LkKX7cnkOBwsXOKK8Hwp7P
	 QPp8vbD3ZXxsC01VqcJc3vuVHmcbQhz2C6aeouV0GXUpf7JVoapr2hevH6hhIXGOJn
	 hy4D2QRNW/v3g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	agross@kernel.org,
	konrad.dybcio@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
Date: Tue, 28 Apr 2026 06:41:13 -0400
Message-ID: <20260428104133.2858589-62-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428104133.2858589-1-sashal@kernel.org>
References: <20260428104133.2858589-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A299D483383
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104960-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,linaro.org,baylibre.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.232.135.74:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lore:url,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

From: Pengyu Luo <mitltlatltl@gmail.com>

[ Upstream commit 0f5c8f03d990f9be9908a08a701c324e113554d2 ]

Recently, when testing 10-bit dsi C-PHY panel, clks are different
from the usual. (dsi0_phy_pll_out_dsiclk's parent is dsi0_pll_bit_clk
now (dsiclk_sel = 0)) And we failed to set dsiclk's children.

dsi_link_clk_set_rate_6g: Set clk rates: pclk=172992000, byteclk=108120000

byteclk was set first to 108120000, so the vco rate was set to
108120000 * 7 * 1 * 1 = 756840000. When we was trying to set
172992000 on mdss_pixel_clk_src later.

Since there was no matched ratio, we failed to set it. And dsiclk
divider ratio was set to 15:1 (wrong cached register value 0xf and
didn't update), we finally got 50455997, apparently wrong.

  dsi0vco_clk                1       1        0        756839941
     dsi0_pll_out_div_clk    1       1        0        756839941
        dsi0_pll_post_out_div_clk 0       0        0        216239983
        dsi0_pll_bit_clk     2       2        0        756839941
           dsi0_phy_pll_out_dsiclk 2       2        0        50455997
              disp_cc_mdss_pclk1_clk_src 1       1        0        50455997
           dsi0_pll_by_2_bit_clk 0       0        0        378419970
           dsi0_phy_pll_out_byteclk 2       2        0        108119991
              disp_cc_mdss_byte1_clk_src 2       2        0        108119991

Downstream clk_summary shows the mdss_pixel_clk_src support the
ratio(35:16)

 dsi0_phy_pll_out_dsiclk             2       2        0        378420000
     disp_cc_mdss_pclk1_clk_src       1       1        0        172992000
 dsi0_phy_pll_out_byteclk            2       2        0        108120000
     disp_cc_mdss_byte1_clk_src       2       2        0        108120000

After checking downstream source, 15:4 also seems to be supported,
add them two.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260321095029.2259489-1-mitltlatltl@gmail.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information I need to complete this analysis.

## Phase 1: COMMIT MESSAGE FORENSICS

**Step 1.1 - Parse subject line:**
- Subsystem: `clk: qcom: rcg2:`
- Action verb: "expand" (non-standard fix verb, but describes adding
  entries)
- Record: Qualcomm Root Clock Generator 2 driver - expand fractional
  ratio table for MDSS pixel clock source

**Step 1.2 - Parse tags:**
- Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com> (Qualcomm clock
  expert, original author of prior frac-table update b527358cb4cd5)
- Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> (msm
  subsystem maintainer)
- Link: lore.kernel.org reference to discussion
- Signed-off-by: Bjorn Andersson <andersson@kernel.org> (Qualcomm SoC
  maintainer, applied it)
- **NO** Fixes: tag (expected absence - this is why it's being reviewed)
- **NO** Cc: stable (expected absence)
- **NO** Reported-by: (author found it while testing)

**Step 1.3 - Analyze commit body:**
- Bug: When using a 10-bit DSI C-PHY panel with `pclk=172992000,
  byteclk=108120000`, `mdss_pixel_clk_src` fails to find a matching
  ratio in `frac_table_pixel[]`.
- Failure mode: `clk_pixel_determine_rate()` returns `-EINVAL`, the
  divider register keeps a stale cached value (0xf = 15:1), so actual
  pclk becomes ~50.4 MHz instead of required ~173 MHz — a ~3.4x wrong
  clock rate. Display output is corrupted/broken.
- Root cause: Table lacks the 16/35 and 4/15 ratios that downstream
  Qualcomm driver supports.
- Record: concrete runtime bug on real hardware; downstream driver
  carries the needed ratios.

**Step 1.4 - Hidden fix detection:** Subject says "expand" but the body
clearly documents a failure mode. This is a bug fix disguised as an
enhancement. The "expand" verb hides that `clk_set_rate()` completely
fails without it.

## Phase 2: DIFF ANALYSIS

**Step 2.1 - Inventory:** 1 file (`drivers/clk/qcom/clk-rcg2.c`), +2 /
-0 lines. Single-file surgical change.

**Step 2.2 - Code flow:**
- Before: `frac_table_pixel[] = { {3,8}, {2,9}, {4,9}, {1,1}, {2,3}, {}
  }`
- After: adds `{16,35}` and `{4,15}` before the sentinel
- Only affects `clk_pixel_determine_rate()` and `clk_pixel_set_rate()`
  iteration logic

**Step 2.3 - Bug mechanism:** Hardware workaround/enablement category.
The table defines numerator/denominator pairs used to compute parent
rate requests. Without the new entries, the iteration loop falls off the
end and returns `-EINVAL` for specific legitimate hardware
configurations.

**Step 2.4 - Fix quality:**
- Obviously correct: pure data table addition, cannot affect previously
  working cases.
- Cannot cause regression: iteration checks each entry in order, new
  entries only kick in when existing ones don't match.
- No risk of deadlock, UAF, etc.

## Phase 3: GIT HISTORY INVESTIGATION

**Step 3.1 - Blame:**
- `frac_table_pixel[]` was introduced by `99cbd064b059f` ("clk: qcom:
  Support display RCG clocks", May 2014)
- Entry `{2, 3}` was added by `b527358cb4cd5` (Feb 2022, Taniya Das)
  with a `Fixes:` tag

**Step 3.2 - No Fixes: tag to follow.** The missing ratios have
effectively been absent since original commit `99cbd064b059f` (2014,
v3.17-era). Code exists in every active stable tree.

**Step 3.3 - Related file history:** Prior similar fix (`b527358cb4cd5`,
"Update the frac table for pixel clock") added a single entry and was
backported broadly. Same author context (Taniya Das reviewed both).

**Step 3.4 - Author:** Pengyu Luo is a regular contributor to qcom
subsystem with multiple DSI-related fixes (`e4eb11b34d6c8`,
`ac47870fd7955`, `fd941c787cbb4`). Patch reviewed by actual subsystem
experts.

**Step 3.5 - Dependencies:** Standalone, self-contained. No
prerequisites.

## Phase 4: MAILING LIST RESEARCH

**Step 4.1 - `b4 dig -c 0f5c8f03d990f`:** Found thread at `https://lore.
kernel.org/all/20260321095029.2259489-1-mitltlatltl@gmail.com/`. Single-
patch, v1 only, applied as-is by Bjorn Andersson with "Applied,
thanks!".

**Step 4.2 - Reviewers:** Taniya Das (Qualcomm clock expert), Dmitry
Baryshkov (msm maintainer), Konrad Dybcio (Qualcomm engineer). Proper
maintainer review.

**Step 4.3 - Discussion:** Konrad asked a clarifying question about
whether these divider pairs are needed at all; Dmitry pointed to the
Qualcomm downstream commit `f7aec4359448d25c8a8d21ad8e8733d61f6b69ab`
confirming the ratios come from the vendor reference code. No NAK, no
concerns about stability.

**Step 4.4 - Series context:** Not part of a series.

**Step 4.5 - Stable discussion:** None found in the thread.

## Phase 5: CODE SEMANTIC ANALYSIS

**Step 5.1 - Key data:** `frac_table_pixel[]` array only.

**Step 5.2 - Callers:** `clk_pixel_ops` (set via `.set_rate =
clk_pixel_set_rate` and `.determine_rate = clk_pixel_determine_rate`) is
used by 17+ Qualcomm dispcc drivers: SDM845, SM6350, SM7150, SM8250,
SM8450, SM8550, SM8750, X1E80100, SC7180, SC7280, SC8280XP, QCM2290,
SM4450, SM6375, SA8775P (dispcc0/1), etc. This is a HIGH IMPACT SURFACE
— affects display on almost every modern Qualcomm SoC.

**Step 5.3 - Callees:** Pure table lookup.

**Step 5.4 - Reachability:** Reached from `clk_set_rate()` on any MDSS
pixel clock → userspace-triggerable via normal display driver operations
(DRM probe, panel enable, mode set).

**Step 5.5 - Similar patterns:** The `b527358cb4cd5` commit is the exact
same pattern (add ratio to `frac_table_pixel`) and was backported to 8
stable trees.

## Phase 6: STABLE TREE ANALYSIS

**Step 6.1 - Code exists in stable:** Verified `frac_table_pixel[]` is
identical (`{3,8}, {2,9}, {4,9}, {1,1}, {2,3}`) on 5.10, 5.15, 6.1, 6.6,
6.12, 6.18, 6.19. Every active stable tree has the same buggy state.

**Step 6.2 - Backport complexity:** The `frac_table_pixel[]` array is in
the same place across all trees. Will apply cleanly or with trivial
context adjustment.

**Step 6.3 - Related fixes in stable:** `b527358cb4cd5` (adding `{2,3}`)
is in all stable trees. This new commit is the continuation.

## Phase 7: SUBSYSTEM CONTEXT

**Step 7.1 - Subsystem:** `drivers/clk/qcom/` - Qualcomm clock driver.
Level: IMPORTANT (affects many SoC families, any user with a Qualcomm
device using `clk_pixel_ops`).

**Step 7.2 - Activity:** Actively maintained subsystem; regular flow of
fixes.

## Phase 8: IMPACT & RISK

**Step 8.1 - Affected users:** Users of Qualcomm SoCs with DSI panels
requiring the specific pixel clock ratios — explicitly 10-bit DSI C-PHY
panels and other configurations where pclk/byteclk combinations force a
16:35 or 4:15 ratio.

**Step 8.2 - Trigger conditions:** Normal display operation with
affected panels. No special privileges needed (display usage is common).

**Step 8.3 - Failure mode severity:** HIGH — pixel clock is set to
completely wrong rate (e.g., 50 MHz instead of 173 MHz, a 3.4x error).
This causes visible display corruption / non-functional display on
affected hardware. Not a crash, but user-visible broken functionality
with no workaround.

**Step 8.4 - Risk/benefit:**
- Benefit: HIGH (fixes display for a class of panels across many SoCs)
- Risk: VERY LOW (2 lines of data, table iteration is in-order; existing
  ratios still match first)
- Ratio: Strongly favors backport.

## Phase 9: SYNTHESIS

**Evidence FOR backporting:**
- Fixes real observed runtime failure with detailed clk_summary evidence
- Same pattern (adding ratio to `frac_table_pixel`) was previously
  backported to 8 stable trees (`b527358cb4cd5` went to 4.9.y, 4.14.y,
  4.19.y, 5.4.y, 5.10.y, 5.15.y, 5.16.y, 5.17.y)
- Minimal 2-line change in a const data table
- Zero functional risk (iteration is ordered; additions cannot break
  existing cases)
- Reviewed by two subsystem experts + applied by Qualcomm SoC maintainer
- Falls into "hardware quirk/workaround" exception category (analogous
  to device ID addition)
- Code exists identically in all active stable trees
- Used by 17+ SoC drivers → broad user impact

**Evidence AGAINST backporting:**
- No explicit Fixes: tag (though prior identical-pattern fix had one,
  and absence of tag is explicitly not a signal per the guidelines)
- Commit message uses "expand" instead of "fix" (but body describes
  concrete failure)
- No Cc: stable from the author

**Stable rules check:**
1. Obviously correct? YES — pure data addition
2. Fixes real bug? YES — pixel clock misprogrammed to ~3.4x wrong rate
3. Important? YES — broken display on affected hardware
4. Small and contained? YES — 2 lines in one file
5. No new features/APIs? YES — extends internal lookup table, not
   exposed
6. Applies to stable? YES — verified identical state across stable trees

**Exception category:** Fits "hardware quirks/workarounds" — enables
specific hardware configurations (10-bit DSI C-PHY panels) that were
previously non-functional due to missing table entries, directly
analogous to adding PCI/USB device IDs or codec quirks.

## Verification

- [Phase 1] Parsed tags: two Reviewed-by from Qualcomm experts, Link to
  lore, no Fixes:/Cc:stable (expected)
- [Phase 2] Diff analysis: 2-line const data addition to
  `frac_table_pixel[]` before sentinel; no control-flow change
- [Phase 3] `git log -- drivers/clk/qcom/clk-rcg2.c` + `git show
  b527358cb4cd5`: confirmed precedent commit adding `{2,3}` was accepted
  with Fixes: tag
- [Phase 3] `git log --author="Pengyu Luo"`: confirmed author has
  multiple legitimate DSI/Qualcomm fixes
- [Phase 4] `b4 dig -c 0f5c8f03d990f`: returned
  `lore.kernel.org/all/20260321095029.2259489-1-mitltlatltl@gmail.com/`
- [Phase 4] `b4 dig -c 0f5c8f03d990f -a`: single v1, no revisions
- [Phase 4] Thread contents via mbox: Taniya Das, Dmitry Baryshkov
  Reviewed-by; Konrad asked a non-blocking question; Bjorn applied with
  "Applied, thanks!"; no NAKs; no stable discussion
- [Phase 5] `grep -rln "clk_pixel_ops" drivers/clk/qcom/`: 17+
  dispcc/gcc drivers use the affected ops (SDM845, SM8250, SM8450,
  SM8550, SM8750, X1E80100, SC7180, SC7280, SC8280XP, QCM2290, SM4450,
  SM6350, SM6375, SM7150, SA8775P, etc.)
- [Phase 6] Examined `drivers/clk/qcom/clk-rcg2.c` at for-greg/5.10-200,
  5.15-200, 6.1-200, 6.6-200, 6.12-200, 6.18-200, 6.19-200:
  `frac_table_pixel[]` identical across all trees — will apply cleanly
- [Phase 6] `grep -rl "b527358cb4cd" /home/sasha/stable-
  queue/releases/`: confirmed prior similar commit was backported to
  4.9.311, 4.14.276, 4.19.238, 5.4.189, 5.10.110, 5.15.33, 5.16.19,
  5.17.2
- [Phase 8] Failure mode from commit body: pclk set to 50455997 Hz
  instead of 172992000 Hz (3.4x off) on 10-bit DSI C-PHY panels — user-
  visible display failure

---

This is a well-reviewed, minimal hardware-enablement fix (analogous to a
hardware quirk) that addresses a documented, reproducible runtime
failure on real hardware. The fix is a 2-line data-table extension with
zero regression risk. There is strong precedent: a commit with the exact
same pattern (`b527358cb4cd5`) was backported broadly to stable. The
affected code is used by 17+ Qualcomm SoC drivers, giving wide user
impact.

**YES**

 drivers/clk/qcom/clk-rcg2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index fc696b66ccda9..6064a0e17d519 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1117,6 +1117,8 @@ static const struct frac_entry frac_table_pixel[] = {
 	{ 4, 9 },
 	{ 1, 1 },
 	{ 2, 3 },
+	{ 16, 35},
+	{ 4, 15},
 	{ }
 };
 
-- 
2.53.0


