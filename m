Return-Path: <linux-arm-msm+bounces-114087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5P3bBDMiOmpZ2AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:05:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 373156B4597
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:05:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114087-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114087-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C75C3017062
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 06:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB363AB286;
	Tue, 23 Jun 2026 06:05:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC4B3A9636;
	Tue, 23 Jun 2026 06:05:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782194735; cv=none; b=SMhdEx6/ujjdI0Lnf+B7QYDQ63x0+y8C4XQpcVrHBXCLqnQVDzydbw17UVZnRCb4e29Dcge2gIoCHa7Cm1XXmSzWuk1LHZJmBIpszWtKag9MzX9W0JSARpUTJnyvJSGCQeqFCIwRGsX0pURkh0DNg1L0D8AXDrRoYB4uZuYqjNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782194735; c=relaxed/simple;
	bh=b/cLS9SI1SecUwu4Me3MrbPLCRWHFzJlxWlYAStU9MI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bPDgc7Vj6gHW9b3edYHVVsKbmvk/TjISZdSaRSDSH0LRlh0DxKRSiCVKRfOcAy12fKe0gZlGs0M9cnBeX3XYRFQFCUxnLD89gcsS+nDgnKjU4DknJlXGYdSBaia1Gc1L3z5oVlTO4RD4/8hga5TLgHSWI1yc5UjYIIkZQU9u2xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAAHfO8kIjpqXN_JFA--.1729S2;
	Tue, 23 Jun 2026 14:05:24 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable paths
Date: Tue, 23 Jun 2026 14:05:16 +0800
Message-ID: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAHfO8kIjpqXN_JFA--.1729S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr45GF48uFWxZFWDXryUtrb_yoW5CryDpF
	W8WasrK3y7WryUur4SgrZrZwnIqr93tFy3C397G34Iv3Z0vrn8Kr1fGF9FvayDWFyxJF13
	CFZ7tFyrCa1UtFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYCJmUU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114087-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 373156B4597

The HFPLL enable helper waits for the lock bit but ignores the
regmap_read_poll_timeout() result. The polling condition is also
inconsistent with clk_hfpll_init(), which treats the lock bit being set
as the locked state.

Wait for the lock bit to become set, return timeout errors from the
helper, and propagate those errors through clk_hfpll_enable() and
clk_hfpll_set_rate() instead of enabling the output unconditionally.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/clk/qcom/clk-hfpll.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/clk-hfpll.c b/drivers/clk/qcom/clk-hfpll.c
index 705352aff067..e2059682e440 100644
--- a/drivers/clk/qcom/clk-hfpll.c
+++ b/drivers/clk/qcom/clk-hfpll.c
@@ -54,12 +54,13 @@ static void __clk_hfpll_init_once(struct clk_hw *hw)
 	h->init_done = true;
 }
 
-static void __clk_hfpll_enable(struct clk_hw *hw)
+static int __clk_hfpll_enable(struct clk_hw *hw)
 {
 	struct clk_hfpll *h = to_clk_hfpll(hw);
 	struct hfpll_data const *hd = h->d;
 	struct regmap *regmap = h->clkr.regmap;
 	u32 val;
+	int ret;
 
 	__clk_hfpll_init_once(hw);
 
@@ -76,19 +77,23 @@ static void __clk_hfpll_enable(struct clk_hw *hw)
 	regmap_update_bits(regmap, hd->mode_reg, PLL_RESET_N, PLL_RESET_N);
 
 	/* Wait for PLL to lock. */
-	if (hd->status_reg)
+	if (hd->status_reg) {
 		/*
 		 * Busy wait. Should never timeout, we add a timeout to
 		 * prevent any sort of stall.
 		 */
-		regmap_read_poll_timeout(regmap, hd->status_reg, val,
-					 !(val & BIT(hd->lock_bit)), 0,
-					 100 * USEC_PER_MSEC);
-	else
+		ret = regmap_read_poll_timeout(regmap, hd->status_reg, val,
+					       val & BIT(hd->lock_bit), 0,
+					       100 * USEC_PER_MSEC);
+		if (ret)
+			return ret;
+	} else {
 		udelay(60);
+	}
 
 	/* Enable PLL output. */
 	regmap_update_bits(regmap, hd->mode_reg, PLL_OUTCTRL, PLL_OUTCTRL);
+	return 0;
 }
 
 /* Enable an already-configured HFPLL. */
@@ -99,14 +104,15 @@ static int clk_hfpll_enable(struct clk_hw *hw)
 	struct hfpll_data const *hd = h->d;
 	struct regmap *regmap = h->clkr.regmap;
 	u32 mode;
+	int ret = 0;
 
 	spin_lock_irqsave(&h->lock, flags);
 	regmap_read(regmap, hd->mode_reg, &mode);
 	if (!(mode & (PLL_BYPASSNL | PLL_RESET_N | PLL_OUTCTRL)))
-		__clk_hfpll_enable(hw);
+		ret = __clk_hfpll_enable(hw);
 	spin_unlock_irqrestore(&h->lock, flags);
 
-	return 0;
+	return ret;
 }
 
 static void __clk_hfpll_disable(struct clk_hfpll *h)
@@ -161,6 +167,7 @@ static int clk_hfpll_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long flags;
 	u32 l_val, val;
 	bool enabled;
+	int ret = 0;
 
 	l_val = rate / parent_rate;
 
@@ -183,11 +190,11 @@ static int clk_hfpll_set_rate(struct clk_hw *hw, unsigned long rate,
 	regmap_write(regmap, hd->l_reg, l_val);
 
 	if (enabled)
-		__clk_hfpll_enable(hw);
+		ret = __clk_hfpll_enable(hw);
 
 	spin_unlock_irqrestore(&h->lock, flags);
 
-	return 0;
+	return ret;
 }
 
 static unsigned long clk_hfpll_recalc_rate(struct clk_hw *hw,
-- 
2.50.1 (Apple Git-155)


