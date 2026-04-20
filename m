Return-Path: <linux-arm-msm+bounces-103766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGbADe0u5mliswEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:49:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0E442C52E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BC6830B244A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D93B3D5676;
	Mon, 20 Apr 2026 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uliTc7Mw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3768B3B4EA0;
	Mon, 20 Apr 2026 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691422; cv=none; b=osqSP/sdrsClvkwMpdvCoqti9H1aMiVXHUfAyeZU7dVCODfumr+jgnM9B9S9NOCNiZllisu8ATlVO6bWcR5LYZ+tu1vmrD/gRrJ+grbxGMsUVuLkz/EFU0wu39VLt2i6WG0JLFrpWftyIvV8qA8yxH7ckeWf55bP0atNT4mEaNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691422; c=relaxed/simple;
	bh=Qx5BWE5JKdzh50v31WfXTYccvFO/EIWCcAxnDRZsVg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c4gSCBGx/zmP9nbR1hidslxlPZUw/CH36uJoLyi474eKzxxfoyKilOmOCIIainrfKMYaOF4QFzshIEYCxftbzHhNeZXBrdPEVz0RkhKfnhZx8Xy8B2dA3/251ACCMUvxA6YHuGNpM60meQvxsF/bCwuANcUFsq5sNL7sxKn3p9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uliTc7Mw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCA0C2BCB7;
	Mon, 20 Apr 2026 13:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691422;
	bh=Qx5BWE5JKdzh50v31WfXTYccvFO/EIWCcAxnDRZsVg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uliTc7Mwhg6ir8I3JWjpDOa47avXLxap9LYKlmDvU5dYimum7XZml9iL1V0YLj8/a
	 PgA6ySUaPXflaxO8XVUeynqLCg+dfHksh8CMBAuiMOc/UWgKMYbi/qhQ+yNywuWtAx
	 m9/Rc0xa1ZCQx3ROw0sPS9DaKLIaUzyyOGxhYqlHfb6dCdEsvE87EJ57KATqBalbtG
	 AstClvkzkQHu2KO0jZCX9Wexoi9ADesBht4LUu4MRjys0tnuCfc00+bY6CDdeGdK4p
	 NW/Bh5/rCYipiL0jBARwbJFy9bizmmsE+5412RqUbjjVgSetkgBcanExqAuHF/VDzf
	 Z/u9UmBk0mtlA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.15] remoteproc: qcom: Fix minidump out-of-bounds access on subsystems array
Date: Mon, 20 Apr 2026 09:16:51 -0400
Message-ID: <20260420132314.1023554-17-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103766-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: EB0E442C52E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

[ Upstream commit 743cfae79d2458e241b06ed523c28a09f1449b75 ]

MAX_NUM_OF_SS was hardcoded to 10 in the minidump_global_toc struct,
which is a direct overlay on an SMEM item allocated by the firmware.
Newer Qualcomm SoC firmware allocates space for more subsystems, while
older firmware only allocates space for 10. Bumping the constant would
cause Linux to read/write beyond the SMEM item boundary on older
platforms.

Fix this by converting subsystems[] to a flexible array member and
deriving the actual number of subsystems at runtime from the size
returned by qcom_smem_get(). Add a bounds check on minidump_id against
the derived count before indexing into the array.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260331171243.1962067-1-mukesh.ojha@oss.qualcomm.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have enough information to complete my analysis.

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1 - Subject Line Parse:**
Record: Subsystem `remoteproc: qcom:`; action verb `Fix`; summary: fix
out-of-bounds access on minidump subsystems array.

**Step 1.2 - Tags:**
Record:
- `Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>` (author,
  Qualcomm/remoteproc contributor)
- `Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>` (subsystem
  contributor)
- `Link: https://lore.kernel.org/r/20260331171243.1962067-1-
  mukesh.ojha@oss.qualcomm.com`
- `Signed-off-by: Bjorn Andersson <andersson@kernel.org>` (remoteproc
  co-maintainer)
- No `Cc: stable@vger.kernel.org`, no `Fixes:` tag (expected for review
  candidates)

**Step 1.3 - Commit Body:**
Record: Bug description: `MAX_NUM_OF_SS` hardcoded to 10 but
`minidump_global_toc` overlays SMEM item allocated by firmware; newer
firmware allocates more subsystems; bumping constant would overflow SMEM
on older platforms. Fix: convert to flexible array, derive count at
runtime from `qcom_smem_get()` size, add bounds check.

