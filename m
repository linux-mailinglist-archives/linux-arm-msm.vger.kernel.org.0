Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD6CB10D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2019 16:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732579AbfILOPp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Sep 2019 10:15:45 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39267 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732480AbfILOPo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Sep 2019 10:15:44 -0400
Received: by mail-wr1-f68.google.com with SMTP id t16so28659811wra.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2019 07:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MyCCet13LkijoDqtWJYtA/7gCLRctgr20CN4r0Zl6Mg=;
        b=zeRGnx9Jl5O3X7Jd4SHlQ0k/Z1HyWXgLVZ7K6qOsjBO4t7cEJY2Atb4S61Y5e3Mo6W
         iWDKSfGYbBtsw95T7xSReKUHHARk8fx+5BXT/9kojZfo59vSEZSPnc2wZ9aUNFXPeMP/
         RINSZZ69wStZe3kzgVNrCS91tG3fuWI5h2eLczRUzzFwqMa07Gq61x0B+SrvNdSKcjfo
         SqRqCApVvCoEaKoQVY9nOuo8uF5McNy0JGG5JK3XWfuRBQD1ZyPeC0a87DJM9uPD1Pki
         qHGktZH0ZQNDu91OGL8XwkLY2jGn/6jD0LHwROdyPaApTNV3bmnJRIhst4z7rAZW5ZG3
         l7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MyCCet13LkijoDqtWJYtA/7gCLRctgr20CN4r0Zl6Mg=;
        b=lnDSI2VZd+S3N2Wpe6BNUTcw2563eiI2mpd/SaWT54+CNHuqCEmOM4c4E6gQ9WLZOJ
         gpVezMbt6kzu6I+3ggUseZW37vIqR0yJ+tCR0Uc365/JTBb3oJqSAHWO6JSboRivx3Jg
         qIfwvltEY6f+He+9zqCqZD07ge1O5Tl/e8sMrePep+GEIze8PBpyXFAHA9lCBq9kQND+
         S5oPmmjS+37kyKSJieJcKXMOOVdvVkgeAO/JqKwuP0SeZPUnCbMTtEac4npHDYpdET01
         qwCA9z8hwJeJYpmjQJESosDI2VkAmDFuttkemFgnZ+2Tq8Lk+a/otoj9c0qh7RlC9NFj
         K6Hw==
X-Gm-Message-State: APjAAAUscdFUoAzcnluAS8eOJ61DZlyHsFYQVtU+Z4/pXyb8rSlcwFm8
        wsR/5iX3LYyaFA9tDsQZZN/N6A==
X-Google-Smtp-Source: APXvYqwwqholtaKN+KyTW+G3hH4nfqJZ2659cgwFzkvHppKcYvHrcYjQj1TbkApkjUg1z3nZ2ylJjw==
X-Received: by 2002:a5d:4044:: with SMTP id w4mr36896685wrp.281.1568297742744;
        Thu, 12 Sep 2019 07:15:42 -0700 (PDT)
Received: from localhost.localdomain (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id p23sm137599wma.18.2019.09.12.07.15.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 12 Sep 2019 07:15:42 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        agross@kernel.org, mturquette@baylibre.com,
        bjorn.andersson@linaro.org
Cc:     niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] clk: qcom: hfpll: register as clock provider
Date:   Thu, 12 Sep 2019 16:15:31 +0200
Message-Id: <20190912141534.28870-3-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912141534.28870-1-jorge.ramirez-ortiz@linaro.org>
References: <20190912141534.28870-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make the output of the high frequency pll a clock provider.
On the QCS404 this PLL controls cpu frequency scaling.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/hfpll.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
index a6de7101430c..e64c0fd82fe4 100644
--- a/drivers/clk/qcom/hfpll.c
+++ b/drivers/clk/qcom/hfpll.c
@@ -57,6 +57,7 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 		.num_parents = 1,
 		.ops = &clk_ops_hfpll,
 	};
+	int ret;
 
 	h = devm_kzalloc(dev, sizeof(*h), GFP_KERNEL);
 	if (!h)
@@ -79,7 +80,14 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 	h->clkr.hw.init = &init;
 	spin_lock_init(&h->lock);
 
-	return devm_clk_register_regmap(&pdev->dev, &h->clkr);
+	ret = devm_clk_register_regmap(dev, &h->clkr);
+	if (ret) {
+		dev_err(dev, "failed to register regmap clock: %d\n", ret);
+		return ret;
+	}
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					   &h->clkr.hw);
 }
 
 static struct platform_driver qcom_hfpll_driver = {
-- 
2.23.0

