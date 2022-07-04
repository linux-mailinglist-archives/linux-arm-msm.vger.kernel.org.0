Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7D7565931
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 17:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233720AbiGDPFi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 11:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbiGDPFg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 11:05:36 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60D9EE30
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 08:05:34 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id f85so5365040pfa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 08:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Er22kXvaN2nTH/U01YGmNngJ1WDjE8zNH8lib6jN5uA=;
        b=GM/HTaMLJ3BZwwND0QLWYnm465VVMuA87ivCwyqlfw/z58O7A6fY1ztYpdUsAnl4O6
         Q1juhnKu5UaHC7YKpbjNpeYFCzyGPItoNt2q9hApsBeGregLWMXMxmrlj2a7iXSW6fUR
         DvnFd+EZe5KsSoEIVyA3RBQ+GupLGDQt2rPaUxSKYWveaC4SsJhf555PYMagjUqY0Fi2
         KAnSeujDKSBhSL0a2U3zGi75gOec6+JND/2UPi5NqHnq5R5LAvaaiC4jorWsPp8MPjfJ
         OsXXEv/YLoZskQR6lO8ZMgxLRP86ad+AFhoLdMVonCqQ8jzWEL0Ls0E6cOjTcCPJuJY1
         xncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Er22kXvaN2nTH/U01YGmNngJ1WDjE8zNH8lib6jN5uA=;
        b=123yNNMOXGEjVOjh4P2rQ6I5ewW7R8Vt7k1BHaXCTAPq4QIwPCT1AIDKIYcnvb1Kxp
         9tuiAVgM3bbGZY06tRpvsq2Dm5Uzy1zWryiefVvyHH8QbujIk0fOtQu9Vl0ZsEDCxeXu
         /dtY3zxJ5EubC+nRYwTUYEFrlMSAY7cVSKOOTs0DHbTWjut69dx3GL+cUY4mO8YRpfWP
         mCH8G98wOpuTSXhb+2InOmk/cq7Z2CMpwao0fWzgmt1I9053FKz3HWOpn/c0OyW9nHkn
         +X5k1LQTBGZo0ytMc4U2Lu2MxcQ+rIk1eTCv+CGVFT0lk3h3BlXeMxlsZzJzGdKCXsdw
         jMrA==
X-Gm-Message-State: AJIora+yzmBS1Q7Mt/QllcjZBjyPCcEEtW1y71tVZPmhQmUebGcla6jF
        6CZ0O4hn+ZuSDbYw4dc6nbM5
X-Google-Smtp-Source: AGRyM1uO43KM7dJPBQVhWcvHjRu1UuN3SerZnzcREeZDF7nh8tuNNM1SehZW229klSp3mWZiggIqvA==
X-Received: by 2002:a65:6944:0:b0:408:aa65:9464 with SMTP id w4-20020a656944000000b00408aa659464mr25189301pgq.160.1656947134345;
        Mon, 04 Jul 2022 08:05:34 -0700 (PDT)
Received: from localhost.localdomain ([220.158.158.244])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902654400b0016be96f9c8csm1648396pln.255.2022.07.04.08.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 08:05:34 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     bjorn.andersson@linaro.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, masneyb@onstation.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] pinctrl: qcom-pmic-gpio: Make irqchip immutable
Date:   Mon,  4 Jul 2022 20:35:27 +0530
Message-Id: <20220704150527.361470-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make the irqchip immutable by defining it as a const and flag it as
IRQCHIP_IMMUTABLE. This also fixes the below warning,

[    0.688749] gpio gpiochip1: (c440000.spmi:pmic@1:gpio@8800): not an
immutable chip, please consider fixing it!

Since this is a hierarchial irqchip, there is no need to explicitly tell
GPIOLIB which line has triggered the IRQ (as per the documentation).

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index fd5fff9adff0..9b7ff649e4e0 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -988,6 +988,17 @@ static void *pmic_gpio_populate_parent_fwspec(struct gpio_chip *chip,
 	return fwspec;
 }
 
+static const struct irq_chip pmic_gpio_irqchip = {
+	.name = "spmi-gpio",
+	.irq_ack = irq_chip_ack_parent,
+	.irq_mask = irq_chip_mask_parent,
+	.irq_unmask = irq_chip_unmask_parent,
+	.irq_set_type = irq_chip_set_type_parent,
+	.irq_set_wake = irq_chip_set_wake_parent,
+	.flags = IRQCHIP_IMMUTABLE, IRQCHIP_MASK_ON_SUSPEND,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int pmic_gpio_probe(struct platform_device *pdev)
 {
 	struct irq_domain *parent_domain;
@@ -1081,16 +1092,8 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 	if (!parent_domain)
 		return -ENXIO;
 
-	state->irq.name = "spmi-gpio",
-	state->irq.irq_ack = irq_chip_ack_parent,
-	state->irq.irq_mask = irq_chip_mask_parent,
-	state->irq.irq_unmask = irq_chip_unmask_parent,
-	state->irq.irq_set_type = irq_chip_set_type_parent,
-	state->irq.irq_set_wake = irq_chip_set_wake_parent,
-	state->irq.flags = IRQCHIP_MASK_ON_SUSPEND,
-
 	girq = &state->chip.irq;
-	girq->chip = &state->irq;
+	gpio_irq_chip_set_chip(girq, &pmic_gpio_irqchip);
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 	girq->fwnode = of_node_to_fwnode(state->dev->of_node);
-- 
2.25.1

