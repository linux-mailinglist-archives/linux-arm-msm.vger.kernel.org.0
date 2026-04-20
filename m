Return-Path: <linux-arm-msm+bounces-103772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLfHFMY55mlutgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:35:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 212BE42D3A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69DB43355C76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22B43F9F31;
	Mon, 20 Apr 2026 13:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYaGNvCc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D82E3F9F2D;
	Mon, 20 Apr 2026 13:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691567; cv=none; b=DvgthLeICA9GnSvckCMtaqrobXfUuaT68Q3mABlSdeKyIMqHDZiC7ciM4tawmyRtnqbyHXx+Ywp8pHUlXObexCzb6lByE5xAZurZ61h+i00bY3UM1UBSQHPmzAZZVPIswWtjf7BTtmpCoGxGPN6vEj2fTLupLN04oceAx7ZAhZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691567; c=relaxed/simple;
	bh=Aqq2CoKAYC0JIFkME59G9i6dMfRAUh3bvKNHV0ky5ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PYr/+fwijnobUMIF5czt68k1CQqIEoKrMNomUCcK3kOJWdFJbvgu6LuBwx1GWlXH1q9wonkiHBuJXai2wSsUm4foopqwDC5YDVweGV4pbmtfxFkQKImSoNcANLvPJG+yOYbMy7joLEItFfheTLdZwYhBbGu/tdT1UV5tACclQU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYaGNvCc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5CDC2BCB4;
	Mon, 20 Apr 2026 13:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691567;
	bh=Aqq2CoKAYC0JIFkME59G9i6dMfRAUh3bvKNHV0ky5ic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gYaGNvCcrckgUIDnwR+tMKICYrFTEACe/gJcFWzuHEAmmdzEZEO8wnQogfgFxMylF
	 /Smo0ntLl0Cb6y57bJTOJsnB6CDMgvCrDDmbqK2ya04bVjT6xh1WGNGcAGKcsqlV/x
	 zlN1X8Q4/I+wB+9OpiWrMhakd3uyzwVQmRgzhATAkNEP6tF9PCmcrXF1lmm0X8/ieZ
	 GdwKtJ9q6UDTYx+bmSwlZ8zvYSkK8ny7SWqdJRnHIdZS7a0QqDfhLNXz87ikGtWDRN
	 ABd94IR/VBMAh5rxAlIZJBfI+9+t5j7cTqB2fXpAmOJM/RdHEBxlJQlfukwhDkhaC8
	 wYkWEp6AbL90A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Val Packett <val@packett.cool>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.18] firmware: qcom: scm: Allow QSEECOM on ECS LIVA QC710
Date: Mon, 20 Apr 2026 09:18:18 -0400
Message-ID: <20260420132314.1023554-104-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103772-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 212BE42D3A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Val Packett <val@packett.cool>

[ Upstream commit 34a49e8508b5d00816d25fe3758b474471e7e051 ]

Allow this machine to access efivars through qseecom/uefisecapp.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
Link: https://lore.kernel.org/r/20260120234029.419825-11-val@packett.cool
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have a clear picture. Let me finalize my analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
- Subsystem: `firmware: qcom: scm`
- Action: "Allow" — enabling hardware functionality
- Summary: Add ECS LIVA QC710 to the QSEECOM allowlist for EFI variable
  access.

**Step 1.2: Tags**
- `Reviewed-by: Dmitry Baryshkov` — Qualcomm subsystem reviewer
- `Signed-off-by: Val Packett` — patch author
- `Link:` to lore (message-id:
  `20260120234029.419825-11-val@packett.cool`) — patch 11 of a series
- `Signed-off-by: Bjorn Andersson` — subsystem maintainer who merged it
- No Fixes: tag (expected for an allowlist addition)
- No Cc: stable (expected for this review)

**Step 1.3: Commit Body**
The body is a single sentence: "Allow this machine to access efivars
through qseecom/uefisecapp." Without this entry, the ECS LIVA QC710
cannot access UEFI EFI variables, which are needed for firmware settings
and boot configuration.

**Step 1.4: Hidden Bug Fix Detection**
This is not a hidden bug fix. It is a straightforward hardware
enablement / device ID addition.

Record: This is a device allowlist addition, enabling EFI variable
access on a specific Qualcomm-based machine.

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- 1 file changed: `drivers/firmware/qcom/qcom_scm.c`
- 1 line added: `{ .compatible = "ecs,liva-qc710" },`
- Function: N/A — it's a static data table entry
- Scope: Trivially small, single-line addition to an allowlist array

**Step 2.2: Code Flow Change**
Before: ECS LIVA QC710 is not in the allowlist, so
`qcom_scm_qseecom_init()` prints "untested machine, skipping" and
QSEECOM/uefisecapp is not initialized.
After: The machine is matched, QSEECOM is initialized, and EFI variables
become accessible.

**Step 2.3: Bug Mechanism**
Category: Hardware enablement / device ID addition. Not a bug fix per
se, but enables critical firmware functionality (EFI variable access) on
a specific machine.

**Step 2.4: Fix Quality**
- Obviously correct — adding one compatible string to a sorted allowlist
- Minimal / surgical — one line
- Zero regression risk — only affects the specific machine by compatible
  string match
- Reviewed by Qualcomm reviewer, merged by subsystem maintainer

## PHASE 3: GIT HISTORY

