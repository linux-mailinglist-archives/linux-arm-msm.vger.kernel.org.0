Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0E3E11F9F0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 18:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfLORvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 12:51:43 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39775 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbfLORvn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 12:51:43 -0500
Received: by mail-pf1-f194.google.com with SMTP id 2so4326020pfx.6;
        Sun, 15 Dec 2019 09:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=A8oziVX0OVPNw7lU9FI+EUt433jdMUM01Z2ORYeAVas=;
        b=fBKZq3B+UTdbWsi9+g8bdOFCHGpe7TR9sfAOlLy6zhHgToqYKI2okWlUO/wS9d6u+p
         QObETgFmagku6GU1FlRQNb5t/Y9dhG0vMyt6zn/KGXslbl4lHP+yyMILKeUnZCONpcFn
         nFk0ak5IMJLciJtTB9ij91nLomUhjmWlZ14uu6ohZjsqPZqXutI+9z1rnDlHxiPEPw6t
         7YZThJj7UCNgkM0r2R80yHDaLx7hfnKGgi8f/DRlmtx1GVhlgdgpoz3UYxNu9ZDMXFcK
         Yv+Xe0JZFl44GM/aIAmtJ/YQsFJ79OS2CDFVX3XxVQTVvTKoAvpv2bPHh+bVZJgQgtIs
         BI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=A8oziVX0OVPNw7lU9FI+EUt433jdMUM01Z2ORYeAVas=;
        b=MjyUi9WbzfXt2aUMIFBE+g4N6/Bi0dbHoU2aA73I3gWOdSizrbkUo6AZ3/IZzsSb/t
         NbpdOdMJi3OmoBu5LzWPCdRRlPFbekNOFxVpOdapQPAkzlBxq18sd7AdTx0JwL0ScT9H
         67pczMG0lXW4EMT82spSeNE0fT4aL4lPCa77jhhQsTTU9Uc572QT1cI6JCQ/4XkHOCd9
         bwX6rzjdXI7JeCRzeAlNb29i0P1vDGswiCbvGvHWgp71nshh02AoOPAGTx3NyHgc6lji
         9FY81oclNLw1mKuojY8urX+F91NSYNJsoRFBJWi77Ua65ltjem+ofU6s1uazZhG28fWo
         Dhkw==
X-Gm-Message-State: APjAAAW0iX78knivzw2kdtud5e4sQI25NmvtIwS8wj0XnMrz1ZNoqG/T
        gfNXY+hDBFPuZcp9yA1RCuM=
X-Google-Smtp-Source: APXvYqzRYb6wWnfYIhsx/jpaCv0k0FMwBhDH/4hA1EyERHMjQx3fHd7/IHnrk/B7nyDbivGMX1th5Q==
X-Received: by 2002:a63:ea4b:: with SMTP id l11mr13127641pgk.357.1576432302424;
        Sun, 15 Dec 2019 09:51:42 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id i4sm16309004pjd.19.2019.12.15.09.51.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 09:51:42 -0800 (PST)
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
Subject: [PATCH 08/13] mmc: sdhci_am654: convert to devm_platform_ioremap_resource
Date:   Sun, 15 Dec 2019 17:51:15 +0000
Message-Id: <20191215175120.3290-8-tiny.windzz@gmail.com>
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
 drivers/mmc/host/sdhci_am654.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
index b8e897e31e2e..aa237f565e23 100644
--- a/drivers/mmc/host/sdhci_am654.c
+++ b/drivers/mmc/host/sdhci_am654.c
@@ -491,7 +491,6 @@ static int sdhci_am654_probe(struct platform_device *pdev)
 	struct sdhci_am654_data *sdhci_am654;
 	const struct of_device_id *match;
 	struct sdhci_host *host;
-	struct resource *res;
 	struct clk *clk_xin;
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
@@ -524,8 +523,7 @@ static int sdhci_am654_probe(struct platform_device *pdev)
 		goto pm_runtime_disable;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(base)) {
 		ret = PTR_ERR(base);
 		goto pm_runtime_put;
-- 
2.17.1

