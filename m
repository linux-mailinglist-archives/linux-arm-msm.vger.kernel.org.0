Return-Path: <linux-arm-msm+bounces-104959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMhXAOGX8GmrVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:20:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A474838AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F6CB3050499
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35311423158;
	Tue, 28 Apr 2026 10:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSZMOcJl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039903F789C;
	Tue, 28 Apr 2026 10:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372981; cv=none; b=Y/pJW4DRr4B2eSNjmlpqQvqDzkNR7Ac1vLwFLTny+PR9TS1boIg+UMhpT2RiHHTeTjXlc5C7Cp9LQuDP4Wlu20kVs8QJhZ5DsJUPBiBWwnbBiF4nP4hCRvkQ6ssjSHfqcSf371sZ8nEU7TQafBwXEV+F5dXptkUfLUxbptGAhVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372981; c=relaxed/simple;
	bh=4nR918EIDXWBQ6yZsT4PSXyTN+JKf8XyCWTAO00oxuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qpyTgFjYWdNhfQx9FzEnU+7M7rXC4XcjA9LRz/FxaLHh2FswujQxsmUSEXIF2rXUgArAk6LwUteDEdLjT/OQp5IJrWUjs0jvOtBMMi0QS0uW0k5mqJVANhTFmhl+y+H07Bp8JxBVUoWXTKeL8+mdUMNBZjBNUVpUBN6y8V7rYlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSZMOcJl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D35C4AF09;
	Tue, 28 Apr 2026 10:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777372980;
	bh=4nR918EIDXWBQ6yZsT4PSXyTN+JKf8XyCWTAO00oxuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jSZMOcJlfUZXchkHdcieRKFkp+ouh+3vi3ww9EnAHRE0JrJ8OEoLlzucj+DtwO4Kf
	 scrvh8oyEVx7QSPBZmOcunlD9ZWhSXZD9MXFHxWfLVmaEHG9sQ1eiM6m/Shxvyfc2U
	 0q2G5rQnq92LlDmUpVS9i9CELpRbCs4OkYJq+3/uF7MIPeWaZWSWvAGC13hcKx4WI8
	 AKbBu5zr/pdJDzheC3BvEk4wSSxCDXd2lZP9/AIt0ZcITP0vGay/niR4V/tiyg05bg
	 Np+EjzTWkQAnYw0KVZ5E3r8zec9z2GYwI98tQQUn8uNnIpPWfRCocTzheJuqNaq3q7
	 IxZ3AGoDMUohg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Daniele Palmas <dnlplm@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.12] bus: mhi: host: pci_generic: Add Telit FE912C04 modem support
Date: Tue, 28 Apr 2026 06:41:11 -0400
Message-ID: <20260428104133.2858589-60-sashal@kernel.org>
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
X-Rspamd-Queue-Id: 98A474838AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-104959-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,msgid.link:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.dev:email]

From: Daniele Palmas <dnlplm@gmail.com>

[ Upstream commit ac12b852b4ead4a586299c8f68cdcbcaf1bf6cbc ]

Add SDX35 based modem Telit FE912C04, reusing FN920C04 configuration.

01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
        Subsystem: Device 1c5d:2045

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Link: https://patch.msgid.link/20260323122837.3406521-1-dnlplm@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis, this is a clear device-ID addition to an existing
driver. Let me provide the comprehensive analysis.

## Phase 1: Commit Message Forensics

**Step 1.1 - Subject line parse:**
Record: subsystem=`bus: mhi: host: pci_generic`, action verb=`Add`,
summary=`Add Telit FE912C04 modem support`

**Step 1.2 - Tag analysis:**
- Signed-off-by: Daniele Palmas (author, repeat contributor for Telit
  modems)
- Signed-off-by: Manivannan Sadhasivam (MHI maintainer)
- Link: lore.kernel.org thread
  (`20260323122837.3406521-1-dnlplm@gmail.com`)
- No Fixes:, no Cc: stable, no Reported-by:, no Tested-by:, no Reviewed-
  by:, no syzbot

Record: Standard maintainer-applied patch with no fix-related tags.

**Step 1.3 - Commit body:**
Single-paragraph body: states the device is SDX35-based, will reuse the
existing FN920C04 configuration, and includes an `lspci` snippet
confirming the PCI subsystem ID `1c5d:2045`. No bug description, no
symptom, no crash trace.

Record: This is a hardware enablement commit, not a bug fix.

**Step 1.4 - Hidden bug fix detection:**
The verb is "Add" with "modem support". No "handle", "ensure",
"prevent", "fix", "clean up". The diff is a textbook device-ID addition
reusing existing config. Not a hidden bug fix.

Record: Pure hardware enablement - new PCI device ID + descriptor for an
existing driver.

## Phase 2: Diff Analysis

**Step 2.1 - Inventory:**
- Files: `drivers/bus/mhi/host/pci_generic.c` only
- Total: +13 lines, -0 lines
- Functions modified: none (only adds a static struct and a table entry)
- Scope: single-file, surgical, additive

**Step 2.2 - Code flow change:**
- Before: `mhi_pci_id_table[]` did not match PCI VID 0x17cb / SVID
  `1c5d:2045`
