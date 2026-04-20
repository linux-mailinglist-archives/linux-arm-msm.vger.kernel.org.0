Return-Path: <linux-arm-msm+bounces-103765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBpeCSwz5mmOtQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:07:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CFF42CA9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 720503250358
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7563BA238;
	Mon, 20 Apr 2026 13:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9TuX5zn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456F83A5421;
	Mon, 20 Apr 2026 13:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691022; cv=none; b=LZjZ/XemkTmWL1wNH98dMhuUQuSvc5+YcRV2NRLgqwWpprx9QDLuIL8LgzH/so/6Ib1UplubnBUCDFtNHZT3ng5uKukk6L2tHhwfRijAGDJ83HrEyMgU15lEOV6cdDDh+tIFo87nLUmR8UTswgTjRYuSiYVZlana5HDVR8yHQjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691022; c=relaxed/simple;
	bh=o2BQ8tLO1WJSMZ5lUAftphaYlqLGzweqzJDt9RDrhPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mb1SYNtyCAnxj3CHNObbWLxw/fqqx/6Lvd68ZT0/OXpur6B+3FCxMNLvvbZjOGnTWMotDoH6r5XkStDrwPw3bfRIYHBVej0d5lEEhnMfwOUCNJOhyiOegbjiN8y+fib+iP6jUgjY0PCcQI14YuKuczzCNSXlnm+j0b+BJqrBHzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9TuX5zn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C592BC2BCB4;
	Mon, 20 Apr 2026 13:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691022;
	bh=o2BQ8tLO1WJSMZ5lUAftphaYlqLGzweqzJDt9RDrhPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E9TuX5zndlpMP6skowVUy2QRHERihd6Ftu6tSFdCxMYGxGnEdREWUsJnR48cJi6GY
	 gfGlNTmBZGS9BAh91ufyj7DuHA2r2h5BEQSB4v56ghUzge99Bnzc7LiMG8mD/M7hNy
	 HbTizB8V71Y4xbDY4migjqIbzBVZqgnvEXeCzcOlKdyzZlYBEyA1N4muG5rPC6p982
	 joAIjMzZpgiJA/dNt2OU4xhraWzs91TAGe1wy2+jORC1YiTsqoEeaeEaoD+VJVb7yM
	 sgwUsnBkbRkatEUt8WQ+0eZmCx0/tXdqmACAwYseLzrIPRYmTLDWyub49XimQAfRF6
	 Ylk6Co7VYG1qQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	brgl@kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.6] Bluetooth: hci_qca: Fix missing wakeup during SSR memdump handling
Date: Mon, 20 Apr 2026 09:08:34 -0400
Message-ID: <20260420131539.986432-48-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420131539.986432-1-sashal@kernel.org>
References: <20260420131539.986432-1-sashal@kernel.org>
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
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103765-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,molgen.mpg.de,intel.com,kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mpg.de:email,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,yhbt.net:url]
X-Rspamd-Queue-Id: 12CFF42CA9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

[ Upstream commit c347ca17d62a32c25564fee0ca3a2a7bc2d5fd6f ]

When a Bluetooth controller encounters a coredump, it triggers the
Subsystem Restart (SSR) mechanism. The controller first reports the
coredump data and, once the upload is complete, sends a hw_error
event. The host relies on this event to proceed with subsequent
recovery actions.

If the host has not finished processing the coredump data when the
hw_error event is received, it waits until either the processing is
complete or the 8-second timeout expires before handling the event.

The current implementation clears QCA_MEMDUMP_COLLECTION using
clear_bit(), which does not wake up waiters sleeping in
wait_on_bit_timeout(). As a result, the waiting thread may remain
blocked until the timeout expires even if the coredump collection
has already completed.

Fix this by clearing QCA_MEMDUMP_COLLECTION with
clear_and_wake_up_bit(), which also wakes up the waiting thread and
allows the hw_error handling to proceed immediately.

Test case:
- Trigger a controller coredump using:
    hcitool cmd 0x3f 0c 26
- Tested on QCA6390.
- Capture HCI logs using btmon.
- Verify that the delay between receiving the hw_error event and
  initiating the power-off sequence is reduced compared to the
  timeout-based behavior.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information needed for a complete analysis. Let me
compile it.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: PARSE THE SUBJECT LINE
- **Subsystem prefix:** Bluetooth: hci_qca
- **Action verb:** "Fix" - explicitly a bug fix
- **One-line summary:** Fix missing wakeup during SSR memdump handling -
  `clear_bit()` doesn't wake up waiters sleeping in
  `wait_on_bit_timeout()`.

