Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC7AD1176E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 20:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfLIT6F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 14:58:05 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35287 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfLIT6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 14:58:05 -0500
Received: by mail-pl1-f194.google.com with SMTP id s10so6245335plp.2;
        Mon, 09 Dec 2019 11:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kQqkd4Go/fezV95dyLC3ywKvO+7ydWbuuW1GTA8ixyg=;
        b=Msei64Fu/8t2NFRncpq95gV/RuQA61hBHdK4sNALHPvBxrm37uRxeQuOKpTGMzXvsw
         uaS96um2tvLut0uD+CSYGN5+X8ra/ZDSxdwDYkhnA/g/vodCP+d0vzVSZf2Kft6r9Q4K
         Km1ofWiqOmT/VTJwwh46segleeWqzwxEerzW0QkJEfmOaBkhJotS8KeDBuNTvg+m7srJ
         ZibXDnmHmQQRuco5c1F85EkFBldhrB53KxMafhrAA6kiHmiOb2Xp4zEYbdLVZumxbfDX
         lCfyrMRXXdJ1AFwM5hWanmfYoUVWuiV7hnFgpvj1S0n+t3Thei5fDLW2F6h/yYKg030R
         k6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kQqkd4Go/fezV95dyLC3ywKvO+7ydWbuuW1GTA8ixyg=;
        b=QGuBdwfg3NnV5JAf+yyeBN8dUAheONM26MCpxCx3i092p/0pa3JwJWQPBjvqdASYJI
         fR1LW1L0Xo1bUlSYNnyLxDdVnxjfQEWo+7mJfhzbh47Q2iIQGue8khGpxCVDJ1n96q1t
         kfMVWolMdE6bBrsVZ8FLyAijrGDc9/zROdG2nqLJNgEY4THyCkQHd379uVyEtCqnyiZ6
         HW6XqYWauypoN2o9JW0S+EVHtKFYzCNzVlCrphLkmit5hI7ZEueEHodBUZ5g6Eg48Exp
         JvOv4WUEdzMQbhUFOdNjQvtUrQDfHTvNCdc2mCQY1Mcrr1op1DS04Bp3P/9170nYJOsu
         zEaA==
X-Gm-Message-State: APjAAAWWRmMOPjxWpFlyToJMkU63T6tcn2hWDlxBnrYQDx8Q37zHExPp
        Cjy4mlE9+ocaZjFeGeo3dkI=
X-Google-Smtp-Source: APXvYqxPkM9S+2BDxVhR/pd+pjvcvaNCiP57InFYKfnb/zDnE5wvpd64NLJQLnXBF/zs7qKdbOoEVw==
X-Received: by 2002:a17:90a:2521:: with SMTP id j30mr874681pje.98.1575921484132;
        Mon, 09 Dec 2019 11:58:04 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id 8sm306168pfu.21.2019.12.09.11.58.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 11:58:03 -0800 (PST)
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
Subject: [PATCH 03/17] clk: samsung: convert to devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 19:57:35 +0000
Message-Id: <20191209195749.868-3-tiny.windzz@gmail.com>
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
 drivers/clk/samsung/clk-exynos-audss.c   | 4 +---
 drivers/clk/samsung/clk-exynos4412-isp.c | 4 +---
 drivers/clk/samsung/clk-exynos5433.c     | 4 +---
 drivers/clk/samsung/clk-s5pv210-audss.c  | 4 +---
 4 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index 42b5d32c6cc7..9cc127a162ad 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -129,7 +129,6 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 	struct clk *pll_ref, *pll_in, *cdclk, *sclk_audio, *sclk_pcm_in;
 	const struct exynos_audss_clk_drvdata *variant;
 	struct clk_hw **clk_table;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	int i, ret = 0;
 
@@ -137,8 +136,7 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 	if (!variant)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg_base = devm_ioremap_resource(dev, res);
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base))
 		return PTR_ERR(reg_base);
 
diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
index 4b9e73608c21..20f5129f7212 100644
--- a/drivers/clk/samsung/clk-exynos4412-isp.c
+++ b/drivers/clk/samsung/clk-exynos4412-isp.c
@@ -110,11 +110,9 @@ static int __init exynos4x12_isp_clk_probe(struct platform_device *pdev)
 	struct samsung_clk_provider *ctx;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct resource *res;
 	void __iomem *reg_base;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg_base = devm_ioremap_resource(dev, res);
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base)) {
 		dev_err(dev, "failed to map registers\n");
 		return PTR_ERR(reg_base);
diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 4b1aa9382ad2..b0d48cddfd6e 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -5557,7 +5557,6 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
 	struct exynos5433_cmu_data *data;
 	struct samsung_clk_provider *ctx;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	void __iomem *reg_base;
 	int i;
 
@@ -5570,8 +5569,7 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	ctx = &data->ctx;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg_base = devm_ioremap_resource(dev, res);
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base))
 		return PTR_ERR(reg_base);
 
diff --git a/drivers/clk/samsung/clk-s5pv210-audss.c b/drivers/clk/samsung/clk-s5pv210-audss.c
index 14985ebd043b..503bd8a10d8f 100644
--- a/drivers/clk/samsung/clk-s5pv210-audss.c
+++ b/drivers/clk/samsung/clk-s5pv210-audss.c
@@ -63,15 +63,13 @@ static struct syscore_ops s5pv210_audss_clk_syscore_ops = {
 static int s5pv210_audss_clk_probe(struct platform_device *pdev)
 {
 	int i, ret = 0;
-	struct resource *res;
 	const char *mout_audss_p[2];
 	const char *mout_i2s_p[3];
 	const char *hclk_p;
 	struct clk_hw **clk_table;
 	struct clk *hclk, *pll_ref, *pll_in, *cdclk, *sclk_audio;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg_base = devm_ioremap_resource(&pdev->dev, res);
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base)) {
 		dev_err(&pdev->dev, "failed to map audss registers\n");
 		return PTR_ERR(reg_base);
-- 
2.17.1