**Step 1.4 - Hidden Fix:**
Record: Explicit bug fix ("Fix ... out-of-bounds access") - not hidden.

## PHASE 2: DIFF ANALYSIS

**Step 2.1 - Inventory:**
Record: Single file `drivers/remoteproc/qcom_common.c`; +14/-3 lines;
modifies `qcom_minidump()` function and `struct minidump_global_toc`;
surgical, single-file fix.

**Step 2.2 - Code Flow:**
Record: Before: `qcom_smem_get(...,NULL)` ignores size; directly indexes
`toc->subsystems[minidump_id]` which is declared `[MAX_NUM_OF_SS=10]`.
After: requests actual SMEM size via `&toc_size`; computes `num_ss` from
`(toc_size - offsetof(...,subsystems))/sizeof(subsystem)`; returns early
with error if `minidump_id >= num_ss`.

**Step 2.3 - Bug Mechanism:**
Record: Category: **memory safety / out-of-bounds access**. With
`MAX_NUM_OF_SS=10`, accessing `toc->subsystems[20]` (as done for SA8775p
CDSP1) is out-of-bounds per the C array type. Fix converts to flexible
array member and validates index at runtime.

**Step 2.4 - Fix Quality:**
Record: Obviously correct; minimal/surgical; preserves behavior for
valid indexes (< actual count); no regression risk for existing devices
using minidump_id 3/4/5/7; depends on `qcom_smem_get()` reporting
accurate size which is its contract.

## PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1 - Blame:**
Record: `MAX_NUM_OF_SS=10` was introduced by `8ed8485c4f056
("remoteproc: qcom: Add capability to collect minidumps")` in Nov 2020
(v5.11). The buggy code has been present since v5.11.

**Step 3.2 - Fixes Tag:**
Record: No `Fixes:` tag present. The bug was technically present since
minidump was added in v5.11, but only becomes an observable OOB when a
device's `minidump_id` exceeds 9.

**Step 3.3 - File History:**
Record: The file has been minimally modified. Key related commits:
- `9091225ba28c0` ("remoteproc: qcom: pas: Add support for SA8775p ADSP,
  CDSP and GPDSP") in v6.12-rc1 added `minidump_id = 20, 21, 22` for
  sa8775p CDSP1, GPDSP0, GPDSP1 → this is when the bug becomes
  triggerable.
- `318da1371246f` ("remoteproc: qcom: Expand MD_* as MINIDUMP_*") - same
  author, minidump cleanup
- Standalone fix, not part of a series.

**Step 3.4 - Author Context:**
Record: Mukesh Ojha is a regular Qualcomm remoteproc contributor and the
primary author of minidump-related work (multiple minidump cleanup
commits). Fix from a knowledgeable author.

**Step 3.5 - Dependencies:**
Record: Only dependency is that `qcom_smem_get()` supports returning
size via pointer, which it has done since inception (verified in all
stable trees).

## PHASE 4: MAILING LIST RESEARCH

**Step 4.1 - b4 dig:**
Record: Found at `https://lore.kernel.org/all/20260331171243.1962067-1-
mukesh.ojha@oss.qualcomm.com/`. Only v2 was applied.

**Step 4.2 - Reviewers:**
Record: Sent to Bjorn Andersson (co-maintainer), Mathieu Poirier (co-
maintainer), linux-arm-msm, linux-remoteproc. Reviewed/Acked by Konrad
Dybcio.

**Step 4.3 - History - v1 Discussion:**
Record: Fetched v1 thread
(`20250808164417.4105659-1-mukesh.ojha@oss.qualcomm.com`). V1 was a
naïve fix bumping `MAX_NUM_OF_SS` from 10 to 30. Bjorn Andersson
objected: "this number is used to size the minidump_global_toc struct...
Doesn't this imply that on older platforms you've now told Linux (and
your debugger) that it's fine to write beyond the smem item?" and
suggested "check the returned size of the qcom_smem_get() call." Author
Mukesh specifically asked **"do you think it should a fix (cc
stable)?"**. V2 implemented exactly Bjorn's suggestion, received Ack,
and was applied.

**Step 4.4 - Series:**
Record: Standalone single-patch submission.

