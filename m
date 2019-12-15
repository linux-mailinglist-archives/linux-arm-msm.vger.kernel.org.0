Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D84C011FA00
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 18:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbfLORwC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 12:52:02 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44326 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbfLORvs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 12:51:48 -0500
Received: by mail-pf1-f194.google.com with SMTP id d199so4310608pfd.11;
        Sun, 15 Dec 2019 09:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qIcZpVaq+iaWAioOWHH7QyZK8f/ao9N/kVPUnMEajrg=;
        b=eQhWosuwmegDI3J/X1lPGlAItpCcpP+ZIhdz/qqbfb6orbQFKn4DWfrncu89r+aQbm
         fwFbVih2JALiHfXd2X1+MCWrWH4RSC4JuF1cg1BlWTEtAfFqst8Rn+lRBAVP0tw0UWvP
         X4ippjV15+9c/2NDDbj9OjZ4jfMQK2Mw/YkNFEHyUjYZTD77gd1eIeLya1FuM3vgF3P2
         vjSaBoDB6iSDBMHfu1t+WBZHSPnVmfJXVymcmZy84YNbGOuXhINfETqsvsT8t0aBRps9
         0QLO3Lcpmwi5QbvOItENts7vwfPBMP85HHs/BpSvycP+rHMksXVTnIYJDTKTPgTuhqWN
         m6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qIcZpVaq+iaWAioOWHH7QyZK8f/ao9N/kVPUnMEajrg=;
        b=VHy+axx1EbyKheq6UEqK8943F2STVWEUelxn/Ezw8fqhsL3a49LYTFiWLzPAJ0wgrv
         so6OB+CYVEaV2YXH+g17TkmVOqwuACdf8+FTOzF2xZVMGg9dk0Q+GzUQSPDr4LyL3Gy9
         DouT2Z24HsEP499YzkJPWX2FtKxaM5n87yFBZQ7v7ve7O1Fcga8Y257Y1KmRCtKTJJ17
         05OIWr/E2UTSi8mfkkRqPf1snYM79sDVq0nsXHc1aKnUgbD1yfz5GS1tJK9gT4dHnQnq
         AB/whZeC8tBy+gVBFd4bGe+Ix/47ZsUUACLQL6un0sL+luc+ZIeD+9fyGX/YWgDfPQWv
         7yCA==
X-Gm-Message-State: APjAAAVfF1JonAMxjQczKA/7iZx8KzLr+mMYELk7Uub8mosf/jut59Et
        R5wu8gRB65mW239DmfUbx+E=
X-Google-Smtp-Source: APXvYqzMOkkvgyckqiTIpy5X7VqgwsZVaBxnJUyY/NoJodtBNikPzj1CKS0zJ3tx829QCCA+BuuTIA==
X-Received: by 2002:a62:d444:: with SMTP id u4mr11821902pfl.153.1576432308269;
        Sun, 15 Dec 2019 09:51:48 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id y76sm19858133pfc.87.2019.12.15.09.51.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 09:51:47 -0800 (PST)
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
Subject: [PATCH 11/13] mmc: mvsdio: convert to devm_platform_ioremap_resource
Date:   Sun, 15 Dec 2019 17:51:18 +0000
Message-Id: <20191215175120.3290-11-tiny.windzz@gmail.com>
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
 drivers/mmc/host/mvsdio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/mvsdio.c b/drivers/mmc/host/mvsdio.c
index 74a0a7fbbf7f..203b61712601 100644
--- a/drivers/mmc/host/mvsdio.c
+++ b/drivers/mmc/host/mvsdio.c
@@ -696,16 +696,14 @@ static int mvsd_probe(struct platform_device *pdev)
 	struct mmc_host *mmc = NULL;
 	struct mvsd_host *host = NULL;
 	const struct mbus_dram_target_info *dram;
-	struct resource *r;
 	int ret, irq;
 
 	if (!np) {
 		dev_err(&pdev->dev, "no DT node\n");
 		return -ENODEV;
 	}
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	irq = platform_get_irq(pdev, 0);
-	if (!r || irq < 0)
+	if (irq < 0)
 		return -ENXIO;
 
 	mmc = mmc_alloc_host(sizeof(struct mvsd_host), &pdev->dev);
@@ -758,7 +756,7 @@ static int mvsd_probe(struct platform_device *pdev)
 
 	spin_lock_init(&host->lock);
 
-	host->base = devm_ioremap_resource(&pdev->dev, r);
+	host->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->base)) {
 		ret = PTR_ERR(host->base);
 		goto out;
-- 
2.17.1

