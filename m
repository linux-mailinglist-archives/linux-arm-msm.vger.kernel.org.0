Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84E3411769E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 20:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbfLIT6Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 14:58:16 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35157 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727086AbfLIT6Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 14:58:16 -0500
Received: by mail-pg1-f193.google.com with SMTP id l24so7637127pgk.2;
        Mon, 09 Dec 2019 11:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=e/xw/4DU6R/wwAQXOSaREMBJ7MJ6SzjE/v+O35UsN0I=;
        b=RXmVdRBEPDoF3rwjV8HCt2/y7yrz0sWN0CCE+wTL4LBZk1SPdgMEvRR2Ry9YXy46hq
         GVwnLz0DEU3+FhOwG1DB/2RRvOdIwQm8HoDC8uOCalGUOGtBD0XuyYkc8u9FkcrdG8k6
         6g6N8DmMTaj9b/gnD7PCHsDg1i5oDebstS77oQzmQU30DxZOt1qAeTLXNEwYEdL3/aan
         9lq3KEYU3DTp90PGWtqJ5uN0JTt6iOPdvssOtlt7HdduSDktyUFuAEvjVfff7bSkzyG2
         ohoslBU8NiAw8wh6CNHlM4yMQLxiLqFzZLU6dtLUPt1c4Zo7cTUHZwTEgmEtbgOjKXh3
         G0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=e/xw/4DU6R/wwAQXOSaREMBJ7MJ6SzjE/v+O35UsN0I=;
        b=oQZ0z3qaHsGQXGfUosNJuHTsYOH04KurCOOfG0sIGiGoCOAB8QpWQofQhPHfItOaFF
         CSHjCKskDg/HndTAey/v0ffmGc/H9sgCqTWk5DQuuA74DC3vlsUCKdpHDUFE9i/9Lxvi
         ThGOq9QWITDYwY+O0Mx0mmgWSMxjIq7JWjZKlyG9zYEbKvlHHHbjpAKoXgjtpaLH03dG
         W/JGUzYCOVeaa37+/zm2gQRWgekQobpZCDci7Levp4IeAHhn574InjUbt/V33T/KgrCU
         U10aJayF9szyzM2txCSDIxipRAx5MMNUfhEfZZ35aCsFmwK80jUn0SRgWCw/O9B3l2r+
         10/Q==
X-Gm-Message-State: APjAAAWz2SSm2OfeQ1RhlC2ex7xXgTHerEl6P3uG0JmyDLcikq4K7VYq
        20VW7yN4/cmdaK+4HSS2RzE=
X-Google-Smtp-Source: APXvYqx/xVThTCf89p72LZFA4UzOdBkyyKi9dguN+2zd9txD/+pD++B6QJgrWwAPA+xTEfTBozXgEA==
X-Received: by 2002:aa7:86c5:: with SMTP id h5mr30662267pfo.259.1575921495225;
        Mon, 09 Dec 2019 11:58:15 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id bo9sm193008pjb.21.2019.12.09.11.58.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 11:58:14 -0800 (PST)
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
Subject: [PATCH 09/17] clk: sifive: convert to devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 19:57:41 +0000
Message-Id: <20191209195749.868-9-tiny.windzz@gmail.com>
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
 drivers/clk/sifive/fu540-prci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/sifive/fu540-prci.c b/drivers/clk/sifive/fu540-prci.c
index 6282ee2f361c..ececee273d32 100644
--- a/drivers/clk/sifive/fu540-prci.c
+++ b/drivers/clk/sifive/fu540-prci.c
@@ -582,7 +582,6 @@ static int __prci_register_clocks(struct device *dev, struct __prci_data *pd)
 static int sifive_fu540_prci_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct __prci_data *pd;
 	int r;
 
@@ -590,8 +589,7 @@ static int sifive_fu540_prci_probe(struct platform_device *pdev)
 	if (!pd)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pd->va = devm_ioremap_resource(dev, res);
+	pd->va = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pd->va))
 		return PTR_ERR(pd->va);
 
-- 
2.17.1

