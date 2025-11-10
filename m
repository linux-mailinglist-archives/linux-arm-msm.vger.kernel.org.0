Return-Path: <linux-arm-msm+bounces-81143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5C9C49292
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 20:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B91CC3A4344
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 19:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DC233F39B;
	Mon, 10 Nov 2025 19:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYl+zes6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C191032C33C;
	Mon, 10 Nov 2025 19:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762804649; cv=none; b=Vh8xnmdHm3pKaEgLsrj2c4PuB8jLbZ6fPaM5grxUER4ZVTQ0qD3aZrxPmxgiFvPVbh7fqacffFvXN4nfcXUgAETWDfRX9bwI1dTBUhOvyOY2pX7eVKeVZrLG8eVglzfN7YGn8V8gG1HZrIoWXY2hJFAltPs/hENNIKbxyc6G9MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762804649; c=relaxed/simple;
	bh=1ac7IzhKmYqWG7jucxUrD8X+YajNf9Mfi3O6JIKv6IA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GbMOiQbi2AX82YUHAUcVsbku3X83SlJ/fw6tgWPX+D4ch8TzAymB48+FX7kTrFXr//T//hWqyS/GhM4d6S1Ml2N2khFCplRHt9acj7GqIXQoiluYA9RkK1W0zXPDHPZAO3T/6/K8BpleyMhktDiLXHMadb+lYPvT8yiCOQzbkO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYl+zes6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B03C4CEFB;
	Mon, 10 Nov 2025 19:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762804649;
	bh=1ac7IzhKmYqWG7jucxUrD8X+YajNf9Mfi3O6JIKv6IA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XYl+zes6oNWcMoaIIWj0gQNWgw3zHnKFmEkKDSs6T+/fBSkMWnjA26zIA0T00AhqV
	 cIGGUYig+ET9N7X2uUlo7L2DPIg8ZbfWw950fMCMflFk2WjmkKrD2ImxEjR7XvElCY
	 33lG8f0KqlpFm05OFLyQpWklRrI6JvW8AAq6iAehZlnpAvHXEaqegLRZIPMn41LONd
	 Wm8/Ry3Wr9/GFXah5kumt4F5SyTkUzL/kR77y2YehzcVPaeTTu2pmhHQMWLOjP48Nk
	 IypBEVTohqSxlquLjORyJGB8Pp/URd6AIoEnpjapI8Pue/LEvjZuLwTDyUJB35k3Gu
	 6iAF6IX22Ha1g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17] scsi: ufs: ufs-qcom: Fix UFS OCP issue during UFS power down (PC=3)
Date: Mon, 10 Nov 2025 14:57:04 -0500
Message-ID: <20251110195718.859919-4-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110195718.859919-1-sashal@kernel.org>
References: <20251110195718.859919-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>

[ Upstream commit 5127be409c6c3815c4a7d8f6d88043e44f9b9543 ]

According to UFS specifications, the power-off sequence for a UFS device
includes:

 - Sending an SSU command with Power_Condition=3 and await a response.

 - Asserting RST_N low.

 - Turning off REF_CLK.

 - Turning off VCC.

 - Turning off VCCQ/VCCQ2.

As part of ufs shutdown, after the SSU command completion, asserting
hardware reset (HWRST) triggers the device firmware to wake up and
execute its reset routine. This routine initializes hardware blocks and
takes a few milliseconds to complete. During this time, the ICCQ draws a
large current.

This large ICCQ current may cause issues for the regulator which is
supplying power to UFS, because the turn off request from UFS driver to
the regulator framework will be immediately followed by low power
mode(LPM) request by regulator framework. This is done by framework
because UFS which is the only client is requesting for disable. So if
the rail is still in the process of shutting down while ICCQ exceeds LPM
current thresholds, and LPM mode is activated in hardware during this
state, it may trigger an overcurrent protection (OCP) fault in the
regulator.

To prevent this, a 10ms delay is added after asserting HWRST. This
allows the reset operation to complete while power rails remain active
and in high-power mode.

Currently there is no way for Host to query whether the reset is
completed or not and hence this the delay is based on experiments with
Qualcomm UFS controllers across multiple UFS vendors.

Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://patch.msgid.link/20251012173828.9880-1-nitin.rawat@oss.qualcomm.com
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my comprehensive analysis using semantic code analysis tools
and repository examination, here is my assessment:

## BACKPORT RECOMMENDATION: YES

## Analysis Summary

### Semantic Analysis Tools Used:

1. **mcp__semcode__find_function** - Located the `ufs_qcom_suspend` and
   `ufs_qcom_device_reset_ctrl` functions
2. **mcp__semcode__find_callers** - Found that
   `ufs_qcom_device_reset_ctrl` is called by only 2 functions, making
   impact analysis straightforward