**Step 3.1: Blame**
The allowlist was introduced in commit `00b1248606ba39` ("Add support
for Qualcomm Secure Execution Environment SCM interface"), tagged
`v6.6-rc1-2`, which means it appeared in v6.7. Multiple similar entries
have been added since.

**Step 3.3: File History**
There are 17+ similar "Allow QSEECOM on <machine>" commits — this is a
well-established pattern.

**Step 3.5: Dependencies**
The diff also shows `asus,vivobook-s15-x1p4` and `qcom,purwa-iot-evk`
entries that don't exist in the current tree. These come from other
patches in the same series (patch 11 of a multi-patch series). However,
the `ecs,liva-qc710` line itself is independent — it's just an addition
to an alphabetically-sorted list with no dependencies on other entries.

## PHASE 4: MAILING LIST

The Link header references `20260120234029.419825-11-val@packett.cool`,
indicating this is patch 11 of a larger series. The patch was reviewed
by Dmitry Baryshkov (Qualcomm reviewer) and merged by Bjorn Andersson
(the subsystem maintainer).

## PHASE 5: CODE SEMANTIC ANALYSIS

The allowlist is used in `qcom_scm_qseecom_init()` which checks
`of_machine_device_match(qcom_scm_qseecom_allowlist)` (in mainline) or
`qcom_scm_qseecom_machine_is_allowed()` (in older stable trees). If the
machine isn't in the list, QSEECOM is skipped entirely. The change only
affects the specific ECS LIVA QC710 machine.

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1: Code Existence in Stable Trees**
- v6.6: Does NOT have the allowlist (code doesn't exist) — not
  applicable
- v6.7 through v6.13+: DO have the allowlist
- Active stable trees with this code: 6.12.y and any other LTS ≥ 6.7

**Step 6.2: Backport Complications**
The one-line addition should apply cleanly. In older stable trees, the
surrounding list entries may differ slightly (fewer entries), but the
addition of a new compatible string to the sorted list is trivial to
resolve if there's a minor context conflict. The function mechanism (old
`qcom_scm_qseecom_machine_is_allowed` vs new `of_machine_device_match`)
doesn't matter — only the data table is modified.

## PHASE 7: SUBSYSTEM CONTEXT

- Subsystem: Qualcomm SCM firmware interface
- Criticality: PERIPHERAL — affects users of specific Qualcomm ARM
  platforms
- This is an actively developed subsystem with many contributors adding
  machine support

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1: Who is Affected**
Only users of the ECS LIVA QC710 (Qualcomm-based mini PC).

**Step 8.2: Trigger**
Every boot — without this entry, EFI variables are completely
inaccessible on this machine.

**Step 8.3: Failure Mode**
Without the fix: EFI variables are inaccessible, which means users
cannot manage boot configuration, firmware settings, or Secure Boot
through the standard Linux efivars interface. Severity: MEDIUM-HIGH for
users of this specific hardware.

**Step 8.4: Risk-Benefit Ratio**
- BENEFIT: Enables critical firmware functionality for a specific
  machine
- RISK: Essentially zero — only a data table entry, only affects the
  specific machine by exact compatible string match
- Assessment: Very favorable ratio

## PHASE 9: FINAL SYNTHESIS

**Evidence FOR backporting:**
- Classic device ID / allowlist addition pattern — exception category
  that is routinely backported
- One-line change with zero regression risk
- Enables critical firmware functionality (EFI variable access)
- Well-reviewed by subsystem reviewer and maintainer
- Established pattern with 17+ identical precedent commits

**Evidence AGAINST backporting:**
- This is hardware enablement, not a bug fix in the traditional sense
- Only affects a single specific machine
- The allowlist doesn't exist in v6.6.y (oldest active LTS)

**Stable Rules Checklist:**
1. Obviously correct? YES — single allowlist entry
2. Fixes a real bug? It enables required functionality — comparable to a
   device ID addition
3. Important issue? Medium-important for affected hardware users
4. Small and contained? YES — 1 line
5. No new features? Correct — just enables existing feature on
   additional hardware
6. Can apply to stable? YES for 6.12.y and later stable trees

**Exception Category:** Device ID / hardware allowlist addition to
existing driver — this is an explicitly allowed exception for stable
trees.

## Verification

- [Phase 1] Parsed tags: Reviewed-by Dmitry Baryshkov, Link to lore,
  Signed-off-by Bjorn Andersson (maintainer)
- [Phase 2] Diff: Single line `{ .compatible = "ecs,liva-qc710" }` added
  to allowlist table
- [Phase 3] git blame: allowlist introduced in 00b1248606ba39 at
  v6.6-rc1-2, present from v6.7+
- [Phase 3] git log: 17+ identical "Allow QSEECOM on <machine>" commits
  exist as precedent
- [Phase 4] b4 dig for similar commit (30ee285f1e3cd): confirmed review
  and merge pattern
- [Phase 5] Allowlist controls access in qcom_scm_qseecom_init(), only
  matched machine is affected
- [Phase 6] Allowlist exists in v6.7+ (verified via git show for v6.6
  through v6.13); not in v6.6
- [Phase 6] v6.12 uses `qcom_scm_qseecom_machine_is_allowed()` — data
  table change applies regardless
- [Phase 8] Risk: zero — one-line data table entry, only affects
  specific machine by exact compatible match

This is a textbook device ID / allowlist addition. It's a single line,
zero-risk, enables important firmware functionality for a specific
machine, and follows a long-established pattern of identical commits
that are routinely backported.

**YES**

 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 2fe1632f06e90..f06bed79666b9 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2296,6 +2296,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "dell,inspiron-14-plus-7441" },
 	{ .compatible = "dell,latitude-7455" },
 	{ .compatible = "dell,xps13-9345" },
+	{ .compatible = "ecs,liva-qc710" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
-- 
2.53.0


