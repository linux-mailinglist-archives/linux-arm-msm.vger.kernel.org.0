Return-Path: <linux-arm-msm+bounces-96107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7GA8JmEdrmnv/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 02:07:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BB2233074
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 02:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5FA5300B84D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 01:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8EA22D4DC;
	Mon,  9 Mar 2026 01:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="vpoLoQtb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4A82264A9
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 01:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773018461; cv=none; b=Chz2nfTPheyos8KGBAJwgDNFE6qcFPoOEC4+CMeIAq6snYZnawG/xhISHqr9MC8ltpYN28gSqQqrbbi+eOQpB3t9bfnIWr6xQAoCV9k0dwyGTgvHk9SUb8PeRc0HWgSrq+7uEWxjC45FPIDalHOto3KFf7YIjwtjqEqTGHCo1dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773018461; c=relaxed/simple;
	bh=U57ypHnljXKDxdsq3ODYlw85+vLwbFuz97Pd9FjGt+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUNeDUWNi3jdBPRgNgpisf1eAey8dEvC+HAiZlZloM0ZgtOZBxlO2b+sH1UHFEVD5kwGoX8tlhn2IXju8xwx2BzoLVb675dFoucB+gLNfx7rqbLku5sGxuRGYg0eRfjPzjEBT5nmsku4geS6vWMBshOo4BPFj0phtUwY4GvIOkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=vpoLoQtb; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773018458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6kYbndzewGc+xjVSANoUQRMJVXNo+rCGM1vazeKfU1s=;
	b=vpoLoQtbqNORZ41RDBb6IYgUabzjzMd35UAUcTCyT0fX/7QjBVzYQrC0gq4O0KE1ES0r7M
	fdlvfW+YrztwYgvmVd6PDUNX7c7nNJy71pTDAlObeyiWkQE2KrEDuiScGZufQ3re8AWL1y
	p+Z0Jp5gGtwhx4BSEQ6XrvbBLhhCWmQf1I4BJI7J02lBbX/v6CQ2nkSKZR4nYfNaZI46Jo
	Niw1K7KYPL9DICKftfUgov06kn4IXsokdoRAYp3Qdqx/nge69OCdh7/EpZiFv1C5WMMfxg
	xoqmriC8yPjB2+5rzCJVl3RqOmb3vwhGKnpLQkmeSnxXfhgJkIAiJ+xKDFmw3g==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] clk: qcom: gcc-sc8180x: Add runtime PM
Date: Sun,  8 Mar 2026 22:06:03 -0300
Message-ID: <20260309010653.4266-1-val@packett.cool>
In-Reply-To: <20260309010214.224621-1-val@packett.cool>
References: <20260309010214.224621-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: F0BB2233074
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96107-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:dkim,packett.cool:email,packett.cool:mid]
X-Rspamd-Action: no action

The GCC block on SC8180X is powered by the CX rail. We need to ensure
that it's enabled to prevent unwanted power collapse.

Enable runtime PM to keep the power flowing only when necessary.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/gcc-sc8180x.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index 365943cd5278..073fb1e2b302 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -9,6 +9,7 @@
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -4676,9 +4677,19 @@ static int gcc_sc8180x_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	int ret;
 
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
 	regmap = qcom_cc_map(pdev, &gcc_sc8180x_desc);
-	if (IS_ERR(regmap))
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
 		return PTR_ERR(regmap);
+	}
 
 	/* Keep some clocks always-on */
 	qcom_branch_set_clk_en(regmap, 0xb004); /* GCC_VIDEO_AHB_CLK */
@@ -4699,9 +4710,20 @@ static int gcc_sc8180x_probe(struct platform_device *pdev)
 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
 					ARRAY_SIZE(gcc_dfs_clocks));
 	if (ret)
-		return ret;
+		goto err_put_rpm;
 
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sc8180x_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &gcc_sc8180x_desc, regmap);
+	if (ret)
+		goto err_put_rpm;
+
+	pm_runtime_put(&pdev->dev);
+
+	return 0;
+
+err_put_rpm:
+	pm_runtime_put_sync(&pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver gcc_sc8180x_driver = {
-- 
2.52.0