- After: PCI core probes → matches new entry → loads MHI driver with
  `mhi_telit_fe912c04_info` (which uses already-existing
  `modem_telit_fn920c04_config`)

Record: Adds one new PCI table row + one descriptor struct. No
behavioral change for any existing device.

**Step 2.3 - Bug mechanism:**
Not a bug fix. This is category (h) "Hardware workarounds → Device ID
additions" from the stable rules exceptions.

**Step 2.4 - Fix quality:**
- Obviously correct: a new struct with same fields as
  `mhi_telit_fe990b40_info`, reusing `modem_telit_fn920c04_config`
  already proven for SDX35 hardware
- Minimal/surgical: 13 lines, contained in tables only
- Regression risk: nil for any user without that exact 1c5d:2045 device;
  for users with it, there is no other code path (driver simply wouldn't
  bind today)

## Phase 3: Git History Investigation

**Step 3.1 - git blame:** Not applicable - no existing buggy code is
being fixed; only additions.

**Step 3.2 - Fixes: tag:** Not present (and not expected for a device-ID
addition).

**Step 3.3 - File history (recent same-file commits):**
```
ac12b852b4ead Add Telit FE912C04 modem support       <- this commit
6eaee77923ddf Add Telit FE990B40 modem support
00559ba3ae740 Add Telit FN990B40 modem support
6348f62ef7ecc Add Telit FN920C04 modem support
```
Record: This is the latest in a steady cadence of Telit modem device-ID
additions. All prior siblings in this series were backported to stable
(verified below).

**Step 3.4 - Author history:**
Daniele Palmas is a long-time Telit modem submitter; Manivannan
Sadhasivam is the MHI subsystem maintainer who applied it.

**Step 3.5 - Dependencies:**
- Requires `modem_telit_fn920c04_config` (introduced by 6348f62ef7ecc,
  backported to 6.12+).
- Diff context anchored on `mhi_telit_fe990b40_info` (introduced by
  6eaee77923ddf, backported to 6.12+).
Both dependencies exist in stable 6.12.y, 6.18.y, 6.19.y, 7.0.y.

## Phase 4: Mailing List Investigation

**Step 4.1 - b4 dig:**
- `b4 dig -c ac12b852b4ead4a586299c8f68cdcbcaf1bf6cbc` matched by patch-
  id and resolved to
  https://lore.kernel.org/all/20260323122837.3406521-1-dnlplm@gmail.com/
- Single revision (PATCH 1/1), no v2/v3.
- Maintainer reply: "Applied, thanks!" - no review concerns, no NAKs, no
  stable nomination requested.

**Step 4.2 - Reviewers:** Patch sent to maintainer Manivannan
Sadhasivam, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org. Right
people CC'd. Maintainer applied.

**Step 4.3 - Bug reports:** Not applicable; no Reported-by/Link to bug
tracker.

**Step 4.4 - Series context:** Standalone single-patch.

**Step 4.5 - Stable list:** No prior stable discussion (typical for a
new device ID).

## Phase 5: Code Semantic Analysis

**Step 5.1 - Functions:** None modified; only data-structure additions.

**Step 5.2-5.4 - Reachability:** The new entry is reachable only when
the PCI core enumerates a device with VID=QCOM(0x17cb), DID=0x011a,
SVID=0x1c5d, SSID=0x2045. No other code path is affected.

**Step 5.5 - Similar patterns:** The same pattern (adding
`mhi_pci_dev_info` + `pci_device_id`) is used for FN920C04, FN990B40,
FE990B40 - all backported.

## Phase 6: Cross-Referencing & Stable Tree Analysis

**Step 6.1 - Buggy code in stable:** N/A (no bug being fixed).

**Step 6.2 - Backport feasibility:**
- 7.0.y, 6.19.y, 6.18.y, 6.12.y: dependencies present → patch should
  apply cleanly with at most trivial offset.
- 6.6.y: `modem_telit_fn920c04_config` and `mhi_telit_fe990b40_info` are
  NOT in `pci_generic.c` → patch will not apply cleanly. Backport for
  6.6.y would require backporting prerequisites first (which were not
  selected for 6.6.y).

**Step 6.3 - Related fixes already in stable:**
- 6348f62ef7ecc (FN920C04) → backported as 4e3297ec0c469
- 00559ba3ae740 (FN990B40) → backported as 1ee92e44c3316 / 7bce22989c7b7
- 6eaee77923ddf (FE990B40) → backported as 9bef8beef1557 / 3a15c519d2b0f

The pattern clearly establishes that every prior Telit/MHI device-ID
addition in this file has been backported.

## Phase 7: Subsystem Context

Subsystem: `drivers/bus/mhi/host/` - host-side MHI bus controllers,
primarily for Qualcomm SoC modems used as PCIe-attached cellular cards.
Criticality: PERIPHERAL (hardware-specific) but with real-world users
(laptops, IoT, M2M deployments).
Activity: Active and well-maintained.

## Phase 8: Impact and Risk

