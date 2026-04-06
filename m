Return-Path: <linux-arm-msm+bounces-101979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLgWHKzX02nUnAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:56:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2897A3A4F83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0C763016279
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 15:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C457B3321BF;
	Mon,  6 Apr 2026 15:56:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4BD325701;
	Mon,  6 Apr 2026 15:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775490975; cv=none; b=Aw89ALjkrqNOrACjtqgC//baBOH4XOcaNPq2mg/3UalycC9tNrmIzpONJgwyqtyOBe/Fn7GUWBRXO8UaJZNdVfEEAZgcJH7iVz6f3yGI9StEd126xl7etv/SjXBk6BubHyFqxMsvATy4IrYOCYjFQiJW+IRRjQYtqJia0FZ7JV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775490975; c=relaxed/simple;
	bh=gnkUmVU1LyJnPFJoUBS9r7AF4qmy3GcAKD0eBQeszLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bjJVHDMpfMQogJF+BZDy0PEdodo+kkg6+95WuW6QZyCGIKQ+qn/7vhmGlrACtxphOGrSEHrd1iYxY/Huh4H0QRbNXfYgKvmFNCDyL4yfMdWAudoe4zMEgVuW7X1gNUzv1F+pMIA8YskXbVkQQYNmPtFDjlsqXeJ7NzK5MoyTCoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz9t1775490892tfbe0e21d
X-QQ-Originating-IP: bR5ZXZfIll1MIptKQxxeV+OfKwfN8IGcIP4TTnaIjIk=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 06 Apr 2026 23:54:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17703681536824160484
EX-QQ-RecipientCnt: 11
From: Xilin Wu <sophon@radxa.com>
Date: Mon, 06 Apr 2026 23:54:33 +0800
Subject: [PATCH 1/5] clk: qcom: clk-rcg2: fix clk_rcg2_calc_mnd() producing
 wrong M/N/pre_div
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-clk-qcom-gpclk-fixes-v1-1-7a14fe64552d@radxa.com>
References: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
In-Reply-To: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Taniya Das <quic_tdas@quicinc.com>, Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3853; i=sophon@radxa.com;
 h=from:subject:message-id; bh=gnkUmVU1LyJnPFJoUBS9r7AF4qmy3GcAKD0eBQeszLA=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJmXr7vPUr621IbHyb5z8aFJf8w3HVn0UrFGrnzTkZsVr
 Pu4MkIZOkpZGMS4GGTFFFkU4hnmslfmXnsqVqoHM4eVCWQIAxenAExkxnlGho9C2/jbn3JMbkox
 29fja/NNV/XLBM8dUSscHq+ZXn9xninD/xqfbRueTfxrscFwxs53Wyv/Gt/aumuBk1fTB3Zr0Yq
 q7WwA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NC+WtJebsKNcbqM23I/D6x2h7HydLJXjUrP/3sbtB4cunSXC4buP+d7B
	AnmrOrKNdYyJfoZ60fUG4mIDB/R+WwHIN+hC4gOuGxmKd25Ri5HPtJeWRoWlUxiDqspSry/
	oP8UfVDTQPHr9GfEJucHbmOFuDHV8PRz+4WoEgPCrc2oPziXiPAOO57WuO//7HK2xDGvAiD
	2PHuMg0DG02QYnIY5Iz9cywfqRY3bjgKly9WwC2TjLXSBhEGso0bDxg24TknSriMy7wNg5v
	hqpsAwhFmuEMGOsfwW9JfkrUf05ycrunQNLxtXCLN7amlj5MmSdKD+3cSEkE/ri9iZ2yxZv
	B59Tp7Fv+PZ8gta2GIXAy0+JYrdupHuRYwkM4cpmfw5Rm3FVohAQOdQEfBafPoy59ugVG4A
	FlivT9wAMr90hYLHp3pFbw4Wz/dr/6zd1IqOGi5CdK/wOqhSMkrq6VliKBpMaTtCv4/BFGp
	MmL0cVh3eSpD0ndVAtz2gleZYkHnQ/TIbC0LAp1ubldo4O/cUvccJjDqaeZfsBlF7/bO6kC
	VIWNjrqGgnt2QfkOLVaTm7EZ8QH3HaFRVAnk82o7N6crA4SvqA43URZMzIYG2FvMJ7cFADS
	UibKxAi88HUkzcTD2mNcTjQI2C5D3VCGkuKorBngYPj8eFtl5Y2mP64FSG5FsYJt+SUk+D1
	WGvDIBlK9irh7l64gmiUL4o9qm7DVcVhoIjNVstYxfQZfPs79JKhjXvVk2mF94widpJf54q
	xLqQ8iKaVhGAB13Hd2siZQbIvuPd1/bZxozEFkmPeiVXkQlAFVgqwiOT/8GZ+2QA5W5e4OP
	go4IObIUs11nu6K6AnN/vnfnXmG17BgHyHrrwrUEcrpeJ/CYsD+bdyoYBThE6r/NCEu3ol8
	9EHUxUBBBoM9yNqEhac3mQ7y7euxrVKfUZj3dKJ65BrR4leBkyvhOhpcDPuHakZVjpnDuu6
	+y3a7gj4asdj6Qr31bLEGuDSsz7+yKoA6reuXH7cuPQpVMQ/LuME+e6rc6BxTCOntGx4wOb
	kDG4xaWASobe+wf6fPizJNxh/KXiQEW5ISO5OBHJfraKf6Z6mD5vw5y4UAPA3yMFU8bFGC5
	kJoNv7RasWE
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101979-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.793];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,radxa.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2897A3A4F83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix three related bugs in clk_rcg2_calc_mnd() that cause the GP clock
MND divider to produce incorrect frequencies and duty cycles:

