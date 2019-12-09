Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6A2911767B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 20:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfLIT6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 14:58:03 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46660 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfLIT6C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 14:58:02 -0500
Received: by mail-pl1-f194.google.com with SMTP id k20so6219315pll.13;
        Mon, 09 Dec 2019 11:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oFak+0J7ythKfPAlMM6BlHsXOZpfWhjFtYhFdd8JGAU=;
        b=fTOm1kOhKLvzJHC0AAqUb2/p0TvDJgwfmvnY3lHowW7c+48yFQB6XDVPnKvWLsFxoJ
         8+qJLxmjP0fWQPJFjWjrzeKdmr7HCcvUPvupXLrSiUy+v9Xm/2K0P4PcQJxly8qcGPCT
         BZANJxsD9diLPPIp8TWbnOz5lnrhf195tMiXAMYWOceS/lA0pRyYJPDmU/jaMZth8IfN
         JqAS64c3uyTNUvVI4njUfbds4hdw1XR9X31FhizZGxy80cDDrI5aZ8b0q895feKvjQ+B
         Ic5kPESbJnMbBdfonlBK5KqGSgrPk5e5jgkhxoFwB5eQGA5OUimVoap56TL4+5rhG0lU
         jDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oFak+0J7ythKfPAlMM6BlHsXOZpfWhjFtYhFdd8JGAU=;
        b=ajBnmhOriBI25w9Pq7Ew5TWK7xccyDQuzLgiEKDXW8a32Uctq1vcrC1HKYRHF0ihl4
         AqcSLY6jQAPvaCN1ufg1j+dllghuNHumhpUKGb3DsfFcJ/iUTafZEVpjtOEeGW7nAwf+
         YfEWhpiypQeqaSgCRnF/6mywrulYuMedowfYpH2nkzuTacPVv6sB+/g9xCZYXTaSrEqA
         JTBF6W5sFf6sUpHDEBi6fUDck2Ci7lvXjOA4cL0pTrBdYiKGihZ0N0E0vCi/h5UTm99w
         Zs1JO35iqGx98Y09LKgRsL4ynhlOp6CSKhSO0sdujwJtu5Uz+21+hrC4vhP1d9m99k43
         pEqw==
X-Gm-Message-State: APjAAAXYSanZ6J3ZrLFAWZxr4r2YMvWfDj7PFvlroHQ2B6L2xIQnm4A/
        Z7IdRMwPAUTeCAYKPtU48eY=
X-Google-Smtp-Source: APXvYqw8p9qnWyQgULg4OsrlEke+jE9I3hGNN9t0otHZ2EhBJwliK/uGLJQ+ngat7SZpVpL4h+AdQg==
X-Received: by 2002:a17:90a:6484:: with SMTP id h4mr863042pjj.84.1575921482018;
        Mon, 09 Dec 2019 11:58:02 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id k12sm358411pgm.65.2019.12.09.11.58.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 11:58:01 -0800 (PST)
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
Subject: [PATCH 02/17] clk: qcom: convert to devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 19:57:34 +0000
Message-Id: <20191209195749.868-2-tiny.windzz@gmail.com>
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
 drivers/clk/qcom/a53-pll.c  | 4 +---
 drivers/clk/qcom/common.c   | 8 ++------
 drivers/clk/qcom/hfpll.c    | 4 +---
 drivers/clk/qcom/kpss-xcc.c | 4 +---
 4 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index 45cfc57bff92..42d14b6861d4 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -38,7 +38,6 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
-	struct resource *res;
 	struct clk_pll *pll;
 	void __iomem *base;
 	struct clk_init_data init = { };
@@ -48,8 +47,7 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	if (!pll)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 60d2a78d1395..0932e019dd12 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -73,11 +73,9 @@ struct regmap *
 qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
 {
 	void __iomem *base;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return ERR_CAST(base);
 
@@ -313,11 +311,9 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 			   const struct qcom_cc_desc *desc)
 {
 	struct regmap *regmap;
-	struct resource *res;
 	void __iomem *base;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, index);
 	if (IS_ERR(base))
 		return -ENOMEM;
 
diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
index a6de7101430c..de7df848dcfb 100644
--- a/drivers/clk/qcom/hfpll.c
+++ b/drivers/clk/qcom/hfpll.c
@@ -47,7 +47,6 @@ static const struct regmap_config hfpll_regmap_config = {
 
 static int qcom_hfpll_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
 	struct regmap *regmap;
@@ -62,8 +61,7 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 	if (!h)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
diff --git a/drivers/clk/qcom/kpss-xcc.c b/drivers/clk/qcom/kpss-xcc.c
index 8590b5edd19d..4fec1f9142b8 100644
--- a/drivers/clk/qcom/kpss-xcc.c
+++ b/drivers/clk/qcom/kpss-xcc.c
@@ -33,7 +33,6 @@ static int kpss_xcc_driver_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *id;
 	struct clk *clk;
-	struct resource *res;
 	void __iomem *base;
 	const char *name;
 
@@ -41,8 +40,7 @@ static int kpss_xcc_driver_probe(struct platform_device *pdev)
 	if (!id)
 		return -ENODEV;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.17.1

