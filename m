Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF3647CE60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 22:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730729AbfGaU3t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 16:29:49 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45132 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730706AbfGaU3t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 16:29:49 -0400
Received: by mail-wr1-f65.google.com with SMTP id f9so71056177wre.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2019 13:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=onetUiZPcKYw43ltVy2pax5WwMNPrRMe/eAwSVGynt4=;
        b=hyDo5hAhRc4QzuIX2tUpIKbH3IelBuPVusXpwSvSNMh9tzz94z/m8CQjhd4r5uATJ5
         IwiBzZESkY4K2MTQFADxZhMygATszMtZhDOOdYS00mhRA+Ghk8oOiibymHRGzOU+Rq5B
         0kSFzaZLM6YrI5Dg311b3EyUCJyOYsL8cp3ImiXtGIQ86tI+ob9HD3LLh8VJqvSWbF1q
         djifVGZBkToBzRoVMRMciAwyXobYowv0eANNZz6d1ZX7+rOu96bPEEgOcSbZQbWbvbU7
         0LI+p7KwSWs2S6a7C2EvLNXer9Mdq7XrKPpzat4dc6i5iig7t30hKa+U+utmJxSzVKpY
         0D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=onetUiZPcKYw43ltVy2pax5WwMNPrRMe/eAwSVGynt4=;
        b=LMUWJ8TRM3CM74Likrx4XTJv7OVGf9w5n6bL2ShycTh5KBRNPc+HvTwLTIQZxrKbwL
         QD9PhkSLV8AIKUl/qLm2t+gXvpKk0usSrVIWzKJovAAJd2qHM9pDtmcecnTg04EfsE1y
         uwq0OWEBUGpT9uwX2Z2s8sAVGpv5qP/DkdPJrFfEH+dLsb6h1dZZviE9DyzMABuAAPNO
         RRIcKruhkfP/2iuyehoZ2GFECaCo76R6hkvs7A3Y5kflqjHlibHUvP8HQLnWumQjaRg+
         ivx9xsGpWEkqRHUSiQnbiITi3tTmOVGBtulrzdUmTy8vM3cZ0gaEcgyUTR7fhyjts1u8
         j7Cg==
X-Gm-Message-State: APjAAAU5nZ+puTXSSGQykmtQprjHKF6gfbDM4s4WqHZ/iyJ8IkIiA4ne
        brf5XemQ3Evh8LUv2UoDGD78bA==
X-Google-Smtp-Source: APXvYqy6YgTYQC3Fho4PDvDZwRFPnMUj0vZ+AbVsH4vJvPB20hp2gbPmVYNLKolRigmcbxZyhR8AIA==
X-Received: by 2002:adf:f046:: with SMTP id t6mr19884717wro.307.1564604987154;
        Wed, 31 Jul 2019 13:29:47 -0700 (PDT)
Received: from localhost.localdomain (19.red-176-86-136.dynamicip.rima-tde.net. [176.86.136.19])
        by smtp.gmail.com with ESMTPSA id i18sm91905591wrp.91.2019.07.31.13.29.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 31 Jul 2019 13:29:46 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v4 07/13] clk: qcom: hfpll: register as clock provider
Date:   Wed, 31 Jul 2019 22:29:23 +0200
Message-Id: <20190731202929.16443-8-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
References: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
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

