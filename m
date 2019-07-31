Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA1E7CE83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 22:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730709AbfGaUa3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 16:30:29 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38638 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730659AbfGaU3r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 16:29:47 -0400
Received: by mail-wr1-f66.google.com with SMTP id g17so71075969wrr.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2019 13:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BoMlESuV3B6tPWN9XWP2L6fpdT8XV6yqfKxT2xNxK2o=;
        b=n6sHKkfaAZlka5CATr3XtZRARQ3pNoD6Mf1sXo2WWw8trtUv/46OA3woHnhBMu0b0E
         6b/b/Mt+v3BxRwqJeBaAfR4dXduuxA/gGaZDNGnwJDnYsQDkRBImyl8xD0eYnPo+yxQ0
         jBT/Pi0Zfg9u4jQoFELZbrv8WqznsZuz5aa/ykhC6JiyiEK74G4O0cvTMGLdKpqvOBTQ
         tA9D56Ag6WUbe6fuL75YnPpHQItr6F7A4lcd/PmjTlUSnOlmJXhua5N7P5eFsOkVJ7zC
         t0POw5bAvNfWz2eiMONKgBWktBxCeUV2NMKlOuupDWYmfCz8YKl16g1UYi5xdIoRKuBQ
         8lBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BoMlESuV3B6tPWN9XWP2L6fpdT8XV6yqfKxT2xNxK2o=;
        b=XbDJNN3ZqNK7FVt8nk6gFMzrQQ9i4sXm3bm2NLxZVZDM4sktZoOylFkRlC9qVh8Oqs
         cVefbSn2O8aKjHir0LnGKMFav3dwGyL0hcfYNETUkiGsJVCfg4cnfKSuQeLz4qFY/SEM
         BEBxlEA8J+mHhKmcDsvGwHIgFvpIBRBc8KUxMLbRtydSt9HDAdThWAQvvZeyFDGBqKRr
         7gtNir528zvbYlHX6vCctXGiKnaxYyLiyDVDKbIoGSZqKVBd/0v3feMsEfISVyWz7KCV
         F/PUzqALZdhQ0VK7obY9U+xMVCailQIlmMFv+4knMxm7hX3EGG0cPhLJDb0OMokQh50Q
         6hLw==
X-Gm-Message-State: APjAAAXsGJZb+uftVrWQykbEu+YqlLdDMa62Yd7g0rc5S13zEeuRjAu5
        z2ZTZIHKFo/LVhuYlJMvt8qJAw==
X-Google-Smtp-Source: APXvYqwpQEfh6lRzSLC7qveHzHmaJHjlrp6uAR1UHcFOtEzkTfXHHYUkxxhDNW/ynLeN4Zqrid8yeg==
X-Received: by 2002:adf:fa42:: with SMTP id y2mr54956154wrr.170.1564604985426;
        Wed, 31 Jul 2019 13:29:45 -0700 (PDT)
Received: from localhost.localdomain (19.red-176-86-136.dynamicip.rima-tde.net. [176.86.136.19])
        by smtp.gmail.com with ESMTPSA id i18sm91905591wrp.91.2019.07.31.13.29.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 31 Jul 2019 13:29:44 -0700 (PDT)
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
Subject: [PATCH v4 06/13] clk: qcom: hfpll: get parent clock names from DT
Date:   Wed, 31 Jul 2019 22:29:22 +0200
Message-Id: <20190731202929.16443-7-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
References: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow accessing the parent clock name required for the driver
operation using the device tree node.

This permits extending the driver to other platforms without having to
modify its source code.

For backwards compatibility leave the previous value as default.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/clk/qcom/hfpll.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
index a6de7101430c..87b7f46d27e0 100644
--- a/drivers/clk/qcom/hfpll.c
+++ b/drivers/clk/qcom/hfpll.c
@@ -52,6 +52,7 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 	void __iomem *base;
 	struct regmap *regmap;
 	struct clk_hfpll *h;
+	struct clk *pclk;
 	struct clk_init_data init = {
 		.parent_names = (const char *[]){ "xo" },
 		.num_parents = 1,
@@ -75,6 +76,13 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 					  0, &init.name))
 		return -ENODEV;
 
+	/* get parent clock from device tree (optional) */
+	pclk = devm_clk_get(dev, "xo");
+	if (!IS_ERR(pclk))
+		init.parent_names = (const char *[]){ __clk_get_name(pclk) };
+	else if (PTR_ERR(pclk) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
 	h->d = &hdata;
 	h->clkr.hw.init = &init;
 	spin_lock_init(&h->lock);
-- 
2.22.0

