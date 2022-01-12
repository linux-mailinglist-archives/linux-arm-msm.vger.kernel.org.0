Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944B248C4D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jan 2022 14:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353604AbiALNaX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jan 2022 08:30:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347543AbiALNaW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jan 2022 08:30:22 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC535C06175D
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jan 2022 05:30:20 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id z17so310679ilm.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jan 2022 05:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bSv0Q4TNteJbdpvC1uUIQLPNd+EooxVM4yLrKrNBrSY=;
        b=yPTp7WrPSZWd17+619zhF2bIra/Bg8qaWNq3CQ89koAo+LXXt3jYvGKaWPwUuhP2Mg
         +w3wEa6pn85t9HMWMUtxCYRL4WoFO+BfCsY81dtvDNSk8jP2uxVtdlpw/Ey5sNVjQySO
         5LetC/yFgkOLu/Qrupz8bPT64A4YLKBougmB6gAAZbZF/F0rLSpZRWVYM/mKGx79XLit
         7lvMPhKp9+XKZo884W4bVe2f+uR2gv6K2jY10AUgOuA94T7KadDK8rJ0PuS+4CAllodP
         OXuQU9DSpXRR1qXfu7qDahHyKY2Xe2ZAkAP6FcOKv5IFOWk+FJEc7Xq+TZqyXciqU29g
         Q4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bSv0Q4TNteJbdpvC1uUIQLPNd+EooxVM4yLrKrNBrSY=;
        b=LhQcwQkUTHxofdYxm7x7VN2laERRlFm5c4VEr2f+Mbk7KJY7xadqTksG5NLvM1Sp21
         WLU5U4ff8Rz3UPa7xG7HzMLduvY0aBrhtd5CNU2ScDXR/APtqqTGe7bspZA1WRKVU5oZ
         ahS03wHSuAwr6CGEbV6TTb5jlXkRN/atA5TpiKKExMYikbOE1rGx2T+D7V+ZhYH6qJHB
         oAP+2v63xQKO54lawlJv05/b9NTLHn6ShAfyutR/P8HoKfyuBxI/rXch6GAHWADZ/LcP
         envcECkik9HFYza1xKe9LeUjUER1AFp1PA+UrkjUUbUSWo7UzLWY02R6VC0xXK/GC4iT
         v2Cg==
X-Gm-Message-State: AOAM531VrE3elqzZGK6+9HW9mCKh+rtcWqSLkVx7PpyJGeNLiRylV1S+
        D8KX/KZzSpFaMsjWGkclA58KDQ==
X-Google-Smtp-Source: ABdhPJwbf4kWzn7assSpm2KapJOFwddjfiK1G84tBr9UXZO4CVWfs+s8O399GZ9Z9GmQ1lfgmivQZw==
X-Received: by 2002:a05:6e02:1b84:: with SMTP id h4mr4575927ili.12.1641994220145;
        Wed, 12 Jan 2022 05:30:20 -0800 (PST)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id e17sm7476742iow.30.2022.01.12.05.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 05:30:19 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     jponduru@codeaurora.org, avuyyuru@codeaurora.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        cpratapa@codeaurora.org, subashab@codeaurora.org, mka@chromium.org,
        evgreen@chromium.org, elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net v2 3/3] net: ipa: prevent concurrent replenish
Date:   Wed, 12 Jan 2022 07:30:12 -0600
Message-Id: <20220112133012.778148-4-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220112133012.778148-1-elder@linaro.org>
References: <20220112133012.778148-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We have seen cases where an endpoint RX completion interrupt arrives
while replenishing for the endpoint is underway.  This causes another
instance of replenishing to begin as part of completing the receive
transaction.  If this occurs it can lead to transaction corruption.

Use a new flag to ensure only one replenish instance for an endpoint
executes at a time.

Fixes: 84f9bd12d46db ("soc: qcom: ipa: IPA endpoints")
Signed-off-by: Alex Elder <elder@linaro.org>
---
v2: Use test_and_set_bit() and clear_bit(), as Jakub suggested

 drivers/net/ipa/ipa_endpoint.c | 13 +++++++++++++
 drivers/net/ipa/ipa_endpoint.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index cddddcedaf72b..68291a3efd040 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -1088,15 +1088,27 @@ static void ipa_endpoint_replenish(struct ipa_endpoint *endpoint, bool add_one)
 		return;
 	}
 
+	/* If already active, just update the backlog */
+	if (test_and_set_bit(IPA_REPLENISH_ACTIVE, endpoint->replenish_flags)) {
+		if (add_one)
+			atomic_inc(&endpoint->replenish_backlog);
+		return;
+	}
+
 	while (atomic_dec_not_zero(&endpoint->replenish_backlog))
 		if (ipa_endpoint_replenish_one(endpoint))
 			goto try_again_later;
+
+	clear_bit(IPA_REPLENISH_ACTIVE, endpoint->replenish_flags);
+
 	if (add_one)
 		atomic_inc(&endpoint->replenish_backlog);
 
 	return;
 
 try_again_later:
+	clear_bit(IPA_REPLENISH_ACTIVE, endpoint->replenish_flags);
+
 	/* The last one didn't succeed, so fix the backlog */
 	delta = add_one ? 2 : 1;
 	backlog = atomic_add_return(delta, &endpoint->replenish_backlog);
@@ -1691,6 +1703,7 @@ static void ipa_endpoint_setup_one(struct ipa_endpoint *endpoint)
 		 * backlog is the same as the maximum outstanding TREs.
 		 */
 		clear_bit(IPA_REPLENISH_ENABLED, endpoint->replenish_flags);
+		clear_bit(IPA_REPLENISH_ACTIVE, endpoint->replenish_flags);
 		atomic_set(&endpoint->replenish_saved,
 			   gsi_channel_tre_max(gsi, endpoint->channel_id));
 		atomic_set(&endpoint->replenish_backlog, 0);
diff --git a/drivers/net/ipa/ipa_endpoint.h b/drivers/net/ipa/ipa_endpoint.h
index 07d5c20e5f000..0313cdc607de3 100644
--- a/drivers/net/ipa/ipa_endpoint.h
+++ b/drivers/net/ipa/ipa_endpoint.h
@@ -44,10 +44,12 @@ enum ipa_endpoint_name {
  * enum ipa_replenish_flag:	RX buffer replenish flags
  *
  * @IPA_REPLENISH_ENABLED:	Whether receive buffer replenishing is enabled
+ * @IPA_REPLENISH_ACTIVE:	Whether replenishing is underway
  * @IPA_REPLENISH_COUNT:	Number of defined replenish flags
  */
 enum ipa_replenish_flag {
 	IPA_REPLENISH_ENABLED,
+	IPA_REPLENISH_ACTIVE,
 	IPA_REPLENISH_COUNT,	/* Number of flags (must be last) */
 };
 
-- 
2.32.0

