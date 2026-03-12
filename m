Return-Path: <linux-arm-msm+bounces-97183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMhoJZeismnwOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:25:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B81270DB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 488CD305B5AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019E63BE64F;
	Thu, 12 Mar 2026 11:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="epMDnH1M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A11E3BD25F
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314673; cv=none; b=QH7NtYri8w6J4pRWnJVhk/J5eftjhvakJh+8VcXYOXBLJAL+DrGvv1AtLOg5BcBDmgZ3xoMqL3Fwj6s1Q9p9qooOepIca1cJPDZ7w/SfhJCClY4HxG7i6USxPL9LxPkgGpATlTAjYmaQ1FyyxOWjNoFApureBSKbtdc0tCNa4Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314673; c=relaxed/simple;
	bh=/tmKxqWvNYa6MuUMQn+keyh63vEc8tPLub4G+YWIYJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HOcdKIhzPiFNzoC7RUHoyKLdpLJqITA6Ly6tdCVNP9C5PufE9UbFMmKdY2Q8M5e+BPLz0cpU1P8DR/77HQIKRGY+U+b4HiicUflLQi0r/qRwpDYlF5YGKzChou/cd4pSdwt37yCAlwCJ4qKDGkesvbJEw+c+hwHjfyv3hgftOLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=epMDnH1M; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773314671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CzW6GgYT0Hq52fgkX18bHoLKVtz4DvDWuePNOqfPfZY=;
	b=epMDnH1MBr9n2q5qyz6OUtR5PLmPfJKXqHht82KSgIV9rMPdn68oqjkSukJIenyrCp5mTL
	hx3IjIvHHG6WZ5GqIlGavqdkPjW5RH/SfyyCdwk5lix6RWibJIZOYFcCXnz8/xLBFRtXtq
	+sbl4A2EPZpdEIwJWAtq+x01fBPkAvgtN+zgLR1k0J3aNTn7RBEEtwABtVCmHcdo5RZ3nx
	lPoBIXdAf/xWvolCabVsfRjwnwDYoExjovcjXbs21ehO+3CIaVt+nHnVsXd4EjfweZoi3k
	mxuzQoZ1VhSZMZm4w1UdKldKGMVAwoR/Yi+Fa8VeDG2sCiK4Cg8cprkyTyhNKQ==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/11] clk: qcom: dispcc-sm8250: Use shared ops on the mdss vsync clk
Date: Thu, 12 Mar 2026 08:12:12 -0300
Message-ID: <20260312112321.370983-8-val@packett.cool>
In-Reply-To: <20260312112321.370983-1-val@packett.cool>
References: <20260312112321.370983-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[packett.cool,kernel.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-97183-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,packett.cool:dkim,packett.cool:email,packett.cool:mid]
X-Rspamd-Queue-Id: 28B81270DB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

mdss_gdsc can get stuck on boot due to RCGs being left on from last boot.
As a fix, commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon
registration") introduced a callback to ensure the RCG is off upon init.
However, the fix depends on all shared RCGs being marked as such in code.

For SM8150/SC8180X/SM8250 the MDSS vsync clock was using regular ops,
unlike the same clock in the SC7180 code. This was causing display to
frequently fail to initialize after rebooting on the Surface Pro X.
Fix by using shared ops for this clock.

Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/dispcc-sm8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 8f433e1e7028..cdfdb2cfb02b 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -632,7 +632,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 		.parent_data = disp_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
-- 
2.52.0


