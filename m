Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE839271BDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 09:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgIUHbO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 03:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgIUHbO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 03:31:14 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F23C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 00:31:13 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id w5so11568810wrp.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 00:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=E9uK6cUKZvYaOC1SO2xlC3K+A737Lj7EsUdN8ZvLlkQ=;
        b=A5IkbEuhkIu7q9pLhz2cRNtfeZKzP/rs30nYcFuavg7GJY0TTqHGNcxv1VLJKd07NY
         BQ3cGhN1k7l8t5weJlT7brQ6nctnX6X+99VsazEQrZxv1RIUayk0u6Nqf8aycEmk45MQ
         LlCx+CCGRbxc61+DiybyNbCUDSm7XHtPFz8wAR1HoIYHn710RVmp2KfM3+d/Z6cxql3l
         i/KvfFGPmccT3qGoM/HK8lflUJpcWa4X+KWidv226myeolmDRVEWbjdaQwG56Ss8lUqQ
         JBFphIFTwrRBONtyl2RyswULF4asxSuy22yekRK4zStsZ3iu9+AVPvPHVckRf61MArUG
         WxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=E9uK6cUKZvYaOC1SO2xlC3K+A737Lj7EsUdN8ZvLlkQ=;
        b=JtYCXR7+hcYiD7BclTKP/atJUSwHqZq4TcyZe0NlsX4AfvGS8wJ3mq5eGEGZFef5be
         Rd7EiQQEjKmp9YDc8jtEmZ03MNK0ynrD1TtSkeWiOiCKv0kgiBEi1c2EO05DiPYzSUu9
         e59z4RcvGTVLXQsGEzVG6vD3aCKI2IvyADoGqnrIAHZEbLPuJkAQWo+FGRxG7gI/6Q0v
         77uZTQwT/Uy69V8xgSpe/St9+qmsbCCVPDK6y2JZ5ppZgeiKF9A/XLWXcBV5u7RBck1o
         1/1yMd0J5V2b1rjybdV8CKNGZ6RiHsF8peGkg9UExwnMzw1Ll35csO1LXHhh3sicu7Af
         2OKQ==
X-Gm-Message-State: AOAM532g5Lyu5yyvxWgfia0hRydMiOJ7096ejNk63ugaOlK48jfpjuc+
        YP5tRse5KRXeD+Aqi8z0mv8vag==
X-Google-Smtp-Source: ABdhPJwW4j10XVwNTtKtXR6vJevIyL58H2NTaF1wEzJtHRwToXYBdm+5Y1eY0FRh3434W/NDRexjRw==
X-Received: by 2002:adf:e8ce:: with SMTP id k14mr54538631wrn.394.1600673472457;
        Mon, 21 Sep 2020 00:31:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:490:8730:5875:9da3:b857:e7f4])
        by smtp.gmail.com with ESMTPSA id u13sm18331995wrm.77.2020.09.21.00.31.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 00:31:12 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        clew@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 2/2] bus: mhi: Remove unused nr_irqs_req variable
Date:   Mon, 21 Sep 2020 09:36:59 +0200
Message-Id: <1600673819-1698-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600673819-1698-1-git-send-email-loic.poulain@linaro.org>
References: <1600673819-1698-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

nr_irqs_req is unused in MHI stack.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: add this patch to the series

 drivers/bus/mhi/core/init.c | 3 ---
 include/linux/mhi.h         | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 31961af..8798deb 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -643,9 +643,6 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
 		mhi_event++;
 	}
 
-	/* We need IRQ for each event ring + additional one for BHI */
-	mhi_cntrl->nr_irqs_req = mhi_cntrl->total_ev_rings + 1;
-
 	return 0;
 
 error_ev_cfg:
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 742dabe..0d277c7 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -309,7 +309,6 @@ struct mhi_controller_config {
  * @total_ev_rings: Total # of event rings allocated
  * @hw_ev_rings: Number of hardware event rings
  * @sw_ev_rings: Number of software event rings
- * @nr_irqs_req: Number of IRQs required to operate (optional)
  * @nr_irqs: Number of IRQ allocated by bus master (required)
  * @family_number: MHI controller family number
  * @device_number: MHI controller device number
@@ -389,7 +388,6 @@ struct mhi_controller {
 	u32 total_ev_rings;
 	u32 hw_ev_rings;
 	u32 sw_ev_rings;
-	u32 nr_irqs_req;
 	u32 nr_irqs;
 	u32 family_number;
 	u32 device_number;
-- 
2.7.4

