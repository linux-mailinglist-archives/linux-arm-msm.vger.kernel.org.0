Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01B795F6E3B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 21:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiJFT3b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 15:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbiJFT3a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 15:29:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4303839B9E
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 12:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665084568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=08jbpfBTd1YQoRYfrXDErR4SgE4lO6QGJjAUK4zNVW0=;
        b=DS2u/KkT5YrCuts732eOqNjcoB3zOeiSygkjcTB+mElD6RfeLfxQR99i3iy5kXgEM45T4s
        ALbv8cvpz1LQxMKurmDQKvurA5YHxU4AEDX2chdaYfZaOk6Mse4LAHLbYSa13dyQzwgFvS
        hioD3XadYh/74R5V4JGo/GGAbOGJeXE=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-489-KYi4CZr2OiaLMZyzPWhqHg-1; Thu, 06 Oct 2022 15:29:27 -0400
X-MC-Unique: KYi4CZr2OiaLMZyzPWhqHg-1
Received: by mail-oi1-f200.google.com with SMTP id o12-20020a056808124c00b00353f308fb4bso1505154oiv.22
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 12:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=08jbpfBTd1YQoRYfrXDErR4SgE4lO6QGJjAUK4zNVW0=;
        b=3qIFfGY+UyO7kt9ZzmAu4sFksI5RYF0+JYRYksSykdc1jtJ8Lh3AIQXopLRsTxgXsN
         2fSgGAe2XGRHEG3NNkST7k4F4rLM+SHlcsWhv0HRe5/lh+1S3gMYXC/Cs80LSRGpY4eE
         ynDoS8F0wq6gUoDO6j/2LsyF7ePh5cgWjBbOSWyqsH1pUwfGP7WXdxNgmyRrmLzxj/dl
         sk7y5DKr9IKEt9OMBN3rIqUsQ6QNTzIHxz91vhErMYbSd4aQ4hRj14RuW/FJpkYqM+/P
         qrR4O/VF9XCxQlACWnzVLhlkJwbk7urmI3m6oLtHKgGQR6tcuQr4P2xuGeI1nTjOhbv8
         uGgQ==
X-Gm-Message-State: ACrzQf0+KuzsfDgOq0QFvLO8NOumdjJXEaXNdy+jARjfSP9Z1dLG1zQ9
        QoOZxgLseTVeMEQgfXinp+r3zAi0w8p0EjLC1ZR74rrjnjKgKjYtVP0lt888GNvi4rZgQaPxCz0
        gW125ykPP+51EjQIX9SwHpby/GQ==
X-Received: by 2002:a05:6808:e90:b0:345:6ee0:9a68 with SMTP id k16-20020a0568080e9000b003456ee09a68mr633816oil.173.1665084566571;
        Thu, 06 Oct 2022 12:29:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Tft7TyzQPnpWaWyWuOlVkW+RxIUVgBIRxRwmiIs7DA8kbsZ6Pfmd2dIYuXYjbu29i+hBWDg==
X-Received: by 2002:a05:6808:e90:b0:345:6ee0:9a68 with SMTP id k16-20020a0568080e9000b003456ee09a68mr633803oil.173.1665084566347;
        Thu, 06 Oct 2022 12:29:26 -0700 (PDT)
Received: from localhost (pool-100-0-210-47.bstnma.fios.verizon.net. [100.0.210.47])
        by smtp.gmail.com with ESMTPSA id w107-20020a9d3674000000b00638ef9bb847sm170071otb.79.2022.10.06.12.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 12:29:25 -0700 (PDT)
From:   Eric Chanudet <echanude@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-rt-users@vger.kernel.org,
        linux-kernel@vger.kernel.org, Eric Chanudet <echanude@redhat.com>
Subject: [PATCH v2] mailbox: qcom-ipcc: flag IRQ NO_THREAD
Date:   Thu,  6 Oct 2022 15:28:56 -0400
Message-Id: <20221006192856.2546702-1-echanude@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PREEMPT_RT forces qcom-ipcc's handler to be threaded with interrupts
enabled, which triggers a warning in __handle_irq_event_percpu():
    irq 173 handler irq_default_primary_handler+0x0/0x10 enabled interrupts
    WARNING: CPU: 0 PID: 77 at kernel/irq/handle.c:161 __handle_irq_event_percpu+0x4c4/0x4d0

Mark it IRQF_NO_THREAD. This is an IRQ-multiplexer and as such it should
not be threaded, otherwise its child-interrupts would be invoked from
the thread handler which is not desired.

This is noticed by PREEMPT_RT, but also on a non-PREEMPT_RT kernel where
`threadirqs' has been used.

Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
Changes since v1:
- Reformulate the patch description using Sebastian's response.

v1 can be found at
https://lore.kernel.org/linux-arm-msm/20221003170849.383005-1-echanude@redhat.com/

 drivers/mailbox/qcom-ipcc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index 31d58b7d55fe..7e27acf6c0cc 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -308,7 +308,8 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 		goto err_mbox;
 
 	ret = devm_request_irq(&pdev->dev, ipcc->irq, qcom_ipcc_irq_fn,
-			       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND, name, ipcc);
+			       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND |
+			       IRQF_NO_THREAD, name, ipcc);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register the irq: %d\n", ret);
 		goto err_req_irq;
-- 
2.37.3

