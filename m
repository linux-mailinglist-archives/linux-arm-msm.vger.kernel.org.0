Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7389A4A8977
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 18:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352558AbiBCRJp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 12:09:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352532AbiBCRJh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 12:09:37 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 932BFC061401
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 09:09:37 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id e79so4011143iof.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 09:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xl48elVtzdvJ/g20NXNECeobi1xogdrDqiancn7eDUY=;
        b=U+FRSTLhO8mv9K7+OqQpUKavuTqHUH23ppB7lEYSWgSmZEFzlvgloHdoSwAlrwAr9L
         a4AWeGKv1MyTq/ZSOo+LRgWDrySNDTtucHLZYW+NaHzdxnwmht4GO0xUdm1T1TnusRS0
         /4NhgQbIdv4dFVWXXuvgZbp/rnxIaKyF8Au4GJ5qnZf069Dgx5YkI419tN7cOjbU7fyp
         lbogSwjz1tBePgY69Ui2uRN3K7eqbAClKdNQNBzSkQZM9AG7zLpErL8jkJzHNGj5TGwt
         44iQyfrJwBRwWnjIEThSVm301yfZryebgKKDvKZMeALrGv7Eumt3CakBxuRWiRJpHgBl
         d7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xl48elVtzdvJ/g20NXNECeobi1xogdrDqiancn7eDUY=;
        b=B49sUqMeP0XG/kXUAVzdUcLaa2G0T5+ppB7B1vGwzXrT8LXGclwtZ3Pq7jMtcHkZmi
         w/ZwxnQ33hSyw5167DIMriJ+adVAMhKEjHsR0Yn+luprznKOxH97n1m/jmbjSoLKWEWh
         fToTv4RAUd7BIefadUuuqD5oPYYQt0CtzbOByNX7fRPH+W6OsrKXVCticKeAjZxCA0ST
         koni5uw2IeZ1r+7sk7kDHlQhWCICG9U9AfnU72FdyAGOW4UYLNvxLdlI9PqLEMeHLNRr
         ABLmvlS81RDzSKBsOIhLoUvszBdmfT0Cdn3jHtdqIUwU+SfZW+BP6m5o0jtz2itJi13n
         WxhA==
X-Gm-Message-State: AOAM530yXoofsaJ6makkUtl4ZDXCSqdcsIJKpmFSuahJfqviEgcrtSxs
        IwFF+y8oQ+ppySxNBiTA9lQPWA==
X-Google-Smtp-Source: ABdhPJzS6Tz0bFFNqMgE95uK21ifG3uUZr+k0LR8EqBX+XSLVF2jB35xfAjRzp1HetpD5mkTuczwvg==
X-Received: by 2002:a05:6602:1512:: with SMTP id g18mr11947586iow.121.1643908176951;
        Thu, 03 Feb 2022 09:09:36 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id m12sm21869671iow.54.2022.02.03.09.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 09:09:36 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     bjorn.andersson@linaro.org, mka@chromium.org, evgreen@chromium.org,
        cpratapa@codeaurora.org, avuyyuru@codeaurora.org,
        jponduru@codeaurora.org, subashab@codeaurora.org, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 03/10] net: ipa: increment backlog in replenish caller
Date:   Thu,  3 Feb 2022 11:09:20 -0600
Message-Id: <20220203170927.770572-4-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220203170927.770572-1-elder@linaro.org>
References: <20220203170927.770572-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Three spots call ipa_endpoint_replenish(), and just one of those
requests that the backlog be incremented after completing the
replenish operation.

