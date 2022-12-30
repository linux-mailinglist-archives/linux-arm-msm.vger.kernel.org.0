Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22CD3659E08
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Dec 2022 00:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235615AbiL3XWh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 18:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235595AbiL3XWg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 18:22:36 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E78F1D0FF
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 15:22:35 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id d14so12065420ilq.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 15:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gh2pdQ8Qz1jZcFQ0f9txmSCzOLVZiWWbqoSXvGeFz+g=;
        b=ZYZNnlUOkpTkj9RFdJdH5nqOqbvVZ6akzpzo3bs2kmgroaVZ2XWbhB+wWuG/xwOnDv
         LBhH5Xqo8vL9xzjIGtbVdt4qFpZWLV6DidrbkP5SkL+1broFvO+0ZnVsia5L6Ksl3ykz
         gDVqKrvgWI7Uon77gbweRmur3AjCAb4o8OGGoRyqyNDVTolRK8cShKrR0I4KEZJ1iJen
         Anwj4MKvDd+Fr3nfbULRJExr2nvJtOz5ttJGJW4BPpK+WzkUpUDLjMCvOi3x7oLLtWDN
         5yzvZL8/yCwGVMDps/VACLEnIB7S3YaPF9uyxpbnHPOg8krLP23UUChtq5Frei1K6oHV
         Mq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gh2pdQ8Qz1jZcFQ0f9txmSCzOLVZiWWbqoSXvGeFz+g=;
        b=wcV31uCYOZYKuRud38oX0nke2zZvAZ9BDHn/0b267pAL9Cpx1P6dSmOVVjxLMlNKlu
         LMhbkmg8fKlkFV4PfJrcytQRdPfsak1T52gzV5SoGFvo0vLcHPP8hE9ENgY1RWmmxxvv
         rSrtdcEiZbWRp9nDhjAbQtl7SpT6INAhI6h9MyuEanltYJraSj/RsTnAWQNOy5s/b24A
         e/K7GvlsItMVHA2qP6Xti+aPOXeZ8HjwMQt5YOnyaslIqEGAa1pEEgH+NxaPGjix2V1g
         Kw4x+8g9iY86BqrkuGfSmCZzsFQk2rpqvViBa3DhIRLIT3A3agM2bYNt2XJSSUO7x0/E
         f6lQ==
X-Gm-Message-State: AFqh2krZCAqc2E5ZvxyXnvqoLB4nFFG0SgzAinJAVaFkUIBOpNTroIco
        rpuRIlACjtyLBCwECgpRvJ2hBQ==
X-Google-Smtp-Source: AMrXdXvdocMfWO8HGIymmgpF7Pf8/58co9uNQyH3dB6OF6qzOshTwLzLIkVw2cAja4wlZKCzyqiTWg==
X-Received: by 2002:a92:c501:0:b0:30b:e92a:aa8f with SMTP id r1-20020a92c501000000b0030be92aaa8fmr16796909ilg.15.1672442554689;
        Fri, 30 Dec 2022 15:22:34 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id co18-20020a0566383e1200b0038a53fb3911sm7170558jab.97.2022.12.30.15.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 15:22:34 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        andersson@kernel.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/6] net: ipa: introduce a common microcontroller interrupt handler
Date:   Fri, 30 Dec 2022 17:22:25 -0600
Message-Id: <20221230232230.2348757-2-elder@linaro.org>
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

The prototype for an IPA interrupt handler supplies the IPA
interrupt ID, so it's possible to use a single function to handle
any type of microcontroller interrupt.

Introduce ipa_uc_interrupt_handler(), which calls the event or the
response handler depending on the IRQ ID provided.  Register the new
function as the handler for both microcontroller IPA interrupt types.

The called functions don't use their "irq_id" arguments, so remove
them.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_uc.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/ipa_uc.c b/drivers/net/ipa/ipa_uc.c
index f0ee472810153..0a890b44c09e1 100644
--- a/drivers/net/ipa/ipa_uc.c
+++ b/drivers/net/ipa/ipa_uc.c
@@ -124,7 +124,7 @@ static struct ipa_uc_mem_area *ipa_uc_shared(struct ipa *ipa)
 }
 
 /* Microcontroller event IPA interrupt handler */
-static void ipa_uc_event_handler(struct ipa *ipa, enum ipa_irq_id irq_id)
+static void ipa_uc_event_handler(struct ipa *ipa)
 {
 	struct ipa_uc_mem_area *shared = ipa_uc_shared(ipa);
 	struct device *dev = &ipa->pdev->dev;
@@ -138,7 +138,7 @@ static void ipa_uc_event_handler(struct ipa *ipa, enum ipa_irq_id irq_id)
 }
 
 /* Microcontroller response IPA interrupt handler */
-static void ipa_uc_response_hdlr(struct ipa *ipa, enum ipa_irq_id irq_id)
+static void ipa_uc_response_hdlr(struct ipa *ipa)
 {
 	struct ipa_uc_mem_area *shared = ipa_uc_shared(ipa);
 	struct device *dev = &ipa->pdev->dev;
@@ -170,13 +170,24 @@ static void ipa_uc_response_hdlr(struct ipa *ipa, enum ipa_irq_id irq_id)
 	}
 }
 
+static void ipa_uc_interrupt_handler(struct ipa *ipa, enum ipa_irq_id irq_id)
+{
+	/* Silently ignore anything unrecognized */
+	if (irq_id == IPA_IRQ_UC_0)
+		ipa_uc_event_handler(ipa);
+	else if (irq_id == IPA_IRQ_UC_1)
+		ipa_uc_response_hdlr(ipa);
+}
+
 /* Configure the IPA microcontroller subsystem */
 void ipa_uc_config(struct ipa *ipa)
 {
+	struct ipa_interrupt *interrupt = ipa->interrupt;
+
 	ipa->uc_powered = false;
 	ipa->uc_loaded = false;
-	ipa_interrupt_add(ipa->interrupt, IPA_IRQ_UC_0, ipa_uc_event_handler);
-	ipa_interrupt_add(ipa->interrupt, IPA_IRQ_UC_1, ipa_uc_response_hdlr);
+	ipa_interrupt_add(interrupt, IPA_IRQ_UC_0, ipa_uc_interrupt_handler);
+	ipa_interrupt_add(interrupt, IPA_IRQ_UC_1, ipa_uc_interrupt_handler);
 }
 
 /* Inverse of ipa_uc_config() */
-- 
2.34.1

