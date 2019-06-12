Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39D3F42093
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 11:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408703AbfFLJUk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 05:20:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:38586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406714AbfFLJUk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 05:20:40 -0400
Received: from localhost.localdomain (unknown [106.200.205.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9DCC1208C2;
        Wed, 12 Jun 2019 09:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560331239;
        bh=BfsGQZR4Ybb+MkIRvK9Va0OCM+SFEMOozdC+GsS/y6I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=swWChb+NB4og5PUkGnpGHlutKPUPZT76YPFHjo3uPjuurts+S/nJuEDrkjCLXwtNb
         IoYS8brvJ2yA2fmWLTwk9YlWeuk5NvW5BapobvQiUkYWOSYk0AvyqF4upVCXrDHepL
         QFNdsCzsBjPJkvxi/LilB2qax/TdhMsKzVlYu9y4=
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 1/5] clk: qcom: clk-alpha-pll: Remove unnecessary cast
Date:   Wed, 12 Jun 2019 14:47:18 +0530
Message-Id: <20190612091722.9377-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612091722.9377-1-vkoul@kernel.org>
References: <20190612091722.9377-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We have couple of instances in the driver with unnecessary
u64 casts, drop them.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 0ced4a5a9a17..b48707693ffd 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -832,7 +832,7 @@ static int clk_alpha_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 	int div;
 
 	/* 16 -> 0xf, 8 -> 0x7, 4 -> 0x3, 2 -> 0x1, 1 -> 0x0 */
-	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate) - 1;
+	div = DIV_ROUND_UP_ULL(parent_rate, rate) - 1;
 
 	return regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
 				  PLL_POST_DIV_MASK(pll) << PLL_POST_DIV_SHIFT,
@@ -1094,7 +1094,7 @@ static int clk_alpha_pll_postdiv_fabia_set_rate(struct clk_hw *hw,
 		return -EINVAL;
 	}
 
-	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
+	div = DIV_ROUND_UP_ULL(parent_rate, rate);
 	for (i = 0; i < pll->num_post_div; i++) {
 		if (pll->post_div_table[i].div == div) {
 			val = pll->post_div_table[i].val;
-- 
2.20.1

