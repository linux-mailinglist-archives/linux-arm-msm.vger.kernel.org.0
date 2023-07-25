Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5EE76052C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 04:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjGYCWe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 22:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGYCWc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 22:22:32 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 402D0CD
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 19:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=sc2Tu5geYKZO+SZD2l
        C6G0ggiQHdezHocGO0JNy3wP0=; b=Fg9Qk6UZUzlFX8AKMjrWcju519hOFqyPJ9
        3ADnWES0Bals0qPXRaZZ1WCTEVfim7ZzbzT6gPFDHInDxAkLQ7GGZvFdBK9/OSoQ
        +zZrADPb6q/4iH2Kn85pelW+z1wUY9d24XLPlsn9PFxsoVaVK6US5DfChS0qQ1uu
        7qYdYjoK8=
Received: from localhost.localdomain (unknown [202.112.113.212])
        by zwqz-smtp-mta-g5-4 (Coremail) with SMTP id _____wDXBofAMb9kuyPcBA--.16655S4;
        Tue, 25 Jul 2023 10:22:01 +0800 (CST)
From:   Yuanjun Gong <ruc_gongyuanjun@163.com>
To:     quic_bjorande@quicinc.com
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, ruc_gongyuanjun@163.com
Subject: [PATCH v2 1/1] soc: qcom: use devm_clk_get_enabled() in gsbi_probe()
Date:   Tue, 25 Jul 2023 10:21:51 +0800
Message-Id: <20230725022151.36110-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230720184354.GB2667611@hu-bjorande-lv.qualcomm.com>
References: <20230720184354.GB2667611@hu-bjorande-lv.qualcomm.com>
X-CM-TRANSID: _____wDXBofAMb9kuyPcBA--.16655S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4UXFy5ur15ZrWfKw1xXwb_yoW8Xr18pa
        s7AF90kw48XrW0kayDJr48ZF1YyF4xta42q3s3C3ykZa45Zr4ktFyvqFy0vFs5XFZ5AF4r
        JF42qFs5A3Zru3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRNeOdUUUUU=
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbBiA+35VaEF6Hu4gABs8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

in gsbi_probe(), the return value of function clk_prepare_enable()
should be checked, since it may fail. using devm_clk_get_enabled()
instead of devm_clk_get() and clk_prepare_enable() can avoid this
problem.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/soc/qcom/qcom_gsbi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/qcom/qcom_gsbi.c b/drivers/soc/qcom/qcom_gsbi.c
index f1742e5bddb9..aaa50c1856b1 100644
--- a/drivers/soc/qcom/qcom_gsbi.c
+++ b/drivers/soc/qcom/qcom_gsbi.c
@@ -178,12 +178,10 @@ static int gsbi_probe(struct platform_device *pdev)
 
 	dev_info(&pdev->dev, "GSBI port protocol: %d crci: %d\n",
 		 gsbi->mode, gsbi->crci);
-	gsbi->hclk = devm_clk_get(&pdev->dev, "iface");
+	gsbi->hclk = devm_clk_get_enabled(&pdev->dev, "iface");
 	if (IS_ERR(gsbi->hclk))
 		return PTR_ERR(gsbi->hclk);
 
-	clk_prepare_enable(gsbi->hclk);
-
 	writel_relaxed((gsbi->mode << GSBI_PROTOCOL_SHIFT) | gsbi->crci,
 				base + GSBI_CTRL_REG);
 
@@ -211,10 +209,7 @@ static int gsbi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gsbi);
 
-	ret = of_platform_populate(node, NULL, NULL, &pdev->dev);
-	if (ret)
-		clk_disable_unprepare(gsbi->hclk);
-	return ret;
+	return of_platform_populate(node, NULL, NULL, &pdev->dev);
 }
 
 static int gsbi_remove(struct platform_device *pdev)
-- 
2.17.1

