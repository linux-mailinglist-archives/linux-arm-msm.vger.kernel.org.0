Return-Path: <linux-arm-msm+bounces-118907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 11P5Du2sVWprrgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:28:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B80D750A17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:28:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=mqef01Uk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118907-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118907-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F37B3041BB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9583B9D9A;
	Tue, 14 Jul 2026 03:28:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E7D18D636;
	Tue, 14 Jul 2026 03:28:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783999718; cv=none; b=p/7rJYPjSxW6qHbqJWnC/IDfim1d2kQ/c6MuaWMfsES/3uWnvJ5zD1SIjNZUzA4nfED77ilDhXpgcnq4aYXRn7I44tqyPGfGf61DNAcb3S5VWsYl8LfG03UxlrtC3qLoY6vk5nCErbpDPp3qYE/hUkoSXJ6djggUIpb1+9S26KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783999718; c=relaxed/simple;
	bh=tuOyGc2HvqsLhhkEBIqIuJ5wQ1fqizUe9vaqx38ybbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mgy1VKHl1nP7KvQu+LOSiJx1cCNnQmZ707lFE619OgyBRVlQ1OV2EtmAQPU2s7lpYLGYvCPaQQOhCWdotS7GjXCyvaxW3vstnpNIgxG9/ZXJSS8icVVhz+Ks8fEvQGVAQ2bgoakYwqSFtOt2keobKXrz/pyimeKyPCi3MunzI7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqef01Uk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70055C2BCF7;
	Tue, 14 Jul 2026 03:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783999718;
	bh=tuOyGc2HvqsLhhkEBIqIuJ5wQ1fqizUe9vaqx38ybbk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mqef01UkobXMx7cBupSiuGbj2JnGgxFaxzbq+2sQN2AzWBcTgAe0UskH4u6fIoMND
	 ie4C2JTsnDoQ2Y9SdgpmtaJkA1bWL+iFgd+mzOy5AmCc7kZ8J71fY5DzZiBFGlwk4c
	 ik54x/midVfTpUe01FDhT3IXKFd7Q2AiveyMH5ei7qzsSFZJnbWNqWjpG8LTvr6Yya
	 L6yRoj+sdb81QFu6S5fuuV6Jh3MvsmK4Mk9bJu/P0V3gdb9Y9EAp/+4Voe2TxW9pMR
	 lBXkYjlWOCgpgegTRHzgSdeqcMxeJ7DbhxzvZTw3kdrqytkO0WXGbBK8xuTI4kRpgx
	 MqScvwCa1FRIw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54408C44507;
	Tue, 14 Jul 2026 03:28:38 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Mon, 13 Jul 2026 23:28:18 -0400
Subject: [PATCH v3 2/3] clk: qcom: dispcc-sm8450: Migrate to
 qcom_cc_driver_data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-sm8450-qol-dispcc-v3-2-56fd05822270@proton.me>
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
In-Reply-To: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783999716; l=2981;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=Jbnp8p29U7ihTi5nzGMIrBxFlgzT7kH3/JhcN7BtyIQ=;
 b=fP44rtzAgx+pYQdrFCgjsq+g5In/H5GO93GUDY8+TCs1kWxhPt+TMwL+PeYzvO77jEhEIK7Oj
 R4ZGbcf7QKNDewMBceIhAYdqOkN+s4BSBYxICimdeSXj+da/4Pgc53q
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:lumag@kernel.org,m:quic_jkona@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:esteuwu@proton.me,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118907-lists,linux-arm-msm=lfdr.de,esteuwu.proton.me];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[esteuwu@proton.me];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B80D750A17

From: Esteban Urrutia <esteuwu@proton.me>

Migrate to qcom_cc_driver_data, which is used by other clock controller
drivers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/clk/qcom/dispcc-sm8450.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index c7e04bd315d5..facbf040ab9a 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -1778,6 +1778,29 @@ static const struct regmap_config disp_cc_sm8450_regmap_config = {
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
+static void disp_cc_sm8450_clk_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Enable clock gating for MDP clocks */
+	regmap_set_bits(regmap, DISP_CC_MISC_CMD, BIT(4));
+}
+
+static const struct qcom_cc_driver_data disp_cc_sm8450_driver_data = {
+	.alpha_plls = disp_cc_sm8450_plls,
+	.num_alpha_plls = ARRAY_SIZE(disp_cc_sm8450_plls),
+	.clk_cbcrs = disp_cc_sm8450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm8450_critical_cbcrs),
+	.clk_regs_configure = disp_cc_sm8450_clk_regs_configure,
+};
+
 static const struct qcom_cc_desc disp_cc_sm8450_desc = {
 	.config = &disp_cc_sm8450_regmap_config,
 	.clks = disp_cc_sm8450_clocks,
@@ -1786,6 +1809,7 @@ static const struct qcom_cc_desc disp_cc_sm8450_desc = {
 	.num_resets = ARRAY_SIZE(disp_cc_sm8450_resets),
 	.gdscs = disp_cc_sm8450_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_sm8450_gdscs),
+	.driver_data = &disp_cc_sm8450_driver_data,
 };
 
 static const struct of_device_id disp_cc_sm8450_match_table[] = {
@@ -1823,19 +1847,13 @@ static int disp_cc_sm8450_probe(struct platform_device *pdev)
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
 
-	/* Enable clock gating for MDP clocks */
-	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xe05c); /* DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm8450_desc, regmap);
 	if (ret)
 		goto err_put_rpm;

-- 
2.55.0



