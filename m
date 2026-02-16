Return-Path: <linux-arm-msm+bounces-93021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CbsFcGqk2lE7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:39:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A227D14821D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:39:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C18493022612
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 23:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD21E27BF7D;
	Mon, 16 Feb 2026 23:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Dn9Jea18"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7761F2F1FFE
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771285142; cv=none; b=E7Gx9vqX5LDdnjNDx6PoK5ZDMLK3thci1hBnekVR/J4/XN3tyzl8AUI0fjudsDbSwp859V+ikCsDLhOVGYFgBfGa+fyST7i3cMgHSIs6d2G97jXJlM88pCwFmAprv5MMCTdhKptY/tc5gr0EJkK3gl4QatSmySpwEKfns5Uwn6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771285142; c=relaxed/simple;
	bh=9gXORpOWQrrniCRlK1vNO9h4X4Fi44J556FjVdTAbLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IfNqZ5hWEA1JcNh3hlxVemKCb3abLLge7Zhv9INbAfTI+CsfPDpgK/SQjzDhlICncgOlLsBu+hn3AAC7Jb5XT0vRLPnnwZSRVDFH/t94twPBgp9d4Qg2rXjAjLxXvv6OUEtoMDxwH6S5DIL9eZbfoNQNMG/CMNJLCSljlMME7UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Dn9Jea18; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1771285139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yY9yyJpMHiUSK3y3yUdWqkedHsO8yxXbPn8ACEQJD3A=;
	b=Dn9Jea18JOksSmpf/XyNliig2T5KJu2U6Gtw7hKdNSfvbm0BtqHMyMA1bE16fcnLlb5TOx
	xddFDV5a909ej8fCFNq5B1mzvrG2UChVKTGrnb7bT1R/2R3Ym4zgRVrZpPI1wnLl0KofxS
	FXcc9yg0LrRrmcFCyKg398NM535UA2gdUuaEvH50ugpBu86g+zcRpKN3GREtZNnedWBaxH
	kdNa/0cekpNWJzf+CjXZowbsQkURUU14BpA/aukRpQ4aJC0hULC8FSGiKZTsuyz2bTewfd
	oyaJyNv0TTlOoxxwgjMZGiwHf+VSE9MC3zqJjHceoprYVmBKS2PFBZhU2DywFQ==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Martin Botka <martin.botka@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Val Packett <val@packett.cool>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] clk: qcom: dispcc-sm6125: Add missing MDSS resets
Date: Mon, 16 Feb 2026 20:25:22 -0300
Message-ID: <20260216233600.13098-6-val@packett.cool>
In-Reply-To: <20260216233600.13098-2-val@packett.cool>
References: <20260216233600.13098-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93021-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A227D14821D
X-Rspamd-Action: no action

The MDSS resets were left undescribed, fix that.

Fixes: 6e87c8f07407 ("clk: qcom: Add display clock controller driver for SM6125")
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/dispcc-sm6125.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm6125.c b/drivers/clk/qcom/dispcc-sm6125.c
index 851d38a487d3..2c67abcfef12 100644
--- a/drivers/clk/qcom/dispcc-sm6125.c
+++ b/drivers/clk/qcom/dispcc-sm6125.c
@@ -17,6 +17,7 @@
 #include "clk-regmap.h"
 #include "common.h"
 #include "gdsc.h"
+#include "reset.h"
 
 enum {
 	P_BI_TCXO,
@@ -607,6 +608,10 @@ static struct clk_branch disp_cc_xo_clk = {
 	},
 };
 
+static const struct qcom_reset_map disp_cc_sm6125_resets[] = {
+	[DISP_CC_MDSS_CORE_BCR] = { 0x2000 },
+};
+
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x3000,
 	.pd = {
@@ -663,6 +668,8 @@ static const struct qcom_cc_desc disp_cc_sm6125_desc = {
 	.config = &disp_cc_sm6125_regmap_config,
 	.clks = disp_cc_sm6125_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm6125_clocks),
+	.resets = disp_cc_sm6125_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_sm6125_resets),
 	.gdscs = disp_cc_sm6125_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_sm6125_gdscs),
 };
-- 
2.52.0


