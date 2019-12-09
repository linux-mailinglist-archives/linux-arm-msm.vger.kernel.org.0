Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2130B1176C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 20:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbfLIT6b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 14:58:31 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34664 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbfLIT6a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 14:58:30 -0500
Received: by mail-pg1-f194.google.com with SMTP id r11so7650310pgf.1;
        Mon, 09 Dec 2019 11:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nmhGacrgUHbjwjf4YiCWKNLwcIuzYeR61NYEOZcH5G8=;
        b=SfvmNGEz3IjWYxuwoEcO8shmSAU5du/S5aNBiDTMJpQT4XtBOnZJ1GE9W+9RvTI2WQ
         npVlDvtTnb5lU/I7kOcET6VHlpfHuyWfwymr+y2lNQnTHwHxhUbCg3I1Iah3F8KWZkMT
         nHhosGYrJRcL/sop1M5rwot8mpuORj98u5DQjFfdRlqj5xMjO/Q7SWyo6tczFUPj//sr
         hxSihWIUndCjgzbcLAPbT0zOw535wvVzN96o4I6caBStgrOFl8zsFinRAosnVOZcp3t9
         GsT/9LI6bK8nP9LOg2jpk/E7f8dIW+oBIzARXjWFoRKe/VHW8/5G+eGQq7PrH/bI9WCe
         dhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nmhGacrgUHbjwjf4YiCWKNLwcIuzYeR61NYEOZcH5G8=;
        b=JIbu09m8NogQmaib7Xz/rrJzVrO81iBoILQmK3eswbvg7Zfl4ygETC1nHSZ32iUs3d
         KI8PcwTO8RZmi1h3CPjK7lkfeJ+rmfpBtwz/AfUN0bTiWcxgV5399SL2bNymINl6DjJt
         i8OUMPP0H83nJPVh4qIQ2fGNL7zVNnBTys1tTLbUKdTcZqE/sGDXv8frgSyZJdS6C8j+
         J3ZdAjS8nMxRkq37vf/1ykXqn9c7gHc64CKEBtyJX3Ty9fpuF+xq5G7Y7HSAPfPU6f/2
         k0dfdKp2EyC6MDCP4JreC48C4xqxIKLKLH1DImTfFiH+IJwbSyvqO6EV8AD9+Su6xtkZ
         HLVA==
X-Gm-Message-State: APjAAAXwEClr4/VubBHai5Wm1EfB38JCjBKoM6gPMIOlPc2BqwCGO+SK
        icsFboADUBEgIkC3EaghgTg=
X-Google-Smtp-Source: APXvYqzDVcsF4Khq7eE4x0IkNwfLh0WRPmgIHhrLa7Br8O4RSImpU5KOUcjmHxIETkRz+zep0mS+Ww==
X-Received: by 2002:a62:1c4:: with SMTP id 187mr17758703pfb.184.1575921510177;
        Mon, 09 Dec 2019 11:58:30 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id s18sm316906pfm.27.2019.12.09.11.58.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 11:58:29 -0800 (PST)
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
Subject: [PATCH 17/17] ARC: clk: convert to devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 19:57:49 +0000
Message-Id: <20191209195749.868-17-tiny.windzz@gmail.com>
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
 drivers/clk/clk-hsdk-pll.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-hsdk-pll.c b/drivers/clk/clk-hsdk-pll.c
index 97d1e8c35b71..155f2af65361 100644
--- a/drivers/clk/clk-hsdk-pll.c
+++ b/drivers/clk/clk-hsdk-pll.c
@@ -299,7 +299,6 @@ static const struct clk_ops hsdk_pll_ops = {
 static int hsdk_pll_clk_probe(struct platform_device *pdev)
 {
 	int ret;
-	struct resource *mem;
 	const char *parent_name;
 	unsigned int num_parents;
 	struct hsdk_pll_clk *pll_clk;
@@ -310,8 +309,7 @@ static int hsdk_pll_clk_probe(struct platform_device *pdev)
 	if (!pll_clk)
 		return -ENOMEM;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pll_clk->regs = devm_ioremap_resource(dev, mem);
+	pll_clk->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pll_clk->regs))
 		return PTR_ERR(pll_clk->regs);
 
-- 
2.17.1

