Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA2D111F9FB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 18:51:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfLORvz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 12:51:55 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43143 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbfLORvw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 12:51:52 -0500
Received: by mail-pl1-f194.google.com with SMTP id p27so3446975pli.10;
        Sun, 15 Dec 2019 09:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/cz4vRUnbRV9SZ3G6wT7uGNBKfnOEqLWr9ZhQq3aPJY=;
        b=VUB0KVQAHEHprXd8JPg/0jED90d4vxehQR5oM13rBTaAw8YxpSr2SHoeE4jGTI7E22
         9CU2zoUYjBTnG3V+h4FvWpk0N4jlhpjp3RLjpQqDiDyO3pz0inFoNokv0y6Fsu0Awb+b
         M7s6Pjtbd8WVa7wOSJJuhjTi8zjBu2AzhoYEhH4fmQZO8q7pTFpxAYhgqOwQ4eb0W5aG
         zmAXTggqqLYOk2JsO0UFqjCtuNRE80TkubJxiCWtarkBSzlpDy5d5eZOKISXqW7sd+ap
         kPsjx2a3CPqG9IkXh3otL1pUVKFSZOoFGepy/lTbYnDJhLyZkz4V+bsRjFtnTv1ABJz3
         6zqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/cz4vRUnbRV9SZ3G6wT7uGNBKfnOEqLWr9ZhQq3aPJY=;
        b=gYAqU1QIk2o+Q/91eGqXvx0rB6tJjumCJlNBE4Xt3sC3pCqW/yTbnNWnVMTyuSlNLR
         onnZYHiZVMY2VGRmAR/wkLm/M5OJ7hJNWn6/vt/qNUJcmO/1VLw7HgvfoUM8RjP6vo5d
         sI+9xtctlV//ODo6lNoDaNA5g34w8l5o5dP1oSMqA4sN4uKQzl35cV1E21xp3lSlOE++
         LCzGxuO4KPWNT7bX2i1CfdxodQ4xYaU3jTv80kggRQ3dt0c6/plq4Dk0zRWf2Y6Lcxpb
         JwM+IVfn+C942r1xeqjetmYuEQDf5dlKxWKJKpkKLPGrAT3n7Hnce9mIKe+4Wx5Dda/e
         SF5A==
X-Gm-Message-State: APjAAAU91b3F1KDZBOrHM5qo8mHc13wc1nLRD5IQAq5tWXO2FkekTUZt
        JToHnP6VzOPNXfS6Z9BwPT0=
X-Google-Smtp-Source: APXvYqwynwF10fAEJxkpOjzXrYzf6q0kcA5H9tyhmFPNupU2grFmbw3V9ozwvElSbTNjK4798iHyCA==
X-Received: by 2002:a17:902:d708:: with SMTP id w8mr11897094ply.280.1576432312130;
        Sun, 15 Dec 2019 09:51:52 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id h3sm19102447pfr.15.2019.12.15.09.51.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 09:51:51 -0800 (PST)
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
Subject: [PATCH 13/13] mmc: au1xmmc: switch to platform_get_irq
Date:   Sun, 15 Dec 2019 17:51:20 +0000
Message-Id: <20191215175120.3290-13-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191215175120.3290-1-tiny.windzz@gmail.com>
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

platform_get_resource(pdev, IORESOURCE_IRQ) is not recommended for
requesting IRQ's resources, as they can be not ready yet. Using
platform_get_irq() instead is preferred for getting IRQ even if it
was not retrieved earlier.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mmc/host/au1xmmc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/au1xmmc.c b/drivers/mmc/host/au1xmmc.c
index bc8aeb47a7b4..8823680ca42c 100644
--- a/drivers/mmc/host/au1xmmc.c
+++ b/drivers/mmc/host/au1xmmc.c
@@ -984,12 +984,9 @@ static int au1xmmc_probe(struct platform_device *pdev)
 		goto out2;
 	}
 
-	r = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "no IRQ defined\n");
+	host->irq = platform_get_irq(pdev, 0);
+	if (host->irq < 0)
 		goto out3;
-	}
-	host->irq = r->start;
 
 	mmc->ops = &au1xmmc_ops;
 
-- 
2.17.1

