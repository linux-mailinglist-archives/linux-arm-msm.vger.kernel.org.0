Return-Path: <linux-arm-msm+bounces-92837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMHrI9fKj2nMTgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 02:07:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6E913A7D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 02:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 93C5F3006172
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 01:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07788222585;
	Sat, 14 Feb 2026 01:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMToLWml"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E691E5B63;
	Sat, 14 Feb 2026 01:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031248; cv=none; b=W98Rkv8UNS5MssybwHvILo2ZLraNnCWLmV4hzCjILhCamqN7NbDA9uUc8A1Dc9BgRZtGGah0pR2Xjo1UPz6WNqMXF7invF0Ie6rzS8/60LGyMgNmHs3N9iHtkMtBmf1SP6GM5rA+7cvAuZHkPzh2QIc8Vz5AcXxLc40YvS86+RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031248; c=relaxed/simple;
	bh=sQPHsviL0mO46JdHWgP/dLVm71GvlCOCbO42cJ0zE9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tUFVAnrvoEXb0IFnVbTI8shU8vjH7aNWVctqPUOHxhAumTvl82/q4dequlkPD62KcEcTYkWVFtiHBOos5edXgeEqk8l+JgG+2xFIM4pyCtI9rYT1pSqqF/750pGJhiIIyVVWc3NBLWK9SOzJ2wFvBPjybONM7HI5Y97imGZcE3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMToLWml; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CBEC116C6;
	Sat, 14 Feb 2026 01:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031248;
	bh=sQPHsviL0mO46JdHWgP/dLVm71GvlCOCbO42cJ0zE9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MMToLWml7eoPpgtBqqZisBBcXKahwrKscNcyt2oABHOd7lZHSkui0j4yMeMNPQt6X
	 tDnkon8Rci+jciJF7wWbLiR+PR+ozdtHXLW/NGEJ0ujT2eztwbsj6pKByi8Q5XKBy4
	 vv0IS4/dddIUn7uaJAVY+ep/kbzhiJbY4ka9e9/CEoQR9zrg6dTltaY9png58M+xzg
	 vzka/yrbcMg3Z4gNkuA2/0oFGR5bh76qxkyI631hEKz+ajX5TyjrbXXpwbEusLLKId
	 DPl6oNCe88AqDCc/c++l8DVXl/jVSBUIgW01mH+EEdkSp65TyV9NBG4ktjjZPA74zc
	 euhE9PPf3jz9Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.12] spi: geni-qcom: Fix abort sequence execution for serial engine errors
Date: Fri, 13 Feb 2026 19:59:59 -0500
Message-ID: <20260214010245.3671907-119-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92837-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3A6E913A7D1
X-Rspamd-Action: no action

From: Praveen Talari <praveen.talari@oss.qualcomm.com>

[ Upstream commit 96e041647bb0f9d92f95df1d69cb7442d7408b79 ]

The driver currently skips the abort sequence for target mode when serial
engine errors occur. This leads to improper error recovery as the serial
engine may remain in an undefined state without proper cleanup, potentially
causing subsequent operations to fail or behave unpredictably.

Fix this by ensuring the abort sequence and DMA reset always execute during
error recovery, as both are required for proper serial engine error
handling.

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://patch.msgid.link/20260204162854.1206323-3-praveen.talari@oss.qualcomm.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I can see the **current code** (before the patch). The issue is
clear:

