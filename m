Return-Path: <linux-arm-msm+bounces-23293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA1390F81F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 23:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51E7B1C208F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716A615B142;
	Wed, 19 Jun 2024 21:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="RthVQZTD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D992315A86E;
	Wed, 19 Jun 2024 21:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718830989; cv=none; b=naDOQNa+ejPuKYmWXMjjk/ahJy3sSWpuNTcJrqKs5LEcMfEWgAAxG2eikvmb9YSMdkoJjD6MWFu4/lBJPTy0/Xwx3pRCyKXzGPHeAO2xPBravlEPleYftChrYcTb4GhCcwaTkJ6cl7aoqzhK3SySKQsKEDZiAsQ+jjUyerVwhMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718830989; c=relaxed/simple;
	bh=HHYOe1tNbi46oASusGfJKqUh6zTbC3KoPVXrtUPA63I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TAwL+zlnB0/YtEo+PZzghHpdT7Zcdr5XDrzbLR2iGtXXHgDqklTiELPfrnt7lTB6XRSv4qblSlzNaaqxoafxzPwrzMVR+iT49QcV4rIJp6LBmAQ1CFPJTiHUPFZC/1oyvNpEyXeEBMdJzbtCw/PqMoZeUZN7uHr+yyb9taML/EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=RthVQZTD; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1718830986; bh=HHYOe1tNbi46oASusGfJKqUh6zTbC3KoPVXrtUPA63I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RthVQZTD6pZSjqiRXZSrWYU3mbmeb/ejHFIHIR42U8+L9164uFHtY6qVBvZQgGsyz
	 XW2mhj85Ul7Wp80zPYht3TywnXTKYrW3v4lBc5jqaRrgCx569EJ2ZjsZ0vvyg5oSkr
	 f0tZxN6CknbMHhipr0ckdFfSW+g7h5+p2/m0nRhw=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 19 Jun 2024 23:02:48 +0200
Subject: [PATCH 4/7] clk: qcom: a53-pll: Add MSM8226 a7pll support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-msm8226-cpufreq-v1-4-85143f5291d1@lucaweiss.eu>
References: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
In-Reply-To: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=708; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=HHYOe1tNbi46oASusGfJKqUh6zTbC3KoPVXrtUPA63I=;
 b=owEBbAKT/ZANAwAIAXLYQ7idTddWAcsmYgBmc0eFV6Lj77id0y5BxGy+VrfvUTm0TyOJl7z/8
 xreIDDwmJ2JAjIEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZnNHhQAKCRBy2EO4nU3X
 VpZ6D/j9ctasA4NsUCd4PtAoAW0nXg9/aHUGMa9Qh7AF1rrY3Ep3AaHP84n6Ma7b05LRUsPEyGz
 8VFSzmSa0ATLqIY1+qeq47aUYiOxSql2RZRDKVVHdQn2ktVd0amnLtmKQvzd5izV+jnPtagF1xk
 HVtP4cJB5FbO98oaEHX4uJHuq5zhiDIiYb+M5pa8F0AaSpEbe94Jr6IJWfp489Z7XlWnICmTo3p
 NCW6zB6aUhSwlRdtsN2sI0XVC0Zzh6SYwp/Er/JS+PJ36kK0Q9Jlbe7tHOViaEidT43fj8277wc
 s5EZqjiLKrwI7Gx5tuVs07kwQwC2CMsnZbjEN94vCS6xmPX+H+dXYR1IQ339/EFmJohOqzBeCzP
 1o2wk6C6Ubd6w/ts4t7CfaIARfgI/MfH2Maz3b6CWBMoIMnv0ssZLaAO4GDwstTx/XEWtWxTakz
 M82sOEWoB8XRyf0a2ndPjQacLYRO42uLwzEcmyzeJwSAOVAJft4i2sf+ovJIP3XBE9KXP/2qs3X
 UCTXaw61+4j3mci+gp/uUXJQ0xpm90QGxGbn9nd3L+pgJlz/0tAMRGHlYAAZ1Zdh8cqKPZKFZHs
 fi1Blz7JQbHXdS/f0NWY5HxI1b0j4VoiJq68FbU1Ag3FCHx9yxnBCged7bwSiDm340dOqvj1Lo+
 SiczF2+ZFrXWZ
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

The MSM8226 has one PLL for its Cortex-A7 cores. The frequencies will be
specified in devicetree.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/clk/qcom/a53-pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index f9c5e296dba2..f43d455ab4b8 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -151,6 +151,7 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_a53pll_match_table[] = {
+	{ .compatible = "qcom,msm8226-a7pll" },
 	{ .compatible = "qcom,msm8916-a53pll" },
 	{ .compatible = "qcom,msm8939-a53pll" },
 	{ }

-- 
2.45.2


