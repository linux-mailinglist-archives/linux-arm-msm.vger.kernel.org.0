Return-Path: <linux-arm-msm+bounces-110698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKMBI95bHmoviwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 06:28:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE6D628124
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 06:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D2DA3019123
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 04:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5970638E8A4;
	Tue,  2 Jun 2026 04:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="TVjmjVox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound10.mail.transip.nl (outbound10.mail.transip.nl [136.144.136.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C013B36C598;
	Tue,  2 Jun 2026 04:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780374483; cv=none; b=YCAp4no/lvxj1ibvhVRlb6fUojB+iQpYwYv5MNiOs25Dg80ijW7TQfni3zwKkTLgqd7Lj3vypNiOmILY+D9hhT9A4thnZ2wnDWAmjMEBswti6sAhW5neXOVMtwlFbMr3mppROi2vJ9B+imIJyqfpLAEbmuaPXGK7nGvu0DOv+lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780374483; c=relaxed/simple;
	bh=VSSf7JsYhPtkpa4irpQThN2KbJrXq0Gamlkn9rF9B/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3JoQ8SPnvC6e8ll7HDBcZtwcijS7FJ/UiKmpAUbyUfsZp2OkfPjiT6azIrd44TQF0bqhV8IS44zODctlOy5UPBvZmaEWmI3W9kvcP2/jeylwZWmCZs7dpNq1ZHvHCjkZJx0fnU0DTar4YoP/VNuSUcByxuoxP5FHzbQ2WMe6+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=TVjmjVox; arc=none smtp.client-ip=136.144.136.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission15.mail.transip.nl (unknown [10.103.8.166])
	by outbound10.mail.transip.nl (Postfix) with ESMTP id 4gTyVZ746bzTPNW8;
	Tue,  2 Jun 2026 06:27:50 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission15.mail.transip.nl (Postfix) with ESMTPA id 4gTyVZ2qhtz3R3nyb;
	Tue,  2 Jun 2026 06:27:50 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: sboyd@kernel.org
Cc: Herman van Hazendonk <github.com@herrie.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: gcc-msm8660: register PLL4_VOTE for LPASS
Date: Tue,  2 Jun 2026 06:27:45 +0200
Message-ID: <20260602042747.277270-3-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602042747.277270-1-github.com@herrie.org>
References: <20260602042747.277270-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission15.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780374470; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=g3ROW7hBNhkKFHDQavHcox1vYNkJIWsOzzdzMxdC0i0=;
 b=TVjmjVox6kZxVyyiiLost18MWfUNz9ZIB9vn5FiWh8G50PnJ5Hsm6l3m9ImMYknx0Xml88
 lGL/8VI0Rj2ux3mS8uCUYi7/22TMJlCvrxkwXZFJnbR+w/NY5yJjhVpRk0Dr9aOwrx6JqC
 FuFDOkA0vcwvtmAJflvS3DlMNLTv01chohqo3kJCleVd9Xu1QB/6yErd/SRl4PhCgRCj9W
 U8qwVZoQTC4o3+//1pXUHYPeMwI/eKRtZ2XI/AFsGzBS+yOTvqyInjgN+MIF22q3dOhyZV
 KfRSg2hnq6ObnNVHSgdfFj/BpcmP0DXgMKpX14znj6JYlyRajr9tSEr6axb+4w==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110698-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[herrie.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:email,herrie.org:mid,herrie.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2CE6D628124
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the CPU-side software vote register for LPASS PLL4. PLL4 itself
lives in the LCC (Low Power Audio Subsystem clock controller); GCC
holds the apps-processor vote in PLL_ENA_SC0 (0x34c0) BIT(4). The
LCC driver references "pll4" as the parent of its slimbus / SAIF /
audio mclk roots, so without this vote PLL4 is gated off when the
apps processor is the only consumer and LCC clocks silently fail to
enable.

Expose it as a single clk_regmap with clk_pll_vote_ops and append
the dt-binding ID at the next free slot (258) after the existing
PLL12 (257), so DT ABI for boards already using the prior header is
preserved.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/clk/qcom/gcc-msm8660.c               | 15 +++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8660.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8660.c b/drivers/clk/qcom/gcc-msm8660.c
index e81b8851a786..cd392e140e95 100644
--- a/drivers/clk/qcom/gcc-msm8660.c
+++ b/drivers/clk/qcom/gcc-msm8660.c
@@ -54,6 +54,20 @@ static struct clk_regmap pll8_vote = {
 	},
 };
 
+/* PLL4 is the LPASS PLL, defined in LCC. This is the voting clock. */
+static struct clk_regmap pll4_vote = {
+	.enable_reg = 0x34c0,
+	.enable_mask = BIT(4),
+	.hw.init = &(struct clk_init_data){
+		.name = "pll4_vote",
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "pll4", .name = "pll4",
+		},
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
 enum {
 	P_PXO,
 	P_PLL8,
@@ -2543,6 +2557,7 @@ static struct clk_branch rpm_msg_ram_h_clk = {
 static struct clk_regmap *gcc_msm8660_clks[] = {
 	[PLL8] = &pll8.clkr,
 	[PLL8_VOTE] = &pll8_vote,
+	[PLL4_VOTE] = &pll4_vote,
 	[GSBI1_UART_SRC] = &gsbi1_uart_src.clkr,
 	[GSBI1_UART_CLK] = &gsbi1_uart_clk.clkr,
 	[GSBI2_UART_SRC] = &gsbi2_uart_src.clkr,
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8660.h b/include/dt-bindings/clock/qcom,gcc-msm8660.h
index 4777c002711a..51d2e97441c8 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8660.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8660.h
@@ -264,5 +264,6 @@
 #define PLL10					255
 #define PLL11					256
 #define PLL12					257
+#define PLL4_VOTE				258
 
 #endif
-- 
2.43.0


