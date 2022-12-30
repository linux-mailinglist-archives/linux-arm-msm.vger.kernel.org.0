Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C408659E0F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Dec 2022 00:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235752AbiL3XWy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 18:22:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235725AbiL3XWo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 18:22:44 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228B41DDC5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 15:22:40 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id c20so8246847ilj.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 15:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5hYek3nB0dmId6hp5MbMyiFoPLMoLSONTQq8CabMoo=;
        b=ThNXYLsEVsgBPhzs5Uq7WacMqSL5M7UajFCbfbhPx5wOLapYvV1osW5+VDozSkPYOI
         ut4z+T/fz4zFWaYz1P3w2cFBc3/Lq0jjU51J0i0A3IRAqy5PQqnp3nqDDzy6AZrGOkBx
         veXgFUdmpJga3FgDZuirF6OHbfubI+JD5QO2sOQMem17XO2kTdaIPhdozHZO0WHPrSfR
         ZXogBQQmks8srE/gDmd4kTfr2+BlHTi290JanaEKjiMsogBf5lSM0BJkMRqLqv2haFRG
         UE/spAzS9ccUc7FxoqvKYGwSUkn9UnsxaDnpgni686T8Wi+nem5Tc82WpF/kaLQxcZrb
         /jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5hYek3nB0dmId6hp5MbMyiFoPLMoLSONTQq8CabMoo=;
        b=Sf6GqfhsaRGC7Bu8YsErZl+4tZC2pk+RkA4l53YY9wvIwFd814A0Xhu62HuyuwDb/K
         9kbOF7M8nanSrMpa1DTtfaEfVL9iplqSuwakhkez1dKa8XNhaLuAgJ+YfD7iuL7nNSla
         kr/kqX0rAtKyH3+0fspe9mF4t8PcCUgUwwtegQBCdquuQacj4CCxhN4V+c+395rLUaVw
         1QEb08oiSpxDwE5J381FWhUUquuuOy886RYqYpQRBOzt6AgYrRmIIYd6fkIqn/h9I2es
         tRZ71w5JV531NjvFsN9tofmDKeaRx7CZbfmdgJepSR/FzX3zkiDo1LJu1MIPIu82tzQo
         MziA==
X-Gm-Message-State: AFqh2koJfcJydcps79fQNX5RP/T3IfWJHQlRVxI0tmY7Pu+46SutuabX
        iw1kG5ZbI8I1A+q9HsBY4Phv+g==
X-Google-Smtp-Source: AMrXdXuOwnnWmSMz2q/fl3VFwD3Njo9F6YqQcUoyIMiAkbUKdRfoqdlsdAP12rCRviz/70r4S3K0Kg==
X-Received: by 2002:a05:6e02:68c:b0:300:60df:e13e with SMTP id o12-20020a056e02068c00b0030060dfe13emr20628795ils.25.1672442559371;
        Fri, 30 Dec 2022 15:22:39 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id co18-20020a0566383e1200b0038a53fb3911sm7170558jab.97.2022.12.30.15.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 15:22:39 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 5/6] net: ipa: kill ipa_interrupt_add()
Date:   Fri, 30 Dec 2022 17:22:29 -0600
Message-Id: <20221230232230.2348757-6-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230232230.2348757-1-elder@linaro.org>
References: <20221230232230.2348757-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dynamic assignment of IPA interrupt handlers isn't needed; we
only handle three IPA interrupt types, and their handler functions
are now assigned directly.  We can get rid of ipa_interrupt_add()
and ipa_interrupt_remove() now, because they serve no purpose.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_interrupt.c | 16 ++--------------
 drivers/net/ipa/ipa_interrupt.h | 33 ---------------------------------
 drivers/net/ipa/ipa_power.c     |  7 +------
 drivers/net/ipa/ipa_uc.c        |  6 ------
 4 files changed, 3 insertions(+), 59 deletions(-)

diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
index f32ac40a79372..f0a68b0a242c1 100644
--- a/drivers/net/ipa/ipa_interrupt.c
+++ b/drivers/net/ipa/ipa_interrupt.c
@@ -30,6 +30,8 @@
 #include "ipa_uc.h"
 #include "ipa_interrupt.h"
 