**Step 4.5 - Stable Mailing List:**
Record: No separate stable discussion visible; author explicitly
considered it a stable fix but final v2 lacks Cc:stable tag.

## PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1 - Key Functions:**
Record: `qcom_minidump()` is the modified function; `struct
minidump_global_toc` is the modified type.

**Step 5.2 - Callers:**
Record: `qcom_minidump()` is called from exactly one place -
`qcom_pas_minidump()` in `drivers/remoteproc/qcom_q6v5_pas.c:151`. This
is registered as `.coredump` callback in `qcom_pas_minidump_ops` (line
531), which is invoked by `rproc_boot_recovery()` in
`remoteproc_core.c:1798` when a crashed remoteproc is being recovered.

**Step 5.3 - Callees:**
Record: Calls `qcom_smem_get()` (SMEM item retrieval), `dev_err()`, and
then `rproc_coredump()` or `qcom_add_minidump_segments()` +
`rproc_coredump_using_sections()`.

**Step 5.4 - Call Chain / Reachability:**
Record: Reachable from remoteproc crash recovery: remoteproc crash →
`rproc_boot_recovery()` → `rproc->ops->coredump()` →
`qcom_pas_minidump()` → `qcom_minidump(rproc, pas->minidump_id, ...)`.
With `pas->minidump_id = 20/21/22`, this triggers OOB on
`toc->subsystems[20]` indexing. This path is triggered automatically
when the remoteproc crashes (real-world trigger, not obscure).

**Step 5.5 - Similar Patterns:**
Record: Verified the file contains only this one use of the
`subsystems[]` array. Checked `minidump_id` values in `qcom_q6v5_pas.c`:
values 3, 4, 5, 7, 20, 21, 22 are used. The 20/21/22 are all for
`sa8775p` CDSP1/GPDSP0/GPDSP1 resources.

## PHASE 6: CROSS-REFERENCING STABLE TREES

**Step 6.1 - Does Buggy Code Exist?**
Record: Verified by inspecting each stable branch:

| Stable | MAX_NUM_OF_SS=10 | minidump_id 20/21/22 | Bug triggers? |
|--------|------------------|----------------------|---------------|
| p-6.1  | Yes              | No                   | No (harmless) |
| p-6.6  | Yes              | Yes (3 entries)      | **Yes**       |
| p-6.12 | Yes              | Yes (3 entries)      | **Yes**       |
| p-6.15 | Yes              | Yes (3 entries)      | **Yes**       |
| p-6.16 | Yes              | Yes (3 entries)      | **Yes**       |
| p-6.17 | Yes              | Yes (3 entries)      | **Yes**       |

Stable 6.6.y through 6.17.y all have the buggy configuration. 6.1.y has
the limit but no triggering minidump_ids, so safe.

**Step 6.2 - Backport Complications:**
Record: Diffed `qcom_common.c` across p-6.12, p-6.15, p-6.17 - file is
identical across these stable trees. Fix should apply cleanly. For p-6.6
the surrounding code is functionally identical. `qcom_smem_get()`
signature with `size_t *size` parameter is unchanged across all trees
(verified in p-6.6).

**Step 6.3 - Related Fixes in Stable:**
Record: No prior fix for this specific issue exists in stable trees; the
MAX_NUM_OF_SS limit has been 10 since minidump was added.

## PHASE 7: SUBSYSTEM CONTEXT

**Step 7.1 - Subsystem:**
Record: `drivers/remoteproc/qcom_common.c` - PERIPHERAL (Qualcomm-
specific remoteproc common helpers, affects only Qualcomm SoC users,
primarily SA8775p automotive).

**Step 7.2 - Activity:**
Record: Actively maintained subsystem with recent activity.

## PHASE 8: IMPACT AND RISK

**Step 8.1 - Affected Users:**
Record: Driver-specific - SA8775p SoC users (Qualcomm automotive
platform) using remoteproc/minidump for CDSP1, GPDSP0, or GPDSP1
subsystems.

**Step 8.2 - Trigger:**
Record: Triggered when a SA8775p CDSP1/GPDSP0/GPDSP1 remoteproc crashes
and `rproc_boot_recovery()` invokes the coredump callback. Cannot be
triggered by unprivileged users directly; occurs on hardware/firmware-
induced remoteproc crashes.

