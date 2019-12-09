Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5E21176CB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 20:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfLIT6j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 14:58:39 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:43041 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727210AbfLIT62 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 14:58:28 -0500
Received: by mail-pj1-f68.google.com with SMTP id g4so6327423pjs.10;
        Mon, 09 Dec 2019 11:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UAdSgK+fA9O9lrhwBZTqgcNqv06lLo3k3bNN7t0UXYE=;
        b=Mwbxp0czb6jYm+pO8RpQXolWKF3fYchQpf977sKp3QQe0/1Xoll3kTO0oeuKkJMEQM
         9luwwdLQdELK86X2RgmMzwDI3ftyzzFTMAnoZLUzxtOMgBq0i+78V6/Tmj6xkhHDOuLB
         gaxDsmEPNX0tLNVGXjCUXdAdcj7yqzFHFSGKIpsw/bulIANe5HNzHJCPluplGWA/kl4Y
         A2FjJ8cpS0CkZzDyGKTaPgKok111l8khZ5BfREE/kyK1a+/ahan3g8fcWi6dVlyPYjaF
         P10gSquZqtb+CxoTfgmaoF8/4ELsnC6MxZ16heLocA/JMCQysQxIi0fgrCn7UKsFOXvM
         smfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UAdSgK+fA9O9lrhwBZTqgcNqv06lLo3k3bNN7t0UXYE=;
        b=hJw4VtgbViUr3/WWHbHv2k5aAx8ajRSREkOBQUTEUmUuYp+JizNy0e3UaaivoW9eoZ
         o7ORS9nQcQ1qXa58mA70m5f4WN5MfHLGN4P9oJAnql36pxiNb1eGX05TXbtpYq4pFEk7
         RN43AOYViJUJVbH+iq+T+sVxnzM8qsZjrEGd8Jhqx6nlnWPPlSVUvjd7hcOV2aSVz3dZ
         paqqpY2L4l39SGSL2gYgfxolclSDgzFcprCIFyNIdrnCASKvX8uTGcfPg4lWnE6M0p4H
         oMbsp3ye8ixFX15eadZDuS/tRIZYOivsy2DknkeC6vk9BySVpvRNVZI6izZxQOfdw78k
         Gk+A==
X-Gm-Message-State: APjAAAW6fGmqZ40Hv9BpH7vH0AuvG0ZDUCkxFN/g6iN3rRazn4yZpMKY
        rno9Kt+sPivOrd4ThyP/hW8=
X-Google-Smtp-Source: APXvYqyseXSQX0ezUzN6Yi60A6N87H983r9c3N5Vir6VF3q9LGo5GM8Zzd8pYnVRLd5PmOxkjr62+w==
X-Received: by 2002:a17:902:b609:: with SMTP id b9mr30695044pls.70.1575921508180;
        Mon, 09 Dec 2019 11:58:28 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id r20sm358961pgu.89.2019.12.09.11.58.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 11:58:27 -0800 (PST)
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
Subject: [PATCH 16/17] clk: actions: convert to devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 19:57:48 +0000
Message-Id: <20191209195749.868-16-tiny.windzz@gmail.com>
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
 drivers/clk/actions/owl-common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/actions/owl-common.c b/drivers/clk/actions/owl-common.c
index 4de97cc7cb54..9e98e8a92ad7 100644
--- a/drivers/clk/actions/owl-common.c
+++ b/drivers/clk/actions/owl-common.c
@@ -43,10 +43,8 @@ int owl_clk_regmap_init(struct platform_device *pdev,
 {
 	void __iomem *base;
 	struct regmap *regmap;
-	struct resource *res;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.17.1

