Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11EF92EB038
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 17:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbhAEQho (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 11:37:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbhAEQho (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 11:37:44 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE2BEC061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 08:37:03 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id a12so36764348wrv.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 08:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=PF1M4i3eJFGcGpF9DAdDv9Yckj7pk60Uyo8Jps0a91k=;
        b=t5hLj9Q3vakjnqhN0dIRJCwGv99R8ueJ9gfr4/1Xn2lC0XTg12i/qfqHkJfUr2w0r3
         3iUJ677Is6kyGLBAXH5mg73obdc5EiQscsQCBwelq6cCEWZx3E8xHxW8dKJriVCFPen5
         wqKROvQH6t0OIc2q8Eea+qa+zhO7SMpogHkc1GMnZckLoTNy8br6LqOvkzgMLt8WFAnH
         AsVw4Bx08B0xA5BScAepV7pYxjQec5VrDIFKo6y9pBDDse+rsdDyoSgU0loUVdS+1SQQ
         90tTzMBo47h+s78PyTXP2Mf0sDy3CSrjY+o9T4F2pU2P3JiNy3C8MaMfpsK7VaWSUwZZ
         zIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PF1M4i3eJFGcGpF9DAdDv9Yckj7pk60Uyo8Jps0a91k=;
        b=OFe6tRPU9h21WApGwfJhCWL393U8rZmkgVzEHB5lpsYyWgv5jxLcr1lsDMXL979UTX
         2akpTsTD9CjweuX14pXw4MRhQwZP0d9FPLJ4VVmzGoQ+SQb+4OwZmb4azQJ1xsNmVfT0
         K43QUpXWUW7XZ+68Yi6dZpEXzuAuqBl4/3ZyTAZOCTqvYH2cuT51DAmNPGVuMj+CCb1a
         2DzGls8wf0OMh/CkrQ93zKDFhFPWoJYkazW9DFXtIX0xhuPYSMZqw69aEWglFyXxj6VU
         NbkTCeMzq8nqVLq1mShv30DTAjVZs0XMDTOHANJFbzZ4o3bExZ2oHNbS+R15aH9qFfNl
         aUkQ==
X-Gm-Message-State: AOAM531naYwyvAiNA33jVShJF5siypS9MpnKcjvJEz5m6J7ZFKnS29k4
        IBgru+y6y95URJjUTFT7GB0PTeQ/HcsY0g==
X-Google-Smtp-Source: ABdhPJyAXaBzui4zVRyZHL3txVEkuqwC55Lmpj8o33P5jsu2BCuc/FOUCXqekhd6tPoDU72gEaJ4fw==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr447223wrn.122.1609864622553;
        Tue, 05 Jan 2021 08:37:02 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:2285:e92f:1a49:4891])
        by smtp.gmail.com with ESMTPSA id z3sm475801wrn.59.2021.01.05.08.37.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jan 2021 08:37:02 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 1/2] mhi: unconstify mhi_event_config
Date:   Tue,  5 Jan 2021 17:44:35 +0100
Message-Id: <1609865076-13890-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some parameters may have to be determined at runtime.
It is the case for the event ring MSI vector.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 v2: no change

 include/linux/mhi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 62da830..48b1b2a 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -290,7 +290,7 @@ struct mhi_controller_config {
 	u32 num_channels;
 	const struct mhi_channel_config *ch_cfg;
 	u32 num_events;
-	const struct mhi_event_config *event_cfg;
+	struct mhi_event_config *event_cfg;
 	bool use_bounce_buf;
 	bool m2_no_db;
 };
-- 
2.7.4

