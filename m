Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0B4311FA06
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 18:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfLORvm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 12:51:42 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36808 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbfLORvl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 12:51:41 -0500
Received: by mail-pf1-f194.google.com with SMTP id x184so4335359pfb.3;
        Sun, 15 Dec 2019 09:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M4rb0k6npd2G8XmrmT8Mmuq1Mqx3Tqp4JozWv4IeGBE=;
        b=Dffo/ivbPuSxvOTilFvFyuCjze8R3Nz1KdRpjRZXiuzi/VElxSGfIWsE7zsGZ16JIl
         wvqLG4syWI7BDu80fWkO44X0LxOO0zbyOuuPqoHFZE7qxFnwAfg1WM85/YsC08Lr6Atc
         f1x3CHSxQxK4W8uN0GPvNQbdOhAbGrKD/lkgp19Wh+tZzD28fwxnFI/rgDycdti4x/Vd
         NvvdWS9zDoHBOnZcouhEQCaJJTr/qCV+yoefROCP2SQE88CSB79DLklO0AP4rsAyO4us
         kaDbsGbd9ayVBP85+vIGzL5vJ+PoGnyHsXOqkZ2051uGdqVxhI1E/zUisQmkG7MAc+ej
         WBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=M4rb0k6npd2G8XmrmT8Mmuq1Mqx3Tqp4JozWv4IeGBE=;
        b=ikNI1GcCwLO9z5fKWrCHlIDw9LbA7q3/hLxTgos8GdpWO8U6I2OAeBxVTJeGw/nS3H
         GyFXdpM/oEeYC8rBGW337X6ofy7jxoYur4KF4vyyDrJI26Qn0eQEuU2YvXP/k+x490JX
         xWQJHkXC0ad32FIjTwfQFDDydat3AEnTofQ01tjS/PjZp4wrXNbOgyo7tI1MSoIH93Ok
         u4NVA6JrxWtCandun4AcyZPhURMgUIr51W3chEcI+HDpfmTzbB9OKSqFDjKMD6g93qC5
         T/qCRRylJHF5t9qyJNUyc3IQSUZ+HLVYr90MWZiYNJztkxOPdauo5kSOfKNWYgKyi+5o
         4wIQ==
X-Gm-Message-State: APjAAAVNbBgCjoI4M/o44o0daGieGzguMNTCFipbYftQhn1As5VDjCE7
        N/9UYMSYB5yAOyV3gPsalQY=
X-Google-Smtp-Source: APXvYqyQzdWSpl2Sd5Qy8EvlwnGWckT99MmmuRs6mMqDmxroD8ufUiQwLV2+LBkw71MDRzquOsBmeg==
X-Received: by 2002:a63:6f8a:: with SMTP id k132mr13514164pgc.70.1576432300626;
        Sun, 15 Dec 2019 09:51:40 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id r62sm19900871pfc.89.2019.12.15.09.51.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 09:51:40 -0800 (PST)
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
Subject: [PATCH 07/13] mmc: sdhci_f_sdh30: convert to devm_platform_ioremap_resource
Date:   Sun, 15 Dec 2019 17:51:14 +0000
Message-Id: <20191215175120.3290-7-tiny.windzz@gmail.com>
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
 drivers/mmc/host/sdhci_f_sdh30.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci_f_sdh30.c b/drivers/mmc/host/sdhci_f_sdh30.c
index fa0dfc657c22..4625cc071b61 100644
--- a/drivers/mmc/host/sdhci_f_sdh30.c
+++ b/drivers/mmc/host/sdhci_f_sdh30.c
@@ -89,7 +89,6 @@ static int sdhci_f_sdh30_probe(struct platform_device *pdev)
 {
 	struct sdhci_host *host;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	int irq, ctrl = 0, ret = 0;
 	struct f_sdhost_priv *priv;
 	u32 reg = 0;
@@ -123,8 +122,7 @@ static int sdhci_f_sdh30_probe(struct platform_device *pdev)
 	host->ops = &sdhci_f_sdh30_ops;
 	host->irq = irq;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	host->ioaddr = devm_ioremap_resource(&pdev->dev, res);
+	host->ioaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->ioaddr)) {
 		ret = PTR_ERR(host->ioaddr);
 		goto err;
-- 
2.17.1

