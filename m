Return-Path: <linux-arm-msm+bounces-103776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EDnI6g25mkmtgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:22:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 094E542CF3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BE323219FD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F96A43DA2E;
	Mon, 20 Apr 2026 13:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHogR+Bs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BD143DA26;
	Mon, 20 Apr 2026 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691799; cv=none; b=abPZVGn3/RtA5vCo/OiS7I54ynb3fwudSHLf+YD5IrC+wMF0h6T7/7F7prdooKRr2Dcxc2yHm5nyNJvoaksZRZVg82Gs7rqrY+Y4nDZ4p59i2E/laEM8Jf8zGq9EKZS/d3e2iOOEZWyybaMmTX0e1MZW2niNie/me8yyzL/Tstg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691799; c=relaxed/simple;
	bh=JDWJGiM6aOLHlB0Z5OiIY/34rqLyGSQTW/tZJy53How=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H0wgudoz/up7+SVsMeZIwyDg26W/Ul43iwnPo5tUbPK3GmmQl4zifFJ2ZamLDpHxPKTkpudN3Oycnck3fqEjNW0dBVd4Iki1diNYohWZh90CXKyOvOxp1ltYCg/Kw9xp3WTc6uzCEKWSMG4rcwX+CrKxCzwlXdOVf6rJqUwZTCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHogR+Bs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B77C19425;
	Mon, 20 Apr 2026 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691798;
	bh=JDWJGiM6aOLHlB0Z5OiIY/34rqLyGSQTW/tZJy53How=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lHogR+Bs5q1KG/kPhyvh4juNcsgGnNFC9wkWSFvqS/mK61kbG5QSbPThabS/LBkNS
	 Ts3H5alfhX9x65YKG4m7alNocJEEGzNa6Ks67TitmoswewiSnfFNUvnrDUtuywDeai
	 KuP/fd9wsjMZnGF/oLF6FONUYAUxTNCN//mjozgpRUZIUK0vOHTgztmG++Jc7MQ7GY
	 a5zSaC6KPWGTrP4wRDu+FH5hgrxrC5HVo6NRWhd4LUyOB3Vk8CGkenHfSFgpnda6CQ
	 7a0FyF5q0G75awdbbGJ/HDRYWN30fpfSZi+dFDyTIXpWxdI1Bk/RCHA3AK86vZ7tSL
	 Ka74IP3IKIPAQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Colin K. Williams" <colin@li-nk.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.18] firmware: qcom: scm: allow QSEECOM on ASUS Vivobook X1P42100 variant
Date: Mon, 20 Apr 2026 09:19:54 -0400
Message-ID: <20260420132314.1023554-200-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103776-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,li-nk.org:email,oldschoolsolutions.biz:email]
X-Rspamd-Queue-Id: 094E542CF3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

[ Upstream commit 26b86610650eaac17bf6574f34d9119151b95483 ]

Enables access to EFI variables on this machine.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Colin K. Williams <colin@li-nk.org>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Link: https://lore.kernel.org/r/20260214-b4-vivobook-v3-2-3c88065bbf77@oldschoolsolutions.biz
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Here is my complete analysis:

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
- Subsystem: `firmware: qcom: scm`
- Action verb: "allow" — enabling a device on an existing allowlist
- Summary: Add ASUS Vivobook X1P42100 variant to the QSEECOM allowlist

**Step 1.2: Tags**
- `Reviewed-by: Dmitry Baryshkov` — a well-known Qualcomm subsystem
  reviewer
- `Tested-by: Colin K. Williams` — independently tested by another
  person
- `Signed-off-by: Jens Glathe` — author, also contributed multiple other
  QSEECOM allowlist entries (HP Omnibook X14, Lenovo Thinkbook 16,
  Windows Dev Kit 2023)
- `Signed-off-by: Bjorn Andersson` — subsystem maintainer who accepted
  the patch
- `Link:` to lore.kernel.org (v3 of the patch series)
- No syzbot, no Fixes: tag (expected)

**Step 1.3: Body**
- "Enables access to EFI variables on this machine."
- Without this entry, the ASUS Vivobook X1P42100 variant cannot access
  EFI variables, which is a fundamental firmware interface needed for
  boot configuration and UEFI operations.

**Step 1.4: Hidden Bug Fix?**
This is not a disguised bug fix — it's an explicit hardware allowlist
addition.

## PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- 1 file changed: `drivers/firmware/qcom/qcom_scm.c`
- 1 line added: `{ .compatible = "asus,vivobook-s15-x1p4" },`
- Function: static data table `qcom_scm_qseecom_allowlist[]`

**Step 2.2: Code Flow**
- Before: The allowlist does not include the X1P42100 variant;
  `qcom_scm_qseecom_init()` skips QSEECOM initialization on this
  machine, printing "untested machine, skipping"
- After: The allowlist includes the variant; QSEECOM is initialized,
  enabling EFI variable access

**Step 2.3: Bug Mechanism**
Category: Hardware enablement — adding a device compatible string to an
existing allowlist table. This is functionally identical to adding a
PCI/USB device ID.

**Step 2.4: Fix Quality**
- Obviously correct: a single compatible string added to a static array
- Minimal/surgical: 1 line
- Regression risk: effectively zero — only affects the specific ASUS
  Vivobook X1P42100 variant
- Pattern is well-established: the allowlist has had dozens of similar
  additions

## PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: Blame**
The allowlist was created in commit `00b1248606ba39` (2023-08-27) and
first appeared in v6.7. The table structure has been unchanged; only new
entries have been added over time.

**Step 3.2: No Fixes: tag** — expected.

