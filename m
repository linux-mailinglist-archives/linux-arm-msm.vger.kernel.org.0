Return-Path: <linux-arm-msm+bounces-103763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOa6C9on5mm6sgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:19:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B63B142B8BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03D4330257B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACF73A6403;
	Mon, 20 Apr 2026 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUuopON2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B516D3A63F8;
	Mon, 20 Apr 2026 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776690958; cv=none; b=bn8ZBogfxZblpJPYb6tEUYI2ThQAJZAmTHaHPBE3PnoLkMehJoaumwXUW5XsBPtVW54kmR9GoIud/MBYdPu9b1hgbkS2gCHGB4N9F+6zK79lc6dkvYAxqss3aAgfkoZKm3JuuGROD5qjLniwcrtEchrQwqcGufxQk4o6GN3jwgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776690958; c=relaxed/simple;
	bh=ap10gA4x702GegdyFFkhpC7MtN3m7LIoExCHfGHCtWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BcWyMku12vh7AafiJUcaqdScJo3duvFfXgTAgO0T0FRNgBzGQl5pxb360wlwXiLcV626fjxBOY3l2h98Rs3qoHMYxHbgmyrk6sn9YZ1RoUugeK71fc0LvNWiZeN+cdc8Yg3/H7FnFwzL7e7BnOVgvtDNTXozA2NsgGnzABwXPHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUuopON2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9B3C2BCB6;
	Mon, 20 Apr 2026 13:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776690958;
	bh=ap10gA4x702GegdyFFkhpC7MtN3m7LIoExCHfGHCtWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NUuopON2zwHfEcREufdSFwIlsiRjSs1jYOsrdJ/2qxfyQH1+0cEXRzE7OVzwSuo0Q
	 VWF2ErQXYoK5DPqIlooJd7Qrndchl67Tv0uoKx/s63OGjyRpPGHQ/ede3nmg12vDIs
	 Og6D2wo4lCMIi7Iszp8t+pvUPAMG7R1E8U0UFg4NLc5qeU8AjgtiUfPbVuZef7hZB6
	 iqXS8+H/rIb5+bsgdfOl3hX1T2k3UYGqZFpm3+S8aWKmpOETTm38o0tcVbfI64nCri
	 Hk8NdUHrf408FuGc02Vh4mIyy0tV60Zcl9czLt5ZCzxv6bUabGSNQOao1owF9EfSGU
	 9OKd8mwJwA9Dg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Simon Horman <horms@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Sasha Levin <sashal@kernel.org>,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] net: qrtr: fix endian handling of confirm_rx field
Date: Mon, 20 Apr 2026 09:07:58 -0400
Message-ID: <20260420131539.986432-12-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420131539.986432-1-sashal@kernel.org>
References: <20260420131539.986432-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103763-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,westermo.com:email]
X-Rspamd-Queue-Id: B63B142B8BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alexander Wilhelm <alexander.wilhelm@westermo.com>

[ Upstream commit e4cf6087cab382c7031e6b436ec55202fa9f2d7b ]

Convert confirm_rx to little endian when enqueueing and convert it back on
receive. This fixes control flow on big endian hosts, little endian is
unaffected.

On transmit, store confirm_rx as __le32 using cpu_to_le32(). On receive,
apply le32_to_cpu() before using the value. !! ensures the value is 0 or 1
in native endianness, so the conversion isn’t strictly required here, but
it is kept for consistency and clarity.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information needed for a comprehensive analysis.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: PARSE THE SUBJECT LINE
Record: **[net: qrtr]** **[fix]** Fix endian handling of `confirm_rx`
field — the word "fix" is used explicitly, targeting an endianness bug
in QRTR protocol.

### Step 1.2: PARSE ALL COMMIT MESSAGE TAGS
- **Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>** —
  QRTR/Qualcomm ARM SoC maintainer
- **Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>**
  — Author (Westermo, embedded networking)
- **Reviewed-by: Simon Horman <horms@kernel.org>** — Netdev reviewer
- **Signed-off-by: David S. Miller <davem@davemloft.net>** — Net
  subsystem maintainer merged it

No Fixes: tag (it was deliberately removed at Simon Horman's request
during review — see Phase 4). No Reported-by tag. No Cc: stable tag.

### Step 1.3: ANALYZE THE COMMIT BODY TEXT
The commit explains that:
- On transmit, `confirm_rx` needs `cpu_to_le32()` because the header
  struct field is `__le32`
- On receive, `le32_to_cpu()` should be applied before use
- The `!!` ensures the value is 0 or 1, so the receive-side conversion
  isn't strictly required but is kept for consistency
