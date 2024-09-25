Return-Path: <linux-arm-msm+bounces-32512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9654986666
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 20:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 782862860A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 18:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6671D13AD03;
	Wed, 25 Sep 2024 18:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="MvyD+L5q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B42C13B792;
	Wed, 25 Sep 2024 18:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727289205; cv=none; b=T2RbabUFD+8XXXCQ3X5HeGynoybjeMYCRu8R/6VJtK1e7422Wm48T4h958ySVofArZ2+fyR1zfKs97TiMOWypzKjjfzO+oFDJXoytpQ5PlDmrZR4TD3y505DY1MZedhPANLU8/xIJg8Ttja8TzcqEokA1AKVd2lsO/mOh19gXns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727289205; c=relaxed/simple;
	bh=OIbBmnELrs++7mtg2YAyqhITWB3pQw7a75MvfNVV7s4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u0RZPYpBdeDW0m2/bqhieeJoXfQJzcMq6hHy70C4iq+J8rynzyJETVqR1XXme1PR8xprVPJaorLwB2PWW/JskffM9DA/zR56lrWXEhWM5WcO9bLpYQ/Cr6UGi+Gu3ULU5WENe8dBmtOE/D4fZeIhKz9J/4P8Jb9vTSmPbRfV7Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=MvyD+L5q; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.130] (BC2491B6.dsl.pool.telekom.hu [188.36.145.182])
	by mail.mainlining.org (Postfix) with ESMTPSA id F13F9E450F;
	Wed, 25 Sep 2024 18:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1727289201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qS9SGz8Gf8aJrDJT2DYvbhtIA9CLbibcCwzukfp2DTM=;
	b=MvyD+L5qPFwCMYR5AQYX8f+N/xtqm9/+3IxTRCPPoYai3u0Wd7Qx+wIF3duH8Sg/h9KTWj
	VcsmCQiwobgJ+6qGcxYNhr8YFxQdgl0YL51/90c71mzVabL9vn0s8xYhoB6S3idB21LaUt
	Q3ctmrLhycMqjllpo6bxohD8hR3PGiYwwxeFQ3kanZA7LSCCIdG6244HT0uAlHbqqvg3kH
	9xWiGxDyWqEswpxL34SYLKJk649XaB/AbqSGaPtMvBDPVEjPEKTZ5ja1Mzg2CSRDkvYabk
	JZRGp9jwhPpevIBuTldeqrSWP+/1YA8MnJPKV3Qx636hZDKoaJGF1/ROJi+P+A==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 25 Sep 2024 20:33:20 +0200
Subject: [PATCH v2] clk: qcom: clk-alpha-pll: Fix pll post div mask when
 width is not set
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240925-fix-postdiv-mask-v2-1-b825048b828b@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAG9X9GYC/32NQQ6DIBBFr2Jm3WkEIaZd9R7GBeqAk1YwYEgb4
 91LPUCX7+f/93dIFJkS3KsdImVOHHwBealgnI13hDwVBllLVd+kRstvXEPaJs64mPTEwaiWxkk
 2ZBooszVS6ZzKri88c9pC/JwPWfzSP7IsUKBt68FobZXQ9FgM+xd79u4aooP+OI4vWif7HbUAA
 AA=
X-Change-ID: 20240925-fix-postdiv-mask-ba47ecd23ea3
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhishek Sahu <absahu@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727289200; l=1539;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=OIbBmnELrs++7mtg2YAyqhITWB3pQw7a75MvfNVV7s4=;
 b=+N3H+rNgpnkxCBDAIzI5nfaKNoc9g7Wib78fCAhevGgGmOhUh50zJemoNfUFLvCwX6UhyDO54
 024YQf13TitCpRu4HTN5WwvntLjerA00fPu+wJAuSEYS4ZJe5kEQXRL
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Many qcom clock drivers do not have .width set. In that case value of
(p)->width - 1 will be negative which breaks clock tree. Fix this
by checking if width is zero, and pass 3 to GENMASK if that's the case.

Fixes: 1c3541145cbf ("clk: qcom: support for 2 bit PLL post divider")
Fixes: 2c4553e6c485 ("clk: qcom: clk-alpha-pll: Fix the pll post div mask")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- Pass 3 to GENMASK instead of 0.
- Add more Fixes tag for reference root cause.
- Link to v1: https://lore.kernel.org/r/20240925-fix-postdiv-mask-v1-1-f70ba55f415e@mainlining.org
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index f9105443d7dbb104e3cb091e59f43df25999f8b3..be9bee6ab65f6e08d5ae764d94a92e395e227fbc 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -40,7 +40,7 @@
 
 #define PLL_USER_CTL(p)		((p)->offset + (p)->regs[PLL_OFF_USER_CTL])
 # define PLL_POST_DIV_SHIFT	8
-# define PLL_POST_DIV_MASK(p)	GENMASK((p)->width - 1, 0)
+# define PLL_POST_DIV_MASK(p)	GENMASK((p)->width ? (p)->width - 1 : 3, 0)
 # define PLL_ALPHA_MSB		BIT(15)
 # define PLL_ALPHA_EN		BIT(24)
 # define PLL_ALPHA_MODE		BIT(25)

---
base-commit: 62f92d634458a1e308bb699986b9147a6d670457
change-id: 20240925-fix-postdiv-mask-ba47ecd23ea3

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


