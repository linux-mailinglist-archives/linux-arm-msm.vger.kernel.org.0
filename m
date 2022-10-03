Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4EE5F3444
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 19:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbiJCRN1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 13:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiJCRM0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 13:12:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE5538A36
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 10:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664817094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Dzb8EgXtXtOeTruW/z4IGhhF8RMS3aAQr6k0iWpk9YQ=;
        b=Z8Z/7d83MKcSLv4EGMO/EA41TgplpRKBZVF2DkwpJu9oJnXD5OUOt+YFjGcgeB7/QtGoeo
        ABNwyfjshmbpWh/bkd0Lzju/IGmwvGbOPkFPcy84CBNJ0PpMbRZtqoArQeHH4WylVijXPN
        721RzUaGq5rhaapBXa5SdG7qNVLSOyU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-527-OaVBJFYuO8Wx9b9nIrxVQA-1; Mon, 03 Oct 2022 13:11:33 -0400
X-MC-Unique: OaVBJFYuO8Wx9b9nIrxVQA-1
Received: by mail-qk1-f199.google.com with SMTP id k2-20020a05620a414200b006ceec443c8bso9607606qko.14
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 10:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Dzb8EgXtXtOeTruW/z4IGhhF8RMS3aAQr6k0iWpk9YQ=;
        b=7cYJ7S3VYninpmB1IQ6dSf0KxAFchXxAoFofAH3ODkdPHwZAYdBv2THbPTvyUOXzm6
         TgrbnI+GvZ9VPY0gS9pRdUAfeiq+LMW9KR+sD62wI/sUhUom1tHZS8Zj8ShoWtu1GxCm
         z0Onk7LXVdX7ei9EsJm6b3l4VCFhMmw1y9FYjJqM6+sCNaixTJd5MtxL/DJ65orDvmkH
         33DX3veda2qjiKE9wkJ1aGGNlurNLnUP843Yp1czrDz0+E6RaqFFM0fyDZSHKaMGyY8S
         Ynzf+OB04/CCYkA+tvmjHd55bi7WqRUccO1uZqjTbUau0TuIuu9KnCd2VxyKqeiPT3Iz
         mZIg==
X-Gm-Message-State: ACrzQf0jdTbPFMk2onFugxvSpcUuBezwp+o90DBQx708nlmoDdSnuAm5
        c/hYDN/d2Bu+c5KTI02Ruduaur4yS1mydxYdD2eHoqkxxRlPn2orsQVUEPTIhlGG4TEOgopHHg3
        iJBqcQgVaFz92cJKuKaPRtbBtCg==
X-Received: by 2002:a05:622a:180d:b0:35b:d283:7e65 with SMTP id t13-20020a05622a180d00b0035bd2837e65mr16743091qtc.106.1664817093067;
        Mon, 03 Oct 2022 10:11:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Px9ykH7I6R3BOvdcWrkGhEmxNlAdURjOCoJnDBPlrIXe9R9dzuva7XqDYcpbqzTxfd+yV3w==
X-Received: by 2002:a05:622a:180d:b0:35b:d283:7e65 with SMTP id t13-20020a05622a180d00b0035bd2837e65mr16743073qtc.106.1664817092858;
        Mon, 03 Oct 2022 10:11:32 -0700 (PDT)
Received: from localhost (pool-100-0-210-47.bstnma.fios.verizon.net. [100.0.210.47])
        by smtp.gmail.com with ESMTPSA id x22-20020a05620a449600b006cf3592cc20sm12155356qkp.55.2022.10.03.10.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 10:11:32 -0700 (PDT)
From:   Eric Chanudet <echanude@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-rt-users@vger.kernel.org,
        linux-kernel@vger.kernel.org, Eric Chanudet <echanude@redhat.com>
Subject: [PATCH] mailbox: qcom-ipcc: flag IRQ NO_THREAD
Date:   Mon,  3 Oct 2022 13:08:49 -0400
Message-Id: <20221003170849.383005-1-echanude@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
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

Mark it IRQF_NO_THREAD to avoid running the handler in a threaded
context with threadirqs or PREEMPT_RT enabled.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
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

