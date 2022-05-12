Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 754BF5250EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 17:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355736AbiELPLT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 11:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355731AbiELPKo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 11:10:44 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF3A261F99
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 08:10:39 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id z26so5629182iot.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 08:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ObrabPeHCvU+7dJRKxpHSNrTAOTtMCoM5TrsgPoZkdA=;
        b=LqDnul8IKgFzWCT9AVCqtSZZI7UcE9n96UHYaVIKrZD7cdeC9oVar/qF2tycyK52L9
         oTwaHrqibKBzBzgpvySd/H2RB/YciH6aGzeX/lWqQp9oX6W4iaacU5tp2j7iCwLVbEf1
         GtR0YBHiKSfuaWOIMt/cKZfC32ZkeRcQGMe46B8O7O2/AM1BadvnVdhlI4iLHtVg6qdN
         nWNG0+bxOEAWljR6Fykxtaq2gos/WENZtVibwse/JhU0gZ2KSlMPM4b9etNg9CjFdYQd
         C0fX3bE2KW57tZf3GFsI/X/F1hXKRO9qApQ9VmpBwg5OKzgjX04snqiC8uHg72rFCopV
         /GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ObrabPeHCvU+7dJRKxpHSNrTAOTtMCoM5TrsgPoZkdA=;
        b=nlVRbzCsiuak1XjK7YUkMr7wdeKxqItuTMME6QV7NxlF7xSosMz5H6A6XIPS+z6uPn
         upk6CEnygtNA6jxjO2J58x4HRa1AclWj3aOlIWozJ0ucZooVbL1pj7TefI9wRaewAGn7
         449Ln4yev9b618BbjWj8sshJiQ1ds94jZzMZLxMRKF0MdHa+xpnkT7Yd6zEZLfHVKXBv
         pn1XJJv9fv+vMNcq9Zo96jU96cE8dPw1SUz9YZJaSYryIUTNi9R4RFuMB/0nAvik+TdA
         1jH5Dr3fDUNffcykcRvm09LQaZFghwe7pQFY3gDRfAsNH0aHKDO0e9KK1aYsdDdGLdpp
         TQkw==
X-Gm-Message-State: AOAM530JyUYbq8He1XZqiU9wD3zEapmOR5tIVDq/N6AfdXzrNqj1aWDE
        wvNxUQqhjI5EBv56v/PnzEO1ZQ==
X-Google-Smtp-Source: ABdhPJwQ7Zbh5j7m5lhCWjOFBKmPPzLvKaDYU8LgG42BXrcHI9hZ5ehn3NWDUSTp+qJkpYDhcAsLZQ==
X-Received: by 2002:a02:84ac:0:b0:32b:a11b:4586 with SMTP id f41-20020a0284ac000000b0032ba11b4586mr202328jai.231.1652368238418;
        Thu, 12 May 2022 08:10:38 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id p15-20020a6b8d0f000000b0065a47e16f3fsm18217iod.17.2022.05.12.08.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 08:10:38 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com
Cc:     lkp@intel.com, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, quic_cpratapa@quicinc.com,
        quic_avuyyuru@quicinc.com, quic_jponduru@quicinc.com,
        quic_subashab@quicinc.com, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net 1/3] net: ipa: certain dropped packets aren't accounted for
Date:   Thu, 12 May 2022 10:10:31 -0500
Message-Id: <20220512151033.211592-2-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220512151033.211592-1-elder@linaro.org>
References: <20220512151033.211592-1-elder@linaro.org>
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

If an RX endpoint receives packets containing status headers, and a
packet in the buffer is not dropped, ipa_endpoint_skb_copy() is
responsible for wrapping the packet data in an SKB and forwarding it
to ipa_modem_skb_rx() for further processing.

If ipa_endpoint_skb_copy() gets a null pointer from build_skb(), it
just returns early.  But in the process it doesn't record that as a
dropped packet in the network device statistics.

Instead, call ipa_modem_skb_rx() whether or not the SKB pointer is
NULL; that function ensures the statistics are properly updated.

Fixes: 1b65bbcc9a710 ("net: ipa: skip SKB copy if no netdev")
Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_endpoint.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index 888e94278a84f..cea7b2e2ce969 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -1150,13 +1150,12 @@ static void ipa_endpoint_skb_copy(struct ipa_endpoint *endpoint,
 		return;
 
 	skb = __dev_alloc_skb(len, GFP_ATOMIC);
-	if (!skb)
-		return;
-
-	/* Copy the data into the socket buffer and receive it */
-	skb_put(skb, len);
-	memcpy(skb->data, data, len);
-	skb->truesize += extra;
+	if (skb) {
+		/* Copy the data into the socket buffer and receive it */
+		skb_put(skb, len);
+		memcpy(skb->data, data, len);
+		skb->truesize += extra;
+	}
 
 	ipa_modem_skb_rx(endpoint->netdev, skb);
 }
-- 
2.32.0

