Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA9F1176E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 20:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfLIT6H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 14:58:07 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33066 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfLIT6G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 14:58:06 -0500
Received: by mail-pg1-f194.google.com with SMTP id 6so7648521pgk.0;
        Mon, 09 Dec 2019 11:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZPPKMUNJFnDD1fLVF2b5xNbZ5vTIG/P+LXFYR9smJaU=;
        b=lo+syYauvnRwQdhFley8gcsKGmFUQ3vpu+XWF0DUCxOGSBbY4/ZuN/YdV51AZ9SRKR
         O+wvxpqy1rrLkIisPjItC043mU1e8IkC+BZjbqmwoBpA0Nd2IJLGqSrXjUzeXEkxuGLw
         jO6gAaWEJ+yy+HjVbD1BCDcfFiMwWu4l9pDCPuymcpOJKHLprW0OBB0f2XBusSH6KjGX
         HPDMUNAxiY68aT3OQvffKpsfJ3TPHq4J5KnYIk7sHGVrLLNPjUH8C447mawTDYyZc15V
         FKN1Y9hgKsXq2kX2BLw3bNCXmJADchGyB3sj7lPFlWWamuVdKb6E0qAGM8acESx0qt4B
         Bj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZPPKMUNJFnDD1fLVF2b5xNbZ5vTIG/P+LXFYR9smJaU=;
        b=if1f8OjD4+cChJ9chc5NTBG8R21dh53QVroSvZSt5vBn6xWvQfM3AwZEjK0ukAVS3O
         J3fVOExHfBUhWzgCxH9ae+C9JtEh69wvhEb/lMK9QV639lABp9UrfWL6HxUXysqryrkl
         FaGWbng/MjBN4Gw+g73PXpIxiABvDJuK6IfNGHSwghTgf94ZbyDG0DI0racJ36dF6n20
         WIuOweCUk994VSNLXjK15IikTjokFahPPNvsJHXo+3g1GqFjhmwq+hqo66idiGCP7NuY
         fCYX0poEAtcJbu02l6K1xfMyZUsqw1yR4IoSrWZtw8p/Tf5Yh2Bu5GSqbPTVTr6P60H8
         5GyQ==
X-Gm-Message-State: APjAAAUFMvwU5Fol2I6A7IIUM1uN3dO0X2IxwDRsLPo8njlvNNpyidk2
        3PYBXAyiLf/Qzjxn60ruZHQ=
X-Google-Smtp-Source: APXvYqzVk8FZGIeKpbC0J5xuSpVLKietZZTCSKq+SBUzJ343WU+e8TIgncCtl7MNZ6LNoRCMyAJIQw==
X-Received: by 2002:a65:58c7:: with SMTP id e7mr19794009pgu.390.1575921486181;
        Mon, 09 Dec 2019 11:58:06 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id a10sm364726pgm.81.2019.12.09.11.58.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 11:58:05 -0800 (PST)
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
Subject: [PATCH 04/17] clk: mediatek: convert to devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 19:57:36 +0000
Message-Id: <20191209195749.868-4-tiny.windzz@gmail.com>
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
 drivers/clk/mediatek/clk-mt2701.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index 695be0f77427..a6aea6646118 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -668,9 +668,8 @@ static int mtk_topckgen_init(struct platform_device *pdev)
 	struct clk_onecell_data *clk_data;
 	void __iomem *base;
 	struct device_node *node = pdev->dev.of_node;
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
@@ -889,9 +888,8 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 	void __iomem *base;
 	int r;
 	struct device_node *node = pdev->dev.of_node;
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.17.1

