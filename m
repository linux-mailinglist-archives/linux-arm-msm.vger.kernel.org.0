Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5A6B11F9E7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 18:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbfLORva (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 12:51:30 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44699 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfLORva (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 12:51:30 -0500
Received: by mail-pl1-f195.google.com with SMTP id az3so3442857plb.11;
        Sun, 15 Dec 2019 09:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=z1jBRqifD9uwR57sxHEm4IG5SvaRCOY1FJ5LXadeqP4=;
        b=LD9i0Sz6s6XSzCMt0KxGg8AkP/88Gm29YgxJKl/PIqRJ29V1U4k/Q1BcW2j8KkXiun
         oYLm5Oj4XhSh35ez2t6kOADhXR1IKCNrHdK9Tq2IoifZqzGaoUiYkTDOgVZVjEzxGucW
         t0yMqBvCvtGLkldgOTt6EEETTw6diR2m8JWhrciDiz8t0r6oWa5FoiiSjOFWVrwjKVO1
         3SculOLAtHzrOynoET+zghiGzyI5dGzUZlCNZ+YHnez/tYiMyMo2tB4pHUN2jVptR1lv
         GPXHLuxviOJVUKzri0wyTsmwSmsOOjY0g7WapaSEIWGMR1TvUxQrPW9ddrdvJOARMD1R
         OveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=z1jBRqifD9uwR57sxHEm4IG5SvaRCOY1FJ5LXadeqP4=;
        b=ggzioMtNbpMoq+VRzANnHB1AwNYMCZBGHQTfpwvQeQSbsc3/wnVdD52okPWBpHvcut
         qdLe6a3iR7la5xTZb5vwwy5vfoO7xAUP5T/0bXsVTp0Dy5zVp5CpJgflNis7Erj5YQj7
         87EyaQ4KvdpHHQ54VvD8UfTfEWKRMdP70v0R+gMtpWTPjd1h5BG0HgWhQ0bOsJqckiaj
         H5Z/ZCgDbpdvHiccaivaXwJa9iG9fpuugjr8j+G0xKlNVLtEbcAov4cOhRpz3/LINVHr
         sPXfdsujqyQoqIBpTynkS+MAnrxsX+Zfl4Ju0/7N+bGtl8+PziOe2iPod+HBpdGI+m1d
         Xsuw==
X-Gm-Message-State: APjAAAXhPu4iMFAmWTQdmyt0AGeXKotiOfk36IFM3JlIhz5g4W0G07e5
        ZrYebYDz4iwXvvzpSsp0g6Q=
X-Google-Smtp-Source: APXvYqzWCydMHykUpEys8y8YK57hVRHOWOHSqS0Ui0zvmzlWq1mTCq8BkWpBBEPrjneRePs+lPMvMg==
X-Received: by 2002:a17:902:59c9:: with SMTP id d9mr11602644plj.184.1576432289298;
        Sun, 15 Dec 2019 09:51:29 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id q6sm19291374pfl.140.2019.12.15.09.51.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 09:51:28 -0800 (PST)
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
Subject: [PATCH 01/13] mmc: sunxi-mmc: convert to devm_platform_ioremap_resource
Date:   Sun, 15 Dec 2019 17:51:08 +0000
Message-Id: <20191215175120.3290-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index d577a6b0ceae..f87d7967457f 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -1273,8 +1273,7 @@ static int sunxi_mmc_resource_request(struct sunxi_mmc_host *host,
 	if (ret)
 		return ret;
 
-	host->reg_base = devm_ioremap_resource(&pdev->dev,
-			      platform_get_resource(pdev, IORESOURCE_MEM, 0));
+	host->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->reg_base))
 		return PTR_ERR(host->reg_base);
 
-- 
2.17.1

