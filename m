Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7920209761
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 02:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388685AbgFYAKq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 20:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388674AbgFYAKp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 20:10:45 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F5BC061795
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 17:10:45 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id d6so2137673pjs.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 17:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qCGYxi6L0dmDdYzHShkkSHiKc6T34aWWoWuQkkFnaWU=;
        b=rOF1YhixiSD8M50+j5CiMzpdohF2arfJt6iyO3UNYlYzhcfBE1/ym4B6dvjJpTZQXZ
         zNVl2oHPobEbAf/+XE2fkhaKapUULh2NUBFuLnvMJpyrqa8xhuu4qGqnVEr92Hp1cXAH
         QQaYRDNL3+IxM2eAoostdDGI9aTtunbnEzAclrm8dcD0BhYaha73Pc10WKlQIrMw4nxg
         75l1QGAhHoBHeSHNEKMgI82S4ZsIAl9YBGDMdZeoKr7tX9q0TN//+8jFTFf9KrKkZQYF
         OuDtsKWUUZAau3d1SAJhBktN2QePVibBmLBb7cygtwzBQmNZ/HXDf1LYhCdnotpzASWL
         PR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qCGYxi6L0dmDdYzHShkkSHiKc6T34aWWoWuQkkFnaWU=;
        b=FDm6IaqkakBpGq3dAWX06dpz9YFSBc6+N/xl6ugONMxZaZv71MG2E9IwiL0o6UJdXW
         +oUXVE0GQxkAZSklkXB6vZxu7MLgs5em4LGI5i+PnbX0b7Aypfor2/TnilPxAGmEOO11
         8ms9ePBKjsatM0J0JZyIHWPRBdoCyUZUYWIHXGOpfqIpPoEBtStL6ueFfptumyqEmSRz
         czUBQEtULkCSdVZxL1GIr3naLT2Nk9SO2d58ECgWEVcu1DE13Pkwe7EO1UMUCUZPSshC
         7b5CCelZ+KxpjI2cwMoBuC8KZ5TD6M8aD4C4xsWKe0jjqDg1X0apxzCpXqvmYr3mveRG
         kkpQ==
X-Gm-Message-State: AOAM533OXuc6OFNn1mAy2MGqh/mtJ6xajSOK7kAW0JFgsmBTumCHSaIn
        bZy4ixvasGPhUc4m+NYS4YAgqw==
X-Google-Smtp-Source: ABdhPJxGeqEMqjAA50eBDK/+kqthZdDuh3xyYY2kWfjMLxc1bNitFm5ktScRYkrsfEUgv5rN5ZagFQ==
X-Received: by 2002:a17:90a:1781:: with SMTP id q1mr392515pja.8.1593043844977;
        Wed, 24 Jun 2020 17:10:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id n19sm17458671pgb.0.2020.06.24.17.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 17:10:44 -0700 (PDT)
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
Subject: [PATCH v2 1/5] irq: irqdomain: Export irq_domain_update_bus_token
Date:   Thu, 25 Jun 2020 00:10:35 +0000
Message-Id: <20200625001039.56174-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625001039.56174-1-john.stultz@linaro.org>
References: <20200625001039.56174-1-john.stultz@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add export for irq_domain_update_bus_token() so that
we can allow drivers like the qcom-pdc driver to be
loadable as a module.

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
 kernel/irq/irqdomain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index a4c2c915511d..ca974d965fda 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -281,6 +281,7 @@ void irq_domain_update_bus_token(struct irq_domain *domain,
 
 	mutex_unlock(&irq_domain_mutex);
 }
+EXPORT_SYMBOL_GPL(irq_domain_update_bus_token);
 
 /**
  * irq_domain_add_simple() - Register an irq_domain and optionally map a range of irqs
-- 
2.17.1