**Before the fix (buggy code):**
- When `spi->target` is true, the code does `goto reset_if_dma`, which
  **skips both**:
  1. The cancel command (correct - target mode doesn't support cancel)
  2. The abort command (INCORRECT - abort is still needed for proper
     error recovery)

**After the fix:**
- When `spi->target` is true, only the cancel command is skipped
- The abort command (`geni_se_abort_m_cmd()`) and subsequent DMA reset
  **always execute** regardless of target/controller mode

The logic restructuring:
- The old code: `if (spi->target) { goto reset_if_dma; }` - skips
  everything (cancel AND abort)
- The new code: `if (!spi->target) { do cancel; if cancel succeeded,
  goto reset_if_dma; }` then **always** falls through to the abort
  sequence

This is a critical error recovery path fix. Without the abort, the
serial engine can remain stuck in an error state.

### 3. CLASSIFICATION

This is clearly a **bug fix** for improper error recovery in the SPI
GENI Qualcomm driver:
- Fixes a functional bug where the abort sequence is incorrectly skipped
- The serial engine can get stuck in an undefined state
- Subsequent SPI transactions can fail

### 4. SCOPE AND RISK ASSESSMENT

- **Lines changed:** Small - approximately 10-15 lines of logic
  restructuring within a single function
- **Files touched:** 1 file (`drivers/spi/spi-geni-qcom.c`)
- **Subsystem:** SPI driver, specifically Qualcomm GENI SPI
- **Risk:** LOW - The change is well-contained within
  `handle_se_timeout()`, only affects error recovery logic, and the
  abort command is the standard recovery mechanism for the serial
  engine. The cancel path for controller mode is preserved unchanged.
- **The change is purely a control flow fix** - no new functions, no new
  variables, no new APIs

### 5. USER IMPACT

- **Who is affected:** Users of Qualcomm platforms (Snapdragon-based
  devices, many ARM boards/phones) using SPI in target mode
- **Severity:** When the bug triggers, the SPI bus can become stuck,
  requiring a reboot or causing cascading failures for SPI peripherals
- **Real-world impact:** This affects error recovery - when things go
  wrong (timeouts, SE errors), the system can't recover properly. This
  is a significant reliability issue.

### 6. STABILITY INDICATORS

- **Reviewed-by:** Konrad Dybcio (Qualcomm maintainer)
- **Signed-off-by:** Mark Brown (SPI subsystem maintainer)
- The commit is clearly described and the logic is straightforward

### 7. DEPENDENCY CHECK

The fix is self-contained - it restructures control flow within a single
function using existing APIs (`geni_se_abort_m_cmd`,
`geni_se_cancel_m_cmd`). No dependencies on other commits. The affected
code has been in the kernel for a while (the `spi->target` check and the
abort/cancel framework).

### Summary

This is a clear, small, well-reviewed bug fix that corrects an error
recovery path in the Qualcomm GENI SPI driver. Without this fix, when
serial engine errors occur in target mode, the abort sequence is
skipped, leaving the hardware in an undefined state. The fix is surgical
(single function, single file), low risk, and addresses a real
reliability problem on Qualcomm platforms. It meets all stable kernel
criteria.

**YES**

 drivers/spi/spi-geni-qcom.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 5ab20d7955121..acfcf870efd84 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -160,24 +160,20 @@ static void handle_se_timeout(struct spi_controller *spi,
 	xfer = mas->cur_xfer;
 	mas->cur_xfer = NULL;
 
-	if (spi->target) {
-		/*
-		 * skip CMD Cancel sequnece since spi target
-		 * doesn`t support CMD Cancel sequnece
-		 */
+	/* The controller doesn't support the Cancel commnand in target mode */
+	if (!spi->target) {
+		reinit_completion(&mas->cancel_done);
+		geni_se_cancel_m_cmd(se);
+
 		spin_unlock_irq(&mas->lock);
-		goto reset_if_dma;
-	}
 
-	reinit_completion(&mas->cancel_done);
-	geni_se_cancel_m_cmd(se);
-	spin_unlock_irq(&mas->lock);
+		time_left = wait_for_completion_timeout(&mas->cancel_done, HZ);
+		if (time_left)
+			goto reset_if_dma;
 
-	time_left = wait_for_completion_timeout(&mas->cancel_done, HZ);
-	if (time_left)
-		goto reset_if_dma;
+		spin_lock_irq(&mas->lock);
+	}
 
-	spin_lock_irq(&mas->lock);
 	reinit_completion(&mas->abort_done);
 	geni_se_abort_m_cmd(se);
 	spin_unlock_irq(&mas->lock);
-- 
2.51.0


