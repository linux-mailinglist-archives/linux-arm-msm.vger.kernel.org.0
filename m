Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54DAD11FA01
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 18:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbfLORwC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 12:52:02 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39229 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbfLORvr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 12:51:47 -0500
Received: by mail-pj1-f67.google.com with SMTP id v93so1961039pjb.6;
        Sun, 15 Dec 2019 09:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YhjgtX960UbsjbrvQDkjR25LC0Xp5UzP+rm2Z3AHVDQ=;
        b=VkW7kWPXziC0PIAM0OaTLrvFFbF7v1ufFpviwDay49gsDMIcH+IRBccBJkurcCi4Vq
         q5zOaB1wZls+sDA4pOti1NqA+zCz50hczkno5ZcBXkTH7MAUjtp+hxim8dDi0xM9zlBh
         ORTfc7tfdwMyf44es4S115TlGJAo26zBaga4SP9Y2tm88AQJ8aj2m7/XSID274AaZLms
         r7kAlePWaMqowpfXAbyBnPXOCr/YpBVHULS1GQ8tBd2FKQnh71FuVAqFXVNByMVol0gD
         bv4nHt2lDPvuMrqo5uZe2xwrtq1AVl0Tr5mMHy7rSIm1CxFBmAOLQYeCQ17ker7YtIVV
         /G1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YhjgtX960UbsjbrvQDkjR25LC0Xp5UzP+rm2Z3AHVDQ=;
        b=NgM7WJd1k+S5cn1R5Dv/7sSwbGTGPnQ00EYbOdcDurpKH4EzCzHqvxoXLsamxLhJk9
         mTBTtcr+ACP/SvFjY10IftwDOGYruIh501yqHm0HykLpkxdIEjxL2c/wjToWX+nL9txN
         7BV/WIUgGQmG2PKuRMqk4nSFnpzqhDI8hZ3PKCrNOnhT+ot1VE5xxv0A2V+NM5dJek7j
         b57tMkLd8oSxy88V826hk2+wQ6JCpOaOlkSOmw9N06rHVhwm6EBLqf13opmldNk/kLN0
         DLTLxu2iFmozXBFx/4b6Sa24PgNSr9rWHdaCYRTbkOb0eCx/5rgBNHB3spRk3wvvzOVt
         s11g==
X-Gm-Message-State: APjAAAXCJKRAFHQIfFL9mjfL1S+DPv6fdgRFjgj3F0xfK/CA/5XnP7yz
        X8TePYtAqmo8PuDL8Z1M0XA=
X-Google-Smtp-Source: APXvYqyFOVnVHQlrCHXl4b4SA8i+eeSI1R8YkDiMXk+XQeJjyOl6YSByuDfOki4oIhQ8Xaa4GARrSg==
X-Received: by 2002:a17:90a:86c9:: with SMTP id y9mr13116519pjv.88.1576432306430;
        Sun, 15 Dec 2019 09:51:46 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id p28sm18232181pgb.93.2019.12.15.09.51.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 09:51:46 -0800 (PST)
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
Subject: [PATCH 10/13] mmc: sdhci-msm: convert to devm_platform_ioremap_resource
Date:   Sun, 15 Dec 2019 17:51:17 +0000
Message-Id: <20191215175120.3290-10-tiny.windzz@gmail.com>
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
 drivers/mmc/host/sdhci-msm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 3d0bb5e2e09b..6daacef4ceec 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1746,7 +1746,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	struct sdhci_host *host;
 	struct sdhci_pltfm_host *pltfm_host;
 	struct sdhci_msm_host *msm_host;
-	struct resource *core_memres;
 	struct clk *clk;
 	int ret;
 	u16 host_version, core_minor;
@@ -1847,9 +1846,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	}
 
 	if (!msm_host->mci_removed) {
-		core_memres = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-		msm_host->core_mem = devm_ioremap_resource(&pdev->dev,
-				core_memres);
+		msm_host->core_mem = devm_platform_ioremap_resource(pdev, 1);
 
 		if (IS_ERR(msm_host->core_mem)) {
 			ret = PTR_ERR(msm_host->core_mem);
-- 
2.17.1