Instead, have the caller increment the backlog, and get rid of the
add_one argument to ipa_endpoint_replenish().

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_endpoint.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index f8dbd43949e16..060a025d70ec6 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -1084,7 +1084,6 @@ static int ipa_endpoint_replenish_one(struct ipa_endpoint *endpoint)
 /**
  * ipa_endpoint_replenish() - Replenish endpoint receive buffers
  * @endpoint:	Endpoint to be replenished
- * @add_one:	Whether this is replacing a just-consumed buffer
  *
  * The IPA hardware can hold a fixed number of receive buffers for an RX
  * endpoint, based on the number of entries in the underlying channel ring
@@ -1093,24 +1092,17 @@ static int ipa_endpoint_replenish_one(struct ipa_endpoint *endpoint)
  * an endpoint can be disabled, in which case buffers are not queued to
  * the hardware.
  */
-static void ipa_endpoint_replenish(struct ipa_endpoint *endpoint, bool add_one)
+static void ipa_endpoint_replenish(struct ipa_endpoint *endpoint)
 {
 	struct gsi *gsi;
 	u32 backlog;
-	int delta;
 
-	if (!test_bit(IPA_REPLENISH_ENABLED, endpoint->replenish_flags)) {
-		if (add_one)
-			atomic_inc(&endpoint->replenish_backlog);
+	if (!test_bit(IPA_REPLENISH_ENABLED, endpoint->replenish_flags))
 		return;
-	}
 
-	/* If already active, just update the backlog */
-	if (test_and_set_bit(IPA_REPLENISH_ACTIVE, endpoint->replenish_flags)) {
-		if (add_one)
-			atomic_inc(&endpoint->replenish_backlog);
+	/* Skip it if it's already active */
+	if (test_and_set_bit(IPA_REPLENISH_ACTIVE, endpoint->replenish_flags))
 		return;
-	}
 
 	while (atomic_dec_not_zero(&endpoint->replenish_backlog))
 		if (ipa_endpoint_replenish_one(endpoint))
@@ -1118,17 +1110,13 @@ static void ipa_endpoint_replenish(struct ipa_endpoint *endpoint, bool add_one)
 
 	clear_bit(IPA_REPLENISH_ACTIVE, endpoint->replenish_flags);
 
-	if (add_one)
-		atomic_inc(&endpoint->replenish_backlog);
-
 	return;
 
 try_again_later:
 	clear_bit(IPA_REPLENISH_ACTIVE, endpoint->replenish_flags);
 
 	/* The last one didn't succeed, so fix the backlog */
-	delta = add_one ? 2 : 1;
-	backlog = atomic_add_return(delta, &endpoint->replenish_backlog);
+	backlog = atomic_inc_return(&endpoint->replenish_backlog);
 
 	/* Whenever a receive buffer transaction completes we'll try to
 	 * replenish again.  It's unlikely, but if we fail to supply even
@@ -1152,7 +1140,7 @@ static void ipa_endpoint_replenish_enable(struct ipa_endpoint *endpoint)
 	/* Start replenishing if hardware currently has no buffers */
 	max_backlog = gsi_channel_tre_max(gsi, endpoint->channel_id);
 	if (atomic_read(&endpoint->replenish_backlog) == max_backlog)
-		ipa_endpoint_replenish(endpoint, false);
+		ipa_endpoint_replenish(endpoint);
 }
 
 static void ipa_endpoint_replenish_disable(struct ipa_endpoint *endpoint)
@@ -1167,7 +1155,7 @@ static void ipa_endpoint_replenish_work(struct work_struct *work)
 
 	endpoint = container_of(dwork, struct ipa_endpoint, replenish_work);
 
-	ipa_endpoint_replenish(endpoint, false);
+	ipa_endpoint_replenish(endpoint);
 }
 
 static void ipa_endpoint_skb_copy(struct ipa_endpoint *endpoint,
@@ -1372,7 +1360,8 @@ static void ipa_endpoint_rx_complete(struct ipa_endpoint *endpoint,
 {
 	struct page *page;
 
-	ipa_endpoint_replenish(endpoint, true);
+	ipa_endpoint_replenish(endpoint);
+	atomic_inc(&endpoint->replenish_backlog);
 
 	if (trans->cancelled)
 		return;
-- 
2.32.0

