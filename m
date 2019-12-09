Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 836F31176AC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 20:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfLIT6V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 14:58:21 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33082 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbfLIT6T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 14:58:19 -0500
Received: by mail-pg1-f193.google.com with SMTP id 6so7648816pgk.0;
        Mon, 09 Dec 2019 11:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SbJEFogy5XAFY4TYFLgBXitNAQgdKkyYMT58Qy+43jg=;
        b=XmA+olZeCpYR11cQzmQbfmvSmN+IsE5uP9rv7i1vzOAVv6sHuoqZB4DbaFo+TnEN6P
         ahp2GcHUxJXqGF/tK5PkLADRoVeuhewH39dnTizx+bjFZkJQIJ67B2i6c7LAASdyiY8J
         t7d/5vEb3E2E7isAub58n5W8bkd0MtGCPnMnAp2uhldQbbB6navMyR1iHAgrjKUZItA3
         fs610lOV5eUsTnczYIWv8AbQLoo1J3ll4yes4ACWDPLMSqNQwk5uWiBXaONxm30aUAqt
         RpL9Dyp77o5wk4KUD09lSJCO3D2Opi0JJKC4YZCnDQX70pNmIZT1hyA/NdV2kQuGmQX2
         sjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SbJEFogy5XAFY4TYFLgBXitNAQgdKkyYMT58Qy+43jg=;
        b=Ci5ALBKW17SVnL8Tv7WtBBDpEpTyJpvOwJhRhSXP/zJ8v5ymBuU0anlWiIWnINUhIo
         XJyAYINep9lYiBBLYUQym7kbmJ04Vb3BSf2eCdrjBIbNJlhRrGaFElnfjruGMBcU5oA7
         pPYqZmkn7oXTMThg4tyeWW01S197WuaUUmyLeH3dd0voTGJ4KIbgjAC5H6IW7cBpZvU7
         /pEoXDimrilyqKlXYnn5KrMXsN6OTDkvLY9ueHFkBcxsl4oARKGLqLJ9P53Rp3IK0pyp
         VWy9AWjuHNo49FpMxlTGvecVW86yhXN2eN5eucvJJ8DkS93O786IUlD+yNqfgxd2g9Us
         rSvw==
X-Gm-Message-State: APjAAAXlQgkWLAfd/Uce/seeHHpsMmIHYHj+S5By9k9uO5Oh88FeJ9Ku
        QhBkY00lSK3xEJ4hLMVqWBY=
X-Google-Smtp-Source: APXvYqztL0uynR1jfq6nvIVhCUpiCpIkwcvVJW0DmeVnGKgqbUuTQpHioHk3H4rrikSuYpAy2AXhKg==
X-Received: by 2002:a63:4503:: with SMTP id s3mr20541879pga.311.1575921498910;
        Mon, 09 Dec 2019 11:58:18 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id f18sm289935pfk.124.2019.12.09.11.58.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 11:58:18 -0800 (PST)
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
Subject: [PATCH 11/17] clk: milbeaut: convert to devm_platform_ioremap_resource
Date:   Mon,  9 Dec 2019 19:57:43 +0000
Message-Id: <20191209195749.868-11-tiny.windzz@gmail.com>
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
 drivers/clk/clk-milbeaut.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-milbeaut.c b/drivers/clk/clk-milbeaut.c
index 80b9d78493bc..05f09fbfb80a 100644
--- a/drivers/clk/clk-milbeaut.c
+++ b/drivers/clk/clk-milbeaut.c
@@ -560,14 +560,12 @@ static void m10v_reg_mux_pre(const struct m10v_clk_mux_factors *factors,
 static int m10v_clk_probe(struct platform_device *pdev)
 {
 	int id;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
 	const char *parent_name;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.17.1

