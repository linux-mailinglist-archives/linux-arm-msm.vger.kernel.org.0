Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1148224755
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jul 2020 02:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728729AbgGRAGq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 20:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728691AbgGRAGp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 20:06:45 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A80C0619D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 17:06:45 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id e80so7995172pfh.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 17:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=DKGRFKWlyGqgvFuZLsoVKcLXRUmmTtOYHyvcndsSP+U=;
        b=eaB2T02EB8g0y1xZXeHPi2mGLg8poIqpVgJ7BZUCLc/EEq3S9kRsfSNNVOCKuDD0Tp
         x74rVZSROfJKsOJm9ugF+T1Hp/iX0XD+d22Er6E2Ibg96Ah5e8rAy3JrWpf9H2Z7OG+d
         YfBGYGnHBr3s3ccaS/U13rr/1gTn2YsvYde1+xHImpDp53KqpLwJSlZ2wApaMUKIJsf3
         crIVaak6JWU7DHb9Yi5DC8e+5EFRBpqVcvzTXx4P24HIAMBgrJPX7czTcaMGSWVzUDhV
         MEo1D+Pw+zcwU39+Qrp+uVsSPuLqyQXoE6/DNJ8WbV/EYVgi81q5pq3cK0C/DF/L+LlF
         vZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=DKGRFKWlyGqgvFuZLsoVKcLXRUmmTtOYHyvcndsSP+U=;
        b=rrEgCeqmWDCuPppBUNrt/cMOq/YTzY+Uv/ifvJbQyJclzmg/SgB760Ov5d8OAG3Far
         fwo4gOO8umVLOrlBBguid15VPbHYF45MYBziD6ep7cYvDvrRpg8TD3nDFikI8sCV32GM
         2tb4qZ5YQAij0aKiKgMikiEnq92v5uy5/TwuJ6V8enkH0FVh458i+tJ0aOmc0cxGcFhU
         QSQM76+ITzS/32lGyeIFlfm/2r7tgdB3tumKP0Wl5WMiU9l2IaFZiaaPYYh7vNVH49Q0
         G0Vqmo5tRW2xeT6ovnI5YlTbghkaU8o9D9aaAIlRVlQGOJEGPTGC/WM824EEp2BCnYLY
         B7zQ==
X-Gm-Message-State: AOAM533PUaoHQqF5soGIEpcxwju1KCHOCCf7F3WWvA5Vn5jIQVLvwr47
        RxyTB7y+6ZpcOIOSnaxWGtaXt580IXUAL00=
X-Google-Smtp-Source: ABdhPJw0Oq4D37hE7WRVSZZsPHqDRMN/reFgLscACQLoMocTAkUGaDa91/twwV300uYzLONkac+Q5pfdV9Natf0=
X-Received: by 2002:a17:90a:32cb:: with SMTP id l69mr11006149pjb.205.1595030805133;
 Fri, 17 Jul 2020 17:06:45 -0700 (PDT)
Date:   Fri, 17 Jul 2020 17:06:35 -0700
In-Reply-To: <20200718000637.3632841-1-saravanak@google.com>
Message-Id: <20200718000637.3632841-3-saravanak@google.com>
Mime-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using IRQCHIP_PLATFORM_DRIVER
 helper macros
From:   Saravana Kannan <saravanak@google.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>,
        Hanks Chen <hanks.chen@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch the driver to use the helper macros. In addition to reducing the
number of lines, this also adds module unload protection (if the driver
is compiled as a module) by switching from module_platform_driver to
builtin_platform_driver.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/irqchip/qcom-pdc.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 5b624e3295e4..c1c5dfad57cc 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -432,28 +432,8 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 	return ret;
 }
 
-static int qcom_pdc_probe(struct platform_device *pdev)
-{
-	struct device_node *np = pdev->dev.of_node;
-	struct device_node *parent = of_irq_find_parent(np);
-
-	return qcom_pdc_init(np, parent);
-}
-
-static const struct of_device_id qcom_pdc_match_table[] = {
-	{ .compatible = "qcom,pdc" },
-	{}
-};
-MODULE_DEVICE_TABLE(of, qcom_pdc_match_table);
-
-static struct platform_driver qcom_pdc_driver = {
-	.probe = qcom_pdc_probe,
-	.driver = {
-		.name = "qcom-pdc",
-		.of_match_table = qcom_pdc_match_table,
-		.suppress_bind_attrs = true,
-	},
-};
-module_platform_driver(qcom_pdc_driver);
+IRQCHIP_PLATFORM_DRIVER_BEGIN(qcom_pdc)
+IRQCHIP_MATCH("qcom,pdc", qcom_pdc_init)
+IRQCHIP_PLATFORM_DRIVER_END(qcom_pdc)
 MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
 MODULE_LICENSE("GPL v2");
-- 
2.28.0.rc0.105.gf9edc3c819-goog

