Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE911176DD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 20:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbfLIT6J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 14:58:09 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:44950 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbfLIT6I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 14:58:08 -0500
Received: by mail-pj1-f66.google.com with SMTP id w5so6322507pjh.11;
        Mon, 09 Dec 2019 11:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Zwo7j6FYcAU6xQvqiD8wcHYFfx6vmNTXAdLudkME2oA=;
        b=dXCKKHSq708g3bzEhk2NUfFJHmr/4ACNCLQxSjH9idI484enyK0RrSW9L5Ds/zIZw5
         XnGw1cV4dNkh6CrKWdB7D2R1zl+bb+LS1xDRR5bnqBJQe/fjPZm1sfC+BP62o8veYSHc
         um27YLCPDcjfF5466u7ZfOGFvrnzbl8fz66Z2D20sxIIbAR24JKIyeAVUHb8YGSbMO2s
         OCN91B5wp1lMD/fXw0uwRK8mjgbYhr4GIZV+Lk1nKqA0xXNsTTVYuOny/+GWVWimznuT
         SOIt2/zzNkhE/HR2n4NJgoqEuNlShN8idm740MW2DumuUl2zE3UvgIUpG9nVY/NGaykt
         hQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Zwo7j6FYcAU6xQvqiD8wcHYFfx6vmNTXAdLudkME2oA=;
        b=hlfttRcKI+A66sEAnqJws9Kg7KD1dVOJk+AhElrXkbunRd/DTlp0Xs/KvzH2NYJst9
         F0Sgryh6FR91vWTxeGncxKuATzsPGo4c3fIL/hnQGN4kxhVglDwmbHXFlTk4nJklo0JZ
         S3ONQJLY5gZMPUUMCxn0km95gS7pTf1cm6nImZai8FlSxp2/QZSUJPVuy4rfhs0gVLTb
         w500h+rP8DAXFIsxrosq2zzs3Z9kFnULtO11gXwF0CkiPg6BnXFpZ+hGDCF2dxDc6EWi
         lK76jZtu028zokPq/2pEviKiRml2lXYe5J4Of/cLa0Bb0azQOGofE3BihwKy16dPDDO4
         dYGQ==
X-Gm-Message-State: APjAAAWFdRoLiHYpyMZ69uGQA6D75Dyo6Uy+c3cWG08QOdDkYrHcbW8j
        w3IodIHgzHd7T74ebEDS/h8=
X-Google-Smtp-Source: APXvYqwzD81o1+M3dh7boPIyvW4RNlfCGnRpjiWPXJO6NlSMqtQfizgHyNI5b9higsw7zuO17ICQAg==
X-Received: by 2002:a17:90a:ba98:: with SMTP id t24mr933386pjr.12.1575921488045;
        Mon, 09 Dec 2019 11:58:08 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id 39sm203686pjo.7.2019.12.09.11.58.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 11:58:07 -0800 (PST)
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
Subject: [PATCH 05/17] clk: hisilicon: convert to devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 19:57:37 +0000
Message-Id: <20191209195749.868-5-tiny.windzz@gmail.com>
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
 drivers/clk/hisilicon/clk-hi3660-stub.c | 6 +-----
 drivers/clk/hisilicon/clk.c             | 7 +------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3660-stub.c b/drivers/clk/hisilicon/clk-hi3660-stub.c
index 3a653d54bee0..7e44d6e2a307 100644
--- a/drivers/clk/hisilicon/clk-hi3660-stub.c
+++ b/drivers/clk/hisilicon/clk-hi3660-stub.c
@@ -124,7 +124,6 @@ static struct clk_hw *hi3660_stub_clk_hw_get(struct of_phandle_args *clkspec,
 static int hi3660_stub_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	unsigned int i;
 	int ret;
 
@@ -139,10 +138,7 @@ static int hi3660_stub_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(stub_clk_chan.mbox))
 		return PTR_ERR(stub_clk_chan.mbox);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-	freq_reg = devm_ioremap(dev, res->start, resource_size(res));
+	freq_reg = devm_platform_ioremap_resource(pdev, 0);
 	if (!freq_reg)
 		return -ENOMEM;
 
diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index 54d9fdc93599..8c521495d9e5 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -27,18 +27,13 @@ struct hisi_clock_data *hisi_clk_alloc(struct platform_device *pdev,
 						int nr_clks)
 {
 	struct hisi_clock_data *clk_data;
-	struct resource *res;
 	struct clk **clk_table;
 
 	clk_data = devm_kmalloc(&pdev->dev, sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
 		return NULL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return NULL;
-	clk_data->base = devm_ioremap(&pdev->dev,
-				res->start, resource_size(res));
+	clk_data->base = devm_platform_ioremap_resource(pdev, 0);
 	if (!clk_data->base)
 		return NULL;
 
-- 
2.17.1

