Return-Path: <linux-arm-msm+bounces-99632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OMyKSx1wmnqdAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:27:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A891A3074B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 26D4E304D9F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8FF3F0AA3;
	Tue, 24 Mar 2026 11:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qvSCLJ26"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F340E3F0775;
	Tue, 24 Mar 2026 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774351189; cv=none; b=FAwSRC4MVIP2FmUyPFUb6c7NZnUDjQXy0CAXQ12Lek0/yNrJMWJL6kvyqpcN11lhzIBmTLyN1yDPMxQaaQRFbDC1EfkaAIr/y6GoRTdgFbdG8Ht94d96Cprnh3iPwvPfhZkMVisQthDvMpDctYHIwZDpkebZWGY5x08Sf5VTktY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774351189; c=relaxed/simple;
	bh=L7WeZ2HlZmslzL5RLnhKKA7Q4wGl39pNoaAWDw574xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yv+ponJoLUiefNM4vpbc5QQp9OyoxQHaneybdpJDAxkU7+aOyly3fO/wM/j2ZKp0lfsBNlRfRtAW2d5NrOgn9TDSLHJtFRhPRUsR9kIZ3TEK8FwZnEzV2SyWlwp4d0Le7d2t3a8atPp8ZqhGTfq22Mq5DCEaqJ9mR8H+EsZ+XgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qvSCLJ26; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8915EC2BCB1;
	Tue, 24 Mar 2026 11:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774351188;
	bh=L7WeZ2HlZmslzL5RLnhKKA7Q4wGl39pNoaAWDw574xQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qvSCLJ267nzB++5UHIhKz+yxj0kO4yIZLXAVM1+rEDXMEVYO4ySRhxpedLbMAh+aU
	 7guDD/TAWg54xYZyWJa+kx08BNJfeY+31cpIk6XsArjGOvQ80c7ko/L+FH+gF2pect
	 4ql5JmsUGQGXBrVD1jzQ9wOQ+xzwDUPBP/TKcNfkHfMwwpNDu4WDLlxwT63RwZNcWc
	 q1ipkdAHyW599aAVEK/qkgf/6jISPwD4HEUxVjAIpNGO8qWwStHrRRroePF5n+D0wr
	 L3r/OVcqdylxwRPRMw+EcbITUZySO0uJ7l6np/xEjTFgfBJcglb88sUphn/F1JgK7q
	 58oVlJVdHCL1g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.6] spi: geni-qcom: Check DMA interrupts early in ISR
Date: Tue, 24 Mar 2026 07:19:20 -0400
Message-ID: <20260324111931.3257972-11-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324111931.3257972-1-sashal@kernel.org>
References: <20260324111931.3257972-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99632-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: A891A3074B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Praveen Talari <praveen.talari@oss.qualcomm.com>

[ Upstream commit 8c89a077ca796a2fe248c584e9d7e66cff0388c8 ]

The current interrupt handler only checks the GENI main IRQ status
(m_irq) before deciding to return IRQ_NONE. This can lead to spurious
IRQ_NONE returns when DMA interrupts are pending but m_irq is zero.

Move the DMA TX/RX status register reads to the beginning of the ISR,
right after reading m_irq. Update the early return condition to check
all three status registers (m_irq, dma_tx_status, dma_rx_status) before
returning IRQ_NONE.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://patch.msgid.link/20260313-spi-geni-qcom-fix-dma-irq-handling-v1-1-0bd122589e02@oss.qualcomm.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Record: The ISR function itself hasn't changed significantly between 6.6
and mainline in the area being patched. The fix should apply cleanly to
6.6.y and later stable trees.

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

### Step 7.1: SUBSYSTEM CRITICALITY
- **Subsystem:** drivers/spi (SPI bus drivers)
- **Specific driver:** spi-geni-qcom — Qualcomm GENI SPI driver
- **Criticality:** IMPORTANT — used on Qualcomm SoCs (Snapdragon
  platforms), which power many mobile devices, Chromebooks, and embedded
  systems
- The GENI SPI is used for communication with peripherals like sensors,
  touch controllers, etc.

Record: [drivers/spi, Qualcomm GENI] [IMPORTANT — widely used on
Qualcomm platforms including phones, Chromebooks, embedded]

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: WHO IS AFFECTED
Users of Qualcomm SoC platforms that use SPI in DMA mode. This includes
many Android devices, Chromebooks with Qualcomm chips, and embedded
systems.

### Step 8.2: TRIGGER CONDITIONS
The bug triggers when:
1. The SPI controller is operating in DMA mode (GENI_SE_DMA)
2. A DMA transfer completes and fires a DMA interrupt
3. No GENI main interrupt fires at the same time (m_irq == 0)

This is a normal operational scenario — DMA completion interrupts can
arrive without accompanying GENI main interrupts. The trigger is **not
rare** during normal DMA SPI transfers.

### Step 8.3: FAILURE MODE SEVERITY
When triggered:
1. The DMA completion interrupt is not acknowledged → **SPI transfer
   timeout**
2. On shared interrupt lines, repeated IRQ_NONE → kernel may disable the
   entire IRQ line → **device becomes non-functional**
3. Transfer timeouts cause SPI peripheral communication failures →
   **device malfunction**

