Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A90F5537648
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 May 2022 10:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbiE3IJH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 May 2022 04:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbiE3IJG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 May 2022 04:09:06 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE7875216
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 May 2022 01:09:02 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id q12-20020a17090a304c00b001e2d4fb0eb4so3215147pjl.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 May 2022 01:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0FScl+UqRUK2zjAGIdnpLvBJ2sZzcfjY6lr/T8iYlos=;
        b=dYormkjv9tBgqAMnTu37VmgqDlxDGlFXue/fz3cho42K/yVjCGbD8zxALhzpMBMgwl
         JZXJMANAES1GQI8B30K4cIMon6oo/4Duoho54Uec6WlqFfxLWq1yXOKhNaehzFIcu/6d
         D4RgACl+MDeGro5q94U4/EolUn4H0qAv6uQaea59Py4tqm5AWkh54C69YQjlQdHnTIBA
         vnPMooKNk/Uw98pna09Ymi8JN5EOzQIb5poDZ8SSG4YkGoaDZOSflOXpS46U+2upC9aN
         bL2tuShijKJnklTSelKPV/vys6638aKnPUmAYPys83WQjcPUpBsjfIp0m7eXdBfCc7YK
         EHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0FScl+UqRUK2zjAGIdnpLvBJ2sZzcfjY6lr/T8iYlos=;
        b=kAlWV0LEgcneBuyYk0EpXywlDn6E3UulDVprJC4JfeN0aWFnO5Q+93YaAOU4hLmH+g
         m/SrpTeojc4576q5jTAqfoB+BkcGoov3wAX6Ixt9SSAmDsqntItNd8E/1sLr9F321nwt
         oOMyseMhnWejzoGZy31jQEpJrxvsQbZ/E/aCnIZjTDf8NpYnxSEi7W7yGLqHxUoo9tbA
         S1B9i8tuTPNb5l6JwOiQWUzINC2gp2Cqi9e3I4ttK/l1dT4WwF3DXra3iLDTN64s/eTX
         JbulZJOieyLKpZslisCwHWsuGaeltZ201ua+sAlX9VhD669BY2F0QjutpI1+gLvkjHoJ
         i6Xg==
X-Gm-Message-State: AOAM532vh+10vR9egSWhkrUUJtBBvbG9GHhuwxn8VAuWU8DRUq6nyg1X
        25XAmwoLl/FKaXtFWNGcLVHS
X-Google-Smtp-Source: ABdhPJzgQqCsBR3izTUVdM/YjZC4G0IubuAotr/OnzoFZGctfNMTJcbl4DyQ5Y2vXr9SY40Un1R+ag==
X-Received: by 2002:a17:903:11c7:b0:151:9769:3505 with SMTP id q7-20020a17090311c700b0015197693505mr54926412plh.72.1653898141679;
        Mon, 30 May 2022 01:09:01 -0700 (PDT)
Received: from localhost.localdomain ([220.158.159.114])
        by smtp.gmail.com with ESMTPSA id io17-20020a17090312d100b0015e8d4eb285sm8450345plb.207.2022.05.30.01.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 01:09:01 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     tglx@linutronix.de, maz@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/3] genirq: Check for trigger type mismatch in __setup_irq()
Date:   Mon, 30 May 2022 13:38:42 +0530
Message-Id: <20220530080842.37024-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530080842.37024-1-manivannan.sadhasivam@linaro.org>
References: <20220530080842.37024-1-manivannan.sadhasivam@linaro.org>
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

Currently, if the trigger type defined by the platform like DT does not
match the driver requested trigger type, the below warning is shown
during platform_get_irq() but only during the second time of the drive
probe (due to probe deferral or module unload/load).

irq: type mismatch, failed to map hwirq-9 for interrupt-controller@b220000!

Consider a typical usecase of requesting an IRQ in a driver:

```
	/* Assume DT has set the trigger type to IRQF_TYPE_LEVEL_HIGH */

	q6v5->wdog_irq = platform_get_irq_byname(pdev, "wdog");
	if (q6v5->wdog_irq <= 0)
		return q6v5->wdog_irq;

	ret = devm_request_threaded_irq(&pdev->dev, q6v5->wdog_irq,
					NULL, q6v5_wdog_interrupt,
					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
					"q6v5 wdog", q6v5);
	if (ret) {
		dev_err(&pdev->dev, "failed to acquire wdog IRQ\n");
		return ret;
	}
```

For the first time probe of a driver, platform_get_irq_byname() does not
return an error and it sets the platform requested trigger type. Then,
request_irq() also does not check for the trigger type mismatch and sets
the driver requested trigger type. Later if the driver gets probed again,
platform_get_irq() throws the "type mismatch" warning and fails.

Ideally, request_irq() should throw the error during the first time itself,
when it detects the trigger type mismatch. So let's add a check in
__setup_irq() for checking the trigger type mismatch.

It should be noted that the platform trigger type could be IRQ_TYPE_NONE
in some cases like IRQ controller inside the GPIOCHIP. For those cases,
the check should be skipped.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 kernel/irq/manage.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index c03f71d5ec10..dd28c4944172 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1480,8 +1480,18 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
 	 * If the trigger type is not specified by the caller,
 	 * then use the default for this interrupt.
 	 */
-	if (!(new->flags & IRQF_TRIGGER_MASK))
-		new->flags |= irqd_get_trigger_type(&desc->irq_data);
+	flags = irqd_get_trigger_type(&desc->irq_data);
+	if (!(new->flags & IRQF_TRIGGER_MASK)) {
+		new->flags |= flags;
+	} else if (flags && ((new->flags & IRQF_TRIGGER_MASK) != flags)) {
+		/*
+		 * Bail out if the default trigger is not IRQ_TYPE_NONE and the
+		 * caller specified trigger does not match the default trigger type.
+		 */
+		pr_err("Trigger type %u does not match default type %lu for %s (irq %d)\n",
+		       new->flags & IRQF_TRIGGER_MASK, flags, new->name, irq);
+		return -EINVAL;
+	}
 
 	/*
 	 * Check whether the interrupt nests into another interrupt
-- 
2.25.1

