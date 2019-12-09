Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 889C3117699
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 20:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbfLIT6O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 14:58:14 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44488 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbfLIT6O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 14:58:14 -0500
Received: by mail-pl1-f195.google.com with SMTP id bh2so5107831plb.11;
        Mon, 09 Dec 2019 11:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u5SdTuHzF4zf1Wjn1flJ+qtgBZntgOO/VK2s/WcVYGU=;
        b=qrCUYV1V6P4WlHrNdcprEAx8IM1K02m67llRFrDmx5AbLcZr5zs8ipmgkb+Mf86WcE
         KoDWHWWiYzxdsPeY1WSn3XaibbsEMk6RiViK2Ug/v1kHIAm5kd7KWZ04VrGxjR5shB6H
         QwCdY0sNhsC4zuFBSUzJ9KnGnXwQv8RBPweKGsXkxh+f3mwY9l+yHkr/1HEG5u0/u0Z+
         UaTpTeJ1qcMfW4fObk12VUCtENtlyNImns3/j71VtEB69up4yoNuJDzO0cJrU8DEY6os
         kdITtE8N5y98P5f6jC1B7ShpWo70XyQoRDdHM7fdw42vAXf/BtJt/Ie9aN3O7KnoWKIJ
         hHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u5SdTuHzF4zf1Wjn1flJ+qtgBZntgOO/VK2s/WcVYGU=;
        b=ECFFU9omNrDUw4df9bmbWkskrgPjyzeZhoSz9qP2ROuTSCcGMZipPSIhAf3XX9ivhH
         Tjg8iaW9LYQyIE/TX6xk6d45UrxfHMLi+ukvocUyrHbgadcxAuV/ER7C4JM9RL2bnEW+
         Ccf/XUMESmqRymZDZWazauqzhHlR2wwg/6TX3D1OmcMP3gjMs/hF+rsogM4GwHZwdCBo
         wueokoaLvs/a/XZbl5Q6vYLtSo0T2KlVtJQwzd9/EpBWvu9GEDVntLq6nfFFI5wVeds3
         fjQ6P2mLMTCftNyNu6VSMFSxupFc29hfZx0Rrt9qf8dU2p0PAbxWuXEFhoOmUI5WHUQX
         SAKA==
X-Gm-Message-State: APjAAAVmp+GJh8w0tAjsVb3pX7ip4OhVvv9/Sg+C3Zkzx02ErDSqwTAj
        rnIhn+XbYJNRmc0VJJlR66s=
X-Google-Smtp-Source: APXvYqw8Afql676it0tHiWqNjCREZmqJaXGsHUnMLrZAq/Xt4r6ZN5z7oOBZ0rzgeg294DZY29zPYw==
X-Received: by 2002:a17:90a:f0d6:: with SMTP id fa22mr877656pjb.136.1575921493516;
        Mon, 09 Dec 2019 11:58:13 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id d2sm175316pjo.32.2019.12.09.11.58.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 11:58:12 -0800 (PST)
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
Subject: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 19:57:40 +0000
Message-Id: <20191209195749.868-8-tiny.windzz@gmail.com>
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
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index c0aff7ca6374..10ae712447c6 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -164,7 +164,6 @@ static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
 	struct clk_hw_onecell_data *clk_data;
 	const struct imx8qxp_ss_lpcg *ss_lpcg;
 	const struct imx8qxp_lpcg_data *lpcg;
-	struct resource *res;
 	struct clk_hw **clks;
 	void __iomem *base;
 	int i;
@@ -173,10 +172,7 @@ static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
 	if (!ss_lpcg)
 		return -ENODEV;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-	base = devm_ioremap(dev, res->start, resource_size(res));
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (!base)
 		return -ENOMEM;
 
-- 
2.17.1