### Step 1.2: PARSE ALL COMMIT MESSAGE TAGS
- **Reviewed-by:** Bartosz Golaszewski (Qualcomm contributor,
  knowledgeable in this driver)
- **Reviewed-by:** Paul Menzel (known active reviewer)
- **Signed-off-by:** Shuai Zhang <shuai.zhang@oss.qualcomm.com> (author,
  Qualcomm - QCA chipset vendor)
- **Signed-off-by:** Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  (Bluetooth maintainer)
- No Fixes: tag, no Reported-by, no syzbot. Absence of Fixes: is
  expected.

### Step 1.3: ANALYZE THE COMMIT BODY TEXT
- **Bug:** When Bluetooth controller encounters a coredump (SSR), it
  sends memdump data then sends `hw_error` event. The host calls
  `wait_on_bit_timeout()` on `QCA_MEMDUMP_COLLECTION` to wait for the
  collection to complete. But the collection worker clears the bit with
  `clear_bit()`, which does NOT wake up the waiter.
- **Symptom:** The waiting thread blocks for the full 8-second timeout
  (`MEMDUMP_TIMEOUT_MS = 8000`) even when collection finishes early.
- **Root cause:** API misuse - `wait_on_bit_timeout()` documentation
  explicitly requires wakeup via `wake_up_bit()` or
  `clear_and_wake_up_bit()`.
- **Test:** Tested on QCA6390 hardware using `hcitool` and btmon.

### Step 1.4: DETECT HIDDEN BUG FIXES
This is an explicitly stated bug fix, not disguised. The
`wait_on_bit_timeout` API documentation (in `include/linux/wait_bit.h`)
states: "The clearing of the bit must be signalled with wake_up_bit(),
often as clear_and_wake_up_bit()." Using plain `clear_bit()` is an API
violation.

---

## PHASE 2: DIFF ANALYSIS - LINE BY LINE

### Step 2.1: INVENTORY THE CHANGES
- **File:** `drivers/bluetooth/hci_qca.c` only
- **Changes:** 2 lines changed (2 `clear_bit` → `clear_and_wake_up_bit`)
- **Functions modified:** `qca_controller_memdump()` (2 locations)
- **Scope:** Single-file, single-function surgical fix

### Step 2.2: UNDERSTAND THE CODE FLOW CHANGE
**Hunk 1 (line 1108):** Error path when `hci_devcd_init()` fails:
- Before: `clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags)` — clears bit
  but no wakeup
- After: `clear_and_wake_up_bit(QCA_MEMDUMP_COLLECTION, &qca->flags)` —
  clears bit AND wakes waiting thread

**Hunk 2 (line 1186):** Normal completion path (last sequence received):
- Before: same `clear_bit()` without wakeup
- After: same `clear_and_wake_up_bit()` with wakeup

### Step 2.3: IDENTIFY THE BUG MECHANISM
This is a **synchronization bug**: missing wakeup. The
`qca_wait_for_dump_collection()` function calls `wait_on_bit_timeout()`
which puts the thread to sleep waiting for the bit to be cleared AND a
wakeup signal. Without the wakeup, the thread sleeps for the full
8-second timeout.

### Step 2.4: ASSESS THE FIX QUALITY
- **Obviously correct:** Yes. The `wait_on_bit_timeout` documentation
  explicitly states wakeup is required.
- **Minimal:** Yes, 2 line changes.
- **Regression risk:** Negligible. `clear_and_wake_up_bit()` does
  exactly what `clear_bit()` does plus a wakeup. No new side effects.

---

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: BLAME THE CHANGED LINES
- Line 1108 (`clear_bit`): Introduced by `06d3fdfcdf5cef` (Sai Teja
  Aluvala, 2023-06-14) — v6.6-rc1
- Line 1186 (`clear_bit`): Introduced by `7c2c3e63e1e97c` (Venkata
  Lakshmi, 2020-02-14) — v5.7-rc1
- `wait_on_bit_timeout` (line 1606): Introduced by `d841502c79e3fd`
  (Balakrishna Godavarthi, 2020-01-02) — v5.6-rc1

So the bug at line 1186 has existed since v5.7, and the bug at line 1108
since v6.6.

### Step 3.2: FOLLOW THE FIXES: TAG
No Fixes: tag (expected).

### Step 3.3: CHECK FILE HISTORY
Recent changes to `hci_qca.c` are active (73 commits since v5.15). The
file sees regular activity.

### Step 3.4: CHECK THE AUTHOR'S OTHER COMMITS
Shuai Zhang is a Qualcomm contributor with multiple commits to the QCA
Bluetooth stack. The fix was reviewed by the Bluetooth maintainer (Luiz
Augusto von Dentz).

