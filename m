Return-Path: <linux-arm-msm+bounces-103769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D4fKwUw5ml6tAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:54:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F0642C679
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 830D6308488D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804923EB801;
	Mon, 20 Apr 2026 13:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldV5z1ri"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4CF3EB7FB;
	Mon, 20 Apr 2026 13:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691506; cv=none; b=rb6pEzXfNjL6tzDAgiR4CGZkaU97qFG2kntP2ksReUoqab2bNt+UgqgwSPujVuDnUPlUZZ7D4z2cNT401T61VyJC6+gs3CVOA9NwCBfWokvM1tiGQoXkc720c65DbcXMZsFPIo2ZdHDVe0qZ2f44JGa8fOrF/jh3VD1E7GXj+w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691506; c=relaxed/simple;
	bh=Hf9yTG5cr4alGT2BO4PBU0V4D4wRXPj1kxS6E8TimL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n43Kwg625M25bLt6/pmUYGM5O4jFbDhAcLe/7aTWt0wQ/BP+A4dCngn3lT70te5GU6lrV2U874dhvK4NuqN+yGYsZP02PBqyNxEO3xZ5TTbRWiRMdXtjSjBozpJuxRr+KXN/SRWklz6GYJ0G+I1ZQEtQdOVZ62+zkoQJ4wqcfEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldV5z1ri; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33091C2BCB6;
	Mon, 20 Apr 2026 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691506;
	bh=Hf9yTG5cr4alGT2BO4PBU0V4D4wRXPj1kxS6E8TimL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ldV5z1riys3DD8c6RpHyuVfvn3BfKWl5jvLR44F3bD4iBQZ6nR8b/DzfCNSZspA/M
	 a0uRVXvhnlCC9VDDN2y+P11od4VBgOAOQoUqy8Ff7Tb/I/ZOCu21LoqhX2b1YiKsaG
	 jYRc9orhNt8+96tctaJBNCpDrK0J5YDDhD7eayg+R09zAC0zIn7dcjxyRzoUQquHah
	 /ZyRJ5+GQ8mP7bQpn2Q7MO5nSd36c9wVkrKJhWhahwVlWS0XoCurVEabl6XCyiW6nv
	 v93ZBrQ5nfzLmtYN3XV3SYoxDrnZwDB2vsU3SH52lQbYjKx4NnNMnlrTRZ110C+a1b
	 kH/eK1+ARK/fA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.18] firmware: qcom: scm: Allow QSEECOM on Lenovo IdeaCentre Mini X
Date: Mon, 20 Apr 2026 09:17:44 -0400
Message-ID: <20260420132314.1023554-70-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103769-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 23F0642C679
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

[ Upstream commit a31ad9339eff4ce401dec816b01a94b4e3c47898 ]

The Hamoa-based Lenovo IdeaCentre Mini X provides the same UEFI variable
access through uefisecapp as other Hamoa devices, add it to the
allowlist.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260401-ideacentre-v2-3-5745fe2c764e@oss.qualcomm.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have a thorough picture. Let me compile the analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
- Subsystem: `firmware: qcom: scm`
- Action verb: "Allow" (enable a device on an allowlist)
- Summary: Adds the Lenovo IdeaCentre Mini X to the QSEECOM allowlist
  for UEFI variable access.

**Step 1.2: Tags**
- `Reviewed-by: Dmitry Baryshkov` — Qualcomm maintainer reviewed it
- `Signed-off-by: Bjorn Andersson` — both as author and as committer;
  he's the Qualcomm SCM subsystem maintainer
- `Link:` to lore.kernel.org for the v2 series
- No `Fixes:` tag (expected for a device ID / allowlist addition)
- No `Cc: stable`

**Step 1.3: Commit Body**
The commit explains this is a Hamoa-based device that provides the same
UEFI variable access (through `uefisecapp`) as other Hamoa devices
already on the allowlist. The purpose is to enable UEFI variable access
on this specific hardware.

**Step 1.4: Hidden Bug Fix?**
This is not a hidden bug fix. It's a straightforward device allowlist
addition — enabling existing, validated functionality on a new machine.

Record: This is a device allowlist addition, akin to adding a device ID.

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- 1 file changed: `drivers/firmware/qcom/qcom_scm.c`
- 1 line added: `{ .compatible = "lenovo,ideacentre-mini-01q8x10" }`
- No lines removed (other than context shift)
- Function affected: static array `qcom_scm_qseecom_allowlist[]`

**Step 2.2: Code Flow Change**
Before: The Lenovo IdeaCentre Mini X is not in the allowlist →
`qcom_scm_qseecom_machine_is_allowed()` returns false →
QSEECOM/uefisecapp is not initialized → no UEFI variable access on this
device.
After: The device is matched → QSEECOM is enabled → UEFI variable access
works.

**Step 2.3: Bug Mechanism**
Category: Hardware enablement / device ID addition. This is analogous to
adding a PCI/USB device ID to an existing driver. The driver and feature
exist; only the allowlist entry is new.

**Step 2.4: Fix Quality**
- Trivially correct — a single compatible string added alphabetically to
  an existing table
- Zero regression risk — only affects this specific machine
- Minimal change (1 line)

## PHASE 3: GIT HISTORY

**Step 3.1: Blame**
The allowlist was introduced by `00b1248606ba39` (Maximilian Luz,
2023-08-27) with just ThinkPad X13s. It has been incrementally expanded
since then with many similar one-line additions. The table has existed
since approximately v6.7.

**Step 3.2: No Fixes: tag** — expected for allowlist additions.

