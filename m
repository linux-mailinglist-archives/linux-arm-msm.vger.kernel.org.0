Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25F6B16C64
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 22:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfEGUky (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 16:40:54 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52744 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726378AbfEGUkx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 16:40:53 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0C5E960E42; Tue,  7 May 2019 20:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261652;
        bh=Aqgn2CVunlmix1d49JF2zfljL8gEG1nXzkYpE3e8RAo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j//KzvLvmw+0YZTWVLiA0YKCS96hrjEVvAnSVtnf5c1lKwUAMN8JcZtyU6XnJ3dxB
         dAMmS5tC3ZwzC1hVgMW6AhxCGu2KwOipITl1EEhnmy246VET5DOBn+BzRZxN/8WqVY
         cv4Mb69iYARdIMn9FQGmeorhJaJMBA4Fz5aLBKHc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2F393608BA;
        Tue,  7 May 2019 20:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261651;
        bh=Aqgn2CVunlmix1d49JF2zfljL8gEG1nXzkYpE3e8RAo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UApR2QcdYThiCmhlESi9lt8sqkGz3wihNvDbf3RoWHrwHCg8BOMpgRH35rXt5pJJE
         IUe6a/qb3Xk6C89dW6DNnth4Pimp30xxhQfM+x0gcTh4bghymIKZ52HR32kNj5P65J
         UOGiJgtRkl74TnFUvu95DrD/qeznszjn6njr3pyA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2F393608BA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, rplsssn@codeaurora.org,
        linux-arm-msm@vger.kernel.org, thierry.reding@gmail.com,
        bjorn.andersson@linaro.org, dianders@chromium.org,
        Thierry Reding <treding@nvidia.com>,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v5 01/11] gpio: Add support for hierarchical IRQ domains
Date:   Tue,  7 May 2019 14:37:39 -0600
Message-Id: <20190507203749.3384-2-ilina@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190507203749.3384-1-ilina@codeaurora.org>
References: <20190507203749.3384-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hierarchical IRQ domains can be used to stack different IRQ controllers
on top of each other. One specific use-case where this can be useful is
if a power management controller has top-level controls for wakeup
interrupts. In such cases, the power management controller can be a
parent to other interrupt controllers and program additional registers
when an IRQ has its wake capability enabled or disabled.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 drivers/gpio/gpiolib.c      | 15 +++++++++++----
 include/linux/gpio/driver.h |  6 ++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index bca3e7740ef6..4a9a6d4afe6e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1936,7 +1936,9 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
 		type = IRQ_TYPE_NONE;
 	}
 
-	gpiochip->to_irq = gpiochip_to_irq;
+	if (!gpiochip->to_irq)
+		gpiochip->to_irq = gpiochip_to_irq;
+
 	gpiochip->irq.default_type = type;
 	gpiochip->irq.lock_key = lock_key;
 	gpiochip->irq.request_key = request_key;
@@ -1946,9 +1948,14 @@ static int gpiochip_add_irqchip(struct gpio_chip *gpiochip,
 	else
 		ops = &gpiochip_domain_ops;
 
-	gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
-						     gpiochip->irq.first,
-						     ops, gpiochip);
+	if (gpiochip->irq.parent_domain)
+		gpiochip->irq.domain = irq_domain_add_hierarchy(gpiochip->irq.parent_domain,
+								0, gpiochip->ngpio,
+								np, ops, gpiochip);
+	else
+		gpiochip->irq.domain = irq_domain_add_simple(np, gpiochip->ngpio,
+							     gpiochip->irq.first,
+							     ops, gpiochip);
 	if (!gpiochip->irq.domain)
 		return -EINVAL;
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 01497910f023..f481862f1bb0 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -48,6 +48,12 @@ struct gpio_irq_chip {
 	 */
 	const struct irq_domain_ops *domain_ops;
 
+	/**
+	 * @parent_domain:
+	 *
+	 */
+	struct irq_domain *parent_domain;
+
 	/**
 	 * @handler:
 	 *
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

