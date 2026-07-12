Return-Path: <linux-arm-msm+bounces-118528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NTayC+sFU2p5WAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 05:11:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FCA743A85
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 05:11:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=o2d95Jog;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118528-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118528-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7ECDF301982D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 03:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9998F346A18;
	Sun, 12 Jul 2026 03:11:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7496A27A476;
	Sun, 12 Jul 2026 03:11:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825893; cv=none; b=AlFM36phfKZGs035XRMcvJGjYv59ZjBxdAQSCDCpp6ATSZuxb9Qlei26se0C0OKGYD7bIPyvjqM5SOkz3CKb4h56QRM36pVCB1U8brbzCzt97DdGVLbRUQwi6F3/Ij8M8YXgnoFrYM2CrlimYaVbBNclNT9bcrvrSeuBWSALXL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825893; c=relaxed/simple;
	bh=ffpRq/yZnNx7YKIkRIAyqqnKBxqhvOWldlUoQ94VLnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/dwtgePOa4X8q4ut1pm6nl+ktDaSbciOBwyPdQT3CkMLHdphxB4KOoUjgdHk8YS/lXkRtL6rGLdbsgDiYN77yoPCdqKhW9OsaYAirOyRVB62a2jyu6fb/v6HcAQ/RShxV1QwGeVUirVXTm9wM5r5daLbWb+RrlN43lBqnaTBZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2d95Jog; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34C8EC2BCF6;
	Sun, 12 Jul 2026 03:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783825893;
	bh=ffpRq/yZnNx7YKIkRIAyqqnKBxqhvOWldlUoQ94VLnk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=o2d95Joggp4+N+ZF3j0sgXJORMij/S5XGVOskw7gJJl+88k89z1HlVNG813EByfq4
	 a9jyIGR3iteMzhm4D2bibPGN/sT84dMNsIBnAAVFUqDGCsh6XzbMWaVIIPY2pDJWO4
	 lXHZzEgFw37R/PZPIIIjZGc8mt1sp7CT+IqEfi5Z10vn/6sET7BjZ9CSwI9cvKy5ME
	 I30SBbTVxXLrmbeSZtaCgxEL8i2k5TE2e1+GvESKrFOE/asuyAc/RBv6ukR0iTnKtc
	 RRL1RNHy6oESkXFj2WIuMcpMQJxn4mPW+HosYMfqKiXQcc3OW6ifiePhbyDCeOBU7B
	 oQEjf7Ys/rCqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCC6C44501;
	Sun, 12 Jul 2026 03:11:33 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Sat, 11 Jul 2026 23:10:36 -0400
Subject: [PATCH v2 2/3] clk: qcom: dispcc-sm8450: Migrate to
 qcom_cc_driver_data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-sm8450-qol-dispcc-v2-2-fc1a07ac5601@proton.me>
References: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me>
In-Reply-To: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783825891; l=2649;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=PwdqzjnMeRdkC7srNPy0ZM+7B2sU0GfwVPACjedCviQ=;
 b=U7SJM3IHNt/ZbMXtLZBCf07N4fRMeZlzSSaaIkpejagx9223suGXBIVnqXw4mL6ANATt8Hcvx
 HY4UtxlMrFuDaFVM1pigThWj/KkNYYtvNuI/D7ZNMBTi7aSYh5c6ncM
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118528-lists,linux-arm-msm=lfdr.de,esteuwu.proton.me];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:lumag@kernel.org,m:danila@jiaxyga.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:esteuwu@proton.me,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[esteuwu@proton.me];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80FCA743A85

From: Esteban Urrutia <esteuwu@proton.me>

Migrate to qcom_cc_driver_data, which is used by other clock controller
drivers.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/clk/qcom/dispcc-sm8450.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index c7e04bd315d5..07f22b5b5ee5 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -1778,6 +1778,22 @@ static const struct regmap_config disp_cc_sm8450_regmap_config = {
 	.fast_io = true,
 };
 
+static struct clk_alpha_pll *disp_cc_sm8450_plls[] = {
+	&disp_cc_pll0,
+	&disp_cc_pll1,
+};
+
+static const u32 disp_cc_sm8450_critical_cbcrs[] = {
+	0xe05c, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm8450_driver_data = {
+	.alpha_plls = disp_cc_sm8450_plls,
+	.num_alpha_plls = ARRAY_SIZE(disp_cc_sm8450_plls),
+	.clk_cbcrs = disp_cc_sm8450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm8450_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm8450_desc = {
 	.config = &disp_cc_sm8450_regmap_config,
 	.clks = disp_cc_sm8450_clocks,
@@ -1786,6 +1802,7 @@ static const struct qcom_cc_desc disp_cc_sm8450_desc = {
 	.num_resets = ARRAY_SIZE(disp_cc_sm8450_resets),
 	.gdscs = disp_cc_sm8450_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_sm8450_gdscs),
+	.driver_data = &disp_cc_sm8450_driver_data,
 };
 
 static const struct of_device_id disp_cc_sm8450_match_table[] = {
@@ -1823,19 +1840,16 @@ static int disp_cc_sm8450_probe(struct platform_device *pdev)
 		disp_cc_pll1.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
 		disp_cc_pll1.clkr.hw.init = &sm8475_disp_cc_pll1_init;
 
-		clk_lucid_ole_pll_configure(&disp_cc_pll0, regmap, &sm8475_disp_cc_pll0_config);
-		clk_lucid_ole_pll_configure(&disp_cc_pll1, regmap, &sm8475_disp_cc_pll1_config);
+		disp_cc_pll0.config = &sm8475_disp_cc_pll0_config;
+		disp_cc_pll1.config = &sm8475_disp_cc_pll1_config;
 	} else {
-		clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
-		clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
+		disp_cc_pll0.config = &disp_cc_pll0_config;
+		disp_cc_pll1.config = &disp_cc_pll1_config;
 	}
 
 	/* Enable clock gating for MDP clocks */
 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xe05c); /* DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm8450_desc, regmap);
 	if (ret)
 		goto err_put_rpm;

-- 
2.55.0



