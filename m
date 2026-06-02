Return-Path: <linux-arm-msm+bounces-110715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBepJxd5HmqPjQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 08:32:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF28629077
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 08:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1339F30179C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 06:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29153A7193;
	Tue,  2 Jun 2026 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="TaHNG+Aa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound11.mail.transip.nl (outbound11.mail.transip.nl [136.144.136.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1543A6EF1;
	Tue,  2 Jun 2026 06:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780381783; cv=none; b=npnwi+dRXkpjwBwWE8VJIweKRJIT55Vh98qyarFsZlyssaSXcj4DNesNxZjnzTcL6xga4LrobnTkuDnBwdMctnOqCsry2veTzZn4ZIdM/hfob3zBTVDR9ILLefmtIsCCYDBa24+LIlwqs6hxtZ/H+q98CVRWOxZ022j3jOHQ4KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780381783; c=relaxed/simple;
	bh=L1fbsxfPEuEzvH2NsGg+9KqZBofam8axo9KWKn3C2G8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C0d9xFKQ2zSwGDs/3hCfOGR6JPe5XCb5AS0wgjw0qiOrsjucK2WG1TRE0XWCI+YH3GJAC2Y1vrMZuE0TCl0Oe4ei/gaPhxWGbXEH5tAapj0Xb//Y7cw9YHYYe1pHdy1CZ4yKvVy5G+9bOWVsrN51S82meIbdGDWDC5FVG2XTlHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=TaHNG+Aa; arc=none smtp.client-ip=136.144.136.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission14.mail.transip.nl (unknown [10.103.8.165])
	by outbound11.mail.transip.nl (Postfix) with ESMTP id 4gV1Bw4VfszkQNKZ;
	Tue,  2 Jun 2026 08:29:28 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission14.mail.transip.nl (Postfix) with ESMTPA id 4gV1Bw0k2bz3RgQXr;
	Tue,  2 Jun 2026 08:29:28 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: sboyd@kernel.org
Cc: Herman van Hazendonk <github.com@herrie.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: clk-pll: reject vote enable on orphan parent
Date: Tue,  2 Jun 2026 08:29:27 +0200
Message-ID: <20260602062927.467249-1-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission14.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780381768; h=from:subject:to:cc:date:
 mime-version; bh=840DlinO4B97ZCMg4uxTVGT94NCA95j2Wc9qNbGs1Jc=;
 b=TaHNG+Aad0c6YbZBv0d+yoXqeV/hlbQ7Rv5GIyV+nUD9ImVdGvp/T6YulxhVxEgC/RJQ1f
 we+QRJrASemdy+WdD2fOVFckh4Gf0NGj+dpWHRkfTdvKBlEJbJXZgtwzdD9DPMe/PePiT4
 dvS3UzIa2UV5gt+muaLjcyrBn88NfR9TXUP6Jc/H4chzuybDpFYrIGoJZCTKR8/4asJgdG
 p14GmD6L1vhaUFCyp19GVkzHb6Gjj0ThrhPfNI9+n47FanI6cY3KKpj0FizH36be7Q3KJX
 kQHlVUSePBAah0wHff5QF3xZUKr5jP5Qjj2M7HKbqtAhTptjGJF81xs8hvKQEw==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[herrie.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110715-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[herrie.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EAF28629077
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

clk_pll_vote_enable() unconditionally feeds the result of
clk_hw_get_parent(hw) through to_clk_pll() and on to wait_for_pll().
The common clock framework permits clk_enable() on an orphan clock
(supplier not bound yet), in which case clk_hw_get_parent() returns
NULL. to_clk_pll(NULL) then yields container_of(NULL, struct clk_pll,
clkr) -- a non-NULL bogus pointer pointing into the negative offset
of struct clk_pll.

wait_for_pll() reaches for the parent's name via
clk_hw_get_name(&pll->clkr.hw). Because clkr sits at a fixed offset
inside struct clk_pll, &pll->clkr.hw cancels the to_clk_pll offset
exactly back to NULL and clk_hw_get_name() then dereferences
core->name on a NULL clk_hw, panicking the kernel.

This is reachable today: gcc-msm8960.c and gcc-apq8064.c register a
pll4_vote whose parent (pll4) lives in lcc-msm8960.c, and the future
gcc-msm8660 pll4_vote does the same. If anything calls clk_enable()
on pll4_vote between gcc probe and the LCC clock controller binding,
the system panics. The exposure widens as more SoCs adopt the same
cross-controller voter pattern.

Resolve the parent with clk_hw_get_parent() once, return -ENODEV when
it is NULL, and only call into wait_for_pll() with a real
struct clk_pll. The enable-regmap write is also gated behind the
parent check so a failed enable cannot leave the vote bit asserted
against a clock the framework has not finished wiring up.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/clk/qcom/clk-pll.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-pll.c b/drivers/clk/qcom/clk-pll.c
index 26ba709f43c8..7b26129565fe 100644
--- a/drivers/clk/qcom/clk-pll.c
+++ b/drivers/clk/qcom/clk-pll.c
@@ -199,14 +199,31 @@ static int wait_for_pll(struct clk_pll *pll)
 
 static int clk_pll_vote_enable(struct clk_hw *hw)
 {
+	struct clk_hw *parent;
 	int ret;
-	struct clk_pll *p = to_clk_pll(clk_hw_get_parent(hw));
+
+	/*
+	 * Vote clocks can be registered on one clock controller and have
+	 * the underlying PLL live on a different one (e.g. PLL4_VOTE in
+	 * GCC for the LPASS PLL4 owned by LCC on the MSM8x60 / MSM8960 /
+	 * APQ8064 families). The common clock framework permits enable
+	 * on an orphan, so clk_hw_get_parent() can legitimately return
+	 * NULL here while the supplier controller has not finished
+	 * probing yet. Reject the enable rather than handing a bogus
+	 * container_of(NULL, struct clk_pll, clkr) pointer to
+	 * wait_for_pll() - inside wait_for_pll(), clk_hw_get_name()
+	 * would reverse the offset back to NULL and dereference
+	 * core->name.
+	 */
+	parent = clk_hw_get_parent(hw);
+	if (!parent)
+		return -ENODEV;
 
 	ret = clk_enable_regmap(hw);
 	if (ret)
 		return ret;
 
-	return wait_for_pll(p);
+	return wait_for_pll(to_clk_pll(parent));
 }
 
 const struct clk_ops clk_pll_vote_ops = {

base-commit: 944125b4c454b58d2fe6e35f1087a932b2050dff
-- 
2.43.0


