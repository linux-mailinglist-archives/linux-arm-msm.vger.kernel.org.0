Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 959B19D445
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 18:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733016AbfHZQp1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 12:45:27 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37253 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732967AbfHZQpT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 12:45:19 -0400
Received: by mail-wm1-f67.google.com with SMTP id d16so181886wme.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2019 09:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=onetUiZPcKYw43ltVy2pax5WwMNPrRMe/eAwSVGynt4=;
        b=VTzy/+S+EG6NglyCNwJnyPj3v2a/38li9pyUxYKXw95aeoqEm9GPssQFRmUG5oI5c6
         EibgtBUP8JpXh9l/UOZyVKOalAwVOkPO8s9pNn7XDDPcxuydVS9l5FodOV0SUHXsMs/6
         a+ShgY60QQ25TmCk+KweofZi35NxEKp9vY/YYEGj1WvkEMsyEAO9pHrsoCjZkIfjqK7C
         NDsyahCeF26dySxYSNWqn5Sg+1TpbEPNIBwt+txXub1CsghTQ5+TdX76yEufnG9UVhgI
         w8Qbj+iA35AgTzxoF9TK2WruT0+7K0jCSVJp/6qNba2MXP71JyvQN8RXct+m5qD4Tufm
         2dAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=onetUiZPcKYw43ltVy2pax5WwMNPrRMe/eAwSVGynt4=;
        b=soF2IqAKRMLyrVqEUAxvlL/wF0IS/hmqVFqRLwygqW50OToAJ58q/kxBL5keAD2GRv
         mC46QrmvozzB8xxF5N603CqNxfahkRLj1B7bsA3MpeY7X/RGdYvMaXxQBm87pZStuAft
         OKITUdAWccOwdHGEnPPv2jVzltZ+b0l3+zlmhear+7073kOokfV+uevZm+HkvQk5Z+Yo
         Phgl7y7fixogQzuMr8pCcnNod+jxLEHlLNuMgs4mJUPjGfAE/QU0v69vJIivuGf3G7sJ
         D12jjsPM3GwEaGlP4ikpC7ZQM9sk8qSdaC3+/lMAW1HpWLEEqB2nA7f3Pse+MdirLKvb
         bsAA==
X-Gm-Message-State: APjAAAWwOAsg7uughAwuLFJW3X33YmfrtDZxMwLop1expc5gKHqz4frK
        IEVRZpVBzC1UWkzq+c/EkdSS7Q==
X-Google-Smtp-Source: APXvYqz1ti6G8ykQXaSBWITNSJt9no2xf8IMdYAR5XEK+i92tzuI2ROTgl+pfgyiar++tcx9MbRJlQ==
X-Received: by 2002:a7b:c947:: with SMTP id i7mr23496677wml.77.1566837917375;
        Mon, 26 Aug 2019 09:45:17 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id l62sm77872wml.13.2019.08.26.09.45.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 26 Aug 2019 09:45:16 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        agross@kernel.org, mturquette@baylibre.com
Cc:     bjorn.andersson@linaro.org, niklas.cassel@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] clk: qcom: hfpll: register as clock provider
Date:   Mon, 26 Aug 2019 18:45:09 +0200
Message-Id: <20190826164510.6425-4-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org>
References: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org>
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
index 87b7f46d27e0..0ffed0d41c50 100644
--- a/drivers/clk/qcom/hfpll.c
+++ b/drivers/clk/qcom/hfpll.c
@@ -53,6 +53,7 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	struct clk_hfpll *h;
 	struct clk *pclk;
+	int ret;
 	struct clk_init_data init = {
 		.parent_names = (const char *[]){ "xo" },
 		.num_parents = 1,
@@ -87,7 +88,14 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
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
2.22.0

