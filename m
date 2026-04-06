Return-Path: <linux-arm-msm+bounces-101976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LR0LN7X02nUnAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:57:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1858D3A4FAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55ED530063B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 15:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70C13314B7;
	Mon,  6 Apr 2026 15:56:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6129D3093D8;
	Mon,  6 Apr 2026 15:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775490964; cv=none; b=DLBtIJ8Y2KUWR8bE124vFYlsmBXVOyezhJQz/Bf5oD4cHRNwmaiGxehJQwQ2nyvbw2kAaCr2HqtD2REnZvgOLkq4TNE8gdLJUcfyc/3b3YloT/PZWeOPcmyKlNA5yyN1hliU/bLCTcv2lvKlbD/GBip2qm8BUr+pnjsp7KpomOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775490964; c=relaxed/simple;
	bh=aOqTALeaaPjEPJvjLbPBj3axhry4HV3f5+Juq9Ed1J4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BC8HoZafdb5cBfUet47R7hBQmXgPZBUltrF29kHPT4hsPSLOqMhxhPYJBVSCBUeWtUmciT2Kaxv9lCIjEsxewMRvTjiQTYBm6kKa/8sLiVNuxgks3gmDUQ4siVGZwSwwyhfdu7Gjt6dJqkTyvL1GeXz4OdWT0yPLWcl92/1wmaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz9t1775490897te3757a25
X-QQ-Originating-IP: e43LyfCY0OpxhV6mr2hMhuaKYNHUSn0WtLAmc+LxKLc=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 06 Apr 2026 23:54:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3139723224806532076
EX-QQ-RecipientCnt: 12
From: Xilin Wu <sophon@radxa.com>
Date: Mon, 06 Apr 2026 23:54:35 +0800
Subject: [PATCH 3/5] clk: qcom: clk-branch: calculate timeout based on
 clock frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-clk-qcom-gpclk-fixes-v1-3-7a14fe64552d@radxa.com>
References: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
In-Reply-To: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Taniya Das <quic_tdas@quicinc.com>, Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Xilin Wu <sophon@radxa.com>, Mike Tipton <quic_mdtipton@quicinc.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2227; i=sophon@radxa.com;
 h=from:subject:message-id; bh=aOqTALeaaPjEPJvjLbPBj3axhry4HV3f5+Juq9Ed1J4=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJmXr7vHlB+W4fH5q/b8Z0SXhsB+7rc2RUWSp46eyFB7U
 Cd0e2NYRykLgxgXg6yYIotCPMNc9srca0/FSvVg5rAygQxh4OIUgInsD2Bk2B3OfGa6oLnH4xcP
 wtf6W9b/2fvZ26Lr9Md6B6PZE9bqdTD8U1we+lN4gZu//93U3yt36Oy7auUz8em9x0eeKcwyqZ/
 fwQYA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Ne8JfOgbMcIOcyvuKkom0tHCIVGmmYfS8Uoq0XTlVV1xu8xYawvCvmyv
	plkr/zoF6G6vXsrbB0l8L5ll36h9BCMFSH4HjG/ExBuhw0QdeuHG3i72fd5x819kFDs4dRc
	j+z02jMQ54qBAxVYJLeoIdGPJpaVF9HTuhiFed02BpaOWw9L7IUs7ofK1D8BW/oAUfK1e9z
	KfywlS5WHMwzVX6KR6G9KhKz352XFVgRtEksDxQP51t0c/Gg5vqp7XHpi29Jnhm7aJMc16j
	NVTecKlA8qN1O8RWeFqkb2wtTwmDOrliuINBbdWl8In24EA+l62DWQ7Xl72KcPZ3WL3zfIo
	Ao/CJaZBZI0xTvFUWyeJAiW4LMJSOEy1ZrGYfs1tN22lfZ8LUHreggvifBuAWo/U/p11Xmc
	2x/Gex0RBmOl73WrnBQq1yGEqGiAV5vvtdnKd+MbiVdyZqy3bts9CnIoZiIK5cl/Ld3GAxB
	wMkCXjNaZtl4275aIn5ZqPiAAZ/flM4phWat7bNpCbjOVA9+jE2Lu8EohrW44Qm7q4/4hZr
	jujGEum/UcI7fXPjtTEGL8HT6+s8A4AwWrXFjZQCuwWWD2nDuPiZDBsE6c25cqAxUzBwImN
	/Pb+iS8ObLpBo79l+n/ohmdvXyzAgEKbghxrkW7EdcrnDK8gbEZ/dSlkDluk7qfMKc+fF6X
	EXacX0vuwKcW8GSPAWZJHujZ10gpb5/jwx4xtqP806Bpm3SLu6acMPyXD1tg4T8CNwNTjte
	A7trDqv/WKmxuI49j9IveSzIm0MyokSdWu8bCY5YWH/qW78dgtsb/2LfbyGFTxhln2Oz7e2
	g0AHuatsunahIM0nYrDysfnsDYgesWGOoylclzhII8sijOnUvxGUOfih/xkxwWFI5hzm/i4
	bsI/ZjdO8XEWy1/5qJufORWB8lZeOZ9XXPAwUH9AiNfw7eXMcue6LhJdtSlE4TtRuDwXOYe
	kljXcFDaeohzTN5ALozy2TC4sWTdwA8gRSauGMY69zrwlQKTRYzdwzv2mK6UM8jNY1eN20w
	fTZo9S9WVstE2MDBzJJeBSYcgAffnjHN6ueyefkiE/HgKP8PB3+Vy1qlHrZg8e1W00d9kYg
	g==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101976-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,quicinc.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.114];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:email,radxa.com:mid,codelinaro.org:url,quicinc.com:email]