### Step 3.5: CHECK FOR DEPENDENT/PREREQUISITE COMMITS
None. `clear_and_wake_up_bit()` has existed since v4.17. The fix is a
drop-in replacement for `clear_bit()` at two locations.

---

## PHASE 4: MAILING LIST AND EXTERNAL RESEARCH

### Step 4.1-4.2: FIND THE ORIGINAL PATCH DISCUSSION
Found at:
https://yhbt.net/lore/lkml/177583080679.2077665.8641347877052929776.git-
patchwork-notify@kernel.org/T/

The patch went through **7 revisions** (v1 through v7), indicating
extensive review:
- v5→v6: Changed from `wake_up_bit` to `clear_and_wake_up_bit` (the
  proper API)
- Applied to bluetooth-next by Luiz Augusto von Dentz (Bluetooth
  maintainer)
- Commit in bluetooth-next: `9f07d5d04826`

### Step 4.3: BUG REPORT
No external bug report — the author identified the issue through
code/testing.

### Step 4.4-4.5: RELATED PATCHES AND STABLE HISTORY
This is a standalone single-patch fix. No series dependencies.

---

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1-5.4: KEY FUNCTIONS AND CALL CHAINS
The affected path:
1. Bluetooth controller crashes → sends memdump data → sends `hw_error`
   event
2. `qca_hw_error()` or `qca_reset()` → calls
   `qca_wait_for_dump_collection()` → `wait_on_bit_timeout()` on
   `QCA_MEMDUMP_COLLECTION`
3. Concurrently, `qca_controller_memdump()` (workqueue) processes dump
   packets
4. On completion, `qca_controller_memdump()` clears
   `QCA_MEMDUMP_COLLECTION` — but without waking up the waiter in step 2
5. Result: waiter in step 2 sleeps for full 8 seconds even though
   collection finished

Both `qca_hw_error()` and `qca_reset()` call
`qca_wait_for_dump_collection()`, so both paths are affected.

### Step 5.5: SIMILAR PATTERNS
No other `clear_bit`/`wait_on_bit_timeout` mismatches found in this
file.

---

## PHASE 6: CROSS-REFERENCING AND STABLE TREE ANALYSIS

### Step 6.1: DOES THE BUGGY CODE EXIST IN STABLE TREES?
- The `clear_bit` at the completion path (line 1186) has been present
  since v5.7, so it exists in stable trees 5.10.y, 5.15.y, 6.1.y, 6.6.y,
  6.12.y.
- The `clear_bit` at the error path (line 1108) was introduced in v6.6,
  so only in 6.6.y, 6.12.y.

### Step 6.2: BACKPORT COMPLICATIONS
The patch should apply cleanly or with minor context adjustments. The
two lines being changed are simple API call replacements. Older trees
may not have the first hunk (line 1108) since that code was added in
v6.6.

### Step 6.3: RELATED FIXES ALREADY IN STABLE
No related fixes for this specific bug found.

---

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

### Step 7.1: SUBSYSTEM CRITICALITY
- **Subsystem:** drivers/bluetooth — Bluetooth driver for Qualcomm
  chipsets
- **Criticality:** IMPORTANT — QCA Bluetooth chipsets are widely used in
  laptops, phones, and embedded systems

### Step 7.2: SUBSYSTEM ACTIVITY
Active subsystem with regular commits.

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: AFFECTED POPULATION
Users of QCA Bluetooth chipsets (QCA6390 and similar) — a significant
population in the Android and laptop ecosystem.

### Step 8.2: TRIGGER CONDITIONS
Triggered when the Bluetooth controller crashes and SSR begins. Not
common in normal operation, but when it happens (coredump, hw error),
the 8-second unnecessary delay is always present.

### Step 8.3: FAILURE MODE SEVERITY
- **Failure mode:** Unnecessary 8-second delay during Bluetooth recovery
  after controller crash
- **Severity:** MEDIUM — Not a crash, not data corruption, not a
  security issue. It's a latency bug during error recovery that affects
  usability.

### Step 8.4: RISK-BENEFIT RATIO
- **Benefit:** Eliminates unnecessary 8-second delay during SSR
  recovery. Correct API usage per documentation.
- **Risk:** Very low — 2-line change, `clear_and_wake_up_bit` is a
  strict superset of `clear_bit` (clear + wakeup). No new side effects.
- **Ratio:** Very favorable — minimal risk for a real improvement in
  error recovery behavior.

---

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: COMPILE THE EVIDENCE

**FOR backporting:**
- Fixes a genuine API misuse bug (`clear_bit` instead of
  `clear_and_wake_up_bit`)
