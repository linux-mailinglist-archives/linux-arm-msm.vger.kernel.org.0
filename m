Return-Path: <linux-arm-msm+bounces-32508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECB59864A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 18:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F7A228B27A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 16:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EA639FEB;
	Wed, 25 Sep 2024 16:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Zl7g9RJT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDC61D5ABD;
	Wed, 25 Sep 2024 16:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727281088; cv=none; b=fx1qT3bsnK6k0jZZXCWkQSJcQLW1hig2qFOdz3JjbN++lUyybTFWlqRwuZNxNSKNMMb2L1g1HwC2mW2CQWBOfnSFBQF8TwvPgwe3RdgXmzkgq2PCGGjjLD65C8IKSRK/YS3qhgQ86mGu6kYSe6EWVqgjdFGE0sNDObQPiJn3+6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727281088; c=relaxed/simple;
	bh=UR4rx861FVc7MUozMDlYpuInZFzHxiWfjaUBgmnWlzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UZjOLnX1yv1FFOyFulVFy8HEPPJR3687iRKqdrSdO216LdkviTAgc3O8l3oG5dHBitOM158Zc/w0+q0WEw8tNLDeyXLMaT408Bwt4FsrR5vKhZW15MMBgokpA1o6sr96mj5vwDASfxvXF3FjmWBGTtOiHm4dnmaGwBDmx5//gGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Zl7g9RJT; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.130] (BC2491B6.dsl.pool.telekom.hu [188.36.145.182])
	by mail.mainlining.org (Postfix) with ESMTPSA id 489B4E450F;
	Wed, 25 Sep 2024 16:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1727280584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fhfpSgyYQdb2EqROgqo0rwnUCTCj5II+pEYG/o/3OIM=;
	b=Zl7g9RJT1AjBvUtYBfRyjBJYVyoLiEy6jyD5OauarHAkDyPoZY7bX61nKlvOffBto/8ktK
	1eWPZybdICP87Ack0l3GNLoqlaxxBnj5qgwwtj+7IARNqJRJyZ6c3KmKPZPbNacsM3tzbG
	u7c/3Hv9RQJjpR9JxMQYIyWXR+WaaQS+OOx6xzBu+WjpIQ0JsWMcXt0yrJGhQ0nJznftwU
	ipZImxYrLJl9adhoAiLeiBvJQOIaELm2YraA+lQ0RUj+M0QVUq9iMDdEM9Nr8Psyv8YFLy
	3QadhZeUv8IlII528HT+jVFtZ+X9/i/Tk2tfVdqXVJIsfdChV1/xbE3c/j7Xhg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 25 Sep 2024 18:09:39 +0200
Subject: [PATCH] clk: qcom: clk-alpha-pll: Fix pll post div mask when width
 is not set
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240925-fix-postdiv-mask-v1-1-f70ba55f415e@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAMI19GYC/x2MQQqAIBAAvxJ7bqHUiPpKdDDdaoks3JAg+nvSc
 WBmHhCKTAJ98UCkxMJHyFCXBbjVhoWQfWZQlTJVpxqc+cbzkMtzwt3KhpM1LTmvNFkNOTsjZed
 fDuP7fnVsv+1iAAAA
X-Change-ID: 20240925-fix-postdiv-mask-ba47ecd23ea3
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727280584; l=1264;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=UR4rx861FVc7MUozMDlYpuInZFzHxiWfjaUBgmnWlzQ=;
 b=hoCWYjTKMqe5jer7ssS/foHAcic93tpjikdx3NHX2UQP/WtBfWXSd/t7KKJS2eMbxCgxA9rfS
 gJD0R9guodpBmtCYiIht+Kxa2e/ezE4AIbhCwkbfQSF09q04dPcbXT4
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Many qcom clock drivers do not have .width set. In that case value of
(p)->width - 1 will be negative which breaks clock tree. Fix this
by checking if width is zero, and pass 0 to GENMASK if that's the case.

Fixes: 2c4553e6c485 ("clk: qcom: clk-alpha-pll: Fix the pll post div mask")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index f9105443d7dbb104e3cb091e59f43df25999f8b3..1f914bc0af5449ed1fb545d850607138a06fab1a 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -40,7 +40,7 @@
 
 #define PLL_USER_CTL(p)		((p)->offset + (p)->regs[PLL_OFF_USER_CTL])
 # define PLL_POST_DIV_SHIFT	8
-# define PLL_POST_DIV_MASK(p)	GENMASK((p)->width - 1, 0)
+# define PLL_POST_DIV_MASK(p)	GENMASK((p)->width ? (p)->width - 1 : 0, 0)
 # define PLL_ALPHA_MSB		BIT(15)
 # define PLL_ALPHA_EN		BIT(24)
 # define PLL_ALPHA_MODE		BIT(25)

---
base-commit: 62f92d634458a1e308bb699986b9147a6d670457
change-id: 20240925-fix-postdiv-mask-ba47ecd23ea3

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


