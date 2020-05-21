Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE2E1DC6D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 08:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgEUGEl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 02:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728154AbgEUGEc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 02:04:32 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9FF7C061A0F
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 23:04:31 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id b190so2827645pfg.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2020 23:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sLzO6AaZGCnFvcbXowTQDfE+AbORO1+b/Wmhk6/yp2A=;
        b=d46jY1WiNtT+TTR21OXzy5EmRyieh4DSvvJyo4Pt9onu1LVvN5WX7HqqGHlVtCkYiM
         qpTUN6CWnGDj/SSaJU9fR9nH1q/oXTrWJ5pDLU48kVqqgxIrvWSp2QHDecMw2dMXOpvm
         mdUOyOiOa2uvTJ7Dd3pD3CR4rAxxOLpxPPcMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sLzO6AaZGCnFvcbXowTQDfE+AbORO1+b/Wmhk6/yp2A=;
        b=Pha8iaCsop2kE9mFNHfiqi7Zq+AX2JQQqLnPMf1YnIWKzEBb/CZmLyLBMN0AWl4XDV
         f923m8HO9JNYojIpLCZM3cK0i6xDE4aB/CejsG5nY8vXAHiVYAiOqg19LG3jOW7RA54g
         DLpb1bGmZOsrsZE7kOCmIdyGWIwXvkSIV9GvnF6fI+6pHrkqRsRAbYHBf/extDqzp8B7
         sXYwKhr5b1oiNX15vk88wKFgtW5f3D7m6E+24nyj1OW4MxSHbGILyGlDs79jJaAuOl8d
         ebGU+n+xDXrPFqN3vxfKJ+Zo5L/XnyuUOawKL20E7mSrTlMj16K51KBtqrdMNcq3q/gO
         tr2w==
X-Gm-Message-State: AOAM530LGkEUauOnxlq7R+cbYWfJi1hwG0bzjTtEk6FnPDP/76zHIS13
        Zz6LzZxLBhy5WfTt6PnSDjxhNg==
X-Google-Smtp-Source: ABdhPJwf9qox/9THRWrVH/q8CLC1R6TYC7rokcoVy4IkUl256gHyoo6tmtWgxWBt79QrqAYoEf1Fhg==
X-Received: by 2002:aa7:9297:: with SMTP id j23mr7693039pfa.15.1590041071392;
        Wed, 20 May 2020 23:04:31 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k18sm3590146pfg.217.2020.05.20.23.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 23:04:30 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCHv3/RESEND 3/3] soc: qcom: rpmh-rsc: Fold WARN_ON() into if condition
Date:   Wed, 20 May 2020 23:04:25 -0700
Message-Id: <20200521060425.24285-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
In-Reply-To: <20200521060425.24285-1-swboyd@chromium.org>
References: <20200521060425.24285-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the WARN_ON() into the if condition so the compiler can see that
the branch is unlikely() and possibly optimize it better.

Cc: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/rpmh-rsc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index ce725d4ff097..8381bd012de4 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -385,10 +385,8 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 
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