+typedef void (*ipa_irq_handler_t)(struct ipa *ipa, enum ipa_irq_id irq_id);
+
 /**
  * struct ipa_interrupt - IPA interrupt information
  * @ipa:		IPA pointer
@@ -226,20 +228,6 @@ void ipa_interrupt_simulate_suspend(struct ipa_interrupt *interrupt)
 	ipa_interrupt_process(interrupt, IPA_IRQ_TX_SUSPEND);
 }
 
-/* Add a handler for an IPA interrupt */
-void ipa_interrupt_add(struct ipa_interrupt *interrupt,
-		       enum ipa_irq_id ipa_irq, ipa_irq_handler_t handler)
-{
-	WARN_ON(ipa_irq >= IPA_IRQ_COUNT);
-}
-
-/* Remove the handler for an IPA interrupt type */
-void
-ipa_interrupt_remove(struct ipa_interrupt *interrupt, enum ipa_irq_id ipa_irq)
-{
-	WARN_ON(ipa_irq >= IPA_IRQ_COUNT);
-}
-
 /* Configure the IPA interrupt framework */
 struct ipa_interrupt *ipa_interrupt_config(struct ipa *ipa)
 {
diff --git a/drivers/net/ipa/ipa_interrupt.h b/drivers/net/ipa/ipa_interrupt.h
index 5f7d2e90ea337..c1df054be8fab 100644
--- a/drivers/net/ipa/ipa_interrupt.h
+++ b/drivers/net/ipa/ipa_interrupt.h
@@ -12,39 +12,6 @@
 struct ipa;
 struct ipa_interrupt;
 
-/**
- * typedef ipa_irq_handler_t - IPA interrupt handler function type
- * @ipa:	IPA pointer
- * @irq_id:	interrupt type
- *
- * Callback function registered by ipa_interrupt_add() to handle a specific
- * IPA interrupt type
- */
-typedef void (*ipa_irq_handler_t)(struct ipa *ipa, enum ipa_irq_id irq_id);
-
-/**
- * ipa_interrupt_add() - Register a handler for an IPA interrupt type
- * @interrupt:	IPA interrupt structure
- * @irq_id:	IPA interrupt type
- * @handler:	Handler function for the interrupt
- *
- * Add a handler for an IPA interrupt and enable it.  IPA interrupt
- * handlers are run in threaded interrupt context, so are allowed to
- * block.
- */
-void ipa_interrupt_add(struct ipa_interrupt *interrupt, enum ipa_irq_id irq_id,
-		       ipa_irq_handler_t handler);
-
-/**
- * ipa_interrupt_remove() - Remove the handler for an IPA interrupt type
- * @interrupt:	IPA interrupt structure
- * @irq_id:	IPA interrupt type
- *
- * Remove an IPA interrupt handler and disable it.
- */
-void ipa_interrupt_remove(struct ipa_interrupt *interrupt,
-			  enum ipa_irq_id irq_id);
-
 /**
  * ipa_interrupt_suspend_enable - Enable TX_SUSPEND for an endpoint
  * @interrupt:		IPA interrupt structure
diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index 4198f8e97e40b..a282512ebd2d8 100644
--- a/drivers/net/ipa/ipa_power.c
+++ b/drivers/net/ipa/ipa_power.c
@@ -325,15 +325,11 @@ int ipa_power_setup(struct ipa *ipa)
 {
 	int ret;
 
-	ipa_interrupt_add(ipa->interrupt, IPA_IRQ_TX_SUSPEND,
-			  ipa_power_suspend_handler);
 	ipa_interrupt_enable(ipa, IPA_IRQ_TX_SUSPEND);
 
 	ret = device_init_wakeup(&ipa->pdev->dev, true);
-	if (ret) {
+	if (ret)
 		ipa_interrupt_disable(ipa, IPA_IRQ_TX_SUSPEND);
-		ipa_interrupt_remove(ipa->interrupt, IPA_IRQ_TX_SUSPEND);
-	}
 
 	return ret;
 }
@@ -342,7 +338,6 @@ void ipa_power_teardown(struct ipa *ipa)
 {
 	(void)device_init_wakeup(&ipa->pdev->dev, false);
 	ipa_interrupt_disable(ipa, IPA_IRQ_TX_SUSPEND);
-	ipa_interrupt_remove(ipa->interrupt, IPA_IRQ_TX_SUSPEND);
 }
 
 /* Initialize IPA power management */
diff --git a/drivers/net/ipa/ipa_uc.c b/drivers/net/ipa/ipa_uc.c
index 6b7d289cfaffa..cb8a76a75f21d 100644
--- a/drivers/net/ipa/ipa_uc.c
+++ b/drivers/net/ipa/ipa_uc.c
@@ -182,13 +182,9 @@ void ipa_uc_interrupt_handler(struct ipa *ipa, enum ipa_irq_id irq_id)
 /* Configure the IPA microcontroller subsystem */
 void ipa_uc_config(struct ipa *ipa)
 {
-	struct ipa_interrupt *interrupt = ipa->interrupt;
-
 	ipa->uc_powered = false;
 	ipa->uc_loaded = false;
-	ipa_interrupt_add(interrupt, IPA_IRQ_UC_0, ipa_uc_interrupt_handler);
 	ipa_interrupt_enable(ipa, IPA_IRQ_UC_0);
-	ipa_interrupt_add(interrupt, IPA_IRQ_UC_1, ipa_uc_interrupt_handler);
 	ipa_interrupt_enable(ipa, IPA_IRQ_UC_1);
 }
 
@@ -198,9 +194,7 @@ void ipa_uc_deconfig(struct ipa *ipa)
 	struct device *dev = &ipa->pdev->dev;
 
 	ipa_interrupt_disable(ipa, IPA_IRQ_UC_1);
-	ipa_interrupt_remove(ipa->interrupt, IPA_IRQ_UC_1);
 	ipa_interrupt_disable(ipa, IPA_IRQ_UC_0);
-	ipa_interrupt_remove(ipa->interrupt, IPA_IRQ_UC_0);
 	if (ipa->uc_loaded)
 		ipa_power_retention(ipa, false);
 
-- 
2.34.1

