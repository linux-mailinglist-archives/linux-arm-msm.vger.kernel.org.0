Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3052554E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 18:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731773AbfFYQru (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 12:47:50 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37216 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731664AbfFYQrt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 12:47:49 -0400
Received: by mail-wr1-f67.google.com with SMTP id v14so18681114wrr.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 09:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7eEjWytHo14d2wy5W+tNOY0jTfYkPmqHS9SlIMebT7c=;
        b=IxyUGn+UrZ+bnbjJipqX8Tqr/n5Yw6lxFKwRmp2JnOX2l2ltpJwYjzdfcGcgWUJN9F
         WNLe0y0I++0SHoHm8xeEyfqzAlOioa4k0z2moHs9hrOg6RwJ//dJQV1Ee2OGRe/3j5Hp
         62fpJ3/UXSAor4BUpfnIej1/cuQE+ztaAJxvjNBHIuh5iBR8yJTizPh0Zp9RoaX9la45
         AWR/0bwRoG2+sRvo9HyVfH2OPDFOOqIWZNy+o9PQBCWR1GehhyJndZbaLo/DZ5YJV0+1
         cfHb4PtMG78DUKmH0BG6bnNrDdfmVTQNqtRcghH86R5fGo6RpffmFD9aLff+DYw58R3E
         6JcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7eEjWytHo14d2wy5W+tNOY0jTfYkPmqHS9SlIMebT7c=;
        b=s9ZXF3sx6eGy5iOKz32IpjvL2IjKH72nLza3tTh4kZVz45Z49nsZxfP+YBaukTYgEJ
         48FF7zMEebE0u+/GCtBiouI0ODleVFQggy5FcKs36yw2MXJPH/qiYnkNXLwltbXS6eLY
         oUcfTo+0UQkiHSlQaFziEhjzv/kkDw1+w4ociHKorkBJ//urlljzQ/fI2w2aDcU5V/g3
         KZrAl7/+CG2trOcu9WUm8J8JhubNE+f/u7rsSIsFQ0FcYs+w0Eqy4blh8nOA5qwjYBi+
         9QAhmB8nemFqt1Hcc36swIG4aYC0R/9Z+39yEvmnRgn/wsX/AHgSEfPvd1+YvzwHX4j7
         qzmg==
X-Gm-Message-State: APjAAAXSH6GDCRKs3WzJR4asZ4Ud6uV9IIZmJwg+dBxVJy3ZEZ3VXszN
        4koTHy61yc7nf2xH5rLVmCeg3A==
X-Google-Smtp-Source: APXvYqy2Usw9GKw00Bg4lc9/CCqNSi0YvbljOkEbw/xyGvesb5SsyGkFWWx+viRnUehPAPaizW+rCg==
X-Received: by 2002:a5d:5189:: with SMTP id k9mr112089wrv.45.1561481267921;
        Tue, 25 Jun 2019 09:47:47 -0700 (PDT)
Received: from localhost.localdomain (30.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.30])
        by smtp.gmail.com with ESMTPSA id d18sm42594476wrb.90.2019.06.25.09.47.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jun 2019 09:47:47 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        jassisinghbrar@gmail.com, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com,
        arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de,
        sibis@codeaurora.org, enric.balletbo@collabora.com,
        jagan@amarulasolutions.com, olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v3 06/14] clk: qcom: hfpll: get parent clock names from DT
Date:   Tue, 25 Jun 2019 18:47:25 +0200
Message-Id: <20190625164733.11091-7-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
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
2.21.0

