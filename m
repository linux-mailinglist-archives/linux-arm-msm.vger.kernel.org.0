Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 832111176BA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 20:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbfLIT60 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 14:58:26 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:46858 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbfLIT6Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 14:58:25 -0500
Received: by mail-pj1-f67.google.com with SMTP id z21so6316292pjq.13;
        Mon, 09 Dec 2019 11:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tZCUtzM2Kgd4l9GdZkI7BIJ7+D7+CtwfE4AQUqmqqC0=;
        b=APM6Ox4InSxhkeN7AP2rcFRdPKREu2KgwWxmbm4pxCyU3T2SXfh+CeUHCwvInIb6K3
         nO2kVyT2fGTOIQ583eegwqZluOgT399PuFKptVy7OVq14wKXwDnG1SSfd9lYmO38iF5W
         6rse9F3y7i5qWvjctfUoBvfTlrDq7kfF17HwrAymgXDQmknoJyNHbYiRAKNFDg6nqws2
         pFxgXEZ7pI1gjVqeg2l4kpILrdO02ISFHaD6LU3CTduBvQVWbsTsd3teX2b44S8lXQK3
         gSkjnu9wyEsFp7pKBZE9i3Dh6gt7I/iQHv0egAODcfbYZz0Gh9RerAZBV6JmI5AzKbu2
         s/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tZCUtzM2Kgd4l9GdZkI7BIJ7+D7+CtwfE4AQUqmqqC0=;
        b=KeU3DMTMdnSd4XXK317WtYvZ16PIlKprCTLYc8rfG/i5Ig3/TzqGfznhUz+gXhLrUv
         PoIvptQ+cVgoIRhWOsK33UMAAeF9uIJLj7QeUqcqaG6u9qQFH8uq5Ye9L78yA7iRjbGQ
         zRkkDdh81g9IlCpVdeu9uZK+upch9GK/AVgBjOE+qgXZ+Z+SqFVfOvLg1JfAXWuudc3+
         cMgK00XsfUV/NT0jhELpnOtupijHUEolPn3c2xTqeZv8lprwXLSmIYx2RRrs5LjsehpY
         ERHlT58kMOpr9TJGmlCBfdzPMU4fKHRvoqTZTvwy3uHUBoaxMbfBisLTnj9FsbyYH1V3
         PSeg==
X-Gm-Message-State: APjAAAW6RuZlUx05wedZqBNcQrJZlO+Y3dYzP+NFtSnav0j7eLcRWofs
        0isxRUE1p7+CmIplDPsH3uQ=
X-Google-Smtp-Source: APXvYqzuWE4XvNIl961SlGfMHFjXQnwxlLnSazYqYn06S6wZMDDdG11sZdEmHCrhUyFevRch1olcmA==
X-Received: by 2002:a17:902:9b86:: with SMTP id y6mr12047000plp.253.1575921504560;
        Mon, 09 Dec 2019 11:58:24 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id r66sm305249pfc.74.2019.12.09.11.58.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 11:58:24 -0800 (PST)
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
Subject: [PATCH 14/17] clk: axm5516: convert to devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 19:57:46 +0000
Message-Id: <20191209195749.868-14-tiny.windzz@gmail.com>
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
 drivers/clk/clk-axm5516.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-axm5516.c b/drivers/clk/clk-axm5516.c
index 07e80fe8c310..3ab02b62b645 100644
--- a/drivers/clk/clk-axm5516.c
+++ b/drivers/clk/clk-axm5516.c
@@ -541,14 +541,12 @@ MODULE_DEVICE_TABLE(of, axmclk_match_table);
 static int axmclk_probe(struct platform_device *pdev)
 {
 	void __iomem *base;
-	struct resource *res;
 	int i, ret;
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	size_t num_clks;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.17.1