3. **mcp__semcode__find_callchain** - Traced the call path showing this
   is invoked through variant ops during system suspend
4. **mcp__semcode__diff_functions** - Confirmed this is a minimal
   semantic change (just adding a delay)
5. **git log/blame analysis** - Traced the historical context

### Key Findings:

#### 1. **Impact & Scope Analysis**
- **Function location**: `drivers/ufs/host/ufs-qcom.c:731` in
  `ufs_qcom_suspend()`
- **Call graph**: The function is registered as a suspend callback in
  `ufs_hba_variant_ops` and gets invoked during system suspend
  operations
- **Affected devices**: All Qualcomm UFS controllers (MSM8994, MSM8996,
  SDM845, SM8150, SM8250, SM8350, SM8450, SM8550, SM8650, SM8750, and
  many more)
- **User exposure**: HIGH - triggered during normal suspend/resume
  cycles

#### 2. **Code Change Analysis**
The change is extremely minimal and low-risk:
```c
if (ufs_qcom_is_link_off(hba) && host->device_reset) {
    ufs_qcom_device_reset_ctrl(hba, true);
+   usleep_range(10000, 11000);  // Only change: 10ms delay
}
```

#### 3. **Historical Context**
- The device reset during suspend was introduced in **v5.12-rc1**
  (commit b61d041413685, Jan 2021)
- This OCP issue has existed for **~4 years**
- Not a recent regression - this is a long-standing hardware timing
  issue

#### 4. **Problem Severity**
According to the commit message and code analysis:
- **Issue**: After asserting hardware reset, the UFS device firmware
  wakes up and draws large ICCQ current
- **Consequence**: Can trigger overcurrent protection (OCP) faults in
  the regulator hardware
- **Impact**: Potential hardware protection faults during power down
  sequence
- **Root cause**: Race between device reset completion and regulator
  entering low-power mode

#### 5. **Risk Assessment**
- **Regression risk**: VERY LOW - only adds a 10ms sleep
- **Side effects**: None beyond slightly longer suspend time (10ms is
  negligible)
- **Dependencies**: No new dependencies introduced
- **Architectural changes**: None

### Reasoning for YES:

1. **Fixes important hardware issue**: Prevents OCP faults that could
   affect regulator hardware integrity
2. **Wide device impact**: Affects entire Qualcomm UFS ecosystem (very
   popular in Android devices)
3. **Long-standing bug**: Has existed since v5.12 (2021), not a new
   feature
4. **Minimal and safe**: Single-line change with no complex logic
5. **Follows stable rules**:
   - ✓ It fixes a bug
   - ✓ Obviously correct
   - ✓ Small and contained
   - ✓ Doesn't add new features
   - ✓ Low regression risk

### Notable Observations:

- **No explicit stable tag**: The commit does NOT include "Cc:
  stable@vger.kernel.org", which typically indicates maintainers didn't
  prioritize it for backport
- **Cautious language**: Commit uses "may cause" rather than "causes" -
  suggesting this is a potential issue rather than frequently reported
  problem
- **No user reports mentioned**: No indication of widespread user-
  visible failures

### Recommendation:

**YES - Backport to stable kernels 5.12+**

Despite the lack of explicit stable tag, this commit should be
backported because:
- It prevents potential hardware protection faults
- The fix is trivial and risk-free
- It affects a critical subsystem (storage) on widely-used platforms
- The issue has existed for years across all Qualcomm UFS devices

Priority: **MEDIUM** - This is a valid fix for a hardware timing issue,
but the lack of stable tag and cautious commit language suggests it's
not causing widespread failures. However, preventing OCP faults is
important for hardware longevity.

 drivers/ufs/host/ufs-qcom.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 9574fdc2bb0fd..8fe4405ec0ec7 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -741,8 +741,21 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 
 
 	/* reset the connected UFS device during power down */
-	if (ufs_qcom_is_link_off(hba) && host->device_reset)
+	if (ufs_qcom_is_link_off(hba) && host->device_reset) {
 		ufs_qcom_device_reset_ctrl(hba, true);
+		/*
+		 * After sending the SSU command, asserting the rst_n
+		 * line causes the device firmware to wake up and
+		 * execute its reset routine.
+		 *
+		 * During this process, the device may draw current
+		 * beyond the permissible limit for low-power mode (LPM).
+		 * A 10ms delay, based on experimental observations,
+		 * allows the UFS device to complete its hardware reset
+		 * before transitioning the power rail to LPM.
+		 */
+		usleep_range(10000, 11000);
+	}
 
 	return ufs_qcom_ice_suspend(host);
 }
-- 
2.51.0


