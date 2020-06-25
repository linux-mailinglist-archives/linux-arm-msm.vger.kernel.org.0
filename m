Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80EAF209767
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 02:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388761AbgFYAKv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 20:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388679AbgFYAKr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 20:10:47 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF94C061573
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 17:10:46 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ev7so1530297pjb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 17:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+LAKpRiBafd2oOjp/6TfYpZhYF0M8uCnrw227kRHd7U=;
        b=HAlI1u32UitdJLPZdVwEahciwS3ZTB6W+Ys4ec6296HJhVkA4/UXBs25d9AQ+OnJp5
         FP+ahCS3vHw/A1Zixz+Z8l54n8cr+EbLkrbQdselXivq7UG6o3/nTNH9TfuKRZVvEDsJ
         ofl9wVPBBA6nbueD3tW+G8ob3X7lEsPQ1H6Q+ve46dM/XR0/tfXKtcaezay7Xz9G0n7v
         URLpDKtNy6XhKPddMkq2OxknBGWDnel78c7gqfwSTY2o1Gzvi5Owk8HJbpT+y3fBPXvR
         +mgKFgPxG1Ptvh4tLpk/H9kouGfX+/EM2oVuzATRTKR9rYV6C1scXP36jU2P1tL7OnpJ
         vkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+LAKpRiBafd2oOjp/6TfYpZhYF0M8uCnrw227kRHd7U=;
        b=cEqTsB5GCX1wduA1w23lL/CE6AZ0zAh+TrNyLTGEv8w9kWVC8ya9IcwJXiEFNC+Jf5
         BUhp0EtdHW5G1iK4AJEdwSlhsa/wFWbcAZsMRkXQyTnlAWwv3VuqOI8uiQPT9fH9ovNq
         E/YR2LsyoME0gCMPmP6qjxH2JyJKATkK8+ts7gN3tz6rsLuto6h1o+8sHwPhS+hSXFgD
         YO8P1tO8Wb+kqLjeTh/UraNu7tUJSgGnFqXevU2BkbHHjk9+g00jzUSUijM7TIOvTGff
         0NbieZUvWjiAa7NMvKgLD6kvJp0N0SKSEO5CeeZO5ACruQTap2qvuhUbLbkssfL+/6SU
         i6FA==
X-Gm-Message-State: AOAM5307GgpwmNlqp7ZmRzRqPgKz4hKmMVVSdBEh2t+OeWFBvGVV8gEP
        GzfgVG5DcPKxhak1HlRNxuBgVQ==
X-Google-Smtp-Source: ABdhPJwidESwyZghUA8phlmnKseTB1UOw0TCgrn0ehnZTRkv2moQtUQaHy71nTZcExOkP0oXzBdcaQ==
X-Received: by 2002:a17:902:9303:: with SMTP id bc3mr3763473plb.56.1593043846320;
        Wed, 24 Jun 2020 17:10:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id n19sm17458671pgb.0.2020.06.24.17.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 17:10:45 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/5] irq: irqchip: Export irq_chip_retrigger_hierarchy and irq_chip_set_vcpu_affinity_parent
Date:   Thu, 25 Jun 2020 00:10:36 +0000
Message-Id: <20200625001039.56174-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625001039.56174-1-john.stultz@linaro.org>
References: <20200625001039.56174-1-john.stultz@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add EXPORT_SYMBOL_GPL entries for irq_chip_retrigger_hierarchy()
and irq_chip_set_vcpu_affinity_parent() so that we can allow
drivers like the qcom-pdc driver to be loadable as a module.

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
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 kernel/irq/chip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 41e7e37a0928..ba6ce66d7ed6 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1478,6 +1478,7 @@ int irq_chip_retrigger_hierarchy(struct irq_data *data)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(irq_chip_retrigger_hierarchy);
 
 /**
  * irq_chip_set_vcpu_affinity_parent - Set vcpu affinity on the parent interrupt
@@ -1492,7 +1493,7 @@ int irq_chip_set_vcpu_affinity_parent(struct irq_data *data, void *vcpu_info)
 
 	return -ENOSYS;
 }
-
+EXPORT_SYMBOL_GPL(irq_chip_set_vcpu_affinity_parent);
 /**
  * irq_chip_set_wake_parent - Set/reset wake-up on the parent interrupt
  * @data:	Pointer to interrupt specific data
-- 
2.17.1

