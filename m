Return-Path: <linux-arm-msm+bounces-83016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D566CC7F54F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 09:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3B56834590F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 08:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA382EC0A5;
	Mon, 24 Nov 2025 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzRnuL+z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E50B2EB847;
	Mon, 24 Nov 2025 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971613; cv=none; b=mWlnvxgEAhUeXJJEDIy8rfg/HHyDKBC2upDMAV0bhN7N6T8NBpydwD4LUF/oYlXZFwkaJNLycgYO3K3LRLsQsGHNayEy/Ap8ymOlte6cah8TWPGRuPR45MR/m0kvuCUGchJFjdNNbEGe1fludy5crkc51z912BI2/y1uI7CQK3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971613; c=relaxed/simple;
	bh=17YbgJ4cjsUWhoPTxaQqkj19FzshHy7B0XLlDSidKHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MMnnDKNcxEsh0O0816iKwH/MVu71VDmi4ZEWe5iS+lDd4p5Xo/tCpvMd++XhQ4McAij7OlsdkAd3bV+tY+jTdCdAIyXpovNftcpQhuPBvxaXYbwG0pvY/piUAAiXgevgr6zvAX71EJ6G5yl1vCGxyyRhBh/UqZvBsrT+iPFl91U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzRnuL+z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6A6C4CEF1;
	Mon, 24 Nov 2025 08:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763971613;
	bh=17YbgJ4cjsUWhoPTxaQqkj19FzshHy7B0XLlDSidKHg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HzRnuL+zGUWN7cjrs3XXhgilz3ZPfxnb8/eDhAtyFwELZ37ps9dKsSJSo4zwjHfGH
	 ihxoysQljXAq15R3AAozbMhOiQZ6qIlisdWyQM5bRvjc+lWgOC6YXd6ZYALq5Babpx
	 p2vWIFYVkFogHAd14/5Slc+DIGUcha3gDMgjGBZiTeQO6Z4YTJIcNoApNVyoAQ2LMm
	 nxUPRjKEBuImTWjiioupdS824QhJb/wteSq69t3Tz4e6UsOG89bnLZ7Oou4fKz0KvW
	 bXIOWYBJhB6Op2ENlkyDb9mzox5PhfBx1U0Xe8Kljsa14/A/uOHgB5Pg5Tz/2c2PR0
	 htHS4LYLqueCA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.10] pinctrl: qcom: msm: Fix deadlock in pinmux configuration
Date: Mon, 24 Nov 2025 03:06:20 -0500
Message-ID: <20251124080644.3871678-6-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124080644.3871678-1-sashal@kernel.org>
References: <20251124080644.3871678-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.8
Content-Transfer-Encoding: 8bit

From: Praveen Talari <praveen.talari@oss.qualcomm.com>

[ Upstream commit 1c2e70397b4125022dba80f6111271a37fb36bae ]

Replace disable_irq() with disable_irq_nosync() in msm_pinmux_set_mux()
to prevent deadlock when wakeup IRQ is triggered on the same
GPIO being reconfigured.

The issue occurs when a wakeup IRQ is triggered on a GPIO and the IRQ
handler attempts to reconfigure the same GPIO's pinmux. In this scenario,
msm_pinmux_set_mux() calls disable_irq() which waits for the currently
running IRQ handler to complete, creating a circular dependency that
results in deadlock.

Using disable_irq_nosync() avoids waiting for the IRQ handler to
complete, preventing the deadlock condition while still properly
disabling the interrupt during pinmux reconfiguration.

Suggested-by: Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## COMPREHENSIVE ANALYSIS

### 1. COMMIT MESSAGE & CODE ANALYSIS

**Problem Identified:** A circular dependency deadlock occurs in the
Qualcomm pin control driver (`pinctrl-msm.c`).
**Mechanism:** The function `msm_pinmux_set_mux()` is responsible for
changing a pin's function. When switching away from a GPIO that has an
interrupt enabled, it calls `disable_irq()` to mask the interrupt.
**The Deadlock:** `disable_irq()` synchronously waits for any running
IRQ handlers to complete. If `msm_pinmux_set_mux()` is called *from
within* the handler of the very interrupt being disabled (common in
wakeup scenarios where a device wakes up and immediately reconfigures
pins), the code waits for itself to finish, resulting in a hard system
hang.
**The Fix:** The commit replaces `disable_irq()` with
`disable_irq_nosync()`. This variant masks the interrupt without waiting
for pending handlers, effectively breaking the circular dependency while
maintaining the required hardware state safety.

### 2. DEEP CODE RESEARCH

**History and Origin:**
- The problematic `disable_irq()` call was introduced in commit
  `cf9d052aa6005f` ("pinctrl: qcom: Don't clear pending interrupts when
  enabling"), merged in January 2021 (Linux v5.11).
- This means the bug has been present for approximately 4 years and
  affects multiple Long Term Support (LTS) kernels, including 5.15.y,
  6.1.y, and 6.6.y.

**Code Correctness:**
- `disable_irq_nosync()` is the specific API designed for this exact use
  case (disabling an interrupt from within its own handler or call
  chain).
- The change is surgical (one line) and does not alter the logical flow
  of the driver other than removing the synchronous wait.
- The interrupt is properly re-enabled later in the function (if
  switching back to GPIO), ensuring the logic remains consistent.

### 3. BUG SEVERITY AND USER IMPACT

**Severity:** **CRITICAL**. A deadlock causes a complete system freeze,
requiring a hard reset.
**Target Users:** This affects devices using Qualcomm SoCs (MSM/QCOM),
which includes a vast ecosystem of:
- Android smartphones and tablets
- Embedded IoT devices
- Chromebooks
- Automotive IVI systems
**Trigger:** The issue is triggered during wakeup events when a GPIO IRQ
fires and the handler attempts to reconfigure the pinmux. This is a
realistic scenario in power management flows (suspend/resume).

### 4. STABLE KERNEL RULES COMPLIANCE

This commit perfectly fits the criteria for stable backporting:
- **Obviously Correct:** It uses the standard kernel API (`_nosync`) to
  resolve a known deadlock pattern.
- **Fixes a Real Bug:** It addresses a system hang/deadlock.
- **Small Scope:** Only 1 line changed in 1 file.
- **No New Features:** Pure bug fix.
- **Low Risk:** The fix relaxes a synchronization constraint that was
  incorrect for this context; it does not introduce complex new logic.

### 5. BACKPORT FEASIBILITY

Because the surrounding code has been stable since v5.11, this patch
should apply cleanly (cherry-pick) to all active stable branches:
- v6.12.y
- v6.11.y
- v6.6.y (LTS)
- v6.1.y (LTS)
- v5.15.y (LTS)

### CONCLUSION

This is a critical fix for a deadlock that affects widely deployed
hardware. The solution is trivial, correct, and low-risk. Despite the
lack of a "Cc: stable" tag, the nature of the bug (system hang) makes it
a mandatory backport candidate.

**YES**

 drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 83eb075b6bfa1..3d6601dc6fcc5 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -215,7 +215,7 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	 */
 	if (d && i != gpio_func &&
 	    !test_and_set_bit(d->hwirq, pctrl->disabled_for_mux))
-		disable_irq(irq);
+		disable_irq_nosync(irq);
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-- 
2.51.0


