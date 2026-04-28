Return-Path: <linux-arm-msm+bounces-104961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBZnOPSS8GlvVAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:59:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A50D483238
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5764230B5B19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66902426692;
	Tue, 28 Apr 2026 10:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEA7yYMU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0BD42668B;
	Tue, 28 Apr 2026 10:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372986; cv=none; b=KSaK03MyNi/e5S9meTyHuxOvkGXf2T+5dE0lLWFWSHe+xqglFDloM7Rgi4jFTgkaU3JFfnJ2CrXegzO54evPCXJg9HLwAk2MutOUrQMLQ6VsOCfVDk1eLSOZahi6f/kMjAc48cVtYir1vwb5NtJmf9k8AoU6dr41FoKeQs/v4jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372986; c=relaxed/simple;
	bh=7h0htGL/PgzGwtzF3RJ112VpCA39Mricf2ZhIFLCSSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rC6ANQp3npIB0UdN0QhV4Yxzpe0S/99iBArAaaacYnxI65d6nACc463Oxzh8nbL7go5O0RZcy0sxKxzwYPwvzuDfuL+ZZ01fEZ4Owx5ldjRwopZIywe3+i0NzkOn0DDkCz4gDjKanUJ8a86jxQdL0KBirFxl1dupTMLJLtv8mTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEA7yYMU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC55C2BCB8;
	Tue, 28 Apr 2026 10:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777372986;
	bh=7h0htGL/PgzGwtzF3RJ112VpCA39Mricf2ZhIFLCSSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SEA7yYMUsKkLoALS9J9UsYh0twlfCZ3yfq3Rs0OpSLQVOh3e1VMn4fgc6kKv7KAEC
	 RlGnocOyWnlilenHlJeGLqtdDKHF1+BiVezGW2PfYFi25JVpb3Xbjuv6m/LESPmRqu
	 7y51Hs/xIG0/CXcjaDtheFBCmsE8kNqSFDbLTWJOzWlINIpEPY3i6mcFwsETGSqY1r
	 WjDWH+jFi8U/6VEVfHwFpdLg+a+LaChBAvly5fjIp/SFOlnnFALVYF+Ekrx8uMFykC
	 27ATi3//A5b0KnkggXvj27iH3xYA/apTo8BM4aornh7LC6fwDrvtXc6QBFi4F2o4pZ
	 PRt9wV1+QjbUw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.12] bus: mhi: host: pci_generic: Add Qualcomm SDX35 modem
Date: Tue, 28 Apr 2026 06:41:15 -0400
Message-ID: <20260428104133.2858589-64-sashal@kernel.org>
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
X-Rspamd-Queue-Id: 5A50D483238
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104961-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,msgid.link:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

[ Upstream commit 6a7084102bb9659f699005c420eb59eade6d3b4f ]

Add support for sdx35 modem. Similar to SDX75, SDX35 can take longer to
transition to ready during power up, so use modem_qcom_v2_mhiv_config
configurations.

01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
            Subsystem: Qualcomm Device 011a

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Link: https://patch.msgid.link/20260123-mhi_sdx35-v1-1-79440abf0c92@oss.qualcomm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

I have all the information needed. Let me now write the full analysis.

---

## Complete Analysis

### PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject line parsing**
- Record: subsystem=`bus: mhi: host: pci_generic`, action=`Add`,
  summary=`Qualcomm SDX35 modem support`

**Step 1.2: Tag parsing**
- Record: Signed-off-by: Krishna Chaitanya Chundru (author); Signed-off-
  by: Manivannan Sadhasivam (MHI maintainer, who applied the patch);
  Link: to patch.msgid.link. No Fixes:, no Cc: stable, no Reported-by:,
  no syzbot references. Single-version patch (v1), applied directly by
  the maintainer.

**Step 1.3: Commit body analysis**
- Record: Body states SDX35 (like SDX75) can take longer to transition
  to ready during power up, hence using the existing
  `modem_qcom_v2_mhiv_config` which has `ready_timeout_ms = 50000`.
  Provides `lspci` output showing the device signature (vendor 0x17cb /
  PID 0x011a). No stack traces, no bug symptoms — this is hardware
  enablement, not a bug fix.