**Step 8.3 - Failure Severity:**
Record: With `MAX_NUM_OF_SS=10` and `minidump_id=20`,
`&toc->subsystems[20]` reads past the declared struct end. On SA8775p
the firmware's SMEM item is sized for 23+ entries, so reads land within
SMEM but access memory not described by the Linux struct (UBSAN would
flag this). With a UBSAN-enabled kernel → WARN/report. Without UBSAN →
reads memory bytes 320+ from struct start, potentially interprets them
as `status`/`enabled`/`regions_baseptr`. If `regions_baseptr` has non-
zero bits from surrounding SMEM, the code proceeds to
`qcom_add_minidump_segments()` which calls `ioremap()` with attacker-
uncontrolled but wrong values, and `rproc_coredump_add_custom_segment`
with garbage `da`/`size`. Severity: **MEDIUM-HIGH** - not a routine
crash but a real OOB in crash-recovery path that can cause incorrect
behavior, broken minidump collection, and potentially ioremap of wrong
addresses.

**Step 8.4 - Risk-Benefit:**
Record:
- Benefit: Fixes real OOB on SA8775p automotive SoC users; enables
  correct minidump collection on these subsystems.
- Risk: Very low - fix is +14/-3 lines, surgical, only affects the path
  that was broken; does not change behavior for valid minidump_ids (<
  real count); doesn't alter the SMEM overlay layout (flexible array
  occupies the same offset as the previous fixed array).
- Assessment: Positive risk-benefit.

## PHASE 9: FINAL SYNTHESIS

**Step 9.1 - Evidence:**
For:
- Real OOB bug reachable from remoteproc crash path on SA8775p
- Verified triggering config (minidump_id 20/21/22) is present in stable
  trees 6.6.y–6.17.y
- Small, contained fix (single file, single function, ~17 lines)
- Reviewed and Acked by subsystem contributor
- Author explicitly considered it stable-worthy
- Applied cleanly across stable trees (file identical across
  6.12/6.15/6.17)
- Fix doesn't change behavior for existing working configurations
- Addresses exact concern raised by maintainer Bjorn in v1 review

Against:
- No `Cc: stable` tag on final patch
- No explicit `Fixes:` tag
- Only affects SA8775p users (peripheral driver)
- Crash-recovery path, not hot path

Unresolved: None material.

**Step 9.2 - Stable Rules Checklist:**
1. Obviously correct? Yes - proper size-derivation from SMEM + bounds
   check.
2. Fixes real bug? Yes - OOB access verified via source inspection.
3. Important issue? Medium - OOB with potential for misbehavior in crash
   recovery.
4. Small/contained? Yes - +14/-3 in one file.
5. No new features? Correct - pure bug fix.
6. Applies to stable? Yes - verified file identical in 6.12/6.15/6.17;
   p-6.6 is compatible.

**Step 9.3 - Exceptions:**
Not a device ID/quirk/DT/build/doc exception; a standard bug fix.

**Step 9.4 - Decision:**
YES - this fixes a real, verifiable out-of-bounds memory access
reachable in a realistic path (remoteproc crash recovery on SA8775p). It
satisfies all stable kernel rules.

## Verification

- [Phase 1] Parsed commit message: confirmed Acked-by Konrad, SoB from
  Bjorn Andersson, Link to lore; no stable/Fixes tag (expected).
- [Phase 2] Read the diff: verified `MAX_NUM_OF_SS` removed,
  `subsystems[]` changed to flexible array, `qcom_smem_get()` now
  requests `toc_size`, `num_ss` derived via `offsetof`, and bounds check
  added.
- [Phase 3.1] Ran `git blame` on lines 30-35 of
  `drivers/remoteproc/qcom_common.c`: confirmed `MAX_NUM_OF_SS`
  originated from `8ed8485c4f056` (Siddharth Gupta, 2020-11-19).
- [Phase 3.1] `git describe --contains 8ed8485c4f056` →
  `v5.11-rc1~148^2~10`: minidump feature introduced in v5.11.
- [Phase 3.3] `git log -S "minidump_id = 20"` → `9091225ba28c0` (SA8775p
  support) in v6.12-rc1 (`git describe --contains`).
- [Phase 3.3] `git show 9091225ba28c0` confirmed minidump_id = 20, 21,
  22 added for sa8775p CDSP1/GPDSP0/GPDSP1.
