Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0EB15469B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 17:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345163AbiFJPqc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 11:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345608AbiFJPq2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 11:46:28 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE7C3B3F5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 08:46:24 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id h8so7320450iof.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 08:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yzpg6uSX6tMLeSyY3HSLNWDLn7gtZwirUKg77xaYBSY=;
        b=NgvGg1sb/EMOxOd0Hk4IC0/bLMvgrcj1VRmfcbBh+wwoCZAw81jAjGyJ18FjHTna2x
         bdp9AKZ06s4jsbYtlf8XJAGKM1NF3tD3DtFX4+IfZg5gZIDyw0TpKrcB8vfpKQ3wJBgy
         9CvUD52CRzeRKBwE1pZ0E+AmX2gNfZYJQztMaBXTl+iKSYgh7f/8x37q795ziU4kmAy6
         TcDxp2zmDOst1QrGrkRcP/r8O3gwh3uIdrlYTqtyCRQUEk1KY2vAApZNZeloNtxuKT8H
         yY+7GUuKHvxzyNMyQojL5RWz2/UZ9ZEMAl9oeoqUhhEgOmXPXP6xoFUoEMqr3wZz+Y1U
         rqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yzpg6uSX6tMLeSyY3HSLNWDLn7gtZwirUKg77xaYBSY=;
        b=As8zgPFY1niSKvl5PNb14Fxy2VvtVY8Kdl3DR/cwM+XlE3Ho3rOOrGcXf5n4VdYr2I
         /gjfFx/T2Wb/+eZSnnUbGyeEBW/c966eD2aJtuYOHRAYxxGvbSzc34HijYTa3BLaePr/
         G1w5LJBZB4G0rqTxPLxsUlFEW3cO9jueqDIo4wT9fa1TmuPoaIKGUSoXPDfKXYhsKE7F
         d+QsNSyW+2nyA7fqEdCqQe7vci3RjouEJyZgthVazlgAPWhBbRxFg0P1+7YD/OPiAeFH
         EXJnANO5y5BnBAhn9XASBXdIJJr+FTVJLHmNlkNpQDO+vvTn/vvULSn+P2rfgsnmGyoj
         /Xhw==
X-Gm-Message-State: AOAM532lAYfLkVY9iBI2L1YCC/ik1AI2NE7bG2aOSVEtqmhgY1ZHxutz
        GlD8eaUrKuRLJgiXGXJxSAkyTg==
X-Google-Smtp-Source: ABdhPJxT6mIepia5PxJjdru8UpkhyTrUg4l/P9fcEkomP2u+44qHE3xpLXAGA/tvIhTqpz6z+sKdbQ==
X-Received: by 2002:a6b:108:0:b0:669:a9e4:24a0 with SMTP id 8-20020a6b0108000000b00669a9e424a0mr5226313iob.165.1654875983381;
        Fri, 10 Jun 2022 08:46:23 -0700 (PDT)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id y15-20020a92950f000000b002d3adf71893sm12100488ilh.20.2022.06.10.08.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 08:46:23 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/6] net: ipa: simplify endpoint transaction completion
Date:   Fri, 10 Jun 2022 10:46:13 -0500
Message-Id: <20220610154616.249304-5-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220610154616.249304-1-elder@linaro.org>
References: <20220610154616.249304-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When a GSI transaction completes, ipa_endpoint_trans_complete() is
eventually called.  That handles TX and RX completions separately,
but ipa_endpoint_tx_complete() is a no-op.

Instead, have ipa_endpoint_trans_complete() return immediately for a
TX transaction, and incorporate code from ipa_endpoint_rx_complete()
to handle RX transactions.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_endpoint.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index 86ef91f83eb68..66d2bfdf9e423 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -1368,18 +1368,14 @@ static void ipa_endpoint_status_parse(struct ipa_endpoint *endpoint,
 	}
 }
 
-/* Complete a TX transaction, command or from ipa_endpoint_skb_tx() */
-static void ipa_endpoint_tx_complete(struct ipa_endpoint *endpoint,
-				     struct gsi_trans *trans)
-{
-}
-
-/* Complete transaction initiated in ipa_endpoint_replenish_one() */
-static void ipa_endpoint_rx_complete(struct ipa_endpoint *endpoint,
-				     struct gsi_trans *trans)
+void ipa_endpoint_trans_complete(struct ipa_endpoint *endpoint,
+				 struct gsi_trans *trans)
 {
 	struct page *page;
 
+	if (endpoint->toward_ipa)
+		return;
+
 	if (trans->cancelled)
 		goto done;
 
@@ -1393,15 +1389,6 @@ static void ipa_endpoint_rx_complete(struct ipa_endpoint *endpoint,
 	ipa_endpoint_replenish(endpoint);
 }
 
-void ipa_endpoint_trans_complete(struct ipa_endpoint *endpoint,
-				 struct gsi_trans *trans)
-{
-	if (endpoint->toward_ipa)
-		ipa_endpoint_tx_complete(endpoint, trans);
-	else
-		ipa_endpoint_rx_complete(endpoint, trans);
-}
-
 void ipa_endpoint_trans_release(struct ipa_endpoint *endpoint,
 				struct gsi_trans *trans)
 {
-- 
2.34.1

