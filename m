Return-Path: <linux-arm-msm+bounces-92836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGvxD0bKj2ntTgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 02:05:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E8E13A5F2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 02:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1E93306070E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 01:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C564E21576E;
	Sat, 14 Feb 2026 01:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVr5wzIl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17D32147E5;
	Sat, 14 Feb 2026 01:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031029; cv=none; b=k43wbkQPdq5bDpPF8fMAQ1k48mwBV4NrY0h2yPvzVPj13Yew3ahIannlHLso4Uk+ZNbWou7P4OBeQpNUFCZxA/4rRgf/XwHkcuxwD//t54FiGq53Cw5YaKBAwDTh0oFVmkf7tNtWd+2YXCVBnCJ4CgGLGVlMSmaKwEwkYm/FBW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031029; c=relaxed/simple;
	bh=R6oVUFjWz+kXLS9nG8628lUUvyLt6G5fnWHB9B+hzfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qXza00YaB6J/bGunIGt8YdFZc17OVHfTx0Es7e6D29+OKHCWKDGeh8ELLSmrTE1Ab0Opt8QzDLpk52Ql4Vpsi1NNccngEaGW0ijuWIThXKT/t3qnxqNB3ZgEfy6HjGaKB3H8dt3hqZylBwzYSNbHp8sJTreUIqOOTxxS5EF89oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVr5wzIl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B58C19423;
	Sat, 14 Feb 2026 01:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031029;
	bh=R6oVUFjWz+kXLS9nG8628lUUvyLt6G5fnWHB9B+hzfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jVr5wzIlMGmEZPyB8/5n+HnNwpTX28Xl1SQaaKzNl2hQlbLmWJLXKkRx3dbiW/kYb
	 FJJRktTpNJODZRTSF9sU72J1nUrJHvsIi66sMr1nUkSH4CCepZd4Lua29dUOQgZvnd
	 9R1dZYu8KXYI6xdhb9DrRtJPaRuO5/v3ciE948pS4Sa3fnYPoLrh8cYCHw9q6HZ3c3
	 OIUAUJmFNK9TXz9OPAb4iLvZ+Wo+GTelry+smsbgOMNFE+6QqOrXtcasNiEBngHWwa
	 6T8ek099xaWVW7xTZP92FhkFtSVrGRE35dCbmfSpPSVk56lywoRd6ZYjYfXEgdBCky
	 hHeQt/yZA7zqg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jonathan Marek <jonathan@marek.ca>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.6] spi-geni-qcom: use xfer->bits_per_word for can_dma()
Date: Fri, 13 Feb 2026 19:58:30 -0500
Message-ID: <20260214010245.3671907-30-sashal@kernel.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92836-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[marek.ca:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: A8E8E13A5F2
X-Rspamd-Action: no action

From: Jonathan Marek <jonathan@marek.ca>

[ Upstream commit fb2bbe3838728f572485706677590e4fc41eec5c ]

mas->cur_bits_per_word may not reflect the value of xfer->bits_per_word
when can_dma() is called. Use the right value instead.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Link: https://patch.msgid.link/20251120211204.24078-3-jonathan@marek.ca
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Here is my complete analysis:

---

## Commit Analysis: spi-geni-qcom: use xfer->bits_per_word for can_dma()

### 1. Problem Description

The `geni_can_dma()` function and its helper `get_xfer_len_in_words()`
use `mas->cur_bits_per_word` (a cached state variable on the driver
struct) to compute the transfer length in SPI words and the effective
FIFO size. However, **`mas->cur_bits_per_word` may not reflect the
actual `bits_per_word` of the current transfer** when `can_dma()` is
called by the SPI core.

### 2. Root Cause - Call Order Mismatch

The SPI core's `__spi_pump_transfer_message()` calls operations in this
order:

```1726:1825:drivers/spi/spi.c
// Step 1: prepare_message
if (ctlr->prepare_message) {
    ret = ctlr->prepare_message(ctlr, msg);
    // ...
}

// Step 2: spi_map_msg → calls can_dma() for EACH transfer
ret = spi_map_msg(ctlr, msg);

// Step 3: transfer_one_message → calls transfer_one per-xfer
ret = ctlr->transfer_one_message(ctlr, msg);
```

Looking at Step 1, `spi_geni_prepare_message` calls `setup_fifo_params`,
which sets:

```419:419:drivers/spi/spi-geni-qcom.c
mas->cur_bits_per_word = spi_slv->bits_per_word;
```

But **only if mode changed** (`mas->last_mode != spi_slv->mode` at line
405). If the mode hasn't changed between messages,
`mas->cur_bits_per_word` retains whatever value was set during the
**last transfer** of the **previous message**.

In Step 2, `spi_map_msg` → `__spi_map_msg` iterates over **all
transfers** in the message and calls `can_dma()` for each:

```1246:1251:drivers/spi/spi.c
list_for_each_entry(xfer, &msg->transfers, transfer_list) {
    unsigned long attrs = DMA_ATTR_SKIP_CPU_SYNC;
    if (!ctlr->can_dma(ctlr, msg->spi, xfer))
        continue;
```

At this point, `mas->cur_bits_per_word` could be **wrong** for any
transfer whose `bits_per_word` differs from the stale cached value.

Step 3 is where `setup_se_xfer()` (line 863-865) finally updates
`mas->cur_bits_per_word = xfer->bits_per_word` — but this is **too
late** for the `can_dma()` decision, which already happened in Step 2.

### 3. Bug Impact

The buggy `geni_can_dma()` function uses the wrong `bits_per_word` in
two calculations:

**a) Transfer length in words (`get_xfer_len_in_words`):**

