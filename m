Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23B2B11FA0D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 18:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfLORvg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 12:51:36 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:45409 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfLORvg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 12:51:36 -0500
Received: by mail-pj1-f65.google.com with SMTP id r11so1952546pjp.12;
        Sun, 15 Dec 2019 09:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jPiXjT3BT4ZC5Q5kouLFOM5eY+EtYfy9tRuLuTsagUU=;
        b=e2VJlGNiKxNfy/SisX8BcUnvxevhe03BmsPpOEboFRjG9x1guNigRD306+BqeeChZ6
         o/bpyIgK0iWtTH/uwe51dpEL5Lnv+4qRuaRN7uyBCQiRuc0wRglzBgFrhEjbSntBeXYI
         DIcEVcRUXS8ohqZKDpIa/B0dbm6XVfx25nBbmj3FA81Hp/CBxrtivTXN97L0BVY0TmUf
         f1Zgqn0sIkr9h4fKKOxebUja0Emn9HgsDU271ZJE8pZ1cHfVO3Mn2YifRnkBBGr2ZPmM
         SSB2sEzM4p4U0+UEjQslfpqGWph2B5eeFUlCedfCBa3zBMWrlFBfLa+xIQ4YPnCaydEI
         oTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jPiXjT3BT4ZC5Q5kouLFOM5eY+EtYfy9tRuLuTsagUU=;
        b=O2Y++JGG5AKmPz4bN0ZUXswc6A2mEeIDuTRh1IUSXUUIOe26JVTqX870VHhUST/OPB
         LLwwNXZCCJGV9dJKHodrPP9pREynxzV6yFqF8c+N3eYpBs1xQlefLoKvboylq68e5L8n
         lJ8eN7hP+PEn5Om3R297OBbXiMvYz+2FqwAFNLlylBsjIxdh50/ehwqCyzgiLRaG/v35
         YQL9r6xvXJNKTsiNwbuVSr3ubcnuwjTxOBW5wVWCqZ/fTQJTKvjXflI2oHyWOMIP/gOY
         igNEe+oetnjldcp+OeoGIjZvZKhdnGRXzv0xeKHkW08r2f/AkILEGuwFM6M/ZNfXv2jA
         A2Xg==
X-Gm-Message-State: APjAAAVKSGp62raW357zUkzrf+pot0jvvp4DfwSJH0nvXEylOqQI9pTR
        6Wxd2p2EgifTaZWpnuw6e98=
X-Google-Smtp-Source: APXvYqwMdghsP2eW9OqliRa0pUknedlFchToxsCJR4Fd26rwawl+6gOAGBS6Uu8D1cBubCvCuQJpoQ==
X-Received: by 2002:a17:90a:1a8a:: with SMTP id p10mr12724708pjp.6.1576432295219;
        Sun, 15 Dec 2019 09:51:35 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id n2sm9636565pgn.71.2019.12.15.09.51.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 09:51:34 -0800 (PST)
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
Subject: [PATCH 04/13] mmc: sdhci-s3c: convert to devm_platform_ioremap_resource
Date:   Sun, 15 Dec 2019 17:51:11 +0000
Message-Id: <20191215175120.3290-4-tiny.windzz@gmail.com>
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
 drivers/mmc/host/sdhci-s3c.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index 51e096f27388..e72352beb13a 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -481,7 +481,6 @@ static int sdhci_s3c_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct sdhci_host *host;
 	struct sdhci_s3c *sc;
-	struct resource *res;
 	int ret, irq, ptr, clks;
 
 	if (!pdev->dev.platform_data && !pdev->dev.of_node) {
@@ -555,8 +554,7 @@ static int sdhci_s3c_probe(struct platform_device *pdev)
 		goto err_no_busclks;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	host->ioaddr = devm_ioremap_resource(&pdev->dev, res);
+	host->ioaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->ioaddr)) {
 		ret = PTR_ERR(host->ioaddr);
 		goto err_req_regs;
-- 
2.17.1

