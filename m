Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAB5C11F9FE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 18:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfLORvt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 12:51:49 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:45416 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbfLORvp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 12:51:45 -0500
Received: by mail-pj1-f66.google.com with SMTP id r11so1952607pjp.12;
        Sun, 15 Dec 2019 09:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=szqF6wBatd141DYcdeo2AKZKHAndczMcysoH1ninemU=;
        b=Vs9JBuJNJgoOVxp/KSDwEkQIgdPDJROFyC0pjCA6tSN96Gz2QLnZcxrIZftP/0vpOz
         1XRwerz7LUlFA7m7JVRVEYTBhus+FTcNU5oI0GcZKEu28b6bhaRGFeR4UFmyztTAIUsN
         EWfCjHjr0axlnC5vKyu64QiMI/2mzM3bxyhO/CWxAbfoWrJJ3ihzzUkhYUhagoj0nX0S
         a1nUV6UUaWC+yy6bYjA9QctSoc6BiMC3BgFRegMkY03eDkw8o8TGZ5GS+l1mos4+XpVN
         u0rn8oHp6l56e/IojaMT2NqW9UzxqLNcOxntYNN7ZPeRrgnfujsJrFOKPyS7lYMI1cyh
         eLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=szqF6wBatd141DYcdeo2AKZKHAndczMcysoH1ninemU=;
        b=FG1T3O4n/JTWGXBthxo7efrpT1t0XMvDHkjRREDxQRt4Z0UQnyPhH6u5Qij5UYmAxr
         nwo9qAJ9JHA/2f2poLcQqjNRAx1FzGM6rcVcfJpMemRloza2roRRYloNUMQxAbF+c55z
         uREn4tEJ+/UUt2KRYpJ26rFZjYuy+HykRMhsx4myRVWXssi/4sEzIZRFO7kLFAHJVTbY
         L0toLkW+/N9TDWyyLl1u8UM9UkDQwmi2rRvgf9JNcb/UENRA+4mPTaE2q2Cfepq9ShtA
         7lKc8xb9Gs0W7sHzi5x1Dk1oln/3/4y7emQgjhogND660BNldR1TvPSxp2fZckbWLQhk
         HFqg==
X-Gm-Message-State: APjAAAWpme22s8Nop6DWteZGjyWKzQGfESnHDmTzxoCK+HBVPTePtjzp
        1DQOcpqCf+8waOS9M2Jbkq8=
X-Google-Smtp-Source: APXvYqxLXCEA1K+SbpDYjjsq3TkaS0vAO6JjXHILJhQBtbuyekHgkxOcbQ0IvpAcBqayQz3nTOHFsA==
X-Received: by 2002:a17:90a:b010:: with SMTP id x16mr13570307pjq.130.1576432304351;
        Sun, 15 Dec 2019 09:51:44 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id 133sm18872446pfy.14.2019.12.15.09.51.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 09:51:43 -0800 (PST)
From:   Yangtao Li <tiny.windzz@gmail.com>
To:     manuel.lauss@gmail.com, ulf.hansson@linaro.org,
        khilman@baylibre.com, chaotian.jing@mediatek.com,
        matthias.bgg@gmail.com, nico@fluxnic.net, adrian.hunter@intel.com,
        agross@kernel.org, bjorn.andersson@linaro.org, ben-linux@fluff.org,
        jh80.chung@samsung.com, vireshk@kernel.org, mripard@kernel.org,
        wens@csie.org, wsa+renesas@sang-engineering.com,
        gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
        yamada.masahiro@socionext.com, tglx@linutronix.de,
        allison@lohutok.net, yoshihiro.shimoda.uh@renesas.com,
        geert+renesas@glider.be, linus.walleij@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 09/13] mmc: sdhci-milbeaut: convert to devm_platform_ioremap_resource
Date:   Sun, 15 Dec 2019 17:51:16 +0000
Message-Id: <20191215175120.3290-9-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191215175120.3290-1-tiny.windzz@gmail.com>
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mmc/host/sdhci-milbeaut.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-milbeaut.c b/drivers/mmc/host/sdhci-milbeaut.c
index a1aa21b9ae1c..e6245b7bda21 100644
--- a/drivers/mmc/host/sdhci-milbeaut.c
+++ b/drivers/mmc/host/sdhci-milbeaut.c
@@ -242,7 +242,6 @@ static int sdhci_milbeaut_probe(struct platform_device *pdev)
 {
 	struct sdhci_host *host;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	int irq, ret = 0;
 	struct f_sdhost_priv *priv;
 
@@ -280,8 +279,7 @@ static int sdhci_milbeaut_probe(struct platform_device *pdev)
 	host->ops = &sdhci_milbeaut_ops;
 	host->irq = irq;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	host->ioaddr = devm_ioremap_resource(&pdev->dev, res);
+	host->ioaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->ioaddr)) {
 		ret = PTR_ERR(host->ioaddr);
 		goto err;
-- 
2.17.1

