Return-Path: <linux-arm-msm+bounces-103764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNpvA3Ar5mkDswEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:34:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9156D42C02F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCEB23130842
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 13:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A093B9D93;
	Mon, 20 Apr 2026 13:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knc30TDx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9B23B9619;
	Mon, 20 Apr 2026 13:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691020; cv=none; b=tcDTFgTjeDjrn9JwTXcf5FVPmi3gM9IEMwL0NBD4NXhudacnk67hcHD1S1VvTa+saXkJToycMlsYqk5XR/T+YfglIjv3eAJLPWdqaZUjPwgwu+k53SAu8SJEJesU6Qq4GpzvcZwcSuijjY0dP0/EmU2dNVwiHC3y8VA+asB+9bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691020; c=relaxed/simple;
	bh=OnsGnteCarh1gQtreDao9QGu3/yn+Lit1C3JX10wa18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCChTqP05HqkSMjt1hYE3R7u0ukKifgyt5yS4bsefvk+GAlP7q3rVzMKId0bYlozQBcMzxTGdg6MjKumqbfQRBnzn/9iUP5Fvo+IsM3VOo75axTzL4UBJ2jdqQ2tONjzU1om4JnqYcKcyziJu9B48cWqet56q2pXoXTVzvoqxR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knc30TDx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4EEC19425;
	Mon, 20 Apr 2026 13:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691020;
	bh=OnsGnteCarh1gQtreDao9QGu3/yn+Lit1C3JX10wa18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=knc30TDxGu8LXit/WLYB8sN28CsNic0L4SoV1TKQP+N5pWZGVUTvlUV4rrd3DElz0
	 6hFe7ls/34KKfnxkTjLjA3qt1yxdZm+lurVs30P9P3akRw+Qf7YVCClT7ZzfUZsXmh
	 /KU7VtMqp459V9KLG1YeggnhjQYayWY0HyMI2ArVHNXNTh1ZcGemGAeIGABFBwAR2N
	 Ik3GwXy4nidKaE/4gozjllC4mg3kBfZtNaeP9xtxXvoD9DzEC8nAJ0hyl81MSoimXc
	 vclAek+IzHbVVXD6juhGPlspsrsrDyFeze9D94i1b7WDBuyjru4Lve+rdIcLW9E93d
	 hV84QI0S60yew==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	brgl@kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-6.1] Bluetooth: hci_qca: disable power control for WCN7850 when bt_en is not defined
Date: Mon, 20 Apr 2026 09:08:33 -0400
Message-ID: <20260420131539.986432-47-sashal@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,intel.com,kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103764-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9156D42C02F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>

[ Upstream commit 7b75867803a8712bdf7683c31d71d3d5e28ce821 ]

On platforms using an M.2 slot with both UART and USB support, bt_en is
pulled high by hardware. In this case, software-based power control
should be disabled. The current platforms are Lemans-EVK and Monaco-EVK.

Add QCA_WCN7850 to the existing condition so that power_ctrl_enabled is
cleared when bt_en is not software-controlled (or absent), aligning its
behavior with WCN6750 and WCN6855

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information needed for a complete analysis. Let me
compile the results.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1:** [Subsystem: Bluetooth/hci_qca] [Action: "disable" / "add"]
[Summary: Disable software power control for WCN7850 when bt_en GPIO is
not defined (HW-managed)]

**Step 1.2:** Tags found:
- `Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>` - Author,
  Qualcomm BT developer
- `Reviewed-by: Bartosz Golaszewski
  <bartosz.golaszewski@oss.qualcomm.com>` - This is the author of the
  prerequisite commit `0fb410c914eb03` that introduced the
  WCN6750/WCN6855-only check. His review is highly significant.
- `Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>` -
  BT subsystem maintainer applied it
- No Fixes: tag, no Cc: stable, no Reported-by (expected for candidates)

**Step 1.3:** The commit body explains: On Lemans-EVK and Monaco-EVK
platforms (M.2 slot with UART+USB), bt_en is pulled high by hardware.
Software power control must be disabled. Without this,
`power_ctrl_enabled` remains true for WCN7850, causing
`HCI_QUIRK_NON_PERSISTENT_SETUP` and `qca_power_off` shutdown handler to
be set incorrectly.

**Step 1.4:** This IS a bug fix disguised as "aligning behavior." The
commit adds WCN7850 to a condition that was already handling the same
scenario for WCN6750/WCN6855, making WCN7850 broken on affected
platforms.