**Step 1.4: Hidden bug fix detection**
- Record: Not a hidden bug fix. Pure hardware enablement — new device
  support for an existing driver. No "handle", "ensure", "initialize",
  or "balance" language.

### PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- Record: Single file `drivers/bus/mhi/host/pci_generic.c`, +12/-0
  lines. Adds one static `struct mhi_pci_dev_info mhi_qcom_sdx35_info`
  (10 lines) and one entry in `mhi_pci_id_table[]` (2 lines). No
  existing code modified. Single-file, purely additive.

**Step 2.2: Code flow change**
- Record: Before: PID 0x011a only matched specifically via
  `PCI_DEVICE_SUB` for Telit FN920C04 (subvendor 0x1c5d, subdevice
  0x2020); other SDX35 boards did not bind. After: the specific Telit
  match stays (first in table → takes precedence), and any other
  0x17cb:0x011a modem binds to a new generic SDX35 config that uses the
  already-existing `modem_qcom_v2_mhiv_config`.

**Step 2.3: Bug mechanism**
- Record: Category (h) — hardware workaround / new device ID. No
  locking, memory, refcount, or error-path changes.

**Step 2.4: Fix quality**
- Record: Obviously correct — follows the same pattern used for every
  other MHI modem (SDX55, SDX65, SDX75, SDX72). Match ordering preserves
  existing FN920C04 binding because `pci_match_id()` returns the first
  matching entry. Zero risk to existing devices; only affects previously
  unbound 0x011a hardware. Uses an already-upstream config
  (`modem_qcom_v2_mhiv_config`, present since commit `5571519009d09` in
  v6.8).

### PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: git blame**
- Record: The `modem_qcom_v2_mhiv_config` that this patch consumes was
  introduced in `5571519009d09` ("bus: mhi: host: pci_generic: Add SDX75
  based modem support", v6.8). The table and struct patterns being
  extended are long-standing.

**Step 3.2: Fixes: tag follow-up**
- Record: N/A — no Fixes: tag. This is hardware enablement, not a bug
  fix.

**Step 3.3: File history**
- Record: Recent `pci_generic.c` changes show a steady cadence of device
  ID additions (Foxconn T99W760 `ac35e04f8000a`, FN990B40
  `00559ba3ae740`, FE990B40 `6eaee77923ddf`, FN920C04 `6348f62ef7ecc`,
  T99W696 `0d63055e1406c`, etc.). Each follows the same pattern: new
  `mhi_pci_dev_info` struct + new PCI ID table entry. Self-contained,
  standalone — no series.

**Step 3.4: Author history**
- Record: Krishna Chaitanya Chundru (Qualcomm) is a regular contributor
  to MHI / Qcom PCIe subsystems. Co-signed and applied by Manivannan
  Sadhasivam, the MHI maintainer. Authorial credibility is high.

**Step 3.5: Dependencies**
- Record: Depends only on `modem_qcom_v2_mhiv_config` (present since
  v6.8). Applies standalone. No series prerequisites.

### PHASE 4: MAILING LIST RESEARCH

**Step 4.1: b4 dig**
- Record: `b4 dig -c 6a7084102bb96` matched by patch-id and returned `ht
  tps://lore.kernel.org/all/20260123-mhi_sdx35-v1-1-
  79440abf0c92@oss.qualcomm.com/`. Single revision (v1). Read the full
  thread via mbox.

**Step 4.2: Review history**
- Record: Only one reviewer comment — Konrad Dybcio noted the
  "Unassigned class" in the lspci output looks like a separate issue;
  Mani replied that this is a well-known Qcom-modem endpoint class issue
  and he had posted a separate PCI quirk patch for it. No NAKs, no
  concerns raised about this patch. No stable-tree nomination by any
  reviewer. Maintainer applied as-is.

**Step 4.3: Bug reports**
- Record: N/A — no Reported-by, no bug-report Link.

**Step 4.4: Series**
- Record: Standalone single patch (v1-1-1).

**Step 4.5: Stable ML**
- Record: No stable@ list discussion relevant to this patch.

### PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1-5.5:**
- Record: No functions are modified. The change is data-only (two static
  structures). `modem_qcom_v2_mhiv_config` is consumed by existing MHI
  init paths (`mhi_register_controller()` via `mhi_pci_probe()`), which
  are unchanged. No call-chain impact — the new data only activates the
  existing, stable driver code paths for a previously-unbound PID.

### PHASE 6: STABLE-TREE CROSS-REFERENCING

**Step 6.1: Does the code exist in stable?**
- Record: `pci_generic.c` and `modem_qcom_v2_mhiv_config` exist in
  6.6.y, 6.12.y, 6.16.y, 6.17.y, and 7.0.y. The SDX75 commit that
  introduced the v2 config entered mainline in v6.8, so trees at or
  beyond 6.8 can apply this. For trees older than 6.8 (e.g. 6.6.y,
  6.1.y, 5.15.y), `modem_qcom_v2_mhiv_config` does not exist and this
  patch does not apply without additional backports.

**Step 6.2: Backport complications**
- Record: Clean apply expected for 6.12.y, 6.16.y, 6.17.y (the
  `mhi_qcom_sdx55_info` anchor and the 0x011a table entry context both
  exist in recent stable trees per `4e3297ec0c469` in 6.12.y which
  backported the FN920C04 context). For trees before v6.8, would require
  backporting the v2 config first — not worth it.

**Step 6.3: Related fixes in stable**
- Record: Similar device-ID additions in this exact file have routinely
  been picked into stable via AUTOSEL: `4e3297ec0c469` (FN920C04 →
  6.12.y), `bcaec58996672` (FN990B40 → 6.16.y), `df42e29132596` (T99W696
  variants → 6.17.y), etc. Consistent precedent.

### PHASE 7: SUBSYSTEM CONTEXT

**Step 7.1: Subsystem / criticality**
- Record: `drivers/bus/mhi/host/pci_generic.c` — MHI host stack, used by
  Qualcomm PCIe modems (WWAN). PERIPHERAL in the sense that it affects
  users of specific hardware, but popular hardware (laptops, routers, 5G
  WWAN cards).

**Step 7.2: Activity**
- Record: Actively developed. The file receives multiple device-ID
  additions per release cycle.

### PHASE 8: IMPACT AND RISK

**Step 8.1: Affected users**
- Record: Users of SDX35-based modems that are NOT the Telit FN920C04.
  Examples: Qcom reference designs, SDX35-based 5G/LTE cards from
  various OEMs. Without this patch, those boards don't bind to the
  driver at all.

**Step 8.2: Trigger conditions**
- Record: Device probe on the affected PCI card. Common, normal-path
  code.

**Step 8.3: Failure mode severity**
- Record: WITHOUT patch: SDX35 modem does not bind → no WWAN
  connectivity on affected hardware (functional loss for those users).
  Not a crash/corruption — severity MEDIUM (feature not working), but it
  is a real user-visible loss of function. WITH patch: existing devices
  unaffected (FN920C04 keeps its specific entry first), new hardware
  starts working.

**Step 8.4: Risk vs benefit**
- Record: Benefit = hardware enablement for SDX35 modems. Risk =
  essentially zero: additive-only change, reuses an existing config,
  match ordering keeps existing Telit FN920C04 behavior, no code paths
  modified. Classic device-ID-add exception to stable rules.

### PHASE 9: SYNTHESIS

**Step 9.1: Evidence**
- FOR: Exception category (new device ID to existing driver); tiny
  additive change (+12 lines); reuses existing upstream infrastructure;
  applied by the subsystem maintainer; no concerns raised in review;
  consistent with precedent of similar MHI modem additions being picked
  into stable (FN920C04, FN990B40, FE990B40, T99W696 variants).
- AGAINST: No Fixes:/Cc: stable (expected per task instructions —
  absence is not a negative signal); not a bug fix in the traditional
  sense; won't apply to trees older than v6.8.
- Unresolved: None of material weight.

**Step 9.2: Stable-rules checklist**
1. Obviously correct? YES — trivial additive data.
2. Fixes a real issue? YES — enables hardware that currently does not
   work.
3. Important? MEDIUM — feature enablement (functional, not
   catastrophic).
4. Small and contained? YES — 12 lines, one file.
5. No new features/APIs? YES — no new exported symbols, no new userspace
   ABI.
6. Applies to stable? YES for recent trees (v6.8+); NO for older trees.

**Step 9.3: Exception category**
- Record: DEVICE ID ADDITION to an existing driver — explicit stable-
  rules exception.

**Step 9.4: Decision**
- The change meets the device-ID-addition exception. It uses
  infrastructure already present in 6.8+, is minimal, is applied by the
  maintainer, has no regression risk, and has strong precedent among
  sibling MHI modem additions that have routinely been picked up by
  stable.

---

### Verification

- [Phase 1] Parsed tags from commit body: found Signed-off-by author +
  MHI maintainer, Link: to lore, no Fixes:/Reported-by:/Cc: stable.
- [Phase 2] Read the diff in the file context at
  `drivers/bus/mhi/host/pci_generic.c` lines 900–948: confirmed the new
  `PCI_DEVICE(0x17cb, 0x011a)` entry is placed AFTER the specific
  `PCI_DEVICE_SUB(..., 0x1c5d, 0x2020)` for FN920C04, preserving
  existing match.
- [Phase 3] `git log -S "modem_qcom_v2_mhiv_config"`: confirmed config
  introduced in `5571519009d09` (SDX75, v6.8).
- [Phase 3] `git log -- drivers/bus/mhi/host/pci_generic.c`: confirmed
  steady cadence of similar device-ID additions.
- [Phase 4] `b4 dig -c 6a7084102bb96`: matched single-revision thread at
  lore.kernel.org/all/20260123-mhi_sdx35-v1-1-
  79440abf0c92@oss.qualcomm.com.
- [Phase 4] Read full mbox thread: one review comment (Konrad re:
  unrelated class quirk), Mani applied as-is. No NAKs, no stable
  nomination.
- [Phase 6] `git log stable/linux-6.12.y --grep=FN920C04`: confirmed
  `4e3297ec0c469` backport present (precedent).
- [Phase 6] `git log stable/linux-6.16.y --grep="Add Telit FN990B40"`:
  confirmed `bcaec58996672` backport present (precedent).
- [Phase 6] `git log stable/linux-6.17.y --grep="mhi.*pci_generic"`:
  confirmed `df42e29132596` (T99W696 variants) backport present.
- [Phase 6] Confirmed file exists in all active stable trees;
  `modem_qcom_v2_mhiv_config` specifically requires v6.8+.
- [Phase 7] File path `drivers/bus/mhi/host/pci_generic.c` → MHI host /
  PCIe modem bus — peripheral hardware driver.
- UNVERIFIED: Exact match behavior on every stable tree — presumed clean
  apply for 6.12+ based on file structure; unverified for pre-6.8 trees
  (but not applicable since v2 config doesn't exist there).

This is a textbook device-ID addition to an existing driver — explicit
stable-kernel-rules exception, minimal scope, zero regression risk,
maintainer-applied, with clear precedent for sibling commits being
backported.

**YES**

 drivers/bus/mhi/host/pci_generic.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 0884a384b77fc..425362037830e 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -407,6 +407,16 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
 	.sideband_wake = false,
 };
 
+static const struct mhi_pci_dev_info mhi_qcom_sdx35_info = {
+	.name = "qcom-sdx35m",
+	.config = &modem_qcom_v2_mhiv_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+	.edl_trigger = true,
+};
+
 static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
 	.name = "qcom-sdx24",
 	.edl = "qcom/prog_firehose_sdx24.mbn",
@@ -909,6 +919,8 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FN920C04 (sdx35) */
 	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x011a),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx35_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),
-- 
2.53.0


