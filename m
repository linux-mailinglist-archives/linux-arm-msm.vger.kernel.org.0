Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9AB61176BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 20:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbfLIT61 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 14:58:27 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:44976 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfLIT6V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 14:58:21 -0500
Received: by mail-pj1-f68.google.com with SMTP id w5so6322761pjh.11;
        Mon, 09 Dec 2019 11:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DWgsVIOY0rpTchqlnxprL9pMKe3eJBtHdih5dvZI1YU=;
        b=UVr8525x5PR1hCXi/zc6ClYrCBsS4xSdyLch11+WjRQOqJozOqeVeVVTG6Fa9LZrU2
         9KBra6bw+soHXLUDgepf5rziEirRM/1eanxbjgSrCsKhfH1HL6sD0I1OAgr1PXYpOnSV
         p88wyUs/6BZI8luz+1s13LeOqylfYMAiJhtviRBQOg9BH7w94Ab1GgeUmFDqUrfkURAj
         sNXUg7jhFcimeceKhDc6r/PFwqgMOkhKCfEKjUB5NdzfuzH28wTt56kgMT4njq/IBZqb
         XVh2xGpdmlY05wDhjWPOIgE3MKTspZQabX6QRYp62YM/MtYctDAvtyX9QxHohacsM8Lv
         pURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DWgsVIOY0rpTchqlnxprL9pMKe3eJBtHdih5dvZI1YU=;
        b=D5HjPORaDfEmi2jwPNQtIuLpFbiCxlcuStrg1EmCOwganMx/0uY0GZBZzfzxIbTHcP
         1Xbg8gjreYfAZeq08D7gRh9Xaj/5Aed9al6mzRg+xX5YVSMsZQjdGiXEL/Ma+ZewGv1A
         GiCUQhCoFxLDMqMZq9VxWIVU0uk7OK0BqAj/2z1OMSf8sLNhcHZ9JwOnbtwGgNBrAeS0
         Wml5Pv2Luac19Ibj2LuQy7IeFEVTrvWtkzFJSZLznTE1+/074xUA6XPFu0kbn0TZgaXk
         INWCs7Mlx40cA8ZK3WxNyLlH/e1+cF0ggY3JKYE5KPcFoITxEO0bz6GtzmJHXxtOT0eB
         /1oA==
X-Gm-Message-State: APjAAAWbHs+ZqNW2DbNWkVPci/pUDRRr3x+m4bmH4PGKXNSctnt8JYbc
        j+7TmSKqCnG2ZZfo6d4hQ7k=
X-Google-Smtp-Source: APXvYqwKZyxJmpNNkafn9EdnP/h1LD/E4A0E7uVKQmtBTcyTdH/ma+S37ykzthLJxJAbBvrOHqREvw==
X-Received: by 2002:a17:90a:7bc3:: with SMTP id d3mr924437pjl.86.1575921500696;
        Mon, 09 Dec 2019 11:58:20 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id u3sm365617pga.72.2019.12.09.11.58.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 11:58:20 -0800 (PST)
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
Subject: [PATCH 12/17] clk: socfpga: convert to devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 19:57:44 +0000
Message-Id: <20191209195749.868-12-tiny.windzz@gmail.com>
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
 drivers/clk/socfpga/clk-s10.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
index 993f3a73c71e..85055fc56404 100644
--- a/drivers/clk/socfpga/clk-s10.c
+++ b/drivers/clk/socfpga/clk-s10.c
@@ -276,11 +276,9 @@ static struct stratix10_clock_data *__socfpga_s10_clk_init(struct platform_devic
 	struct device *dev = &pdev->dev;
 	struct stratix10_clock_data *clk_data;
 	struct clk **clk_table;
-	struct resource *res;
 	void __iomem *base;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		pr_err("%s: failed to map clock registers\n", __func__);
 		return ERR_CAST(base);
-- 
2.17.1