1) n_max and n_candidate are declared as u16 but can hold values
   exceeding 65535 during computation. When mnd_width is 16 and
   mnd_max is 65535, even m=1 gives n_max=65536 which overflows u16
   to 0, making "n_candidate < n_max" always false. Similarly
   n_candidate overflows on intermediate products (e.g., 15360 * 5 =
   76800 wraps to 11264), causing the wrong value to be accepted as n.

   Fix by changing both n_max and n_candidate from u16 to u32.

2) n_max is computed as (m + mnd_max), which only accounts for the N
   register constraint (n - m must fit in mnd_width bits). However,
   the D register shares the same mnd_width bits but must store values
   up to 2*n for duty cycle control. When n > mnd_max/2, the D
   register cannot represent high duty cycles, silently clamping the
   maximum achievable duty cycle (e.g. to 85% instead of 99%).

   Fix by computing n_max as (mnd_max + 1) / 2, ensuring 2*n always
   fits within the D register's bit width.

3) When no pre-division is needed (pre_div stays at its initial value
   of 1), "pre_div > 1 ? pre_div : 0" sets f->pre_div to 0. The
   subsequent convert_to_reg_val() computes (0 * 2 - 1) which
   underflows the u8 pre_div field to 255, programming a 128x
   pre-divider into hardware.

   Fix by assigning pre_div unconditionally. Since pre_div is
   initialized to 1 and only multiplied, it is always >= 1. A value
   of 1 correctly converts to register value 1 via
   convert_to_reg_val(), which means no pre-division in calc_rate().

Example with parent=19.2 MHz XO, requesting 25 kHz:

  Before: m=1, n=48,  pre_div=15 -> 26666 Hz  (6.7% error)
  After:  m=1, n=768, pre_div=1  -> 25000 Hz  (exact)

Fixes: 898b72fa44f5 ("clk: qcom: gcc-sdm845: Add general purpose clock ops")
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/clk/qcom/clk-rcg2.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 6064a0e17d51..82ee7ca1703a 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -437,27 +437,35 @@ static void clk_rcg2_calc_mnd(u64 parent_rate, u64 rate, struct freq_tbl *f,
 	int i = 2;
 	unsigned int pre_div = 1;
 	unsigned long rates_gcd, scaled_parent_rate;
-	u16 m, n = 1, n_candidate = 1, n_max;
+	u32 n_max, n_candidate = 1;
+	u16 m, n = 1;
 
 	rates_gcd = gcd(parent_rate, rate);
 	m = div64_u64(rate, rates_gcd);
 	scaled_parent_rate = div64_u64(parent_rate, rates_gcd);
-	while (scaled_parent_rate > (mnd_max + m) * pre_div_max) {
+
+	/*
+	 * Limit n so that the D register can represent the full duty cycle
+	 * range. The D register stores values up to 2*(n-m) using mnd_width
+	 * bits. Since m >= 1, n <= (mnd_max + 1) / 2 guarantees
+	 * 2*(n-m) <= mnd_max - 1.
+	 */
+	n_max = (mnd_max + 1) / 2;
+
+	while (scaled_parent_rate > (unsigned long)n_max * pre_div_max) {
 		// we're exceeding divisor's range, trying lower scale.
 		if (m > 1) {
 			m--;
 			scaled_parent_rate = mult_frac(scaled_parent_rate, m, (m + 1));
 		} else {
 			// cannot lower scale, just set max divisor values.
-			f->n = mnd_max + m;
+			f->n = n_max;
 			f->pre_div = pre_div_max;
 			f->m = m;
 			return;
 		}
 	}
 
-	n_max = m + mnd_max;
-
 	while (scaled_parent_rate > 1) {
 		while (scaled_parent_rate % i == 0) {
 			n_candidate *= i;
@@ -475,7 +483,7 @@ static void clk_rcg2_calc_mnd(u64 parent_rate, u64 rate, struct freq_tbl *f,
 
 	f->m = m;
 	f->n = n;
-	f->pre_div = pre_div > 1 ? pre_div : 0;
+	f->pre_div = pre_div;
 }
 
 static int clk_rcg2_determine_gp_rate(struct clk_hw *hw,

-- 
2.53.0