## PHASE 2: DIFF ANALYSIS

**Step 2.1:** Single file changed: `drivers/bluetooth/hci_qca.c`, +2/-1
lines. Function modified: `qca_serdev_probe()`. Scope: single-file,
single-hunk surgical fix.

**Step 2.2:** Before: When `bt_en` is NULL, only WCN6750 and WCN6855 got
`power_ctrl_enabled=false`. After: WCN7850 also gets
`power_ctrl_enabled=false`. This affects the probe path where the power
control strategy is decided.

**Step 2.3:** Bug category: Logic/correctness fix - missing SoC type in
a condition. When `power_ctrl_enabled` remains incorrectly true:
- `HCI_QUIRK_NON_PERSISTENT_SETUP` is set (line 2532)
- `hdev->shutdown = qca_power_off` is set (line 2533)
- The SSR recovery in `fce1a9244a0f8` checks this quirk and takes the
  wrong path

**Step 2.4:** Fix is obviously correct - follows established pattern.
Zero regression risk (only adds a SoC type to an OR chain). Reviewed by
the author of the prerequisite code.

## PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1:** `git blame` shows the condition was introduced by
`0fb410c914eb03` (Bartosz Golaszewski, 2025-05-27), which restructured
the code to restrict the `power_ctrl_enabled=false` check to
WCN6750/WCN6855 only. WCN7850 was inadvertently omitted.

**Step 3.2:** No Fixes: tag. The root cause is `0fb410c914eb03` which
has its own `Fixes: 3d05fc82237a` and `Cc: stable@vger.kernel.org`.
WCN7850 was missed when `0fb410c914eb03` restricted the condition.

**Step 3.3:** Related commits by same author: `fce1a9244a0f8` "Fix SSR
fail when BT_EN is pulled up by hw" - this is the companion fix that
depends on `HCI_QUIRK_NON_PERSISTENT_SETUP` being correctly set. This
commit is standalone but paired with `0fb410c914eb03`.

**Step 3.4:** Shuai Zhang is a regular Qualcomm BT contributor. Bartosz
Golaszewski (reviewer) wrote the prerequisite code.

**Step 3.5:** This commit depends on `0fb410c914eb03` being present.
That commit is in mainline (first tagged in v6.16/v6.17) but NOT yet in
any stable tree (not in v6.6, v6.12, or v6.14). In stable trees without
`0fb410c914eb03`, the code has an unconditional check (`if
(!qcadev->bt_en) power_ctrl_enabled = false;`) that covers ALL SoC types
including WCN7850. The bug only manifests after `0fb410c914eb03` is
applied.

## PHASE 4: MAILING LIST RESEARCH

The patch went through v1 -> v2 -> v3. v1 had review feedback from
Dmitry Baryshkov requesting more context about affected platforms. v2/v3
added platform details (Lemans-EVK, Monaco-EVK). Bartosz Golaszewski
(who wrote the prerequisite commit) gave Reviewed-by on v3. Luiz von
Dentz (BT maintainer) applied it to bluetooth-next. No NAKs, no concerns
about the code change itself.

## PHASE 5: CODE SEMANTIC ANALYSIS

`power_ctrl_enabled` controls two behaviors in `qca_serdev_probe()`:
1. Setting `HCI_QUIRK_NON_PERSISTENT_SETUP` quirk
2. Registering `qca_power_off` as shutdown handler

When `power_ctrl_enabled` is incorrectly true for WCN7850 with HW-
managed bt_en:
- `qca_power_off` -> `qca_power_shutdown()` falls to default case:
  `gpiod_set_value_cansleep(NULL, 0)` which is a no-op (safe)
- But the quirk `HCI_QUIRK_NON_PERSISTENT_SETUP` being set causes the
  SSR recovery code (`fce1a9244a0f8`) to skip critical recovery steps,
  leading to SSR failure (HCI reset timeout)

## PHASE 6: STABLE TREE ANALYSIS

- **v6.6**: WCN7850 exists (12 references). Code structure is completely
  different (`IS_ERR_OR_NULL` pattern). Bug exists differently but this
  patch wouldn't apply without significant rework.
- **v6.12/v6.14**: `3d05fc82237aa9` is present but `0fb410c914eb03` is
  NOT. The check is unconditional (`if (!qcadev->bt_en)
  power_ctrl_enabled = false;`), so the bug does NOT exist yet. However,
  when `0fb410c914eb03` (tagged `Cc: stable`) is backported, it WILL
  introduce this bug by restricting the check to WCN6750/WCN6855 only.