- [Phase 4.1] `b4 dig -c 743cfae79d245` → found at lore v2 URL; `-a`
  shows only v2 in this series.
- [Phase 4.3] `b4 mbox` on v1 URL `20250808164417.4105659-1-...`:
  retrieved v1 discussion; confirmed Bjorn objected to v1's naïve
  constant bump and suggested the exact approach used in v2; author
  asked about Cc: stable.
- [Phase 5.2] `grep "qcom_minidump"` in drivers/remoteproc: confirmed
  single caller in `qcom_q6v5_pas.c:151` via
  `qcom_pas_minidump_ops.coredump`.
- [Phase 5.2] `grep "coredump"` in remoteproc_core.c: confirmed
  invocation from `rproc_boot_recovery()` line 1798.
- [Phase 5.5] `grep "minidump_id = "` in `qcom_q6v5_pas.c`: confirmed
  values 3, 4, 5, 7, 20, 21, 22 - three are out-of-bounds for
  MAX_NUM_OF_SS=10.
- [Phase 6.1] `git show p-6.X:drivers/remoteproc/qcom_common.c | grep
  MAX_NUM_OF_SS`: all stable branches (6.1, 6.6, 6.12, 6.15, 6.16, 6.17)
  have `MAX_NUM_OF_SS=10`.
- [Phase 6.1] `git show p-6.X:drivers/remoteproc/qcom_q6v5_pas.c | grep
  -c "minidump_id = 2[012]"`: p-6.1=0, p-6.6=3, p-6.12=3, p-6.15=3,
  p-6.16=3, p-6.17=3. So bug triggers in 6.6.y through 6.17.y.
- [Phase 6.2] Diffed `qcom_common.c` between p-6.12, p-6.15, p-6.17 -
  files identical, fix should apply cleanly.
- [Phase 6.2] `git show p-6.6:drivers/soc/qcom/smem.c | grep
  qcom_smem_get`: `qcom_smem_get(unsigned host, unsigned item, size_t
  *size)` signature present.
- [Phase 6.2] Verified p-6.6 qcom_minidump function structure matches
  mainline pre-fix version.
- [Phase 8.3] Confirmed callers of `qcom_minidump`: only
  `qcom_pas_minidump`, invoked on remoteproc recovery - real reachable
  path.
- UNVERIFIED: Could not empirically reproduce UBSAN output or observe a
  crash; severity assessment based on code reading and standard C
  semantics.

**YES**

 drivers/remoteproc/qcom_common.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 6c31140268acb..fd2b6824ad265 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -28,7 +28,6 @@
 #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
 #define to_pdm_subdev(d) container_of(d, struct qcom_rproc_pdm, subdev)
 
-#define MAX_NUM_OF_SS           10
 #define MAX_REGION_NAME_LENGTH  16
 #define SBL_MINIDUMP_SMEM_ID	602
 #define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
@@ -80,7 +79,7 @@ struct minidump_global_toc {
 	__le32				status;
 	__le32				md_revision;
 	__le32				enabled;
-	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
+	struct minidump_subsystem	subsystems[];
 };
 
 struct qcom_ssr_subsystem {
@@ -151,9 +150,11 @@ void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
 	int ret;
 	struct minidump_subsystem *subsystem;
 	struct minidump_global_toc *toc;
+	unsigned int num_ss;
+	size_t toc_size;
 
 	/* Get Global minidump ToC*/
-	toc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, NULL);
+	toc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, &toc_size);
 
 	/* check if global table pointer exists and init is set */
 	if (IS_ERR(toc) || !toc->status) {
@@ -161,6 +162,16 @@ void qcom_minidump(struct rproc *rproc, unsigned int minidump_id,
 		return;
 	}
 
+	/* Derive the number of subsystems from the actual SMEM item size */
+	num_ss = (toc_size - offsetof(struct minidump_global_toc, subsystems)) /
+		 sizeof(struct minidump_subsystem);
+
+	if (minidump_id >= num_ss) {
+		dev_err(&rproc->dev, "Minidump id %d is out of range: %d\n",
+			minidump_id, num_ss);
+		return;
+	}
+
 	/* Get subsystem table of contents using the minidump id */
 	subsystem = &toc->subsystems[minidump_id];
 
-- 
2.53.0


