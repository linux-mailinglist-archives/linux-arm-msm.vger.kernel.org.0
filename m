Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5F3530024
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 May 2022 03:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348323AbiEVBAK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 21:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348260AbiEVBAH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 21:00:07 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1F439BB7
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 18:00:05 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id t15so1412761ilg.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 18:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QKpWuvor5353AGWAKQRnBlR2jwT4S//yqIRK+fSNZWk=;
        b=eyiXHhFYeqlKXBdEh0qZtBEceIQlGhwQFov7FtZTiamgX4c3N7rmeqDJ9VjjaQtcNS
         UsYBS2WvXFrpb7ifKEUHr8BhglhyRzrp17SD1cUQiem9ZSKkM/hQ3hjsyApUsgytXxWT
         xAAt/BXM2fyEtjDzZ5If03IUIriSFgtRQHzX9Tuds5Sr/UgaKdXTUuEMO7d/TrWXkS93
         //pZz/QvJ55CSamp4sg6GIIva5/V21UsDVGu4y/Rv/1j/R/FK2694qhebPpW2cjaBt23
         lInvLJVjlcR+cbD0fyLYlwg7jKEMM32J3NXZ3uGTg5joSq3GOJtEwF8r7ISQMV5238bY
         BXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QKpWuvor5353AGWAKQRnBlR2jwT4S//yqIRK+fSNZWk=;
        b=mudvBsMAyUgp8+f90wQfLQRfnJaRFC5aKHnfeQKyx7bAA94Zhy82jjGTl0nfCf+rlU
         CevzBjfgetu79YsGvRS5V6Q95tg2MmpRwqiO/GrQDgXfOwlSCKdbvPhgYt/0x7D/7/xD
         vjQ0+qAVf87VlxU6mBVBsDmneBlfwyXH959B42EPN/JIjC01Hx6Eswx7znSLB/H89FSK
         mhmgb4LcfElSHOTRx1HksC9tVw3UVKSI0Z4eA0/PTVOZ5KY0hFo6YE8fPsxs1pBT1zQL
         KoAc3PfTsCKtvxiWGYkZkmjdLBgCm+/Mp0Hby+40ECRktCcxYn0uFcCCAgI7a9l+1DzW
         ogIw==
X-Gm-Message-State: AOAM531jX4L96T2+3vKwrqop4CvpdQvNxrK5q9WTCoc/CCy256EMnamF
        +WuyuX7ByovwCVQ8boY3OLUigA==
X-Google-Smtp-Source: ABdhPJzwsgBwQcxz++V/OfI8ibnzh7s5eOX43rN63fw+IctTZ0dplBW5LczJi9V5LxIbdvlQFfNS6w==
X-Received: by 2002:a92:bf06:0:b0:2c9:b21d:6db7 with SMTP id z6-20020a92bf06000000b002c9b21d6db7mr8205967ilh.222.1653181204506;
        Sat, 21 May 2022 18:00:04 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id t21-20020a02c495000000b0032eacab7e07sm939366jam.93.2022.05.21.18.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 18:00:04 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 1/2] net: ipa: fix page free in ipa_endpoint_trans_release()
Date:   Sat, 21 May 2022 19:59:58 -0500
Message-Id: <20220522005959.1175181-2-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220522005959.1175181-1-elder@linaro.org>
References: <20220522005959.1175181-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently the (possibly compound) page used for receive buffers are
freed using __free_pages().  But according to this comment above the
definition of that function, that's wrong:
    If you want to use the page's reference count to decide when
    to free the allocation, you should allocate a compound page,
    and use put_page() instead of __free_pages().

Convert the call to __free_pages() in ipa_endpoint_trans_release()
to use put_page() instead.

Fixes: ed23f02680caa ("net: ipa: define per-endpoint receive buffer size")
Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_endpoint.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index 0f489723689c5..675b7135644b8 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -1385,11 +1385,8 @@ void ipa_endpoint_trans_release(struct ipa_endpoint *endpoint,
 	} else {
 		struct page *page = trans->data;
 
-		if (page) {
-			u32 buffer_size = endpoint->config.rx.buffer_size;
-
-			__free_pages(page, get_order(buffer_size));
-		}
+		if (page)
+			put_page(page);
 	}
 }
 
-- 
2.32.0