- This "fixes control flow on big endian hosts"

Record: Bug: Missing endian conversion for the `confirm_rx` field on
both TX and RX paths. Symptom: Broken flow control on big-endian hosts.
Little-endian unaffected. Root cause: `confirm_rx` was stored/read as
native endian into a `__le32` field.

### Step 1.4: DETECT HIDDEN BUG FIXES
Not hidden — this is an explicit endianness bug fix. The subject says
"fix" directly.

---

## PHASE 2: DIFF ANALYSIS — LINE BY LINE

### Step 2.1: INVENTORY THE CHANGES
- **File**: `net/qrtr/af_qrtr.c` — 2 lines changed (1 modified in TX
  path, 1 modified in RX path)
- **Functions modified**: `qrtr_node_enqueue()` (TX),
  `qrtr_endpoint_post()` (RX)
- **Scope**: Single-file, extremely surgical fix

### Step 2.2: UNDERSTAND THE CODE FLOW CHANGE

**Hunk 1 (line 364, TX path in `qrtr_node_enqueue`):**
- Before: `hdr->confirm_rx = !!confirm_rx;` — stores native-endian int
  into `__le32` field
- After: `hdr->confirm_rx = cpu_to_le32(!!confirm_rx);` — properly
  converts to little-endian
- On LE hosts: `cpu_to_le32` is a no-op, identical behavior
- On BE hosts: Value 1 was stored as `0x00000001` in native (big-endian)
  byte order = `0x01000000` in LE interpretation. Now correctly stored
  as LE 1.

**Hunk 2 (line 465, RX path in `qrtr_endpoint_post`):**
- Before: `cb->confirm_rx = !!v1->confirm_rx;` — reads `__le32` as
  native int
- After: `cb->confirm_rx = !!le32_to_cpu(v1->confirm_rx);` — properly
  converts from LE first
- Due to `!!`, the result on the receive side was already correct (any
  non-zero becomes 1). The fix adds the conversion for
  correctness/consistency.

### Step 2.3: IDENTIFY THE BUG MECHANISM
Category: **Endianness/type bug (f)**. The `qrtr_hdr_v1` struct declares
`confirm_rx` as `__le32`, and every other field in the struct uses
proper `cpu_to_le32()`/`le32_to_cpu()` conversions — except
`confirm_rx`. This is the one field that was missed.

### Step 2.4: ASSESS THE FIX QUALITY
- **Obviously correct**: Yes — it follows the exact same pattern as all
  adjacent fields (type, src_node_id, etc.)
- **Minimal**: Yes — 2 lines, exactly matching the existing code pattern
- **Regression risk**: Essentially zero. On LE hosts (the vast
  majority), these are no-ops. On BE hosts, this makes the behavior
  correct.

