Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA7B388204
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 23:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352446AbhERVUq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 17:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235250AbhERVUp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 17:20:45 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4BEC061573
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 14:19:27 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id x188so8378705pfd.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 14:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x0WkbtRSug5KygkEOcSY00slsWucZ8pGUhHWfcZvJLw=;
        b=XoJTI+h6COw5nb4jNXCTBjTFUxOWTdZPBsDhW1Vf5td+5titolSU5hwv0P5QyvJ36G
         +86v7ei0+4gD2Gm6e36pye7sr3DWPDnoF+3e57cxlVxRb/ij4tTdNGoGQcoHR0VmQmFB
         tTRcMD7Qxn4jPS6/sUFRfoDJc2iYEUEGZboioaT5lVKyiMrACIGwlYDlCzlynSbEEvMc
         bGKqmeGo/ICR02ASBae5INu4+FrYCZ4tw1xSz2W8DZtry+lL/4gCZBAqb8CAaRD+feb7
         /asuJN5NVOjHTir3u8XDI0jW0ewNgV8zxqTKWm+RCha+SxkufsoiuCeD9LIfeLnDMaEE
         YjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x0WkbtRSug5KygkEOcSY00slsWucZ8pGUhHWfcZvJLw=;
        b=fvjVABV6xO9YzG+cCRcraTqbpmNssEjEYy3fKlPlBAGP2VbNYFGw1xmNE9ewa3Cujf
         jfwsaoQG3106emItPRszpgYGc371IsOoh706gp8pvk2wG0vWwS56oy5Yr6GDHPDPvfFD
         DTqFF3DhQBQNFgsSML6Vq3y5WcBO2jbM7kkEZZeYC7viSBHg9ndKD/0mBmSXYjw7GzDS
         3acpLZWF4q1xGuB/harv1jQccf2sbDRRi3vhhwlOyaN8VnIH5PXAIM0E3Hv9yba1rzad
         EBCdGrhnfpuzo/LrgEL1HZDhFQG3zZFpi10ZkD9WEU0RF76p1ET06diP0cjB7qPhYn7X
         uxfw==
X-Gm-Message-State: AOAM5320Ml/MwVnrAYI5VDKAMmK9DuOv363CGLV1IKd0Ia5V6JgmTB4F
        W85xXk1ipKeHQ7vU+/Jzip3u5w==
X-Google-Smtp-Source: ABdhPJxHzgg/sDP+AXuLGVUb+sszrOlNtS/1ESyTlJlqL+kEGm+M9oruAN8GSnqVJZjl79LXwnDIqg==
X-Received: by 2002:a63:f40e:: with SMTP id g14mr7070371pgi.402.1621372766908;
        Tue, 18 May 2021 14:19:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id g89sm2587199pjg.30.2021.05.18.14.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 14:19:26 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org, John Stultz <john.stultz@linaro.org>
Subject: [PATCH 1/2] irqchip/qcom-pdc: Switch to IRQCHIP_PLATFORM_DRIVER and allow as a module
Date:   Tue, 18 May 2021 21:19:21 +0000
Message-Id: <20210518211922.3474368-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Saravana Kannan <saravanak@google.com>

This patch revives changes from Saravana Kannan to switch the
qcom-pdc driver to use IRQCHIP_PLATFORM_DRIVER helper macros,
and allows qcom-pdc driver to be loaded as a permanent module.

Earlier attempts at this ran into trouble with loading
dependencies, but with Saravana's fw_devlink=on set by default
now we should avoid those.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Saravana Kannan <saravanak@google.com>
[jstultz: Folded in with my changes to allow the driver to be
 loadable as a permenent module]
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/irqchip/Kconfig    | 2 +-
 drivers/irqchip/qcom-pdc.c | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index b90e825df7e14..d4a0b4964ccc5 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -415,7 +415,7 @@ config GOLDFISH_PIC
          for Goldfish based virtual platforms.
 
 config QCOM_PDC
-	bool "QCOM PDC"
+	tristate "QCOM PDC"
 	depends on ARCH_QCOM
 	select IRQ_DOMAIN_HIERARCHY
 	help
diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 5dc63c20b67ea..32d59202d408d 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -11,9 +11,11 @@
 #include <linux/irqdomain.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/soc/qcom/irq.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
@@ -459,4 +461,8 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 	return ret;
 }
 
-IRQCHIP_DECLARE(qcom_pdc, "qcom,pdc", qcom_pdc_init);
+IRQCHIP_PLATFORM_DRIVER_BEGIN(qcom_pdc)
+IRQCHIP_MATCH("qcom,pdc", qcom_pdc_init)
+IRQCHIP_PLATFORM_DRIVER_END(qcom_pdc)
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. Power Domain Controller");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