- This patch must be paired with `0fb410c914eb03` when backporting.

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

- Subsystem: Bluetooth driver (IMPORTANT, affects Qualcomm BT hardware
  users)
- Criticality: Driver-specific, but WCN7850 is a widely-used Qualcomm BT
  chip (SM8550 platforms and others)
- Active subsystem with regular contributions

## PHASE 8: IMPACT AND RISK ASSESSMENT

- **Who is affected**: WCN7850 users on platforms where bt_en is HW-
  controlled (Lemans-EVK, Monaco-EVK with M.2 slot)
- **Trigger**: Always, during probe on affected hardware. Not timing-
  dependent.
- **Failure mode**: SSR failure - BT controller cannot recover from
  firmware crash. HCI reset times out. MEDIUM-HIGH severity (Bluetooth
  becomes non-functional after FW crash until reboot)
- **Benefit**: High for affected hardware users
- **Risk**: Very low - 1 line addition to an OR condition, obviously
  correct pattern

## PHASE 9: FINAL SYNTHESIS

**Evidence FOR:**
- Fixes real hardware issue on WCN7850 platforms with HW-managed bt_en
- Trivially small (1 line), obviously correct
- Reviewed by the author of the prerequisite code
- Applied by BT subsystem maintainer
- Follows established pattern (WCN6750/WCN6855 already handled)
- Without this fix, SSR recovery fails on affected platforms
- Falls under "hardware quirk/workaround" exception category

**Evidence AGAINST:**
- Depends on `0fb410c914eb03` (not yet in stable trees)
- Limited platform scope (Lemans-EVK, Monaco-EVK)
- In current stable trees, the bug doesn't exist yet (unconditional
  check)

**Stable rules checklist:**
1. Obviously correct and tested? YES (trivial 1-line addition, reviewed)
2. Fixes a real bug? YES (SSR failure on affected hardware)
3. Important issue? YES (BT becomes non-functional after FW crash)
4. Small and contained? YES (1 line change)
5. No new features? YES (just extends existing condition)
6. Can apply to stable? YES, when paired with `0fb410c914eb03`

## Verification

- [Phase 1] Parsed tags: Reviewed-by from Bartosz Golaszewski
  (prerequisite commit author), applied by BT maintainer Luiz von Dentz
- [Phase 2] Diff: 1 line added to OR condition in `qca_serdev_probe()`,
  adding `QCA_WCN7850`
- [Phase 3] `git blame`: condition introduced by `0fb410c914eb03`
  (2025-05-27), which restricted check to WCN6750/WCN6855
- [Phase 3] `0fb410c914eb03` has `Cc: stable`, `Fixes: 3d05fc82237a` -
  will be backported
- [Phase 3] `0fb410c914eb03` NOT in v6.6, v6.12, v6.14 (verified with
  `git merge-base`)
- [Phase 3] WCN7850 support (`e0c1278ac89b0`) is in v6.6 (2023-08-24)
- [Phase 4] Patchew: v3 reviewed by Bartosz Golaszewski, applied by Luiz
  von Dentz. No NAKs.
- [Phase 5] `power_ctrl_enabled=true` causes incorrect
  `HCI_QUIRK_NON_PERSISTENT_SETUP` and SSR recovery failure
- [Phase 5] Verified `qca_power_shutdown()` default case:
  `gpiod_set_value_cansleep(NULL, 0)` is safe (no-op)
- [Phase 6] v6.12/v6.14: unconditional check exists, bug not present.
  Bug will appear when `0fb410c914eb03` is backported
- [Phase 6] v6.6: different code structure, would need rework
- [Phase 8] Failure mode: SSR failure (HCI reset timeout, BT non-
  functional until reboot), MEDIUM-HIGH severity

**YES**

 drivers/bluetooth/hci_qca.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index bb9f002aa85e9..edc907c4e870a 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2471,7 +2471,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 		if (!qcadev->bt_en &&
 		    (data->soc_type == QCA_WCN6750 ||
-		     data->soc_type == QCA_WCN6855))
+		     data->soc_type == QCA_WCN6855 ||
+		     data->soc_type == QCA_WCN7850))
 			power_ctrl_enabled = false;
 
 		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
-- 
2.53.0