**Step 8.1 - Affected users:** Owners of Telit FE912C04 modems (a real
product). Without this patch the device will not bind to any kernel
driver.

**Step 8.2 - Trigger:** Plugging in the specific hardware. No security
relevance, no unprivileged trigger.

**Step 8.3 - Failure mode without patch:** Device simply doesn't work
(no driver binds). With patch: device works using existing, tested
FN920C04 channel/event configuration.

**Step 8.4 - Risk-benefit:**
- Benefit: enables hardware on stable users' systems - high for affected
  users, none for others
- Risk: ~0 - additive only, scoped to one specific PCI subsystem ID,
  reuses already-validated config

## Phase 9: Final Synthesis

**Stable rules checklist:**
1. Obviously correct? YES - reuses already-validated
   `modem_telit_fn920c04_config`
2. Fixes a real bug? Strictly no, but enables real hardware (explicit
   stable exception)
3. Important issue? Hardware enablement, qualifies under exception
4. Small and contained? YES - 13 lines, single file
5. No new features/APIs? YES - no userspace API change, no new module
   behavior
6. Applies to stable? YES for 6.12.y, 6.18.y, 6.19.y, 7.0.y; NO for
   6.6.y (needs prerequisites)

**Exception category:** "NEW DEVICE IDs" - explicitly listed as an
allowed addition for stable.

**Precedent:** All three sibling Telit MHI device-ID additions
(FN920C04, FN990B40, FE990B40) have been backported to stable,
establishing clear policy for this exact scenario.

## Verification

- [Phase 1] Read commit message: confirmed only Signed-off-by (author +
  maintainer) and Link tags; no Fixes/Reported-by/Cc:stable/Tested-
  by/Reviewed-by.
- [Phase 2] `git show ac12b852b4ead`: confirmed +13/-0 lines, all in
  `drivers/bus/mhi/host/pci_generic.c`; verified one new
  `mhi_pci_dev_info` struct and one `pci_device_id` table entry.
- [Phase 3.3] `git log --oneline -- drivers/bus/mhi/host/pci_generic.c`:
  confirmed prior commits FN920C04, FN990B40, FE990B40.
- [Phase 3.5] `grep modem_telit_fn920c04_config pci_generic.c`:
  confirmed config struct exists at line 846 in current tree (introduced
  by FN920C04 commit).
- [Phase 4.1] `b4 dig -c ac12b852b4ead`: matched single-revision thread
  at lore.kernel.org/all/20260323122837.3406521-1-dnlplm@gmail.com/;
  saved mbox; read maintainer's "Applied, thanks!" reply with no
  concerns.
- [Phase 6.2] `git cat-file -p stable/linux-
  {6.12,6.18,6.19,7.0}.y:drivers/bus/mhi/host/pci_generic.c`: confirmed
  `modem_telit_fn920c04_config` and `mhi_telit_fe990b40_info` (anchor
  lines for the diff) are present in 6.12.y, 6.18.y, 6.19.y, 7.0.y
  stable trees.
- [Phase 6.2] `git cat-file -p
  stable/linux-6.6.y:drivers/bus/mhi/host/pci_generic.c`: confirmed
  `modem_telit_fn920c04_config` is NOT in 6.6.y (only earlier modem
  configs present); 6.6.y would need prerequisites.
- [Phase 6.3] `git show 4e3297ec0c469 / 1ee92e44c3316 / 9bef8beef1557`:
  confirmed these are stable backports of upstream commits
  6348f62ef7ecc, 00559ba3ae740, 6eaee77923ddf with "[upstream] commit
  ... upstream." in the body, signed by Greg KH.
- [Phase 8] Diff inspection: no new module parameter, no sysfs, no
  userspace ABI; only additions to two static tables.
- UNVERIFIED: Could not verify without trying that the patch will apply
  with zero context conflict on stable 6.12.y - but anchor-line
  `mhi_telit_fe990b40_info` is present, so a clean apply is highly
  likely.

The change is a textbook PCI device-ID addition for an existing driver,
reusing already-validated configuration, with strong precedent that all
three sibling device-ID additions in the same file have been accepted to
stable. Risk is essentially nil; the benefit is enabling real hardware
for stable users. It falls squarely under the explicitly documented "NEW
DEVICE IDs" exception.

**YES**

 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 425362037830e..5db3df20088fd 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -892,6 +892,16 @@ static const struct mhi_pci_dev_info mhi_telit_fe990b40_info = {
 	.edl_trigger = true,
 };
 
+static const struct mhi_pci_dev_info mhi_telit_fe912c04_info = {
+	.name = "telit-fe912c04",
+	.config = &modem_telit_fn920c04_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.sideband_wake = false,
+	.mru_default = 32768,
+	.edl_trigger = true,
+};
+
 static const struct mhi_pci_dev_info mhi_netprisma_lcur57_info = {
 	.name = "netprisma-lcur57",
 	.edl = "qcom/prog_firehose_sdx24.mbn",
@@ -919,6 +929,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FN920C04 (sdx35) */
 	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
+	/* Telit FE912C04 (sdx35) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2045),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fe912c04_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x011a),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx35_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
-- 
2.53.0


