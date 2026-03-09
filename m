Return-Path: <linux-arm-msm+bounces-96108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKfVN2wdrmnv/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 02:07:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDBA233084
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 02:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AE82300E149
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 01:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA2AC244675;
	Mon,  9 Mar 2026 01:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="SPMEY3Yy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6382A238C1B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 01:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773018470; cv=none; b=sLAyMNzV2hB2FYgix0pt2Fxg1euT5y20YfmJ5Ri8Q/F8xIZP1fCFKN0OyMCE5t3YmcoBrXklG1ymWH5E3G2W15/W2RWmuLQPuo7/DOYBCtLgVqegqugNBV/YYuAF3GO+tGv8M562cVOoplyqwcZhnCrHulGk8Z+Y0pH9hneZkPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773018470; c=relaxed/simple;
	bh=/H2AD7oqAEUG+AgYB0p3dy99I3EKp/981cS22YlZjHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqoirsoIASHatwM4HxWZRgY8CRpHkJatTZuf6ShIt5hGtT0UgT5YL0Oj7P3hJuojzCAmRL6rEWTqgTtnUeYU+mWYofVM79oiSstMyD9v9wGlc34534xIdYcjsCbfgoXPZWUBGgV8Yhwuka7PKoyoo1oKALAPwwk3Wqlmg8QQzKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=SPMEY3Yy; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773018467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H12MaRopqLgkqyQ4i7oMR2dyRauH9db39BTpJwkq+Z4=;
	b=SPMEY3YyNQIQ92AltTwUtMNzMbnciNwyPEzG3ILukOJN7eojqfhbQ0t4Bct5lgi2GpE4md
	bIbnfNetdvmANLtGNoVjEbD7iXh1RNxJrLheZYjI09sW1e9owdOxPVnAm7EGaxRvylvLQT
	VsWd/TfYPHGaqYxeIqLPPBn2oy6tXU9hFaY+u5hGcdruuX9JPGQ9BBmKF0b3vh5RB1OwFA
	IEmGSb7hG65z/NEVCrthncsUX/A9SenNnP3f5VNI4KYz5MsAiio0VKtwqeh8k9ZNN9VtDo
	XRu67Nlgw6IeWgyQRFiUNkcXSxoJuN/6Xdfm8FDTmhRHs/ZEB92rIBeW9JJYJg==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] clk: qcom: camcc-sc8180x: Disable always-on clocks on probe failure
Date: Sun,  8 Mar 2026 22:06:04 -0300
Message-ID: <20260309010653.4266-2-val@packett.cool>
In-Reply-To: <20260309010653.4266-1-val@packett.cool>
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010653.4266-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: DBDBA233084
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
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-96108-lists,linux-arm-msm=lfdr.de];
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

Align runtime PM code with sc8280xp, fixing clocks being left always-on
in case qcom_cc_really_probe fails.

Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/camcc-sc8180x.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
index 388fedf1dc81..7cf24d5c3abf 100644
--- a/drivers/clk/qcom/camcc-sc8180x.c
+++ b/drivers/clk/qcom/camcc-sc8180x.c
@@ -2852,8 +2852,8 @@ static int cam_cc_sc8180x_probe(struct platform_device *pdev)
 
 	regmap = qcom_cc_map(pdev, &cam_cc_sc8180x_desc);
 	if (IS_ERR(regmap)) {
-		pm_runtime_put(&pdev->dev);
-		return PTR_ERR(regmap);
+		ret = PTR_ERR(regmap);
+		goto err_put_rpm;
 	}
 
 	clk_trion_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
@@ -2869,9 +2869,19 @@ static int cam_cc_sc8180x_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0xc200); /* CAM_CC_SLEEP_CLK */
 
 	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sc8180x_desc, regmap);
+	if (ret)
+		goto err_disable;
 
 	pm_runtime_put(&pdev->dev);
 
+	return 0;
+
+err_disable:
+	regmap_update_bits(regmap, 0xc1e4, BIT(0), 0);
+	regmap_update_bits(regmap, 0xc200, BIT(0), 0);
+err_put_rpm:
+	pm_runtime_put_sync(&pdev->dev);
+
 	return ret;
 }
 
-- 
2.52.0


