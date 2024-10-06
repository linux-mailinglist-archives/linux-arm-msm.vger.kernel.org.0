Return-Path: <linux-arm-msm+bounces-33292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6948D992174
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5523FB20E78
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3FD18BB8C;
	Sun,  6 Oct 2024 20:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="c9uvD8Yf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB5813A27E;
	Sun,  6 Oct 2024 20:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728247942; cv=none; b=gZZm6ybC8fFVG1TuSXtC4jONAjnviSyTyhpOozBveD6Ys6gCYKhkgAlN1knBSXjwO/sDlY5DP5s+Ioz31kjhM++FR32czU3mD61QoOic+IDOst9Ccb29MhjfteA91w/1GiYXW8BgdIkf3/VdJpzC5cAYKyd4BxWZ75IxVesJa1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728247942; c=relaxed/simple;
	bh=+hx+n3uWbKFfn6OLsZGwd2NwxKuv9y4K6HWEu5tGwyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pswZiIpcNxLjxDx7lG9wbo/2gUWhWyurh7baWP8pfHOzgpLwgZ+5DJvrlFuPj9B6+YvSiyEsCRtHm28fR7flZ94UJWIOml8gp+EWjVy1J3bcC7k7Jou8jt1tUNpith+Nh3n0tuonDlSHzH/KsbmnvPr/rZR2rJhkAfL3bkIc8kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=c9uvD8Yf; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.62.162] (254C1225.nat.pool.telekom.hu [37.76.18.37])
	by mail.mainlining.org (Postfix) with ESMTPSA id 0F41DE4585;
	Sun,  6 Oct 2024 20:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1728247932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2OCFzLsOedoGB17wlarfdBAMOUiShKOwPhyarUYtwp8=;
	b=c9uvD8YfuovzVFRgBKhE+X4DAXDa3XT6M99YA9tN/4Gto+OXTR4bMfx+npzw4lBXWWDbwg
	7r+GYmrRNbxNbDfFij2BWUU3U2w1T3H2OOpjNjPF9aA0qENmTV7wJOnpCYBLgGO8hb/vpC
	NlC1qvp7fQA9iWJS+b7HqdbkcZe1OP4m0CW5uJXg75xbVizjHpbUhxjTBlDV/LE+ZhE4/h
	dBZEfT8XAcSR8ajRPRVFXiYq8/RvHFGBbKDvvqyTCYJzdkWHbND5U2gLz5aiwHsGNPs+QF
	KNI1YBx7tOsY3Sri5cpwkw/t44DCzWFPrtQx60qLSnjUCZb8CGVw6dDXNegu/g==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 06 Oct 2024 22:51:58 +0200
Subject: [PATCH v3] clk: qcom: clk-alpha-pll: Fix pll post div mask when
 width is not set
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241006-fix-postdiv-mask-v3-1-160354980433@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAG74AmcC/4XNwQqDMAwG4FeRntfRxhbdTr7H2KHVqGGzlVbKh
 vjuq14H2yn84c+XlUUMhJFdi5UFTBTJuxzKU8Ha0bgBOXU5MxCgxAU07+nFZx+XjhKfTHxwa1S
 FbQclmpLlszlg7hzk7Z7zSHHx4X18SHLf/sCS5JL3lbBG615Jjc1kyD3JkRvOPgxsFxP8UyArt
 gYtVJ1Hbb+Ubds+R++nr/sAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728247931; l=1612;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=+hx+n3uWbKFfn6OLsZGwd2NwxKuv9y4K6HWEu5tGwyU=;
 b=w2VFi/4n/OjHGdtwvGUXdCcY9cCJtdI3qVUNMyvJ39thJWqA7ctW4OJo5raiiqNB03CC6LAvS
 9yoq38YU2loC+49icabzZ/uyVpw2nBoRGHo5iKWTcF6yrM+J6cf2HRT
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Many qcom clock drivers do not have .width set. In that case value of
(p)->width - 1 will be negative which breaks clock tree. Fix this
by checking if width is zero, and pass 3 to GENMASK if that's the case.

Fixes: 1c3541145cbf ("clk: qcom: support for 2 bit PLL post divider")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v3:
- Remove one of the fixes tag.
- Link to v2: https://lore.kernel.org/r/20240925-fix-postdiv-mask-v2-1-b825048b828b@mainlining.org

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
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20240925-fix-postdiv-mask-ba47ecd23ea3

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


