Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 418451176A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 20:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfLIT6S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 14:58:18 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33378 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfLIT6R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 14:58:17 -0500
Received: by mail-pf1-f193.google.com with SMTP id y206so7776933pfb.0;
        Mon, 09 Dec 2019 11:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ps/yL6sIyA/HzDEFUdGrtX3BgHMKWprdRozhFXs72OQ=;
        b=TaNk4gU+Qf1rcbmjZAkQiW3/WHyVFXCi7zmDAdiZtdKbXURE12spMk6pgcjhAfd3Ro
         i0JM6AXHmKs4EjDYYp6GM5QNgAPGiJVGrzJNPp8G1ld+NZoMTP605aHNwFlMgRKgiL4w
         E6jWfIqvgrnzKW0hAr+vOBCG54aHqgBXe1H2UZhmiXkv4o0fK52AjpbkcvfVX789pO0r
         kTro2cUcvpnZmtEYPliBihUPzgqPCLYFyKLfeOBXrfVZFsBL0duPZDkOscsczOq48pKL
         Q1zNZ2uC/1chXyMS5dboUhYoAs6WHs3Tj3Wk2yK5HYKQk6r2qFEMrq7/UC3aLlsbf12a
         5tCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ps/yL6sIyA/HzDEFUdGrtX3BgHMKWprdRozhFXs72OQ=;
        b=ldp6USwTDLG+OmUqiLi4tS6bcabb6lGUGEs1Mk+ZrX/tHH9MfTqSCcSfOZnNq94sIh
         eK7NwL4f08ixwvYJqzutFGjSdyUswk5hnRvn3WChgyzYwRdhLwfnIR/9QwFpvLPhkLUM
         cXDPQPtLtGOWYaP0tevrikbVqyBaBPDzOTEqjoshgH//VpmKVHaM0TrA/l20C7gP7QtL
         09wHJ915EmXVRMbeZK9lUXxk6mAo85IHqIHgHt6JhE/sCcTVwuEl5hd314Dj28GSoI17
         2E4QvwZz5Xbac4HvOePxvDwmKUKrGImEzBnN/A01IXBDIDHmlWESnwXOx7wkFD1TjV9l
         RpVg==
X-Gm-Message-State: APjAAAXzTRlAmkxYo83NLptqNeth7USMG8ajmYB9AgNNYrRobVCicDZK
        9KPnag3Jl4AELWiifU/E5KY=
X-Google-Smtp-Source: APXvYqzfh0NCFt3LIk+KUA0hhxrykBenrX9LyOzFKnUPS1uqtGFUf/GaYK5SaID3cQhSSuXJEI4UIw==
X-Received: by 2002:a62:1c88:: with SMTP id c130mr31355900pfc.195.1575921497176;
        Mon, 09 Dec 2019 11:58:17 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id z64sm307501pfz.23.2019.12.09.11.58.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 11:58:16 -0800 (PST)
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
Subject: [PATCH 10/17] clk: axi-clkgen: convert to devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 19:57:42 +0000
Message-Id: <20191209195749.868-10-tiny.windzz@gmail.com>
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
 drivers/clk/clk-axi-clkgen.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index 96f351785b41..8d0c32e81e78 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -412,7 +412,6 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 	struct clk_init_data init;
 	const char *parent_names[2];
 	const char *clk_name;
-	struct resource *mem;
 	unsigned int i;
 	int ret;
 
@@ -427,8 +426,7 @@ static int axi_clkgen_probe(struct platform_device *pdev)
 	if (!axi_clkgen)
 		return -ENOMEM;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	axi_clkgen->base = devm_ioremap_resource(&pdev->dev, mem);
+	axi_clkgen->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(axi_clkgen->base))
 		return PTR_ERR(axi_clkgen->base);
 
-- 
2.17.1

