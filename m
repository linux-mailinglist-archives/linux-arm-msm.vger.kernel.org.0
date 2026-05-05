Return-Path: <linux-arm-msm+bounces-106017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id v3R5OntV+mmNMgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 22:39:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 539584D3B88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 22:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6E8F301C3C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 20:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDB33D6CB2;
	Tue,  5 May 2026 20:38:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.chunchunmaru.org (mail.chunchunmaru.org [45.79.219.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2003D3C2763;
	Tue,  5 May 2026 20:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.219.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778013537; cv=none; b=paNGkz1qvCW73GRMQJV6ggmiVo/c+Wz9d0imjCDJp9UwewWxHu6f+f8Msw9gpOmHa1GxkB8IWm1PxsSZxovQxjffVFEKKRNCLEZFF0+dhu/I1Qy17qjASOpK6fHX3jeAlQfPCxWNWz3+ZrUewxA5pl1WqwIihR2KLmN74driafk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778013537; c=relaxed/simple;
	bh=dHd2KDKnBvYMY1x5Ql4RD/wy9CzzB4WBj1LykRhnhTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cYKw8w3CZWjBpnVAuW/9/4G5RirJmy32MoB8jcA13MJyQFjsS2nTJVLvwqjVzbM7a9viPva1PsuLIMq9LprEI/84RMbOzZfNoqZr4jNpwo1PjsWQnNNbvjbq80yX8a/7cZ6ZkIXLUIWUFcByrxqLkcmJFHUe9VFEYF57pLAZjWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=floorchan.org; spf=none smtp.mailfrom=floorchan.org; arc=none smtp.client-ip=45.79.219.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=floorchan.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=floorchan.org
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9517A32254A;
	Tue,  5 May 2026 20:38:53 +0000 (EDT)
From: "Catherine A. Frederick" <serenity@floorchan.org>
To: andersson@kernel.org,
	sboyd@kernel.org,
	krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Catherine A. Frederick" <serenity@floorchan.org>
Subject: [PATCH 1/3] clk: qcom: smd-rpm: Add clocks for MSM8920
Date: Tue,  5 May 2026 16:38:39 -0400
Message-ID: <20260505203845.192140-1-serenity@floorchan.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 539584D3B88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106017-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DMARC_NA(0.00)[floorchan.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[serenity@floorchan.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	BLOCKLISTDE_FAIL(0.00)[100.90.174.1:server fail,45.79.219.101:server fail,2600:3c0a:e001:db::12fc:5321:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

MSM8920 is very similar to MSM8917, but adds IPA clocks.

Signed-off-by: Catherine A. Frederick <serenity@floorchan.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 103db984a40b..cdabe373aabc 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -666,6 +666,36 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8917 = {
 	.num_icc_clks = ARRAY_SIZE(bimc_pcnoc_snoc_smmnoc_icc_clks),
 };
 
+static struct clk_smd_rpm *msm8920_clks[] = {
+	[RPM_SMD_XO_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_BIMC_GPU_CLK]		= &clk_smd_rpm_bimc_gpu_clk,
+	[RPM_SMD_BIMC_GPU_A_CLK]	= &clk_smd_rpm_bimc_gpu_a_clk,
+	[RPM_SMD_IPA_CLK]		= &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK]		= &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_QDSS_CLK]		= &clk_smd_rpm_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK]		= &clk_smd_rpm_qdss_a_clk,
+	[RPM_SMD_BB_CLK1]		= &clk_smd_rpm_bb_clk1,
+	[RPM_SMD_BB_CLK1_A]		= &clk_smd_rpm_bb_clk1_a,
+	[RPM_SMD_BB_CLK2]		= &clk_smd_rpm_bb_clk2,
+	[RPM_SMD_BB_CLK2_A]		= &clk_smd_rpm_bb_clk2_a,
+	[RPM_SMD_RF_CLK2]		= &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A]		= &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_DIV_CLK2]		= &clk_smd_rpm_div_clk2,
+	[RPM_SMD_DIV_A_CLK2]		= &clk_smd_rpm_div_clk2_a,
+	[RPM_SMD_BB_CLK1_PIN]		= &clk_smd_rpm_bb_clk1_pin,
+	[RPM_SMD_BB_CLK1_A_PIN]		= &clk_smd_rpm_bb_clk1_a_pin,
+	[RPM_SMD_BB_CLK2_PIN]		= &clk_smd_rpm_bb_clk2_pin,
+	[RPM_SMD_BB_CLK2_A_PIN]		= &clk_smd_rpm_bb_clk2_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_msm8920 = {
+	.clks = msm8920_clks,
+	.num_clks = ARRAY_SIZE(msm8920_clks),
+	.icc_clks = bimc_pcnoc_snoc_smmnoc_icc_clks,
+	.num_icc_clks = ARRAY_SIZE(bimc_pcnoc_snoc_smmnoc_icc_clks),
+};
+
 static struct clk_smd_rpm *msm8936_clks[] = {
 	[RPM_SMD_XO_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo,
 	[RPM_SMD_XO_A_CLK_SRC]		= &clk_smd_rpm_branch_bi_tcxo_a,
@@ -1295,6 +1325,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8909", .data = &rpm_clk_msm8909 },
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8917", .data = &rpm_clk_msm8917 },
+	{ .compatible = "qcom,rpmcc-msm8920", .data = &rpm_clk_msm8920 },
 	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
 	{ .compatible = "qcom,rpmcc-msm8937", .data = &rpm_clk_msm8937 },
 	{ .compatible = "qcom,rpmcc-msm8940", .data = &rpm_clk_msm8940 },
-- 
2.53.0


