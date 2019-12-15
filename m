Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A672A11FA0C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 18:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfLORve (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 12:51:34 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41374 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbfLORve (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 12:51:34 -0500
Received: by mail-pg1-f196.google.com with SMTP id x8so2324520pgk.8;
        Sun, 15 Dec 2019 09:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=q2+k5GlnKvFjGF2Y6yVzyvXp0HKBb/C1jWd07eNgP/E=;
        b=fsRMvr+l5cfpJljHCbs3wt3hpAlsSGdaq75BXagITm/GapRuZTC7T9dKBuKkWECQ1H
         ujeH2rpWcODHLCarJxDOBUzouTCLTq19xzl8C9i5FFnS4CquK+QyydtebwxBxJTAdX+x
         lFtHLpZa7YhjBNQSXioToys+V90ggr6pdrP/yEYZav7HK8DePNrfYAmHn4LlJTpGxsFu
         4RHgNMUL+P70URpzULeeR4s+qkbZS2T8TTTeziYmi+4bS64yWGEqUkC1RasMvPVTF7XU
         Ph6OWnLv0eXj3oitlB94bqP/cMI7l3zmdwR4ezisbpjHbVCZzcuass1dYqARA+O2L4JG
         WFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=q2+k5GlnKvFjGF2Y6yVzyvXp0HKBb/C1jWd07eNgP/E=;
        b=tE2soXcdVZponxnWvx9dirvk5XIuzjDRqbpMLTuMy22XH3TOI3ZgVGa+Nn5NpeX0gz
         K8zEF0DfaSCkr7JneSuq+r9F7oWr+DpIfBaBltV/w3Wudy06rDGH0ooINBIsPsrivuUn
         HKOQCoqN05o7qb8S6qNcvhbC8A0UhoLtoNyjz2DP4FCSaUctPD9YmZ/hEQnGukCYg0fh
         7m3CoTwKQ9b5jUBs8J+KEzQIt1Lrxa7b4zovQjIOW/rB2nLmCjFiIXVEm2C8KMi4klOV
         LJAGrl2qJBRhtwPCx4CWc0vRX5KAgtHxZLTQyMtkcenkeamOiz3SIicWc3w6J0sAuUNX
         PJWw==
X-Gm-Message-State: APjAAAWZQA9ahJacbbUMMwnS7fqbd4QHCUnCcZWsoN23lqUmpFwX1SA5
        MhGkpKeGmE9ONWCmajr3n7U=
X-Google-Smtp-Source: APXvYqxm8P6lOSGnTWI55dL9YMjFEmSH9JpmoZJXF4dK5sHP7ZYsgkyVJ7Xzi44T9ZmJFRecdQZP0g==
X-Received: by 2002:aa7:85d3:: with SMTP id z19mr11914677pfn.62.1576432293359;
        Sun, 15 Dec 2019 09:51:33 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id k5sm16070147pju.5.2019.12.15.09.51.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 09:51:32 -0800 (PST)
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
Subject: [PATCH 03/13] mmc: meson-mx-sdio: convert to devm_platform_ioremap_resource
Date:   Sun, 15 Dec 2019 17:51:10 +0000
Message-Id: <20191215175120.3290-3-tiny.windzz@gmail.com>
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
 drivers/mmc/host/meson-mx-sdio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index ba9a63db73da..8b038e7b2cd3 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -638,7 +638,6 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 	struct platform_device *slot_pdev;
 	struct mmc_host *mmc;
 	struct meson_mx_mmc_host *host;
-	struct resource *res;
 	int ret, irq;
 	u32 conf;
 
@@ -663,8 +662,7 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, host);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	host->base = devm_ioremap_resource(host->controller_dev, res);
+	host->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->base)) {
 		ret = PTR_ERR(host->base);
 		goto error_free_mmc;
-- 
2.17.1

