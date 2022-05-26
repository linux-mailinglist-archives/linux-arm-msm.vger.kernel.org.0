Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6BC4535155
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 17:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347886AbiEZPXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 May 2022 11:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244371AbiEZPXV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 May 2022 11:23:21 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00901BA9B9
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 08:23:20 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id y8so1850228iof.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 08:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3FuYWZH+FiljKJENkWoPtISQbamYnIl3gQFtl722jiA=;
        b=JCJ0wcVFz30z7mdJYRQ1SjWB5/cxg52tEnaNUcX7dIplxUVCw74CoRRZS/xOVFVUM7
         s/pzcO+MNm62J5nT943NsEYQvJ2z0BFhGyoa2dY7cHIRIQBh9R7iQEDQ5imoZ6BoWAOn
         4dKll3g71P1z/ZtXyzCupQsqBu0IVVoTpUcHnjwl0SRFloc+vFfi6Q1GQxK83xLHe8Oa
         4eQCfBWb6k5lhYRT5CJ6jB8kRlwa0gRRzHyEOd6rxQkqwERcfaiGesZm9OBFBmtT3g4G
         z9kSZydtVvp0j7tHFaXPU+w5tR9xTiZxL15tp0/tfHC9D0TK2JG+5f6h9QbNvaTRu6in
         lFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3FuYWZH+FiljKJENkWoPtISQbamYnIl3gQFtl722jiA=;
        b=wivnS1XDpFMm+raGqf4HfkN2ZGY21alPqRK1VtZ6E3kwz40ukfPZGv6eG4EzwS//fS
         vLjYPeZGl8N77DpOZ7MjCoz3MehUHZesCEySbVYFOepkAAPufnIRaA85BlP97EPA0V50
         yTfFyGVsxhGl80ghk2IcpUirQ5F0tzZl02jS/6XD1bcjhLsokNnp4cxYKKlAFVmZtNMG
         nbMO8yz16awmkUo0Hh6Y0u9PE2w706jJ577EkZIEAiF3m5VGeiB3OTU1dobPKIf5Yclm
         uSEnv9ahW7ZZmQvcqxyU8PxfMeF/GSZdIH5/NlIasI3wsV2Y8yOmLcyAaOb8Kiecrq/W
         2dIA==
X-Gm-Message-State: AOAM532d+32dMgmnBm/BBbzX3ZM4vuBFxN9PsGI+wjch2hspfXQ507d4
        ZBzO0D0JUCNfT6HhTVoAa3jU9iZUsSzaMg==
X-Google-Smtp-Source: ABdhPJwSwMkwczWccgfG9TdcgTrjzDEinEWUUPdmZXWDZhhvWQEAQXqnS055C5SratTS0Ib/K6kDSw==
X-Received: by 2002:a05:6638:3490:b0:32e:ec1f:b923 with SMTP id t16-20020a056638349000b0032eec1fb923mr6394074jal.20.1653578600375;
        Thu, 26 May 2022 08:23:20 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id b59-20020a0295c1000000b0032b3a78176fsm466847jai.51.2022.05.26.08.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 08:23:20 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/2] net: ipa: fix page free in ipa_endpoint_trans_release()
Date:   Thu, 26 May 2022 10:23:13 -0500
Message-Id: <20220526152314.1405629-2-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220526152314.1405629-1-elder@linaro.org>
References: <20220526152314.1405629-1-elder@linaro.org>
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
index 385aa63ab4bbc..e92aa9447f6e7 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -1418,11 +1418,8 @@ void ipa_endpoint_trans_release(struct ipa_endpoint *endpoint,
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

