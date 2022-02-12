Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFA64B3716
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Feb 2022 19:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbiBLSVx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Feb 2022 13:21:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiBLSVv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Feb 2022 13:21:51 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED16254189
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Feb 2022 10:21:47 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id c5-20020a17090a1d0500b001b904a7046dso13458062pjd.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Feb 2022 10:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x7DQ/ZJ2gQOCs8afpwgV3IUsPGlYg0pNNMCW2zNhUO8=;
        b=WYLrcsL4z93Z79+6TZmR1sVn94tNgubl+JfaCtqejObohJL+hcAyUh2RWSDzlpwEr+
         1lsptBo9XrX0q94C9ENxJCybs2WAo4k5EOvR2VFZV6JhrIxtDcaX6hlxryb1/gWwI5c9
         3JyBQDEXfL5LwEbsdEbQj1/4nfsSZ3/ZEEEtdOaZhYjrLXIEkCGc8l2X3KYPqgAgR2re
         piR+uv8ZxFo9C1Z9rN07f1KomwTl/RO2BMuQZI3tvXo1XOg8+GVlyCxfbP0kEYpBk8L5
         1tjo/7gSqaywFI9hP8JPaAgTNsNA8v7gZC2cRTgu5CweLwyer/c1iy2df/nq9sJ9W0q1
         zPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x7DQ/ZJ2gQOCs8afpwgV3IUsPGlYg0pNNMCW2zNhUO8=;
        b=T3ay2zy/yl72ntMyMojVebGUMAiAaBNV7ldxOA+axaRPC/hvj/pQFdMtXBAjUL1xnQ
         s7t/xGSYO90pG6btvyMbzNObq3rFvYdod4sfIMDOWSSecd8LGYTsDJX7tGkUQ5T2GVpZ
         rJPbO1T9tf70ociINoIfbRmnKcbGaY9U6pgVkM/XelV3g9D/mlCK4kJ5qw2Yt3QVnbsz
         mZE3fmhE6o1tS5hy1mlkPU8D7PKJXgp6uFQ5fQDZX0B26SyhNCW1SRYa+jcp+/2UZR55
         NUG0HpbKIrvPK1OZb6Nan1pyaUeNyZKyOzee+Ybs5kYgq+Nt93y1/XpIKmhTldUjAF/o
         86qQ==
X-Gm-Message-State: AOAM530jBORCgJ0pOr2HaZF5+Iu3N2Yl0eZVudtv08+FAKo6yLcvgE1v
        WZ5A4OWzRsjcpWTsgIQg32nw
X-Google-Smtp-Source: ABdhPJwjJuEzA3rG6VR1TZ2r3vKn3OMJXR3L5Y4wVNt3Gz785c7ZEDqOc9RN+ePb0Lq/fNq4vW0iPw==
X-Received: by 2002:a17:902:bcca:: with SMTP id o10mr6894783pls.147.1644690107434;
        Sat, 12 Feb 2022 10:21:47 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.57])
        by smtp.gmail.com with ESMTPSA id g12sm14961987pfj.148.2022.02.12.10.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 10:21:47 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        quic_vbadigan@quicinc.com, quic_cang@quicinc.com,
        quic_skananth@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, elder@linaro.org,
        Paul Davey <paul.davey@alliedtelesis.co.nz>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>, stable@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 01/25] bus: mhi: Fix pm_state conversion to string
Date:   Sat, 12 Feb 2022 23:50:53 +0530
Message-Id: <20220212182117.49438-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Paul Davey <paul.davey@alliedtelesis.co.nz>

On big endian architectures the mhi debugfs files which report pm state
give "Invalid State" for all states.  This is caused by using
find_last_bit which takes an unsigned long* while the state is passed in
as an enum mhi_pm_state which will be of int size.

Fix by using __fls to pass the value of state instead of find_last_bit.

Fixes: a6e2e3522f29 ("bus: mhi: core: Add support for PM state transitions")
Signed-off-by: Paul Davey <paul.davey@alliedtelesis.co.nz>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Cc: stable@vger.kernel.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 046f407dc5d6..af484b03558a 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -79,10 +79,12 @@ static const char * const mhi_pm_state_str[] = {
 
 const char *to_mhi_pm_state_str(enum mhi_pm_state state)
 {
-	unsigned long pm_state = state;
-	int index = find_last_bit(&pm_state, 32);
+	int index;
 
-	if (index >= ARRAY_SIZE(mhi_pm_state_str))
+	if (state)
+		index = __fls(state);
+
+	if (!state || index >= ARRAY_SIZE(mhi_pm_state_str))
 		return "Invalid State";
 
 	return mhi_pm_state_str[index];
-- 
2.25.1

