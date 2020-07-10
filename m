Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F00A21C0AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 01:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726914AbgGJXSi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 19:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgGJXSh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 19:18:37 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1D2C08C5DD
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:18:37 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z3so3162117pfn.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+LAKpRiBafd2oOjp/6TfYpZhYF0M8uCnrw227kRHd7U=;
        b=Fb2laGua2O0o3qIqAFaaFHeDOkX2Z7Sq4CysZLHkLud6BHKz7RjNEDQoC5zg+gdNRW
         l64bwkrGWxENZzaGdE49CdjfCWmeTUpd14CG/9Ea+BuiUN8kv4ApLd2gVTRe3z4magmR
         /XwHgns0ezmupMVonilKBcWoXcOnMTYozNC5ES7ifUTfqH2sgImqCOF62Phuf4Kszvzl
         +FemTUwsgBfpnPH36Y1zR/5tLM5bOqN7ha3p8bIkHr1EEnGS56QYXSjXfNoXh3E/MI7e
         uBh6LC8Nb0jgO/h3+mfxpKQjb79mjvvEB2SbYBWgz1rl4bCt3oeRAQCH+eVBmZ06lORX
         dcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+LAKpRiBafd2oOjp/6TfYpZhYF0M8uCnrw227kRHd7U=;
        b=hQdq+hviq5zaQwsY8BWBVPN6VQ2obkG6K6+27C7jNnfRT+pk/RRnJXA1UIsY9lZM17
         /5r7syYnaR5aIM3T1z9+DOuPQe/AbFUM/59ZmvsoYoYL1fIJCZOPSnNDolx6mnDztzxk
         qCk1yN6OV07vKKwc4f7xu1W7Snyanhwpx+0ElYr9LpkzZ0FeoBYQTXPS5+Wbxxl2gHpB
         vbwc7fvDYmB50wWrAh6SWTWyMW0/4heMla3sbrJL6NA3WSs6R6ZtoeSwi3R4p/BaRX46
         ScRLMFojOymebMO6BwZoJ0X+vJ55YkL3GYSeYHbvUiUaZip3PCeBaZVFVxmMCjglYsX5
         Tk/A==
X-Gm-Message-State: AOAM532UE6vJ4Je4WrjBW5WBabh36w4GmoKunwnDtvOJm78eZdRLGdsl
        lLcmZJPEUUr7zAHmSp6wZ28QQg==
X-Google-Smtp-Source: ABdhPJxazz3b2K1meU8hdEkjra2QvmoMn+ofo3x6qLL7NuVHq/rd+1PfJ28IeoTLBIcjHFUnIpZasQ==
X-Received: by 2002:a63:fd03:: with SMTP id d3mr60360119pgh.76.1594423116626;
        Fri, 10 Jul 2020 16:18:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id c14sm7296382pfj.82.2020.07.10.16.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 16:18:36 -0700 (PDT)
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
Subject: [PATCH v3 2/3] irq: irqchip: Export irq_chip_retrigger_hierarchy and irq_chip_set_vcpu_affinity_parent
Date:   Fri, 10 Jul 2020 23:18:23 +0000
Message-Id: <20200710231824.60699-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710231824.60699-1-john.stultz@linaro.org>
References: <20200710231824.60699-1-john.stultz@linaro.org>
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

