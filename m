Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F15A117696
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 20:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfLIT6M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 14:58:12 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:42829 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727043AbfLIT6K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 14:58:10 -0500
Received: by mail-pj1-f67.google.com with SMTP id o11so6330025pjp.9;
        Mon, 09 Dec 2019 11:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5Ypj/Z6w2S/xgkl+ZC6Pju9LNZ16DA5i5275AzT7Az8=;
        b=XDWN9d8k0pBMo+UkkcX1UfyWaeD0FDlwtPRgLxmAGmjfj7VvxgJ+utoSJJbVFf1e8j
         cVTIMVhpbFcRmnCfJfNrkdQDWPHhpAOS6W2qbTijNUU98elxzA9CRXupry7r7PmtENWG
         2iaJ+jjdaYShsBjUrnXiXi/RlnB92+H8ym7JDCEv9VRZ/4ps0/dodXmZRSU7hxJVc5Cj
         YthVNwPROegPqrfA3slLTAM8fGIglRXefx2+/Zo8G+iHQesFdbwBYxdnYbogEbDdBjog
         mySYP15VONRcvZ4j7foihrlRjJ+yWyhvJOUqFtIC3Sbs19NDP8t3owrbeHwfGbVV579t
         +rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5Ypj/Z6w2S/xgkl+ZC6Pju9LNZ16DA5i5275AzT7Az8=;
        b=qtDKltIcanPiEx8WoTAAllZMVqPn3UXp/XoiJ63Y9xTpXR+BjwbBJhE4veah4qpBX4
         Uw9epzIZ/vPIGLOq1SOTbzCHoKz+r76AKd9FwLwhGR20xS9eum/9b21Cl/dbIZgh29Ev
         uLcgVcrZwK+TMDIMtLRSA1lpEDKMfN/GuboSeIJItQnopSMj4lnzS20OYaowaj7xCkbD
         4WHXpCMWafHeCZQItLtqNmcpDCK2bOD9phqUIDYxmqUnvyxdv/flGJ/p7xWktQFTX029
         RZ2/j/3iFhIzrGu4Uf55DkuV1VOQ8Wdnu+4QraFd7Ed7nY+0DgiodAsRs7u3QYJtCaup
         /x7Q==
X-Gm-Message-State: APjAAAXfQDXonnHcjWfvsEhOy0X+FAD85H8VIaJ8HCDwb0EwbSeu6W9U
        hAwmKAljF1YYvcxr8HOjBts=
X-Google-Smtp-Source: APXvYqwB7mvU3N06HUnt/fRjyLYz5X1psEZz61OVWSzTqPYA5ykl2uCZGGD6VXZzgLMxQd0Zqd4WHQ==
X-Received: by 2002:a17:902:724b:: with SMTP id c11mr19110880pll.177.1575921489905;
        Mon, 09 Dec 2019 11:58:09 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id p17sm312835pfn.31.2019.12.09.11.58.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 11:58:09 -0800 (PST)
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
Subject: [PATCH 06/17] clk: tegra: convert to devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 19:57:38 +0000
Message-Id: <20191209195749.868-6-tiny.windzz@gmail.com>
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
 drivers/clk/tegra/clk-dfll.c | 34 ++++------------------------------
 1 file changed, 4 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index c051d92c2bbf..070a2957e119 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1935,7 +1935,6 @@ static int dfll_fetch_common_params(struct tegra_dfll *td)
 int tegra_dfll_register(struct platform_device *pdev,
 			struct tegra_dfll_soc_data *soc)
 {
-	struct resource *mem;
 	struct tegra_dfll *td;
 	int ret;
 
@@ -1985,51 +1984,26 @@ int tegra_dfll_register(struct platform_device *pdev,
 		return ret;
 	}
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem) {
-		dev_err(td->dev, "no control register resource\n");
-		return -ENODEV;
-	}
-
-	td->base = devm_ioremap(td->dev, mem->start, resource_size(mem));
+	td->base = devm_platform_ioremap_resource(pdev, 0);
 	if (!td->base) {
 		dev_err(td->dev, "couldn't ioremap DFLL control registers\n");
 		return -ENODEV;
 	}
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!mem) {
-		dev_err(td->dev, "no i2c_base resource\n");
-		return -ENODEV;
-	}
-
-	td->i2c_base = devm_ioremap(td->dev, mem->start, resource_size(mem));
+	td->i2c_base = devm_platform_ioremap_resource(pdev, 1);
 	if (!td->i2c_base) {
 		dev_err(td->dev, "couldn't ioremap i2c_base resource\n");
 		return -ENODEV;
 	}
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-	if (!mem) {
-		dev_err(td->dev, "no i2c_controller_base resource\n");
-		return -ENODEV;
-	}
-
-	td->i2c_controller_base = devm_ioremap(td->dev, mem->start,
-					       resource_size(mem));
+	td->i2c_controller_base = devm_platform_ioremap_resource(pdev, 2);
 	if (!td->i2c_controller_base) {
 		dev_err(td->dev,
 			"couldn't ioremap i2c_controller_base resource\n");
 		return -ENODEV;
 	}
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 3);
-	if (!mem) {
-		dev_err(td->dev, "no lut_base resource\n");
-		return -ENODEV;
-	}
-
-	td->lut_base = devm_ioremap(td->dev, mem->start, resource_size(mem));
+	td->lut_base = devm_platform_ioremap_resource(pdev, 3);
 	if (!td->lut_base) {
 		dev_err(td->dev,
 			"couldn't ioremap lut_base resource\n");
-- 
2.17.1

