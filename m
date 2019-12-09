Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65CC91176DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 20:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfLIT7A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 14:59:00 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45156 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbfLIT6M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 14:58:12 -0500
Received: by mail-pl1-f194.google.com with SMTP id w7so6224308plz.12;
        Mon, 09 Dec 2019 11:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qpHD+BzRmCza+J8cARPun5felyrs+dQCyBCt49mQSmg=;
        b=uV5pv0K9ZJ71Pl8qC7WYaq6P9NAskW0V0XiAkeLFSyizhvo/+ytjTGIPfksDrUOIFH
         Js0M/AxShyNuEgwRGXYUxmSZ9hS6mIf6M6xroyN+ABr52UgxQDr8i0IRUHbeNitNuT1U
         PyUwlJnQD23uobSXoQoShIOi+Kx7wfE/5XbsRDZ587jUIWCSXsQUy11Zts/sTvp2lFbH
         5TgIDQ+C35M4wzudq3ZZddIUCRLtt/+hDyJ6KSWhPBgoXvqB8KNkjACrIFSo5b2nMNRp
         LHW08kv8joPWFKL9aOkDknxugehsWCZaRmGHlhK3NQtdzsZtB0+K+c6WRLw/WT63Dj6Q
         tQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qpHD+BzRmCza+J8cARPun5felyrs+dQCyBCt49mQSmg=;
        b=g+RsXsRaXbeTwZG8PwzQJV5zN235IDFyrMQ9zDuiwZgrUgMWc8upl8d1U55IrxlvF8
         PvlwDTZ+NVmxwIS28U2G3RyxiqcmdKiDkJU01q2p0M7RvvboJEa/GZCr0w/JbXUsmwL/
         ZnazoGlBjZ89VM4jpiy2f7X9DPwkLj/Q6HYozmme1LxwYKpe8sC4oZgS/ZTw3URx5Yoz
         wrbcKaZik6jUe8GBvpCx92eTxcpNgIreKqvRmV3socTaNVcOH5sb2kYth6Rs87Rm6q8d
         F95dTFxN9by62ZtFO+iGC+0JRZ3P3Edod7GDX/f0HjkPf569WEQ8p0iJav5T9bDC3nHC
         0ufw==
X-Gm-Message-State: APjAAAUlru/DPXANyqE5kjstc+Myp0aQMjeVFHv1cwPYCzGB4BV1U3ES
        fPT+eui7yaQg7yeIg6dWXzk=
X-Google-Smtp-Source: APXvYqygbR8Mv8+x1FDwcshTXI8hOICMR3PVfkwhuHwXw/fxZ9bDbGQIRtAbeAH/HT1r6178kXxFQw==
X-Received: by 2002:a17:902:567:: with SMTP id 94mr30967241plf.174.1575921491679;
        Mon, 09 Dec 2019 11:58:11 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id c19sm293007pfc.144.2019.12.09.11.58.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 11:58:11 -0800 (PST)
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
Subject: [PATCH 07/17] clk: mvebu: convert to devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 19:57:39 +0000
Message-Id: <20191209195749.868-7-tiny.windzz@gmail.com>
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
 drivers/clk/mvebu/armada-37xx-periph.c | 4 +---
 drivers/clk/mvebu/armada-37xx-tbg.c    | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index f5746f9ea929..0d03878920ac 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -725,7 +725,6 @@ static int armada_3700_periph_clock_probe(struct platform_device *pdev)
 	const struct clk_periph_data *data;
 	struct device *dev = &pdev->dev;
 	int num_periph = 0, i, ret;
-	struct resource *res;
 
 	data = of_device_get_match_data(dev);
 	if (!data)
@@ -746,8 +745,7 @@ static int armada_3700_periph_clock_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	driver_data->hw_data->num = num_periph;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	driver_data->reg = devm_ioremap_resource(dev, res);
+	driver_data->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(driver_data->reg))
 		return PTR_ERR(driver_data->reg);
 
diff --git a/drivers/clk/mvebu/armada-37xx-tbg.c b/drivers/clk/mvebu/armada-37xx-tbg.c
index 585a02e0b330..5d86912fbb6e 100644
--- a/drivers/clk/mvebu/armada-37xx-tbg.c
+++ b/drivers/clk/mvebu/armada-37xx-tbg.c
@@ -84,7 +84,6 @@ static int armada_3700_tbg_clock_probe(struct platform_device *pdev)
 	struct clk_hw_onecell_data *hw_tbg_data;
 	struct device *dev = &pdev->dev;
 	const char *parent_name;
-	struct resource *res;
 	struct clk *parent;
 	void __iomem *reg;
 	int i, ret;
@@ -105,8 +104,7 @@ static int armada_3700_tbg_clock_probe(struct platform_device *pdev)
 	parent_name = __clk_get_name(parent);
 	clk_put(parent);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(dev, res);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
-- 
2.17.1