---

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: BLAME THE CHANGED LINES
- TX line (364): `hdr->confirm_rx = !!confirm_rx;` — introduced by
  commit **5fdeb0d372ab** ("net: qrtr: Implement outgoing flow
  control"), authored 2020-01-13, first appeared in **v5.6-rc1**
- RX line (465): `cb->confirm_rx = !!v1->confirm_rx;` — introduced by
  commit **194ccc88297ae** ("net: qrtr: Support decoding incoming v2
  packets"), authored 2017-10-10, first appeared in **v4.15**

Record: The buggy TX code has been present since v5.6. The buggy RX code
since v4.15. Both are in all active stable trees (5.10, 5.15, 6.1, 6.6,
6.12, 7.0).

### Step 3.2: FOLLOW THE FIXES: TAG
The v2 submission HAD `Fixes: 5fdeb0d372ab` but it was removed at Simon
Horman's request. The original buggy commit 5fdeb0d372ab ("Implement
outgoing flow control") is present in v5.6+ and all active stable trees.

### Step 3.3: CHECK FILE HISTORY
Recent changes to `af_qrtr.c` are unrelated refactoring (xarray
conversion, treewide changes, proto_ops changes). No recent endianness
fixes.

### Step 3.4: CHECK THE AUTHOR'S OTHER COMMITS
Alexander Wilhelm from Westermo has a clear pattern of fixing endianness
bugs in Qualcomm subsystems: QMI encoding/decoding, MHI BHI vector
table, ath12k QMI data. This is part of an effort to make Qualcomm
subsystems work on big-endian platforms.

### Step 3.5: CHECK FOR DEPENDENT/PREREQUISITE COMMITS
None. The fix applies directly to the original buggy lines without any
prerequisites.

---

## PHASE 4: MAILING LIST AND EXTERNAL RESEARCH

### Step 4.1: FIND THE ORIGINAL PATCH DISCUSSION
Found via yhbt.net mirror of lore.kernel.org. The patch went through 3
versions:
- **v1** (2026-03-20): Initial submission with Fixes tag, targeted at
  `net`
- **v2** (2026-03-24): Rebase on latest net tree, improved commit
  message, still had Fixes tag
- **v3** (2026-03-26): Rebase on `net-next`, Fixes tag removed at Simon
  Horman's request

### Step 4.2: KEY REVIEWER FEEDBACK
**Simon Horman** (netdev reviewer): "But as this isn't strictly
necessary let's target net-next and drop the Fixes tag." This is a
**negative signal** for stable backport — the netdev reviewer explicitly
downgraded from fix to enhancement.

**Manivannan Sadhasivam** (QRTR maintainer) disagreed: "FWIW: Adding
Fixes tag doesn't mean that the patch should be queued for -rcS." Mani
thought the Fixes tag was appropriate.

### Step 4.3: BUG REPORT
No external bug report. The author found this during systematic
endianness auditing.

### Step 4.4: RELATED PATCHES
This is a standalone fix. Not part of a series.

### Step 4.5: STABLE MAILING LIST HISTORY
No stable-specific discussion found.

---

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1: IDENTIFY KEY FUNCTIONS
- `qrtr_node_enqueue()` — TX path
- `qrtr_endpoint_post()` — RX path

### Step 5.2: TRACE CALLERS
- `qrtr_node_enqueue()` is called from: `qrtr_sendmsg()` (the main
  sendmsg path), `qrtr_send_resume_tx()`, and broadcast path. It's the
  core TX function.
- `qrtr_endpoint_post()` is called from: MHI driver (`qrtr_mhi.c`), SMD
  driver (`qrtr_smd.c`), tun driver (`qrtr_tun.c`). It's the core RX
  entry point — called for EVERY incoming QRTR packet.

### Step 5.3-5.4: CALL CHAIN
`qrtr_endpoint_post()` is called directly from hardware transport
drivers on every received packet. `qrtr_node_enqueue()` is called on
every transmitted packet. Both are hot-path functions.

### Step 5.5: SIMILAR PATTERNS
All other fields in `qrtr_hdr_v1` already use proper endian conversions.
`confirm_rx` was the only one missed.

---

## PHASE 6: CROSS-REFERENCING AND STABLE TREE ANALYSIS

### Step 6.1: DOES THE BUGGY CODE EXIST IN STABLE TREES?
The TX bug (5fdeb0d372ab) exists in **v5.6+**, so all active stable
trees: 5.10.y, 5.15.y, 6.1.y, 6.6.y, 6.12.y.
The RX bug (194ccc88297ae) exists since **v4.15**.

### Step 6.2: BACKPORT COMPLICATIONS
The code at these two lines has not changed since introduction. The
patch should apply cleanly to all active stable trees.

### Step 6.3: RELATED FIXES ALREADY IN STABLE
None found.

---

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

### Step 7.1: SUBSYSTEM CRITICALITY
**net/qrtr** — Qualcomm IPC Router, used for communication between Linux
and Qualcomm firmware (modem, WiFi, etc.).
Criticality: **PERIPHERAL** — affects users of Qualcomm SoC platforms
running big-endian kernels (very niche). Qualcomm SoCs are little-endian
ARM, so the primary users are unaffected.

### Step 7.2: SUBSYSTEM ACTIVITY
Moderate activity — mostly maintenance fixes, not heavy development.

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: WHO IS AFFECTED
Only big-endian hosts that use QRTR. This is extremely niche — Qualcomm
SoCs are LE ARM. However, Westermo (author's company) apparently runs BE
systems with QRTR, and there could be other embedded platforms.

### Step 8.2: TRIGGER CONDITIONS
Every QRTR data transmission on a big-endian host. The TX side stores
the wrong endianness, which means the remote end receives a malformed
`confirm_rx` value. The RX side is actually mitigated by `!!` (any non-
zero normalizes to 1).

### Step 8.3: FAILURE MODE SEVERITY
On big-endian hosts: The flow control mechanism (confirm_rx/resume_tx)
breaks. The TX side sends `confirm_rx` in wrong byte order. If the
remote firmware compares `confirm_rx` directly to 1 (rather than using
`!!`), it won't send RESUME_TX messages, causing the sender to
eventually block or exhaust remote resources.
Severity: **MEDIUM** — broken flow control on a niche platform.

### Step 8.4: RISK-BENEFIT RATIO
- **Benefit**: Fixes real protocol-level correctness bug on BE hosts.
  Low impact population but real for those affected.
- **Risk**: Essentially zero. `cpu_to_le32`/`le32_to_cpu` are no-ops on
  LE. The fix follows the established pattern used by every other field
  in the same struct.

---

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: COMPILE THE EVIDENCE

**FOR backporting:**
- Real endianness correctness bug
- Extremely small fix (2 lines), obviously correct
- Zero regression risk on LE systems (no-op), fixes BE systems
- Follows the identical pattern of all adjacent header fields
- Present in all stable trees since v5.6
- Reviewed by 2 reviewers, merged by David Miller
- Manivannan Sadhasivam (QRTR maintainer) considered the Fixes tag
  appropriate

**AGAINST backporting:**
- Simon Horman explicitly said "not strictly necessary," asked to drop
  Fixes tag and target net-next
- Big-endian QRTR usage is extremely niche
- The `!!` on the RX path mitigates the receive side (only TX is truly
  broken)
- No user bug report — found during code audit

### Step 9.2: STABLE RULES CHECKLIST
1. Obviously correct and tested? **Yes** — standard endian conversion
   pattern
2. Fixes a real bug? **Yes** — broken wire protocol on BE hosts
3. Important issue? **Borderline** — broken flow control, but only on BE
   hosts using QRTR
4. Small and contained? **Yes** — 2 lines in 1 file
5. No new features? **Correct**
6. Can apply to stable? **Yes** — clean apply expected

### Step 9.3: EXCEPTION CATEGORIES
None applicable.

### Step 9.4: DECISION
This is a genuine endianness bug fix with zero regression risk. While
the affected population is niche, the fix is so small and obviously
correct that the risk/benefit ratio strongly favors inclusion. The
netdev reviewer's pushback was about targeting net vs. net-next (merge
window process), not about whether the fix is correct. The QRTR
maintainer (Mani) disagreed with dropping the Fixes tag. For stable
users on big-endian platforms running QRTR, this fixes a real protocol-
level correctness issue in the flow control mechanism.

---

## Verification

- [Phase 1] Parsed tags: Reviewed-by from Manivannan Sadhasivam and
  Simon Horman, SOB from David S. Miller (merger)
- [Phase 2] Diff analysis: 2 lines changed — adding `cpu_to_le32()` on
  TX, `le32_to_cpu()` on RX, matching pattern of all other fields
- [Phase 2] Verified `qrtr_hdr_v1.confirm_rx` is declared as `__le32`
  (line 44 of af_qrtr.c)
- [Phase 3] git blame: TX line introduced by 5fdeb0d372ab (v5.6,
  2020-01-13), RX line by 194ccc88297ae (v4.15, 2017-10-10)
- [Phase 3] git merge-base: Confirmed 5fdeb0d372ab is in v5.10, v5.15,
  v6.1, v6.6 (all active stable trees)
- [Phase 3] Author check: Alexander Wilhelm has 7 commits all fixing
  Qualcomm endianness bugs
- [Phase 4] Mailing list (yhbt.net mirror): Found full v2 thread. Simon
  Horman said "not strictly necessary," Mani disagreed
- [Phase 4] Patch went v1->v2->v3; v3 dropped Fixes tag, targeted net-
  next at reviewer request
- [Phase 5] Callers verified: `qrtr_node_enqueue` is core TX path,
  `qrtr_endpoint_post` is core RX entry point (EXPORT_SYMBOL_GPL)
- [Phase 5] Verified all other `qrtr_hdr_v1` fields use proper endian
  conversions — only `confirm_rx` was missed
- [Phase 6] Code is unchanged at buggy lines since introduction — clean
  apply expected
- [Phase 8] Risk assessment: zero risk on LE (no-op conversions), fixes
  correctness on BE

**YES**

 net/qrtr/af_qrtr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index d77e9c8212da5..7cec6a7859b03 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -361,7 +361,7 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
 	}
 
 	hdr->size = cpu_to_le32(len);
-	hdr->confirm_rx = !!confirm_rx;
+	hdr->confirm_rx = cpu_to_le32(!!confirm_rx);
 
 	rc = skb_put_padto(skb, ALIGN(len, 4) + sizeof(*hdr));
 
@@ -462,7 +462,7 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 		cb->type = le32_to_cpu(v1->type);
 		cb->src_node = le32_to_cpu(v1->src_node_id);
 		cb->src_port = le32_to_cpu(v1->src_port_id);
-		cb->confirm_rx = !!v1->confirm_rx;
+		cb->confirm_rx = !!le32_to_cpu(v1->confirm_rx);
 		cb->dst_node = le32_to_cpu(v1->dst_node_id);
 		cb->dst_port = le32_to_cpu(v1->dst_port_id);
 
-- 
2.53.0