**Step 3.3: File History**
Many similar QSEECOM allowlist additions have been committed: Dell XPS
13, Surface Pro, HP Omnibook, ASUS Vivobook, Lenovo Thinkbook 16, etc.
This is a well-established pattern. Each is a standalone one-liner.

**Step 3.4: Author**
Bjorn Andersson is the Qualcomm SCM subsystem maintainer and the main
committer for this driver. High trust level.

**Step 3.5: Dependencies**
No dependencies. This is a self-contained one-line addition to an
existing table.

## PHASE 4: MAILING LIST

b4 dig failed to find the commit (it's not yet in the tree as a
committed hash). The lore link was blocked by anti-bot protection.
However, the Link: tag shows this is v2 of the series, reviewed by
Dmitry Baryshkov, confirming proper review.

Record: Could not fetch lore discussion due to anti-scraping protection.
The commit has proper review tags.

## PHASE 5: CODE SEMANTIC ANALYSIS

The allowlist is checked by `qcom_scm_qseecom_machine_is_allowed()`
which is called during `qcom_scm_qseecom_init()`. This function gates
whether the QSEECOM/uefisecapp platform device is created. Without the
allowlist entry, the specific machine gets an "untested machine,
skipping" message and UEFI variable access is completely unavailable.

This is critical for the device: without this entry, the user cannot
access UEFI variables at all (including boot configuration).

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1: Code existence in stable**
- v6.6: The allowlist does NOT exist (0 matches) → Not applicable
- v6.8+: The allowlist exists (3 matches found)
- The allowlist has been present and growing since approximately
  v6.7/v6.8

The commit is relevant for stable trees v6.8+. However, the current file
in mainline has additional entries that may not all be in older stable
trees. The diff should apply cleanly or with trivial context adjustment
since it's just inserting one line in alphabetical order in a table.

**Step 6.2: Backport complications**
Minor context differences possible (some entries in the list may not be
present in older stables), but since this is adding a line to a simple
table, a backport is trivial — worst case requires manual insertion at
the right alphabetical position.

## PHASE 7: SUBSYSTEM CONTEXT

- Subsystem: Qualcomm firmware / SCM (Secure Channel Manager)
- Criticality: IMPORTANT for Qualcomm ARM laptop users. The QSEECOM
  interface provides UEFI variable access, which is essential for boot
  configuration on these devices.
- Very active subsystem with regular allowlist additions.

## PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1: Affected Users**
Users of the Lenovo IdeaCentre Mini X (Snapdragon/Hamoa-based). Without
this entry, they have no UEFI variable access.

**Step 8.2: Trigger**
Every boot — the allowlist is checked during driver initialization.

**Step 8.3: Severity**
Without this fix: the user cannot access UEFI variables on their
hardware. This is a functional hardware enablement issue.

**Step 8.4: Risk-Benefit**
- Benefit: HIGH — enables essential functionality on real hardware
- Risk: VERY LOW — 1-line addition to a device table, affects only one
  specific machine
- Ratio: Excellent — high benefit, near-zero risk

## PHASE 9: FINAL SYNTHESIS

**Evidence FOR backporting:**
- This is a device allowlist addition — directly analogous to adding a
  device ID, which is an established exception category for stable
- 1-line change, trivially correct, zero regression risk
- Written and committed by the subsystem maintainer (Bjorn Andersson)
- Reviewed by Qualcomm maintainer (Dmitry Baryshkov)
- Follows a well-established pattern (20+ similar commits in history)
- Enables essential UEFI variable access on real shipping hardware

**Evidence AGAINST backporting:**
- The allowlist doesn't exist in v6.6 and earlier (limits applicability
  to v6.8+ stable trees)
- This is technically "new hardware enablement" rather than a "bug fix"

**Decision:** This falls squarely into the **device ID / hardware
allowlist addition** exception category. It's a single-line addition to
an existing allowlist table in an existing driver, enabling known-good
functionality on a new machine. The pattern is identical to adding
PCI/USB device IDs. It has proper review, is written by the maintainer,
and carries essentially zero risk.

## Verification

- [Phase 1] Parsed tags: Reviewed-by Dmitry Baryshkov, Signed-off-by
  Bjorn Andersson (2x — author and committer)
- [Phase 2] Diff: 1 line added to `qcom_scm_qseecom_allowlist[]` array —
  a compatible string
- [Phase 3] git blame: allowlist created by commit `00b1248606ba39`
  (v6.7 era, 2023-08-27)
- [Phase 3] git tag --contains: allowlist first in `next-20251219`, not
  in v6.6
- [Phase 3] v6.8 check: allowlist exists with 3 references (confirmed
  with `git show v6.8:...`)
- [Phase 3] git log: 20+ similar QSEECOM allowlist additions in history
  (established pattern)
- [Phase 4] b4 dig: failed to find commit (not yet in tree); lore
  blocked by anti-bot
- [Phase 5] Allowlist checked in `qcom_scm_qseecom_machine_is_allowed()`
  → gates QSEECOM init → without entry, device prints "untested machine,
  skipping" and UEFI access is disabled
- [Phase 6] Applicable to v6.8+ stable trees only; trivial backport
  (table insertion)
- [Phase 8] Risk: VERY LOW (1 line, only affects one machine); Benefit:
  HIGH (enables UEFI access)
- UNVERIFIED: Exact lore discussion content (anti-bot blocked); does not
  affect decision

**YES**

 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f06bed79666b9..4450741b8221b 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2301,6 +2301,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
+	{ .compatible = "lenovo,ideacentre-mini-01q8x10" },
 	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
-- 
2.53.0