Record: Severity: **HIGH** — causes SPI transfer failures/timeouts in
DMA mode, potential IRQ line disabling.

### Step 8.4: RISK-BENEFIT RATIO
- **BENEFIT:** HIGH — fixes real hardware communication failure on
  Qualcomm platforms
- **RISK:** VERY LOW — the change only moves existing register reads
  earlier and updates one condition check. No new logic, no new code
  paths. The DMA status registers were already being read later; moving
  them earlier is completely safe.
- **Ratio:** Strongly favorable for backporting.

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: EVIDENCE COMPILATION

**FOR backporting:**
- Fixes a real bug: DMA interrupts are silently ignored, causing SPI
  transfer timeouts
- Small and surgical: ~7 lines changed in a single function
- Obviously correct: moves register reads earlier and updates condition
  (matching what the serial GENI driver already does)
- Affects widely-used hardware (Qualcomm SoCs)
- Reviewed by Qualcomm engineer, applied by SPI subsystem maintainer
- Low regression risk: only behavioral change is properly handling DMA-
  only interrupts
- Bug exists since v6.3, present in stable trees 6.6.y+

**AGAINST backporting:**
- No explicit Cc: stable nomination
- No Reported-by (may indicate the bug is not commonly triggered, or was
  found during code review)
- No Fixes: tag (though the fix target is clearly e5f0dfa78ac77)

### Step 9.2: STABLE RULES CHECKLIST
1. **Obviously correct and tested?** YES — reviewed by Qualcomm, applied
   by maintainer, matches pattern used in serial GENI driver
2. **Fixes a real bug?** YES — DMA interrupts not handled, causing
   transfer failures
3. **Important issue?** YES — device communication failure, potential
   IRQ line disabling
4. **Small and contained?** YES — single function, ~7 lines
5. **No new features or APIs?** Correct — no new features
6. **Can apply to stable?** YES — likely clean apply to 6.6.y+

### Step 9.3: EXCEPTION CATEGORIES
Not an exception category — this is a standard bug fix.

### Step 9.4: DECISION
The fix is small, obviously correct, fixes a real bug that causes SPI
transfer failures in DMA mode on Qualcomm platforms, and has very low
regression risk. It meets all stable kernel criteria.

## Verification

- [Phase 1] Parsed tags: Signed-off-by from Qualcomm author, Reviewed-by
  from Qualcomm, Link to patch, applied by Mark Brown (SPI maintainer)
- [Phase 2] Diff analysis: ~7 lines changed in `geni_spi_isr()`, moves
  DMA status reads to top of ISR, updates early return condition
- [Phase 3] git blame: Early return (`if (!m_irq)`) introduced in
  `2ee471a1e28ec7` (2020). DMA mode added in `e5f0dfa78ac77` (v6.3)
  without updating the early return — this is the root cause
- [Phase 3] Author check: Praveen Talari is a regular Qualcomm GENI
  contributor (serial and SPI)
- [Phase 4] lore.kernel.org: Found patch at msgid link; v1 patch, no
  NAKs, accepted by maintainer
- [Phase 5] Callers: `geni_spi_isr` registered via `devm_request_irq()`
  at line 1167, invoked on every SPI interrupt
- [Phase 5] Similar pattern: Serial GENI driver (`qcom_geni_serial.c`
  lines 1065-1070) already reads all IRQ status registers at top of ISR
  — the SPI driver was inconsistent
- [Phase 6] Bug introduced in v6.3 (DMA mode commit). Present in stable
  trees 6.6.y and later
- [Phase 6] Clean apply expected: ISR area has not been significantly
  modified since 6.6
- [Phase 8] Failure mode: DMA transfer timeouts / unhandled interrupts /
  potential IRQ line disabling, severity HIGH
- [Phase 8] Risk: VERY LOW — moves existing reads earlier, no new logic

**YES**

 drivers/spi/spi-geni-qcom.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index acfcf870efd84..736120107184f 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -958,10 +958,13 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 	struct spi_controller *spi = data;
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 	struct geni_se *se = &mas->se;
-	u32 m_irq;
+	u32 m_irq, dma_tx_status, dma_rx_status;
 
 	m_irq = readl(se->base + SE_GENI_M_IRQ_STATUS);
-	if (!m_irq)
+	dma_tx_status = readl_relaxed(se->base + SE_DMA_TX_IRQ_STAT);
+	dma_rx_status = readl_relaxed(se->base + SE_DMA_RX_IRQ_STAT);
+
+	if (!m_irq && !dma_tx_status && !dma_rx_status)
 		return IRQ_NONE;
 
 	if (m_irq & (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |
@@ -1009,8 +1012,6 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 		}
 	} else if (mas->cur_xfer_mode == GENI_SE_DMA) {
 		const struct spi_transfer *xfer = mas->cur_xfer;
-		u32 dma_tx_status = readl_relaxed(se->base + SE_DMA_TX_IRQ_STAT);
-		u32 dma_rx_status = readl_relaxed(se->base + SE_DMA_RX_IRQ_STAT);
 
 		if (dma_tx_status)
 			writel(dma_tx_status, se->base + SE_DMA_TX_IRQ_CLR);
-- 
2.51.0