```551:554:drivers/spi/spi-geni-qcom.c
if (!(mas->cur_bits_per_word % MIN_WORD_LEN))
    len = xfer->len * BITS_PER_BYTE / mas->cur_bits_per_word;
else
    len = xfer->len / (mas->cur_bits_per_word / BITS_PER_BYTE + 1);
```

**b) FIFO size calculation:**

```574:574:drivers/spi/spi-geni-qcom.c
fifo_size = mas->tx_fifo_depth * mas->fifo_width_bits /
mas->cur_bits_per_word;
```

If `mas->cur_bits_per_word` is wrong, both `len` and `fifo_size` are
incorrect. This causes the wrong DMA vs FIFO mode selection:
- If the stale value is **smaller** than actual, `fifo_size` is inflated
  and `len` deflated → **FIFO chosen when DMA should be used** →
  potential FIFO overflow for large transfers
- If the stale value is **larger** than actual, the opposite happens →
  **unnecessary DMA for small transfers**

### 4. Fix Analysis

The fix is trivially correct: replace `mas->cur_bits_per_word` with
`xfer->bits_per_word` in both `get_xfer_len_in_words()` and
`geni_can_dma()`. The `xfer` parameter is already available, and the SPI
core guarantees `xfer->bits_per_word` is always populated via
`__spi_validate()`:

```4079:4080:drivers/spi/spi.c
if (!xfer->bits_per_word)
    xfer->bits_per_word = spi->bits_per_word;
```

This validation runs in the `spi_async()` path, well before `can_dma()`
is called.

The fix is also correct for the other caller of
`get_xfer_len_in_words()` — `setup_se_xfer()` at line 876. In that
context, `mas->cur_bits_per_word` was already set to
`xfer->bits_per_word` (line 865), so using `xfer->bits_per_word`
directly is equivalent and always correct.

### 5. Scope and Risk

- **Size**: Only 4 lines changed across 2 functions in a single file
- **Risk**: Very low — the change replaces a potentially-stale cached
  value with the authoritative source of truth that was always available
- **No behavioral change** for the common case where all transfers use
  the same `bits_per_word`
- **Fixes the bug** for devices using per-transfer `bits_per_word`
  overrides

### 6. Series Dependency

The message-id (`24078-3-jonathan@marek.ca`) indicates this is patch 3
of a series. However, this change is entirely **self-contained** — it
only swaps `mas->cur_bits_per_word` for `xfer->bits_per_word` in
functions that already receive the `xfer` parameter. No dependency on
other patches.

### 7. Affected Stable Versions

- `geni_can_dma` was introduced in commit b59c122484ecb ("spi: spi-geni-
  qcom: Add support for GPI dma") — around v5.16
- `get_xfer_len_in_words` was introduced in commit 3a76c7ca9e772 ("spi:
  spi-geni-qcom: Do not do DMA map/unmap inside driver, use framework
  instead") — v6.5-rc1
- The bug in `geni_can_dma` (using `mas->cur_bits_per_word` for
  fifo_size) has existed since `geni_can_dma` was added, but
  `get_xfer_len_in_words` was refactored in v6.5

### 8. Conclusion

This is a clear bug fix. The commit:
- Fixes a real bug: wrong value used for DMA/FIFO mode selection,
  potentially causing incorrect SPI transfers
- Is small and surgical: 4 line changes, self-contained
- Has very low regression risk: uses the correct data source that was
  always available
- Applies to stable trees v6.5+ (where `get_xfer_len_in_words` exists),
  with a simpler variant applicable to v5.16+
- Does not introduce new features or APIs

**YES**

 drivers/spi/spi-geni-qcom.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 9e9953469b3a0..5ab20d7955121 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -548,10 +548,10 @@ static u32 get_xfer_len_in_words(struct spi_transfer *xfer,
 {
 	u32 len;
 
-	if (!(mas->cur_bits_per_word % MIN_WORD_LEN))
-		len = xfer->len * BITS_PER_BYTE / mas->cur_bits_per_word;
+	if (!(xfer->bits_per_word % MIN_WORD_LEN))
+		len = xfer->len * BITS_PER_BYTE / xfer->bits_per_word;
 	else
-		len = xfer->len / (mas->cur_bits_per_word / BITS_PER_BYTE + 1);
+		len = xfer->len / (xfer->bits_per_word / BITS_PER_BYTE + 1);
 	len &= TRANS_LEN_MSK;
 
 	return len;
@@ -571,7 +571,7 @@ static bool geni_can_dma(struct spi_controller *ctlr,
 		return true;
 
 	len = get_xfer_len_in_words(xfer, mas);
-	fifo_size = mas->tx_fifo_depth * mas->fifo_width_bits / mas->cur_bits_per_word;
+	fifo_size = mas->tx_fifo_depth * mas->fifo_width_bits / xfer->bits_per_word;
 
 	if (len > fifo_size)
 		return true;
-- 
2.51.0


