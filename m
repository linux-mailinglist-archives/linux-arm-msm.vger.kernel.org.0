Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 172F75B3CDB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 18:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbiIIQWa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 12:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbiIIQW3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 12:22:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0527134624
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 09:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662740547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=QWVzTB7DhyDS1w2QS4cDTPYpzzqRPNqjM1zAYKWvkqk=;
        b=Aqt7zifyd+g9X9exLj62xGz9GcR2o+LE8zfyYtEiwsaNpdUfcNnYriL8ZNyBpl8BidSv6l
        4IUEKnPypHNTBxxW5fnFh7x4YLycyZn1Ipq/729wgkYjbK++yc8jKKW6udpIz7cI+q6FbN
        P5dtcnN0A+2d0l3q3akAYC+MWTh51wA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-S2rf2CQ_N0Gyx6-Fg4HF8g-1; Fri, 09 Sep 2022 12:22:26 -0400
X-MC-Unique: S2rf2CQ_N0Gyx6-Fg4HF8g-1
Received: by mail-qt1-f200.google.com with SMTP id fx6-20020a05622a4ac600b0035a70ba1cbcso1894370qtb.21
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 09:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=QWVzTB7DhyDS1w2QS4cDTPYpzzqRPNqjM1zAYKWvkqk=;
        b=NniHRmoDU1LTr148CMqy6PSh5o7qCN/JMWxGEJKdgxD1j++vLdRM7p4TLG7feBzduS
         VPSeTdra/38RXu3UvBSd+uKHD9/1FPf/2u0adATzOWh+uk75UYKPWANr8kO5GTNPXkWr
         Psn0OqQCnCDfF+lA0gQNw+55Xl7Crgie+2ec5s3Do3GTfBfWa0C1dvZGuaXoeyVpy6Ab
         KU1bqpLSyJO0W0S2rkN75p5egZS2RyjhpaXh8b0NIaYTgD9IsoZCfLc+TLSHPscewdjs
         MK8nLSxknMjJHpKDBJ1kypWsdwtM1D+Trw9Qt9XNLZREgL19yG+DLJZTqBWqiPoF5cFv
         6iDw==
X-Gm-Message-State: ACgBeo2NiDubZWnu8/dzKukAuyr0LVN81i6ZWfmJeMcL+iZx6OjXMIrv
        mZv/Ka/ZtLLB5RcL9GpHgSOUznMBGXO6Far/SdaTzO93PlMi8d/qXb5IzNkPG65SgU8I97V4zIV
        Z0DZ/IF0Xr0sYr+cCkMVoNES2xw==
X-Received: by 2002:ac8:5753:0:b0:344:7fb3:3fa4 with SMTP id 19-20020ac85753000000b003447fb33fa4mr13376488qtx.504.1662740544682;
        Fri, 09 Sep 2022 09:22:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7hAW+s8f9b2oeDvYgHufQE+ib/CEkDy6knsDMA34gr6nCl29JT4WooLEDoRT/Y5hac315yKA==
X-Received: by 2002:ac8:5753:0:b0:344:7fb3:3fa4 with SMTP id 19-20020ac85753000000b003447fb33fa4mr13376467qtx.504.1662740544446;
        Fri, 09 Sep 2022 09:22:24 -0700 (PDT)
Received: from localhost (pool-100-0-210-47.bstnma.fios.verizon.net. [100.0.210.47])
        by smtp.gmail.com with ESMTPSA id g15-20020ac87f4f000000b00342e86b3bdasm833619qtk.12.2022.09.09.09.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 09:22:23 -0700 (PDT)
From:   Eric Chanudet <echanude@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-rt-users@vger.kernel.org,
        linux-kernel@vger.kernel.org, Eric Chanudet <echanude@redhat.com>
Subject: [PATCH] mailbox: qcom-ipcc: Use generic_handle_irq_safe()
Date:   Fri,  9 Sep 2022 12:20:43 -0400
Message-Id: <20220909162043.2734873-1-echanude@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PREEMPT_RT forces qcom-ipcc's handler to be threaded with interrupts
enabled, which triggers a warning in __handle_irq_event_percpu().

Use generic_handle_irq_safe() that can be called with or without
interrupts enabled instead.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 drivers/mailbox/qcom-ipcc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index 31d58b7d55fe..be803f324a33 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -82,7 +82,7 @@ static irqreturn_t qcom_ipcc_irq_fn(int irq, void *data)
 
 		virq = irq_find_mapping(ipcc->irq_domain, hwirq);
 		writel(hwirq, ipcc->base + IPCC_REG_RECV_SIGNAL_CLEAR);
-		generic_handle_irq(virq);
+		generic_handle_irq_safe(virq);
 	}
 
 	return IRQ_HANDLED;
-- 
2.37.3

