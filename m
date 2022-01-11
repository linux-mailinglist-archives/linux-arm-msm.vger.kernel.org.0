Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7833B48B745
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jan 2022 20:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344610AbiAKTV5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jan 2022 14:21:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244124AbiAKTV4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jan 2022 14:21:56 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1174CC061751
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 11:21:56 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id r16so69468ile.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jan 2022 11:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n01jCl5rCPyfDFPOLy8WiC9NVM2/7mccZVIePFZbu4I=;
        b=j8vJx99pB1gufpPMx7ta0d9YD6iz9O6WxXvaht+nfwcv8Ri3PwNVv3ppaL73buYw6D
         bzmPKTBaLCZil3mkXil1e4Ahpi0Q+u+sXyWAVzIxW0Jfe3NdN4eplfwl3pi6hj3ZeI8n
         RhiY0+KeJ+uREWI50TQxi+4LB/vd6dyRmnR7doJOlawprLG9W3WsWwtFuQcuLyQTkdsi
         UwYhX4Np6F8YLrf6BSvYile8BC/Blx5nZhSTv620LmJyUxeXHbd1FcS+hZSMYd7aHTut
         69AO9BKxfdFmvVhFUZogUanG2PieYLmmQdbvQLTvVVvHVZrbHqKYzbigp27lT9Q3IoY4
         uGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n01jCl5rCPyfDFPOLy8WiC9NVM2/7mccZVIePFZbu4I=;
        b=2hkmOUlnrkxY33JPDKNGfleGK9w7MfUNcXgcnZhvNU6yqBLYobTGnfMk7ohLKKOTEk
         nAZBnVQ53RlaEhf5C5xnXWYDDbKnIJA/UiNKhqc4rwVryrangPH7hLHP0jK33WOT58Dp
         ptRC92Tn+cG7a/vOiP2Wd5demWidSjOEeKUSqHW+SJDGszEq2PGvmZIuSW8TKO9SGM2h
         sVp+y7OocRpmtg3WKa6rXxHfsE1ITigcaCr2OhX2+Bon0F4gcM2nQBmeo/UTISWIpGx8
         VumhK9p6C60HM5C1X+O9s2+elnARs/QWtvvxyE9CUu2PFWnT/maP1/NeJlGYa7A1vwXi
         mWgg==
X-Gm-Message-State: AOAM530wcPYFDKiiSphDmrtW2wQS/zoBeK7HNgom6PAcph0JXOCdzl1O
        BLZ7Ya+cVwx4glr/d3lzlEjmgw==
X-Google-Smtp-Source: ABdhPJwsOwzNJBBPPg7cBpEQVQ8jW9K9Mguiw2W8Q7qrcKLw21J2Ai2ozqd/QN9oAZKAZJEgFyfbyw==
X-Received: by 2002:a92:c748:: with SMTP id y8mr3075998ilp.140.1641928915449;
        Tue, 11 Jan 2022 11:21:55 -0800 (PST)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id e17sm6264544iow.30.2022.01.11.11.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 11:21:54 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     jponduru@codeaurora.org, avuyyuru@codeaurora.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        cpratapa@codeaurora.org, subashab@codeaurora.org,
        evgreen@chromium.org, elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 1/2] net: ipa: fix atomic update in ipa_endpoint_replenish()
Date:   Tue, 11 Jan 2022 13:21:49 -0600
Message-Id: <20220111192150.379274-2-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111192150.379274-1-elder@linaro.org>
References: <20220111192150.379274-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In ipa_endpoint_replenish(), if an error occurs when attempting to
replenish a receive buffer, we just quit and try again later.  In
that case we increment the backlog count to reflect that the attempt
was unsuccessful.  Then, if the add_one flag was true we increment
the backlog again.

This second increment is not included in the backlog local variable
though, and its value determines whether delayed work should be
scheduled.  This is a bug.

Fix this by determining whether 1 or 2 should be added to the
backlog before adding it in a atomic_add_return() call.

Fixes: 84f9bd12d46db ("soc: qcom: ipa: IPA endpoints")
Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_endpoint.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index 49d9a077d0375..8b055885cf3cf 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -1080,6 +1080,7 @@ static void ipa_endpoint_replenish(struct ipa_endpoint *endpoint, bool add_one)
 {
 	struct gsi *gsi;
 	u32 backlog;
+	int delta;
 
 	if (!endpoint->replenish_enabled) {
 		if (add_one)
@@ -1097,10 +1098,8 @@ static void ipa_endpoint_replenish(struct ipa_endpoint *endpoint, bool add_one)
 
 try_again_later:
 	/* The last one didn't succeed, so fix the backlog */
-	backlog = atomic_inc_return(&endpoint->replenish_backlog);
-
-	if (add_one)
-		atomic_inc(&endpoint->replenish_backlog);
+	delta = add_one ? 2 : 1;
+	backlog = atomic_add_return(delta, &endpoint->replenish_backlog);
 
 	/* Whenever a receive buffer transaction completes we'll try to
 	 * replenish again.  It's unlikely, but if we fail to supply even
-- 
2.32.0

