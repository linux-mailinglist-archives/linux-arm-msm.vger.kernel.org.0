Return-Path: <linux-arm-msm+bounces-35358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDC99A9BFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEF8A1C23794
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE4A156F5F;
	Tue, 22 Oct 2024 08:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/b94/sc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F864155333;
	Tue, 22 Oct 2024 08:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729584370; cv=none; b=D0D6NaUOUPy+PrgSle3Ccmvu69+jN+856jiBUOAgBwWXDktHUCxqVhgvFFjHZCw06GVYVHfASbY3pyZNz6jWlNZaTqJwI6glZ9KrkKmA+5AnpntHsmi6JDi6EUtatEiuzgNGjuSAWqpwBwYLH/0sb8MkVpPLvRh2uuwrGfYo4Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729584370; c=relaxed/simple;
	bh=0K2o1IOhjv4ewnnvIvp7wRvElf7F+KPsC6Wx0FuqcZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ej5AFQ73NKkj5Xrd3isNnirO2tqnNptZiwgLt3dc3xPTUsPxmonDGaZULXOgB93RhQWrS4ViwloyffweyXTmR0uVEaT8wS/m+zYwREpzxxFcmbbX0dVCGX5ZU0n77OSfC3JVGEf1qlMsp49WYGFoTGMH1qJE8sS1712HLzzF89I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/b94/sc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED8DC4CEEB;
	Tue, 22 Oct 2024 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729584369;
	bh=0K2o1IOhjv4ewnnvIvp7wRvElf7F+KPsC6Wx0FuqcZc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t/b94/sc091Fgf8bYUbzoiKlqwRVSlUMrcUpxi04+5nq3anH+2BCobMs5X17ouoi3
	 GiS+YaNuekQfTJ3hN6/7e4kRCK6tDzNv3Yb8wdYM05yW10IUYGTqFTMTR1XQ05RW9O
	 bnJx6u+2ma5yxoR29c4so+7VyZRdfoJKuWsOlQse7NWfwZVUw8lvSeBXcUaytHem+G
	 jgReDSJSnGH0Vq4M9qGp7IziAmBnP+qOBfY0CH0BqiPvv29+GVHiHKXKVpTiKl/lzt
	 3GbIyZCr0HzVp0MGnyaYmDMnboYbWlJNT07t0siTamWMvJ0VB2hvu637JbQDbkwYAu
	 xf1CY/LkRGtiw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t39uG-0000000006z-1O7D;
	Tue, 22 Oct 2024 10:06:20 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vamsi Krishna Lanka <quic_vamslank@quicinc.com>,
	Vivek Aknurwar <quic_viveka@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	Jeevan Shriram <quic_jshriram@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 2/2] clk: qcom: clk-alpha-pll: fix lucid 5lpe pll enabled check
Date: Tue, 22 Oct 2024 10:05:21 +0200
Message-ID: <20241022080521.359-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241022080521.359-1-johan+linaro@kernel.org>
References: <20241022080521.359-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The lucid 5lpe PLL enable check only checks for an impossible negative
return value and does not actually return as intended in case the PLL is
already enabled (e.g. has been left enabled by boot firmware).

Fixes: f4c7e27aa4b6 ("clk: qcom: clk-alpha-pll: Add support for Lucid 5LPE PLL")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 99d6962d25bb..bd1dbef04d9d 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1903,9 +1903,8 @@ static int alpha_pll_lucid_5lpe_enable(struct clk_hw *hw)
 	}
 
 	/* Check if PLL is already enabled, return if enabled */
-	ret = trion_pll_is_enabled(pll, pll->clkr.regmap);
-	if (ret < 0)
-		return ret;
+	if (trion_pll_is_enabled(pll, pll->clkr.regmap))
+		return 0;
 
 	ret = regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
 	if (ret)
-- 
2.45.2