X-Rspamd-Queue-Id: 1858D3A4FAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Clock branches with extremely low rates (tens of Hz to low kHz) take
much longer to toggle than the fixed 200 us timeout allows. A 1 kHz
clock needs at least 3 ms (3 cycles) to toggle.

Instead of increasing the timeout to a huge fixed value for all clocks,
dynamically compute the required timeout based on the current clock
rate, accounting for 3 cycles at the current clock rate.

Based on a downstream patch by Mike Tipton:
https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/aa899c2d1fa31e247f04810f125ac9c60927c901

Fixes: 6e0ad1b6c1c9 ("clk: qcom: Add support for branches/gate clocks")
Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/clk/qcom/clk-branch.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index 444e7d8648d4..2641dcf93277 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -59,9 +59,27 @@ static bool clk_branch2_check_halt(const struct clk_branch *br, bool enabling)
 	return (val & CBCR_CLK_OFF) == (invert ? 0 : CBCR_CLK_OFF);
 }
 
+static int get_branch_timeout(const struct clk_branch *br)
+{
+	unsigned long rate;
+	int timeout;
+
+	/*
+	 * The time it takes a clock branch to toggle is roughly 3 clock cycles.
+	 */
+	rate = clk_hw_get_rate(&br->clkr.hw);
+	if (!rate)
+		return 200;
+
+	timeout = 3 * (USEC_PER_SEC / rate);
+
+	return max(timeout, 200);
+}
+
 static int clk_branch_wait(const struct clk_branch *br, bool enabling,
 		bool (check_halt)(const struct clk_branch *, bool))
 {
+	int timeout, count;
 	bool voted = br->halt_check & BRANCH_VOTED;
 	const char *name = clk_hw_get_name(&br->clkr.hw);
 
@@ -77,9 +95,9 @@ static int clk_branch_wait(const struct clk_branch *br, bool enabling,
 	} else if (br->halt_check == BRANCH_HALT_ENABLE ||
 		   br->halt_check == BRANCH_HALT ||
 		   (enabling && voted)) {
-		int count = 200;
+		timeout = get_branch_timeout(br);
 
-		while (count-- > 0) {
+		for (count = timeout; count > 0; count--) {
 			if (check_halt(br, enabling))
 				return 0;
 			udelay(1);

-- 
2.53.0


