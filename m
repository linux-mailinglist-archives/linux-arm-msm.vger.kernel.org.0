Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE5C75B0DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 16:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbjGTOJD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 10:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbjGTOJC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 10:09:02 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7D13E2122
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 07:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=OR3n9OfZryAfzMm3Lu
        dflsMkLzI8PGHFf8oaq0NEReE=; b=dpZCEHKJxrAFNOgZjLoOrSQDWqNvVKzuim
        OnknZfLufZJyA1YUPvCrxCoCAHLlMBn4oebPIRIh1CuRQ3hm/nsqqGRS8v8qbFW5
        oHYFxqNj4tQVJYY14FNxkUgnLZ4ZgW+W7u1ADUxMEwl68I6edWEPtcoQg/Qg9gtZ
        wazPNKFm8=
Received: from localhost.localdomain (unknown [202.112.113.212])
        by zwqz-smtp-mta-g1-3 (Coremail) with SMTP id _____wCH_o7jP7lkM2REAw--.35248S4;
        Thu, 20 Jul 2023 22:08:39 +0800 (CST)
From:   Yuanjun Gong <ruc_gongyuanjun@163.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Yuanjun Gong <ruc_gongyuanjun@163.com>
Subject: [PATCH 1/1] soc: qcom: use devm_clk_get_enabled() in gsbi_probe()
Date:   Thu, 20 Jul 2023 22:08:34 +0800
Message-Id: <20230720140834.33557-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wCH_o7jP7lkM2REAw--.35248S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4UXFy5ZFW5Gr4DGr1DGFg_yoW8Jw48pa
        s7AFZ0k348X3y0kas8Jr48X3WYkrWxtFyI93s3C34kX3W5Ar4ktFWvqFyFvFsYqFZ5AF4r
        Ja12qrs5A3WDu3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRijjfUUUUU=
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbBSQGy5VaEH7Y0gQABsQ
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
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
 drivers/soc/qcom/qcom_gsbi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/qcom_gsbi.c b/drivers/soc/qcom/qcom_gsbi.c
index f1742e5bddb9..de94a20d5814 100644
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
 
@@ -212,8 +210,6 @@ static int gsbi_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, gsbi);
 
 	ret = of_platform_populate(node, NULL, NULL, &pdev->dev);
-	if (ret)
-		clk_disable_unprepare(gsbi->hclk);
 	return ret;
 }
 
-- 
2.17.1

