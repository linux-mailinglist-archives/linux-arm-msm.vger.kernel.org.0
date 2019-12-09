Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A71D11176D3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 20:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbfLIT6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 14:58:47 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37426 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbfLIT61 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 14:58:27 -0500
Received: by mail-pj1-f68.google.com with SMTP id ep17so6336806pjb.4;
        Mon, 09 Dec 2019 11:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Rh0bnLPUtx+tPcJ7oCSjUFbyV7d1BipJo6LPETVaXJc=;
        b=Ql1idqnFkeOA1b2ibaJk1lP2UsH/b2TD0BILC3fV3jIWbO6hOXSrjUaYvsFKb84JtS
         s6YZZ4GWy0d+u0x82WVYr3eyDLh2FJTWL5ABfs+z4V0q8cwbuATv9EHOY2Poa6e0YqRk
         7uNOluhmhtg4XC1xGIyRPFwvn1VP64F56d4gZzQ+08CJKJ4bR8ZoPrnMEcLpi3NdhqlW
         3Rk0Cp24NqoNVHhL27o1FoM87UpuMvKiEAgj3ME1e/Uiu602SGAV7YWjBsmARtVOjgZ3
         WcYhoM0cIeckI9/dvRc8hmoc84F1JMCdxHEUQTZhA1eZqcAywBsuDW39KOXb1iDtuqtI
         lq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Rh0bnLPUtx+tPcJ7oCSjUFbyV7d1BipJo6LPETVaXJc=;
        b=Cd+KNrfRyXB2Jlvsec0Z9WrQ38fx7/JDrPZhcTOEHVFsySg3vTHEspKdqOoRPqB279
         DPEgng0It+GJg4IeBuXVBGOVHp5iCxtutHNUbUtLKcbogyfpEZ2AECQvVCW+a9MdVuHJ
         qFyn+KJjDvaV6fYcdp+ZQwBPJX8s+f9tsU+pdeWNhYCnLmfae5F+t4jPwGNKY+EZ2k3A
         ZvTkWu8PpZ5h1abEf55PDy3GEoqMMxGcGaS58aWSzyqiuSBmBKH4wezAQICD/rhVDdKX
         uJ6HUVWXkWTBEAqZpL5P+BI94N09AlRfUbIUltFdGnpdAvnncMCgicna6lHSYHpZxEgz
         g1wA==
X-Gm-Message-State: APjAAAVMLWBkO6+uOm59SNg8BUJBeYLI4Yl1DD8GJU25SvJ4gfFv54fw
        9585xxKcNrzxaONYbKURkV4=
X-Google-Smtp-Source: APXvYqw0rvrrMAD8BKloCopu8xC3C8Rdw1NB+NEIqLAqNAoIW5lOeisBjjvEUWp1r84TMZN7X6Ltgw==
X-Received: by 2002:a17:902:b701:: with SMTP id d1mr3560003pls.144.1575921506316;
        Mon, 09 Dec 2019 11:58:26 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id m34sm378688pgb.26.2019.12.09.11.58.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 11:58:25 -0800 (PST)
From:   Yangtao Li <tiny.windzz@gmail.com>
To:     afaerber@suse.de, manivannan.sadhasivam@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        Eugeniy.Paltsev@synopsys.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, agross@kernel.org, s.nawrocki@samsung.com,
        tomasz.figa@gmail.com, cw00.choi@samsung.com, kgene@kernel.org,
        krzk@kernel.org, palmer@sifive.com, paul.walmsley@sifive.com,
        dinguyen@kernel.org, mripard@kernel.org, wens@csie.org,
        emilio@elopez.com.ar, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        matthias.bgg@gmail.com, rfontana@redhat.com,
        gregkh@linuxfoundation.org, t-kristo@ti.com, john@phrozen.org,
        tglx@linutronix.de, allison@lohutok.net,
        kstewart@linuxfoundation.org, swinslow@gmail.com,
        aisheng.dong@nxp.com, robh@kernel.org, daniel.baluta@nxp.com,
        weiyongjun1@huawei.com, wangyan.wang@mediatek.com,
        chunhui.dai@mediatek.com, miquel.raynal@bootlin.com,
        heiko@sntech.de, jcmvbkbc@gmail.com, nsekhar@ti.com,
        geert+renesas@glider.be
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 15/17] clk: bm1880: convert to devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 19:57:47 +0000
Message-Id: <20191209195749.868-15-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/clk/clk-bm1880.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-bm1880.c b/drivers/clk/clk-bm1880.c
index 4cd175afce9b..9fa0ca1fe833 100644
--- a/drivers/clk/clk-bm1880.c
+++ b/drivers/clk/clk-bm1880.c
@@ -893,16 +893,13 @@ static int bm1880_clk_probe(struct platform_device *pdev)
 	struct bm1880_clock_data *clk_data;
 	void __iomem *pll_base, *sys_base;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	int num_clks, i;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pll_base = devm_ioremap_resource(&pdev->dev, res);
+	pll_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pll_base))
 		return PTR_ERR(pll_base);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	sys_base = devm_ioremap_resource(&pdev->dev, res);
+	sys_base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(sys_base))
 		return PTR_ERR(sys_base);
 
-- 
2.17.1