**Step 3.3: File History**
Many identical one-line QSEECOM allowlist additions have been made:
Dell, HP, Lenovo, Microsoft Surface, Huawei, Medion, etc. This is a
well-trodden pattern.

**Step 3.4: Author**
Jens Glathe has contributed 3 other QSEECOM allowlist entries (HP
Omnibook X14, Lenovo Thinkbook 16, Windows Dev Kit 2023). They are a
regular contributor to this subsystem.

**Step 3.5: Dependencies**
None. This is a self-contained one-line table addition with no code
dependencies.

## PHASE 4: MAILING LIST RESEARCH

The Link tag shows this is v3 of the series
(`20260214-b4-vivobook-v3-2-...`), meaning it went through review
iterations. The patch was reviewed by Dmitry Baryshkov (prominent
Qualcomm maintainer) and tested by an independent tester (Colin K.
Williams). The subsystem maintainer Bjorn Andersson applied it.

Lore was unreachable via WebFetch (Anubis protection), but b4 dig
confirmed the pattern matches other QSEECOM allowlist additions.

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1-5.4:** The `qcom_scm_qseecom_allowlist` is used in
`qcom_scm_qseecom_init()` which calls
`of_machine_device_match(qcom_scm_qseecom_allowlist)` (v6.19+) or the
open-coded equivalent in earlier kernels. If the machine's compatible
string isn't in the list, QSEECOM is not initialized, and EFI variable
access is unavailable.

## PHASE 6: STABLE TREE ANALYSIS

**Step 6.1:** The allowlist was introduced in v6.7. It exists in stable
trees v6.12.y and later. It does NOT exist in v6.6.y or earlier.

**Step 6.2:** Backport should be clean for v6.12.y+ since the table
format is identical. The only difference is that v6.19 introduced
`of_machine_device_match()` instead of the open-coded function, but that
doesn't affect the table entries.

**Step 6.3:** No related fixes already in stable.

## PHASE 7: SUBSYSTEM CONTEXT

- Subsystem: `firmware/qcom` — Qualcomm firmware interface, used by
  Qualcomm Snapdragon ARM64 laptops
- Criticality: IMPORTANT — these are real consumer laptops (ASUS
  Vivobook line)
- The subsystem is active with regular QSEECOM allowlist additions

## PHASE 8: IMPACT AND RISK

**Step 8.1:** Affected users: owners of ASUS Vivobook X1P42100 variant
laptops running Linux
**Step 8.2:** Trigger: every boot — without this entry, EFI variables
are inaccessible on this hardware
**Step 8.3:** Failure mode: no EFI variable access = unable to manage
boot entries, firmware settings. Severity: MEDIUM-HIGH for affected
users
**Step 8.4:**
- Benefit: HIGH — enables core firmware functionality on real consumer
  hardware
- Risk: VERY LOW — 1 line, only affects the specific machine
- Ratio: Excellent

## PHASE 9: FINAL SYNTHESIS

**Evidence FOR:**
- Classic device ID / allowlist addition — explicitly listed as an
  exception in stable rules
- 1-line change, zero regression risk to any other machine
- Reviewed by Qualcomm subsystem reviewer, tested independently,
  accepted by maintainer
- Well-established pattern with dozens of identical precedents
- Enables fundamental functionality (EFI variable access) on real
  consumer hardware
- Author is a known contributor to this exact subsystem

**Evidence AGAINST:**
- None significant. The only caveat is it doesn't apply to v6.6.y or
  earlier (the allowlist didn't exist then)

**Stable Rules Checklist:**
1. Obviously correct? YES — single compatible string in a static table
2. Fixes real issue? YES — enables EFI access on real hardware
3. Important? YES — EFI variables are fundamental for boot management
4. Small and contained? YES — 1 line
5. No new features? CORRECT — enables existing feature on additional
   hardware
6. Applies to stable? YES — clean for v6.12.y+

**Exception Category: Device ID / hardware allowlist addition** —
explicitly allowed.

## Verification

- [Phase 1] Parsed tags: Reviewed-by Dmitry Baryshkov, Tested-by Colin
  K. Williams, maintainer SOB Bjorn Andersson
- [Phase 2] Diff analysis: 1 line added to static
  `qcom_scm_qseecom_allowlist[]` table
- [Phase 3] git blame: allowlist created in `00b1248606ba39` (v6.7,
  2023-08-27), table structure unchanged
- [Phase 3] git log --grep="QSEECOM": confirmed ~18 similar allowlist
  additions over time
- [Phase 3] git log --author="Jens Glathe": author has 3 prior QSEECOM
  allowlist contributions
- [Phase 4] b4 dig: lore thread found for similar commits confirming
  review pattern
- [Phase 4] Link tag shows v3 — patch went through review iterations
- [Phase 5] Grep: `qcom_scm_qseecom_allowlist` used in
  `qcom_scm_qseecom_init()` at line 2352
- [Phase 6] `git tag --contains 00b1248606ba39`: first in v6.7, exists
  in v6.12.y+ stable trees
- [Phase 6] `f83b42705782c` (Simplify with of_machine_device_match) is
  v6.19+, does not affect table format
- [Phase 8] 1-line change with zero cross-machine risk, enables EFI on
  specific hardware

**YES**

 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 8fbc96693a55f..2fe1632f06e90 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2290,6 +2290,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
+	{ .compatible = "asus,vivobook-s15-x1p4" },
 	{ .compatible = "asus,zenbook-a14-ux3407qa" },
 	{ .compatible = "asus,zenbook-a14-ux3407ra" },
 	{ .compatible = "dell,inspiron-14-plus-7441" },
-- 
2.53.0


