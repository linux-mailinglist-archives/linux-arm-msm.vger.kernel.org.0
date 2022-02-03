Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B31F74A8963
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 18:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352597AbiBCRJu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 12:09:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352564AbiBCRJq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 12:09:46 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B594C061744
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 09:09:45 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id c188so4059663iof.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 09:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tAfEVLznrjK0PtYMLtCgziZc4mTACQEXidJQ/KE2jWY=;
        b=yZXqiS+hm8Gx5qlSKY/A/sgA85RRPqOyySx9Zj/R3KCPmp6dflOWos+SEuayk2GODs
         gdOKNDI+EaJFQ1EHQ0l65g/3YAFZtQ2eYHhvcTKqgo0kgcxlxT3AJhvCuRGxLkXrqgNb
         CeT0N8fx3mScLoWIEePe6bBzzHRmCyEjLflzV3l7Cu+FACOFzxXDJS2x+1i9sSuZVSof
         b0NT+dH7N4ftYE3FMORiF6H2QlfUQ0G5cQL0sNR9QQ62vbkX5i5lsEc0IwLItG2+3Xr3
         Qw1F0GkzpMp12qMTm8xNDg8uAQO0KJXb2n4qhMleKoTKM1mZTH1WhNEgLZuHFyq5ta/0
         4BXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tAfEVLznrjK0PtYMLtCgziZc4mTACQEXidJQ/KE2jWY=;
        b=r4Q23OfS7AavjznjobcI6HA/wlwZTeWNsQCLQehA9i65TWt/ypHJvIu4/dmxR1qUF5
         82+LYkb1wgbJbdPJvBmoBXfOHkHAtsg1Dino4gERCkCL70L93ZHQCZ5xYfYqGyXfYsb7
         3T+ycPiZuEFbrAVUxOC2W9rN/HOomOuiUt57WvwpsRpBD/NAx76FSMjExp2iBYRIhp+0
         4t3fLBusR+jEiH4G6ZRpxx76Wla2290cyFNKUeF0qRDEx/yRymIC8PnrCsFyZ1FDVl0Z
         HOrMdQCeLFNNpTR2PjaaGwHxbdUM3GIZXxOsi9+CAXFKsPp+QgIEVyMWFuuDjqAtEHKw
         58Qg==
X-Gm-Message-State: AOAM531qSN89G/UcFcEE4fGaJUyvEez9dbUqXjdYf3XeZHpzuVDqDc9f
        K4FcBOuhNWjUctKCud1e+wq5VQ==
X-Google-Smtp-Source: ABdhPJwJNPGh91oli2FBotsMWPYmloSMBeib+F2xqeaNrurxsViPy4ZuXVtrNPHOWQtjmzIbfkQDCA==
X-Received: by 2002:a02:6303:: with SMTP id j3mr18506808jac.292.1643908184957;
        Thu, 03 Feb 2022 09:09:44 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id m12sm21869671iow.54.2022.02.03.09.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 09:09:44 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     bjorn.andersson@linaro.org, mka@chromium.org, evgreen@chromium.org,
        cpratapa@codeaurora.org, avuyyuru@codeaurora.org,
        jponduru@codeaurora.org, subashab@codeaurora.org, elder@kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 09/10] net: ipa: replenish after delivering payload
Date:   Thu,  3 Feb 2022 11:09:26 -0600
Message-Id: <20220203170927.770572-10-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220203170927.770572-1-elder@linaro.org>
References: <20220203170927.770572-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replenishing is now solely driven by whether transactions are
available for a channel, and it doesn't really matter whether
we replenish before or after we deliver received packets to the
network stack.

Replenishing before delivering the payload adds a little latency.
Eliminate that by requesting a replenish after the payload is
delivered.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_endpoint.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index 9d875126a360e..a236edf5bf068 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -1341,10 +1341,8 @@ static void ipa_endpoint_rx_complete(struct ipa_endpoint *endpoint,
 {
 	struct page *page;
 
-	ipa_endpoint_replenish(endpoint);
-
 	if (trans->cancelled)
-		return;
+		goto done;
 
 	/* Parse or build a socket buffer using the actual received length */
 	page = trans->data;
@@ -1352,6 +1350,8 @@ static void ipa_endpoint_rx_complete(struct ipa_endpoint *endpoint,
 		ipa_endpoint_status_parse(endpoint, page, trans->len);
 	else if (ipa_endpoint_skb_build(endpoint, page, trans->len))
 		trans->data = NULL;	/* Pages have been consumed */
+done:
+	ipa_endpoint_replenish(endpoint);
 }
 
 void ipa_endpoint_trans_complete(struct ipa_endpoint *endpoint,
-- 
2.32.0

