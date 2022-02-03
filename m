Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBE84A8974
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 18:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352555AbiBCRJy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 12:09:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352543AbiBCRJo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 12:09:44 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3480C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 09:09:38 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id m17so2617759ilj.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 09:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1KdZcajVjZgu+pEXQdk/RqI6U+J/OtZyImbF73oIsC8=;
        b=KVWM6AxxBaFX120lVv/FXvzsCdVidVZoQu+22yzFauzaZQF1Pg1OdEpW31fiL681Sr
         A7xzZzpI+hh5O7jcnoPyIu8eSkZVNzCheS42OQ7v/WIYCyjv9ykLe6r0JIvgxyOETkol
         DTDRgTu4YPvUcs7/Jpg73VQobIfJxuDpVLmL4Pgmi3F46B8OWBUm3VUrZnNRlkWI6TUq
         +cXGeiEFgxq2V4E1kxeh+cH/ePUL8FHRjMOcwJRUD4PndHvTZMctDK8L2lDVavCIhl52
         jWOyACDSFQJjZu/0ZwJ2XBd5pUxyICq2teLbH7zwRk0jjrg2kI2jWsUo/q6KiP91FZEX
         YhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1KdZcajVjZgu+pEXQdk/RqI6U+J/OtZyImbF73oIsC8=;
        b=wFSqykw10z11FJrgnUgS46u9u5AV3yS1A6BjSMhmExgAUgr3jO4ZfdNAQIBwqLCBLf
         pCpN2UJW0mgEvfhkjamwijOZgBDQX2i2MXAZGBvD6l8wp3C5ULvFCjByMPiP3MZLgl2I
         47NBIixwA/Z2pt2Y7fZ9RlaaynHKSCS8MdQCGf0FMUeunybppcAfaHlPjlS69ukp/gzw
         7fKDZZU3s9B4JbNCLuGXcwXshpbCEHH8Fi4X+PNkETjAje684yjjukrZMjb4Rz0nY6W2
         iJTisNrOGuu4vHkL8ga2eqfiuLQrBibRpFMHNkVIgFfjTa0G45jHk3KK+DrpEEAOsqcE
         5Xng==
X-Gm-Message-State: AOAM530jwgnughuSlJYU9RR/uSc5HuHHrDttx1yIFVyv+29nTIEW+C35
        7AuLUGJLRwqLl0P65TJoEAcqkQ==
X-Google-Smtp-Source: ABdhPJyZ6j2FHUvUiFHZhhEM1xkxbWU88BM9dMz889OeLePYeoqwj8yUiVMMWjVT1AuBOM0Y7HVQoA==
X-Received: by 2002:a05:6e02:2185:: with SMTP id j5mr4789378ila.298.1643908178290;
        Thu, 03 Feb 2022 09:09:38 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id m12sm21869671iow.54.2022.02.03.09.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 09:09:37 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     bjorn.andersson@linaro.org, mka@chromium.org, evgreen@chromium.org,
        cpratapa@codeaurora.org, avuyyuru@codeaurora.org,
        jponduru@codeaurora.org, subashab@codeaurora.org, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 04/10] net: ipa: decide on doorbell in replenish loop
Date:   Thu,  3 Feb 2022 11:09:21 -0600
Message-Id: <20220203170927.770572-5-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220203170927.770572-1-elder@linaro.org>
References: <20220203170927.770572-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Decide whether the doorbell should be signaled when committing a
replenish transaction in the main replenish loop, rather than in
ipa_endpoint_replenish_one().  This is a step to facilitate the
next patch.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_endpoint.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index 060a025d70ec6..274cf1c30b593 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -1036,10 +1036,10 @@ static void ipa_endpoint_status(struct ipa_endpoint *endpoint)
 	iowrite32(val, ipa->reg_virt + offset);
 }
 
-static int ipa_endpoint_replenish_one(struct ipa_endpoint *endpoint)
+static int
+ipa_endpoint_replenish_one(struct ipa_endpoint *endpoint, bool doorbell)
 {
 	struct gsi_trans *trans;
-	bool doorbell = false;
 	struct page *page;
 	u32 buffer_size;
 	u32 offset;
@@ -1064,11 +1064,6 @@ static int ipa_endpoint_replenish_one(struct ipa_endpoint *endpoint)
 		goto err_free_pages;
 	trans->data = page;	/* transaction owns page now */
 
-	if (++endpoint->replenish_ready == IPA_REPLENISH_BATCH) {
-		doorbell = true;
-		endpoint->replenish_ready = 0;
-	}
-
 	gsi_trans_commit(trans, doorbell);
 
 	return 0;
@@ -1104,9 +1099,17 @@ static void ipa_endpoint_replenish(struct ipa_endpoint *endpoint)
 	if (test_and_set_bit(IPA_REPLENISH_ACTIVE, endpoint->replenish_flags))
 		return;
 
-	while (atomic_dec_not_zero(&endpoint->replenish_backlog))
-		if (ipa_endpoint_replenish_one(endpoint))
+	while (atomic_dec_not_zero(&endpoint->replenish_backlog)) {
+		bool doorbell;
+
+		if (++endpoint->replenish_ready == IPA_REPLENISH_BATCH)
+			endpoint->replenish_ready = 0;
+
+		/* Ring the doorbell if we've got a full batch */
+		doorbell = !endpoint->replenish_ready;
+		if (ipa_endpoint_replenish_one(endpoint, doorbell))
 			goto try_again_later;
+	}
 
 	clear_bit(IPA_REPLENISH_ACTIVE, endpoint->replenish_flags);
 
-- 
2.32.0

