Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 032A85469B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 17:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240913AbiFJPqd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 11:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345590AbiFJPq1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 11:46:27 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0558A40E50
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 08:46:23 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id y16so21200026ili.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 08:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0BQDmv34wyVMx4obn1fqFEZa9pyMw3o6hJ+fsh6NgSM=;
        b=ga0Eg6Tt0RYWMUIgu1mvu7J/5FJ6m0+zf/4G9GxASMNYSXwLJOLWCJU+YBYGQi3HH7
         O9Smz2tRhWSRSpgY6ToXMhnTfqczzenh7EWkthxJFr7gBWIp6+qI1y1O9xPkD5enXdl2
         gOEqi5hQJFHIHjnRtK6+sBfbAxTepolG6edtZ2ZU/1KMoQCHsMUlenmPd1aXiBqT6N8w
         p60CMhIbKsCrtDaDsEJAGqyKKGBV1spMJo/zEm9974xKinQaYxTf/Za0dqo+UIZzHWSs
         p8SK4dUKqzy8TJXhtwqLFRvkAknuzJ9oLsiKGc2r5Kju0Q+AlaLq0z1ixmhn0Xi+Z1s8
         olTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0BQDmv34wyVMx4obn1fqFEZa9pyMw3o6hJ+fsh6NgSM=;
        b=fdqvEDfjywI8qnQ3cQRD68t4JfY01pDVGgtdK7b8fx/26oPunTMLobCvuyiXiqVVnp
         uocwgswm7g90mSxZv23kZxCEv8dBwj/rV8mRw8ZKt/GpG82g9ASxkDgjweFWECdPSkdw
         8brRcP2ORl7Um8R/zlkl8we8tApEfQTLuI9xbw4d7JA8ICVb6HZkw0lzGoNEkErj7rsP
         hdew94P4Y3/3HYTYW8DmScdL379ljyUM3f+HIOkRE5oM5hW+x5FuAE6pEkqyw+6MWmjl
         8Wp7Q9gr0LqIq/6xgFMobiKp+1vI09pnBgYZvphcZJyElYoXxrEUlNzEPnyDUOtU0Q7Z
         ZPVw==
X-Gm-Message-State: AOAM5314pfc6j7jrKeJ5/scsyQcI9zuTZsn0hVKBLwDYulleRqOBfiKz
        dl3nONAlPB95kbUGeIO4XGvZpg==
X-Google-Smtp-Source: ABdhPJxGCzAWxekqR/1CB6I34OLmakcTvMrRIr9MdyRPb8GCN98mBQJtFdvPK8caFVS3lBNXTECOBA==
X-Received: by 2002:a05:6e02:1b87:b0:2d6:5e74:217a with SMTP id h7-20020a056e021b8700b002d65e74217amr7584781ili.74.1654875982391;
        Fri, 10 Jun 2022 08:46:22 -0700 (PDT)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id y15-20020a92950f000000b002d3adf71893sm12100488ilh.20.2022.06.10.08.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 08:46:22 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 3/6] net: ipa: rename endpoint->trans_tre_max
Date:   Fri, 10 Jun 2022 10:46:12 -0500
Message-Id: <20220610154616.249304-4-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220610154616.249304-1-elder@linaro.org>
References: <20220610154616.249304-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The trans_tre_max field of the IPA endpoint structure is only used
to limit the number of fragments allowed for an SKB being prepared
for transmission.  Recognizing that, rename the field skb_frag_max,
and reduce its value by 1.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_endpoint.c | 4 ++--
 drivers/net/ipa/ipa_endpoint.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index 57507a109269b..86ef91f83eb68 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -1020,7 +1020,7 @@ int ipa_endpoint_skb_tx(struct ipa_endpoint *endpoint, struct sk_buff *skb)
 	 * If not, see if we can linearize it before giving up.
 	 */
 	nr_frags = skb_shinfo(skb)->nr_frags;
-	if (1 + nr_frags > endpoint->trans_tre_max) {
+	if (nr_frags > endpoint->skb_frag_max) {
 		if (skb_linearize(skb))
 			return -E2BIG;
 		nr_frags = 0;
@@ -1721,7 +1721,7 @@ static void ipa_endpoint_setup_one(struct ipa_endpoint *endpoint)
 	if (endpoint->ee_id != GSI_EE_AP)
 		return;
 
-	endpoint->trans_tre_max = gsi->channel[channel_id].trans_tre_max;
+	endpoint->skb_frag_max = gsi->channel[channel_id].trans_tre_max - 1;
 	if (!endpoint->toward_ipa) {
 		/* RX transactions require a single TRE, so the maximum
 		 * backlog is the same as the maximum outstanding TREs.
diff --git a/drivers/net/ipa/ipa_endpoint.h b/drivers/net/ipa/ipa_endpoint.h
index 01790c60bee8d..28e0a7386fd72 100644
--- a/drivers/net/ipa/ipa_endpoint.h
+++ b/drivers/net/ipa/ipa_endpoint.h
@@ -142,7 +142,7 @@ enum ipa_replenish_flag {
  * @endpoint_id:	IPA endpoint number
  * @toward_ipa:		Endpoint direction (true = TX, false = RX)
  * @config:		Default endpoint configuration
- * @trans_tre_max:	Maximum number of TRE descriptors per transaction
+ * @skb_frag_max:	Maximum allowed number of TX SKB fragments
  * @evt_ring_id:	GSI event ring used by the endpoint
  * @netdev:		Network device pointer, if endpoint uses one
  * @replenish_flags:	Replenishing state flags
@@ -157,7 +157,7 @@ struct ipa_endpoint {
 	bool toward_ipa;
 	struct ipa_endpoint_config config;
 
-	u32 trans_tre_max;
+	u32 skb_frag_max;	/* Used for netdev TX only */
 	u32 evt_ring_id;
 
 	/* Net device this endpoint is associated with, if any */
-- 
2.34.1

