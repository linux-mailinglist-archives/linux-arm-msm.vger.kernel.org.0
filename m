Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4066A1176B3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 20:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbfLIT60 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 14:58:26 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41015 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbfLIT6X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 14:58:23 -0500
Received: by mail-pl1-f194.google.com with SMTP id bd4so6229054plb.8;
        Mon, 09 Dec 2019 11:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZyE91jsZAP5JpR1vW4Julj8lDuf0La64PECRRoFBxZo=;
        b=CCfDbZXmu13SPymCWITnSTOML5WPbRVrTGApg5UmfCZHcEOPETnSQVCveR7/W+o2a+
         qor7hZSTQQfKDL5by514ripTgEWP+meMNrMmWqzP3x4a1QCzu3EgAzlp7Swb8ku2Q5+Z
         p1oUekJQCKB5DyCWusZL5/bPYoCwXe6bBmftn1xyOqu+teC0ds7dqG4oGrAcCam8PYHW
         hoY01PI6z9XPnOdWjg7dC7pGm2h6/d/kLhS4ADtwI0ORNpYzQnkLeVLrbNrB+McL5VF6
         QR8+XurF8EvCE6davNfcy+LEmjNUkvmXB3DzElXAKXWk6azefe7qPAWGnQG+mo5gtk3A
         uMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZyE91jsZAP5JpR1vW4Julj8lDuf0La64PECRRoFBxZo=;
        b=aisqTEZELQtbV5PdHE/rfG+VLQ8i8dmQQjgRCSUM2i885tAWL43t8x8a/6eXB+Q+JR
         G01znXkFVpYZxFjFvVj27gU2WnLdHTEYm/NZB03KPRBXl3IMj99PUOP7f0mItqWfBjWM
         QmhB1Qlde/fgKdcc+xCocQidb0wt6YW/Lw2EPnbnc7/09+zsEQfse7TlHeHhkI9QFIJr
         3FzLmrcpxR9Sr2STraMR76kAK4qwj/MmJ/NXdWm9gCtdR/rYf6ZFN83Ne4swR6Hgw0YS
         Nnw9BLUI5mihxyep1/LfzxWprGsnlfQk2FyNFUghR3YaHOxXEfE3rnARPlLzEG/5Gvld
         bxQw==
X-Gm-Message-State: APjAAAW60oKYxglNvW4MB0jPTlqf8MmkYGkV13rSLUPtuuyYwvOmUloi
        4lh+zmeN76tJrNN/0+bbxiA=
X-Google-Smtp-Source: APXvYqzVde8W7TVt0r7e2n3/0zTHRFhCsTrszUtbv0mgbzWPoD9QO1rfKS+Ar6eiXvKpF0LKb2LT5w==
X-Received: by 2002:a17:90a:634a:: with SMTP id v10mr923372pjs.4.1575921502812;
        Mon, 09 Dec 2019 11:58:22 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id h16sm292614pfn.85.2019.12.09.11.58.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 11:58:22 -0800 (PST)
From:   Yangtao Li <tiny.windzz@gmail.com>
To:     afaerber@suse.de, manivannan.sadhasivam@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        Eugeniy.Paltsev@synopsys.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, agross@kernel.org, s.nawrocki@samsung.com,
        tomasz.figa@gmail.com, cw00.choi@samsung.com, kgene@kernel.org,
        krzk@kernel.org, palmer@sifive.com, paul.walmsley@sifive.com,
        dinguyen@kernel.org, mripard@kernel.org, wens@csie.org,
        emilio@elopez.com.ar, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        matthias.bgg@gmail.com, rfontana@redhat.com,
        gregkh@linuxfoundation.org, t-kristo@ti.com, john@phrozen.org,
        tglx@linutronix.de, allison@lohutok.net,
        kstewart@linuxfoundation.org, swinslow@gmail.com,
        aisheng.dong@nxp.com, robh@kernel.org, daniel.baluta@nxp.com,
        weiyongjun1@huawei.com, wangyan.wang@mediatek.com,
        chunhui.dai@mediatek.com, miquel.raynal@bootlin.com,
        heiko@sntech.de, jcmvbkbc@gmail.com, nsekhar@ti.com,
        geert+renesas@glider.be
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 13/17] clk: gemini: convert to devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 19:57:45 +0000
Message-Id: <20191209195749.868-13-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/clk/clk-gemini.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-gemini.c b/drivers/clk/clk-gemini.c
index b51069e794ff..0184ff9bd206 100644
--- a/drivers/clk/clk-gemini.c
+++ b/drivers/clk/clk-gemini.c
@@ -276,7 +276,6 @@ static int gemini_clk_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	unsigned int mult, div;
-	struct resource *res;
 	u32 val;
 	int ret;
 	int i;
@@ -286,8 +285,7 @@ static int gemini_clk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* Remap the system controller for the exclusive register */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.17.1

