Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D174E1B6CD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 06:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgDXEyV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 00:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbgDXEyU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 00:54:20 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE45CC09B047
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 21:54:18 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t16so3306510plo.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 21:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z/YsFv/10NhkBeiZjaV6l6O7A2swaX/eVpoeaYwPiNg=;
        b=VU1s+LT31TEalxhE+dHeMgtEMRrST5oIP96hg6VW4pHGnP+qE7kUxu38tEe52CypLI
         xuKf3XnGnEDYe3ajNmaDD67pxCiXLlDvRJ5Fxn4hSq61lETE0fcgJ4nc9BHFQegGTQZk
         Q6saQBat6gqeg9CpStPfAtuouhMP8wx4u6uhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z/YsFv/10NhkBeiZjaV6l6O7A2swaX/eVpoeaYwPiNg=;
        b=OO9I5VgA9+KgAVHSMJHaNXo6SF60by82BkN+WAR5UkWrNn3WAyL6vETTAums2xPV0k
         1fv50FjtXPOdWYFGLXR2FE25mIjG1ostrvhV6znzjRwsWHeheeSpaIPx7n8dOMlM96qD
         Xz/WBdDdPFFte5iZqCJd1VRuPSTtw6ex9eoRj5RmINyGy0g6PB8PfChOM4sbHGfqme84
         em2qBVhPBsVX88WLaTjLjCl6jDZkcOsESu63pfrJyWI77zlV7b4sRZ1t+OcrfDVXHR7V
         Sab/gwWTAHTIdJdyz8zxhPUlbkel3+VJq/2XDI4M/kBsAn6j+2EuV6D97YP0hNsq5cLI
         yFwQ==
X-Gm-Message-State: AGi0PuaHmNpCzuzMkdVJQumBlCjSYvKOYKcUxixQHYb6mR+N1sx/4cq8
        KOqaE3W+bco3mvjSwfOU54kqFQ==
X-Google-Smtp-Source: APiQypI6m7J+NqwxX2iu4a6RtckM854S3bBsQf98LAgWiQRqbCtnJRyA11TOuBgHg51CtgGWm2KTmQ==
X-Received: by 2002:a17:902:7148:: with SMTP id u8mr6922882plm.13.1587704058295;
        Thu, 23 Apr 2020 21:54:18 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 62sm4344680pfu.181.2020.04.23.21.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 21:54:17 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 3/3] soc: qcom: rpmh-rsc: Fold WARN_ON() into if condition
Date:   Thu, 23 Apr 2020 21:54:14 -0700
Message-Id: <20200424045414.133381-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
In-Reply-To: <20200424045414.133381-1-swboyd@chromium.org>
References: <20200424045414.133381-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the WARN_ON() into the if condition so the compiler can see that
the branch is unlikely() and possibly optimize it better.

Cc: Maulik Shah <mkshah@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/rpmh-rsc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 462dd267afef..f7763f008e03 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -373,10 +373,8 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 
 	for_each_set_bit(i, &irq_status, BITS_PER_TYPE(u32)) {
 		req = get_req_from_tcs(drv, i);
-		if (!req) {
-			WARN_ON(1);
+		if (WARN_ON(!req))
 			goto skip;
-		}
 
 		err = 0;
 		for (j = 0; j < req->num_cmds; j++) {
-- 
Sent by a computer, using git, on the internet

