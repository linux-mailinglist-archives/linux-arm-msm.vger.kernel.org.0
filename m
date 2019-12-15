Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36B5311F9F5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 18:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbfLORvv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 12:51:51 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34226 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbfLORvu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 12:51:50 -0500
Received: by mail-pg1-f193.google.com with SMTP id r11so2341696pgf.1;
        Sun, 15 Dec 2019 09:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JtOW+QPlUjdDS6TdBpSLjjaJL3b4V2DiQFsJEo2gjJA=;
        b=TDW2vMxn40YMaoX+ioc+kFuwF0B5ob/A2CzICAPtb+qqwCs2/f86cDNY8GUpSPbLln
         Hlo06+FCU6SOZq1/jo2ypmsAz1kxZQNuth6jJbt2oCV0LD5k1RF98BGMYORMcoQWEi32
         DsyXmvip+22q618Yyx6PTaVobtsOUACZVWl1Hu4UU4SjTlgbBYW2kfmvA8+NyChEznJY
         bLHGtt3S6OOvFEKXq2gfsHzRd5IqFFnkGurymO6w5udnrxokay7YnkmiVi5KyYyZX9tI
         bdWt2j+oo+IR7Bl4IuHG4Btis2Hz0o09xIkeJi6Awngc1D4VJM4OzVkjHOyPNrPZPjfs
         6xGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JtOW+QPlUjdDS6TdBpSLjjaJL3b4V2DiQFsJEo2gjJA=;
        b=dldDmMc5pnOIXr40+8Ggoof9Ld4Glenj6ZoFlp9TBWBuKYD8LP4rXU/14AfpX3DyQ8
         xvKcHmF7flrGzTAPDFhkOWoCVwbdGoYb+bXk06lV4kqlnLzUBdYAOx0FS5LPSNkwM4aQ
         hl8yDmABNZdktDeickwI1lZjGy9yQcMDpx5x+TL2j+56GzNtD0QO6vlap4THM/DI7Gky
         tvkuI7yvzcJaDRsadE7PFE/heSBFeUvzo8DqwPRGHDhyzhpJe3ZKmMwUVUNbLA4OTXar
         4584L6l9QZUicaEgWh3gUujOrhJv4AYA1RokfZdY/8Fj0Q5nlaO5Xhzi1CHnyXqi/7Zb
         T/Dg==
X-Gm-Message-State: APjAAAXK1q74QUc2bZVjpEpCZ9QnZOxXtrluOAEAsWD/O+IXqVf4l9jv
        c2Ks8epTGzbw/PL2bS7i6+A=
X-Google-Smtp-Source: APXvYqxnu+iNgVmWSpd7t0baxtWXCgIAvh8wDpoGpNjO6fT2yXWyu/IonFOvxs5K2771DvIxbC2lQw==
X-Received: by 2002:a05:6a00:de:: with SMTP id e30mr11358233pfj.243.1576432310186;
        Sun, 15 Dec 2019 09:51:50 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id g8sm19007763pfh.43.2019.12.15.09.51.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 09:51:49 -0800 (PST)
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
Subject: [PATCH 12/13] mmc: mtk-sd: convert to devm_platform_ioremap_resource
Date:   Sun, 15 Dec 2019 17:51:19 +0000
Message-Id: <20191215175120.3290-12-tiny.windzz@gmail.com>
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
 drivers/mmc/host/mtk-sd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 010fe29a4888..7726dcf48f2c 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2194,8 +2194,7 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	if (ret)
 		goto host_free;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	host->base = devm_ioremap_resource(&pdev->dev, res);
+	host->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->base)) {
 		ret = PTR_ERR(host->base);
 		goto host_free;
-- 
2.17.1