- 2-line surgical fix, trivially correct per API documentation
- Extensively reviewed (7 revisions), 2 Reviewed-by tags
- Applied by Bluetooth maintainer
- Tested on real hardware (QCA6390)
- Very low regression risk
- Bug exists since v5.7 for one path and v6.6 for the other
- `clear_and_wake_up_bit()` exists since v4.17, no dependency issues

**AGAINST backporting:**
- The bug doesn't cause crashes, data corruption, or security issues
- Only manifests during SSR (error recovery), not during normal
  operation
- It's a latency/usability improvement rather than a fix for a hard
  failure

### Step 9.2: STABLE RULES CHECKLIST
1. **Obviously correct and tested?** YES — API documentation is
   explicit, tested on hardware
2. **Fixes a real bug?** YES — missing wakeup causing unnecessary
   8-second delay
3. **Important issue?** MEDIUM — recovery delay, not crash/corruption
4. **Small and contained?** YES — 2 lines in 1 file
5. **No new features or APIs?** YES — just corrects API usage
6. **Can apply to stable trees?** YES — `clear_and_wake_up_bit` exists
   since v4.17

### Step 9.3: EXCEPTION CATEGORIES
Not applicable — this is a standard bug fix.

### Step 9.4: DECISION
The fix is tiny, obviously correct, well-reviewed, and addresses a real
bug where `wait_on_bit_timeout()` is used with `clear_bit()` instead of
`clear_and_wake_up_bit()`, causing an unnecessary 8-second blocking
delay during Bluetooth error recovery. While the impact is "only" a
latency issue during recovery (not a crash or data loss), the extremely
low risk of the fix and the real user-visible improvement make this
appropriate for stable.

---

## Verification

- [Phase 1] Parsed tags: Reviewed-by from Bartosz Golaszewski and Paul
  Menzel; SOB from author and Bluetooth maintainer
- [Phase 2] Diff analysis: 2 lines changed in
  `qca_controller_memdump()`, replacing `clear_bit()` with
  `clear_and_wake_up_bit()`
- [Phase 3] git blame: Line 1108 introduced in `06d3fdfcdf5cef`
  (v6.6-rc1); Line 1186 introduced in `7c2c3e63e1e97c` (v5.7-rc1);
  `wait_on_bit_timeout` introduced in `d841502c79e3fd` (v5.6-rc1)
- [Phase 3] git describe: `clear_and_wake_up_bit` introduced in
  `8236b0ae31c83` (v4.17-rc4), present in all active stable trees
- [Phase 4] lore thread found: patch went through v1→v7, applied to
  bluetooth-next by maintainer as `9f07d5d04826`
- [Phase 4] No NAKs or objections in the discussion thread
- [Phase 5] Call chain: `qca_hw_error()`/`qca_reset()` →
  `qca_wait_for_dump_collection()` → `wait_on_bit_timeout()` waits for
  bit cleared by `qca_controller_memdump()` workqueue
- [Phase 5] Verified `wait_on_bit_timeout()` documentation in
  `include/linux/wait_bit.h` lines 118-120 explicitly requires
  `clear_and_wake_up_bit()`
- [Phase 6] Buggy code exists in stable trees 5.10+, 5.15+, 6.1+, 6.6+,
  6.12+ (second hunk); 6.6+, 6.12+ (first hunk)
- [Phase 6] `MEMDUMP_TIMEOUT_MS` is 8000 (8 seconds) — confirmed at line
  54
- [Phase 8] Failure mode: 8-second unnecessary delay during Bluetooth
  SSR recovery, severity MEDIUM

**YES**

 drivers/bluetooth/hci_qca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index edc907c4e870a..524e47392f919 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1105,7 +1105,7 @@ static void qca_controller_memdump(struct work_struct *work)
 				qca->qca_memdump = NULL;
 				qca->memdump_state = QCA_MEMDUMP_COLLECTED;
 				cancel_delayed_work(&qca->ctrl_memdump_timeout);
-				clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
+				clear_and_wake_up_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
 				clear_bit(QCA_IBS_DISABLED, &qca->flags);
 				mutex_unlock(&qca->hci_memdump_lock);
 				return;
@@ -1183,7 +1183,7 @@ static void qca_controller_memdump(struct work_struct *work)
 			kfree(qca->qca_memdump);
 			qca->qca_memdump = NULL;
 			qca->memdump_state = QCA_MEMDUMP_COLLECTED;
-			clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
+			clear_and_wake_up_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
 		}
 
 		mutex_unlock(&qca->hci_memdump_lock);
-- 
2.53.0


