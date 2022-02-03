Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBD794A8975
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 18:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352532AbiBCRJu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 12:09:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352530AbiBCRJp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 12:09:45 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A1BC061758
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 09:09:41 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id d3so2630453ilr.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 09:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lgsdnCvj6CM3pv7GIi7Q7qxhb/rwEQOt/gAxMz7ESwo=;
        b=CV9xhfZ4p0xRwN3tI5jIW7vkfasMn89uQPYfbgfEIRzmhSKWGFDIibcLrUd/XAE3LZ
         9lFBSDFl0HyFQ+r4NXc0NEMLC5cCgKDBQGtn3cM5IOwKhQuc2JSmeKxGagNlE4aB3u2T
         PrhktKmmbfJVOJAVYd2p8dyo9PwwgWdtRq5T7KFMFaFotAiOlBySMnyG7pMF0Nku1WtA
         4aKtoEYGT3s49glN2KXpPDtnWNe5E0+B0h/lripFYoNBWssVkWBZjwfYUmTdDvquEsKe
         PDqu8waRlxXthYp99P9TfH+I350rX0bJujYbjqOjnysdEcf6CaKeKAzBqMvD34eohO94
         RGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lgsdnCvj6CM3pv7GIi7Q7qxhb/rwEQOt/gAxMz7ESwo=;
        b=aQ62Y01+A3SULAWnUf2q12Lf0mTWuEo5c9BPI1n8IyFczKCSkDd0dBTraeONPSDXEV
         2W6eEoOfMDNiiuNdPxG5ZSAQ1tfTj1SWJa+3iRuPbX1qZjDJb4OVnJKo7mUdRqCknL5D
         PlLcYzjNB/widcbAQE+4JJ7CjqmGZBS3tdnPjbt0u2SXkvsP/qAWBtyapsRDVAcn+i+P
         dMtrQ9QRP5KHRCEMeEAfrjtlsv4/7UTaoS+VPpediCceUAFQydFP16qsSdhMgEzMqyBK
         +WleC5U/eVJdevue6PoFo/77riPI/4WjcDseWIJ2oZfELJoTkLqgy7GL7ZQN8ORj8TRh
         pAcw==
X-Gm-Message-State: AOAM532LbGOakR3pGwzUxytJ33hE4NAQNXcDzTiSygb6i0Kcoj+d+Nay
        QUmCVMyeu9YSpZCOIuTFq51S1Q==
X-Google-Smtp-Source: ABdhPJwPNHidFImaNmF7P2maK7ImXz0odBg3rq1AugQJbNWk9HprTIkONp3Cqhoc/6JALaNpiRutLw==
X-Received: by 2002:a05:6e02:1946:: with SMTP id x6mr5642505ilu.236.1643908180968;
        Thu, 03 Feb 2022 09:09:40 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id m12sm21869671iow.54.2022.02.03.09.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 09:09:40 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     bjorn.andersson@linaro.org, mka@chromium.org, evgreen@chromium.org,
        cpratapa@codeaurora.org, avuyyuru@codeaurora.org,
        jponduru@codeaurora.org, subashab@codeaurora.org, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 06/10] net: ipa: don't use replenish_backlog
Date:   Thu,  3 Feb 2022 11:09:23 -0600
Message-Id: <20220203170927.770572-7-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220203170927.770572-1-elder@linaro.org>
References: <20220203170927.770572-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than determining when to stop replenishing using the
replenish backlog, just stop when we have exhausted all available
transactions.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_endpoint.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index f5367b902c27c..fba8728ce12e3 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -1087,11 +1087,8 @@ static void ipa_endpoint_replenish(struct ipa_endpoint *endpoint)
 	if (test_and_set_bit(IPA_REPLENISH_ACTIVE, endpoint->replenish_flags))
 		return;
 
-	while (atomic_dec_not_zero(&endpoint->replenish_backlog)) {
-		trans = ipa_endpoint_trans_alloc(endpoint, 1);
-		if (!trans)
-			break;
-
+	while ((trans = ipa_endpoint_trans_alloc(endpoint, 1))) {
+		WARN_ON(!atomic_dec_not_zero(&endpoint->replenish_backlog));
 		if (ipa_endpoint_replenish_one(endpoint, trans))
 			goto try_again_later;
 
-- 
2.32.0

