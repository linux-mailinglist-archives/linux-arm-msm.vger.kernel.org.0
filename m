Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90FB116C65
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 22:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbfEGUky (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 16:40:54 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52782 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbfEGUkx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 16:40:53 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 894E560E59; Tue,  7 May 2019 20:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261652;
        bh=pB6Bdb6xkgzNtpfnRd+1ICLbIeXtXqHB0y5vBDg5Wy8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Rl4FujVdwzom8T07qBDrz/l7TEvXSz4833wWOZ1wkxMes7E8n7xarvP0PoWMKaBDU
         8wspQFLsPiDvjuX3L/OGB53KkpslUJ3xUDpjKEgDLROwL91fQKbmVjGd5/hXDUcUDQ
         r1K4a9jn3q9zBMFC+54U0omw/TvWJ5gH3fieKCkk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5073660CF0;
        Tue,  7 May 2019 20:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261652;
        bh=pB6Bdb6xkgzNtpfnRd+1ICLbIeXtXqHB0y5vBDg5Wy8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Rl4FujVdwzom8T07qBDrz/l7TEvXSz4833wWOZ1wkxMes7E8n7xarvP0PoWMKaBDU
         8wspQFLsPiDvjuX3L/OGB53KkpslUJ3xUDpjKEgDLROwL91fQKbmVjGd5/hXDUcUDQ
         r1K4a9jn3q9zBMFC+54U0omw/TvWJ5gH3fieKCkk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5073660CF0
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, rplsssn@codeaurora.org,
        linux-arm-msm@vger.kernel.org, thierry.reding@gmail.com,
        bjorn.andersson@linaro.org, dianders@chromium.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v5 02/11] gpio: allow gpio_to_irq to use OF variants for gpiochips
Date:   Tue,  7 May 2019 14:37:40 -0600
Message-Id: <20190507203749.3384-3-ilina@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190507203749.3384-1-ilina@codeaurora.org>
References: <20190507203749.3384-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The chip may define additional information in the DT that may be useful
for translating and allocting a linux interrupt for the GPIO. When
drivers do not specify a .to_irq function, the gpiolib defaults to
gpiochip_to_irq() function. The defalt function uses creates an IRQ
without referencing the OF definition of the gpiochip. Let's add this
OF support to the default gpiochip_to_irq function.

When requesting an interrupt for the GPIO, let's stick to IRQ_TYPE_NONE
for the trigger type, for we don't have the information what trigger
type the driver may set when requesting the IRQ.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 drivers/gpio/gpiolib.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4a9a6d4afe6e..77317435e2b2 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1825,6 +1825,19 @@ EXPORT_SYMBOL_GPL(gpiochip_irq_domain_deactivate);
 
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
+#ifdef CONFIG_OF_GPIO
+	struct irq_fwspec fwspec;
+
+	if (chip->of_node) {
+		fwspec.fwnode = of_node_to_fwnode(chip->of_node);
+		fwspec.param[0] = offset;
+		fwspec.param[1] = IRQ_TYPE_NONE;
+		fwspec.param_count = 2;
+
+		return irq_create_fwspec_mapping(&fwspec);
+	}
+#endif
+
 	if (!gpiochip_irqchip_irq_valid(chip, offset))
 		return -ENXIO;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

