Return-Path: <linux-arm-msm+bounces-94638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLbAEPxio2myBQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:49:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E061C9476
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 22:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7008F31BB0C1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 20:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FE93090D5;
	Sat, 28 Feb 2026 20:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="rykXTcqZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F06D26C3BE
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 20:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772311660; cv=none; b=ocyubtS3MaGCOUaPHsQJcTBcxXcuZYQf74tCuTgz6i6oSuChVGZ2mISQPmzdKAeM9v2sdPfL0cPGMBm33G7wr4CAoWTc7VgRgO+6M/u83hf3On1KqyCbBXvTpAbkY5xnMIk1bBcly8mdwC2hxypmUgyQWqyMo2+EWVPxJR8GZs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772311660; c=relaxed/simple;
	bh=dcQi2nbUZD1i0Tnlv+ymMpJgvfb8tkQT2XZ6lA9C2Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=prG8rTtzBvtilfRMtek16ep/67xVLWc5YTjKJ0QTuQoTSNqqUHqaUHTWcK3I3CQQVuDoZCOTSGB7+C7gOTqF2UxopSoCiOFwiucvKE2CGoWSGV89ku1oRQfe3sgoBO6kXWPfqgDlAI99EEqd8VRrYkI1+5EU+ZO0o0K6h0qKnP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=rykXTcqZ; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772311657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pSQbyc3KzSWaX/5WfKEJcewBM7+uUPCiSw58qLGCf1k=;
	b=rykXTcqZZQG9Btdc+M4B66oUchPQJ8QsB1YWj/yAHqYSs4/Sj0O103u7vs9FOHfTU4bqCz
	XEQi7mOs7v3kLGGCClzIaOdny38LyihyS9ChdCc6mL66H/PgIup+PfiQG22U76mK/GIib5
	CaSZpeCz6R9IIwH0xRZcxOt7ZmpaAfNsLeZ8PeC1V02JRDDnYLsOohIcqTOgS939Be8fKg
	94udtyeyVme/YIL5oHzHqVBawfDHA9OJdC6zKxLc/JeX4abIgIUCKKssMreiPmL3ILt3Uw
	IYCCFNV3DoSCdYUfMIlKHpSTH/iUgXnMjkd/j/v9yyqijKhDn5TzrhWG/2/kxA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Martin Botka <martin.botka@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 4/6] clk: qcom: dispcc-sm6125: Add missing MDSS resets
Date: Sat, 28 Feb 2026 17:41:30 -0300
Message-ID: <20260228204638.11705-5-val@packett.cool>
In-Reply-To: <20260228204638.11705-1-val@packett.cool>
References: <20260228204638.11705-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94638-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,somainline.org,collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	NEURAL_HAM(-0.00)[-0.951];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:mid,packett.cool:dkim,packett.cool:email]
X-Rspamd-Queue-Id: A2E061C9476
X-Rspamd-Action: no action

The MDSS resets were left undescribed. Add them to allow resetting the
display subsystem, which is necessary to avoid issues caused by state
left over from the bootloader on various platforms.

Fixes: 6e87c8f07407 ("clk: qcom: Add display clock controller driver for SM6125")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


