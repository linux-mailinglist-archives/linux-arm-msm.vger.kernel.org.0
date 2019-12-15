Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83E2011FA10
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 18:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbfLORvj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 12:51:39 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33334 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbfLORvi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 12:51:38 -0500
Received: by mail-pl1-f193.google.com with SMTP id c13so3468410pls.0;
        Sun, 15 Dec 2019 09:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WeP5mW5bX8FRuVYI+VlxgSACH3PZvZTDMYz0Hzl+V2E=;
        b=ID1AOj+6c8Ogf0Hu5RDxzXewB10SEfdGb1Sv5+d7Jnh10f5Ti9G6Mnp7WYJ+JvHBMw
         Shs1Qw8ygC1pEBmPk2Y8Kbi4K/5tjj43ezK5rIxZX07WPLIL6y6q4Gm0r6uStqVcyqfh
         EvHvWDrU8OJVtLLoE5W9knOzkIQ0UYH+H6jiiy0H46OeG3zx2tI8brAeIsg7+8bxPk5N
         +T14M+YvMTh+XtVxMyz3VyipChwVCEny8TyCnAQy3/4M2i9Bj4T2ne21MJkeuzf/TtaL
         eeCY+E01S18KAYaAHH5Gi8UBpIY98wZIPbBCiydcMqnPLyS9sewsj2AahiOmtUINUxLi
         MF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WeP5mW5bX8FRuVYI+VlxgSACH3PZvZTDMYz0Hzl+V2E=;
        b=KxB9n5zLcZ3PqLHVXYawmVI001jZb5GrtYcWOHl32xb5M/Ud3DJskjuXmaRsVu519/
         qGc7vA21rCgndS5ven96MPBZAn6VR4CZoqNnTGYMExs+WzIxcRO2QyFE21x2C+bKS0i5
         32c7n4dnYksYKzujrpbmdVl2/1sP9iVK6CLTqcCgKeM0hldc8MitUkvCLGto+cqZB83J
         fvY+v9aQQBHdwUW+0F7Xqy0xC3I1v2oIlaiGIItEybkll4Lxd6zOXd6MqsdVK/wDhbLk
         xPIn6YJBDcOQaUZ1eBRhXLT6QTmWLNElNmYeNLkYQPx5uA1lF5E2T3kvcDfVOfUEtB/H
         4OCw==
X-Gm-Message-State: APjAAAWbqwYPsI6JmEwKV/0M+uPBiIR3Df3ZbliaUWvGvvXVkDAT+L20
        IoQ2zd+0igi0su0jbClO2Sk=
X-Google-Smtp-Source: APXvYqwb6x+cb5JVAvjSiuBW/F0DFFAQ4Dqz9YAQgQrWJMBNZDKKdDo/7lm7jAMWqNB+6idpMU7dww==
X-Received: by 2002:a17:902:9682:: with SMTP id n2mr11535190plp.336.1576432297060;
        Sun, 15 Dec 2019 09:51:37 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id m22sm12304608pgn.8.2019.12.15.09.51.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 09:51:36 -0800 (PST)
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
Subject: [PATCH 05/13] mmc: sdhci-spear: convert to devm_platform_ioremap_resource
Date:   Sun, 15 Dec 2019 17:51:12 +0000
Message-Id: <20191215175120.3290-5-tiny.windzz@gmail.com>
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
 drivers/mmc/host/sdhci-spear.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-spear.c b/drivers/mmc/host/sdhci-spear.c
index 916b5b09c3d1..37f1c41c8a9c 100644
--- a/drivers/mmc/host/sdhci-spear.c
+++ b/drivers/mmc/host/sdhci-spear.c
@@ -43,7 +43,6 @@ static const struct sdhci_ops sdhci_pltfm_ops = {
 static int sdhci_probe(struct platform_device *pdev)
 {
 	struct sdhci_host *host;
-	struct resource *iomem;
 	struct spear_sdhci *sdhci;
 	struct device *dev;
 	int ret;
@@ -56,8 +55,7 @@ static int sdhci_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	host->ioaddr = devm_ioremap_resource(&pdev->dev, iomem);
+	host->ioaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->ioaddr)) {
 		ret = PTR_ERR(host->ioaddr);
 		dev_dbg(&pdev->dev, "unable to map iomem: %d\n", ret);
-- 
2.17.1

