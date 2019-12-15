Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72B8B11FA12
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 18:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfLORwR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 12:52:17 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37655 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbfLORvj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 12:51:39 -0500
Received: by mail-pj1-f67.google.com with SMTP id ep17so1966596pjb.4;
        Sun, 15 Dec 2019 09:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TZ1xS5qPhU2IhwfRNSwTRqhYIldYr8v5xb3e3qhR6PU=;
        b=pbR7pVsVjeHw0gd67xvoEtScCkAwIdUeTHkozhA37RkgiSyp8YcSx9ERtIfAY+IuDw
         hrCtp5fcXF0DIRbJ9NfadYRWzR7Y1o2M4UDFlv40n+lZbg23Tni/uvFNaakQLuZvz2Bq
         bFwDHfxbqE2SpINHP8LFYxmZWELq6LEjJ3AxV3llH7olhcxa+IBpYaaHVWdsQ4dapcFM
         EOH9KUPmlJpXEPcIKhCwJUnMEMXiTNTg5kJ+Q7IKAKs4CzrlLmCHMy2REvs+RoZazFVg
         ivCZcwp2kgFJP1mYiaGKP/MTCbZNJFOkBX3D7yyGnRrSbgXS12ywC4c8SNGQRXMkKw3u
         nvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TZ1xS5qPhU2IhwfRNSwTRqhYIldYr8v5xb3e3qhR6PU=;
        b=poAPCk2D14lUS7b7aNr0tiNoclMrSXCj1sDyV0zLSfoXDugQFErNyFOJhozoXI7UTA
         jiGyu/KtqvLJ+mp7kYnfLbjrJyJ4QWhsoQqa6ALsPmIKA1nTI9L1g2BmJyIYg1T4yJUr
         Miu9JGzU/3BnXszqEwsuXPvzy6EwqfVVDiuH5HVr91lUGNNFt0u5oZ9NLlA96qxCAj9h
         OdlZyYGd76wRWzNlpzb1Y/F7wES3Y6m+cvcZ7oX2z14spNbE9HP9xa6fydc5ftnuaIYE
         y/ylKqstIu1xGXypzsrRotd/v9ia0yhqw+wb+5F9pxy78XoDqiri6nvKY/0eMlnST88m
         micQ==
X-Gm-Message-State: APjAAAUDkPLLJ1IuBAcEIGHrea4m34TJ0mOZDsotnfpCr/L1M69S5DcL
        ++MnDBKhKnB5v46PJwJfsfY=
X-Google-Smtp-Source: APXvYqy/1P3upyMouvKmiwh3Vz1uiBI+Jt3S3WCz0rzjwcujE1WXEXrqRVWI2k1ffFwimt3XZuCt8g==
X-Received: by 2002:a17:90a:a44:: with SMTP id o62mr13115954pjo.80.1576432298835;
        Sun, 15 Dec 2019 09:51:38 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id s18sm18243050pfh.47.2019.12.15.09.51.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 09:51:38 -0800 (PST)
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
Subject: [PATCH 06/13] mmc: sh_mmcif: convert to devm_platform_ioremap_resource
Date:   Sun, 15 Dec 2019 17:51:13 +0000
Message-Id: <20191215175120.3290-6-tiny.windzz@gmail.com>
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
 drivers/mmc/host/sh_mmcif.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
index 98c575de43c7..5069f1cbcef8 100644
--- a/drivers/mmc/host/sh_mmcif.c
+++ b/drivers/mmc/host/sh_mmcif.c
@@ -1388,7 +1388,6 @@ static int sh_mmcif_probe(struct platform_device *pdev)
 	struct sh_mmcif_host *host;
 	struct device *dev = &pdev->dev;
 	struct sh_mmcif_plat_data *pd = dev->platform_data;
-	struct resource *res;
 	void __iomem *reg;
 	const char *name;
 
@@ -1397,8 +1396,7 @@ static int sh_mmcif_probe(struct platform_device *pdev)
 	if (irq[0] < 0)
 		return -ENXIO;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(dev, res);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
-- 
2.17.1

