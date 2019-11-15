Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9151BFDA82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 11:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfKOKFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 05:05:39 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:36302 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbfKOKFi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 05:05:38 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C541561840; Fri, 15 Nov 2019 10:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573812338;
        bh=Slc9IF5dQX6uwoXbBqrzCLllWU271qMpL9I+h5dYbOU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WJyzbjtiGzccbud9GMuy+M9y6J/MD2+X3xIyM0Rzjd8d6egUrTQKL9FashTe+4gxi
         DSN3dSkhGO1CsjKZsD3HEyehbn79oF+OVHfg4OVSETBNS5WAYkFu8M6j8ZyloFt8Vd
         J9Lyg5CfVyIPthO9sEYv9qRbV+VB1K7vbNb3I4hs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0753C61808;
        Fri, 15 Nov 2019 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573812323;
        bh=Slc9IF5dQX6uwoXbBqrzCLllWU271qMpL9I+h5dYbOU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M19rqDsWMJGB3dHxExGcnjqr1q70spPIww8YOuRxbUEgMqiJyDz5uz1OKrkpNasQQ
         3qapSGbZ0vTNDR0xl8HXnvQVOlTaWWy73L9Cl7u9qIDhjPbIXVSOnt6uN+Zace1U2s
         /kA0tLlQuBxvrVUYMqQkWAZDipIaNCKLnPTJyZqE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0753C61808
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 1/8] clk: qcom: alpha-pll: Remove useless read from set rate
Date:   Fri, 15 Nov 2019 15:34:57 +0530
Message-Id: <1573812304-24074-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573812304-24074-1-git-send-email-tdas@codeaurora.org>
References: <1573812304-24074-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PLL_MODE read in fabia set rate is not required, thus remove the same.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 055318f..e39034d 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1141,14 +1141,9 @@ static int alpha_pll_fabia_set_rate(struct clk_hw *hw, unsigned long rate,
 						unsigned long prate)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
-	u32 val, l, alpha_width = pll_alpha_width(pll);
+	u32 l, alpha_width = pll_alpha_width(pll);
 	u64 a;
 	unsigned long rrate;
-	int ret = 0;
-
-	ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
-	if (ret)
-		return ret;

 	rrate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

