Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A983111F9E9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 18:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfLORvc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 12:51:32 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38392 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfLORvc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 12:51:32 -0500
Received: by mail-pl1-f193.google.com with SMTP id f20so1685556plj.5;
        Sun, 15 Dec 2019 09:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LysDIRyUWjcACkzyZj03TqlWtvxOY9uGmk/396mKWhc=;
        b=NEyWXOSvcxEgMiU0sSL9uY/bFD35hforgyUqSOgXK50IABjB3O1mGxt+4tbptDT1yj
         CxmvnM0vh4yPihzrQE7TGoLaKgx01+pmVH1kwqrdgE5hb/t5rKm3YC3uWSTFFtL/LRBC
         giHhCLMg/coaFC+Ia+Dc/5MjAfToGyWZzhpcjfbaUourf44Bo7/4Z2Oynlzipd1+VTXI
         NyxEwEXknnTRwmYLO35Ys24C85+XKM+1OCbQfwch624nKKK60yY3rqU4Qp2sIC6Ny7GT
         5j//iQOVphr/0l7mVcVXyIXonorpV3qL5ToV+gxkoVM8Ho4JKUjToUixzPT+B6mfSOhU
         269w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LysDIRyUWjcACkzyZj03TqlWtvxOY9uGmk/396mKWhc=;
        b=Al3KY5qNI5mZLZ2aL5cSn6yykrTfJ/hnKnlCPOgdDfAEn2odOv+SDFs3E1jiuH1XGW
         U8b//8/G4Lcsu8bZOkRzCW9BSma8NiW2+TkbFRgR2Z0Yd7RlrkYIiPuZf8XgCWbEhsMP
         DPtCYCKcDhdG+T+Df/0jlC/f5Xb0Qh9x2iF4+2B+5vXrUpK/DKvqxAO1Z13oEMLZpQPv
         REltlhkx7we5ucwxrp8ehq39DKZ+BXy429ZomAX0hLUhSk71vgJiMaTtbwjf4AVgVIz2
         7J+bw5/3u8dXNjGZsm0vu/IKArIKhLv8Lh1+DWcs1wYNHPAKIpCezrtee4PRqGDOU92K
         byNA==
X-Gm-Message-State: APjAAAXh68Q8DbgzEb2IgGCTwgZKUvL8ZQQ3BakoAM9HctyLpvGQUPRJ
        hLEPIsMIBPPAkaqM3AtimDg=
X-Google-Smtp-Source: APXvYqzmvIDLb1enKy35lMWmLNm4qJzVxGNdBEBQLoJbjT8Xb9jqha4asK/Aw4JMGO6idxiJbcFfiA==
X-Received: by 2002:a17:90a:a798:: with SMTP id f24mr13456417pjq.27.1576432291181;
        Sun, 15 Dec 2019 09:51:31 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id h68sm20424981pfe.162.2019.12.15.09.51.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 09:51:30 -0800 (PST)
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
Subject: [PATCH 02/13] mmc: tmio: convert to devm_platform_ioremap_resource
Date:   Sun, 15 Dec 2019 17:51:09 +0000
Message-Id: <20191215175120.3290-2-tiny.windzz@gmail.com>
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
 drivers/mmc/host/tmio_mmc_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index c4a1d49fbea4..365d518c6d7d 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1109,12 +1109,10 @@ struct tmio_mmc_host *tmio_mmc_host_alloc(struct platform_device *pdev,
 {
 	struct tmio_mmc_host *host;
 	struct mmc_host *mmc;
-	struct resource *res;
 	void __iomem *ctl;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ctl = devm_ioremap_resource(&pdev->dev, res);
+	ctl = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctl))
 		return ERR_CAST(ctl);
 
-- 
2.17.1

