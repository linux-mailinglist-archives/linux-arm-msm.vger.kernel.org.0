Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC5AE2D99A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 15:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgLNOTV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 09:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440020AbgLNOTK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 09:19:10 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59189C0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:30 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id 91so16571886wrj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=geSRvMF6kCfgAVrxKSiIze0q0V64uiyFq2IRTDk+dkk=;
        b=Qn+uQp/daOJFLGBxEn+Jxi+2wPnCbhJ1FFJRxvdIhbweAMhsbXLSCLB6/fqlg0Z/8P
         MbUpEXd5hx16zzUB2ZZ8CYn6LHFaGfqy88rwSbfO952qInZj5ezYDKQeWMSZNyOhc4+n
         iv6pxPv32McWuWyt6Ny9H1STnA3msDs/wdYYkBRBm9Z+hxgkfDKRhaNrigP21C2u0gEa
         Tw5y5mtLe8oBad2cfXKRa7aCja/pF68rD3Kxab0wLZUwGIMx2obNhnXrD7KwXhpu+4jN
         bliT5lwPB/rZXDHYjL6pNm4Izc8977zB/vAtqw9oQhK56a0Eq1DdtvRbuUaHsZhlI/vA
         /rEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=geSRvMF6kCfgAVrxKSiIze0q0V64uiyFq2IRTDk+dkk=;
        b=BcPfM65pqfyCIpcvoVuwowjibF+axug8h6Pf29n+pyDIyM3zdlYpqk9M4J7EY7MeBW
         dA7S7Z5GVZly938pPLNvO4cSg24Yhe/ommg18TjlEnnoEphutWTId2J/ZQj158Bni6r1
         ER7UInNky6eosTRr/AK6FJ0Tek4cVy7U3VDJopRB/RPn5GmVVDJ1+z+snhrJ0Wq3mITf
         2HE4SeNOy02KgpQJbl4O4BQiLyCsglXsrMltZUEyz4L4cUHIPVtWj3xnn2mThjrS6GqN
         8X54TPZoiCHY7c9qCQ1dKTzR7n7d7K9ZbWAOGnWItFqOrsBhs219XUouJKnzaeMel58T
         V3nA==
X-Gm-Message-State: AOAM530FnckByinzZwnta2ezfVvi3bm4SkgTw8iFW2BMi4ZsQ9b5NUQe
        ktsONO6vUadV0vp4KNxCrEa9tw==
X-Google-Smtp-Source: ABdhPJyOtBLS6bR005nwCuxoIITJbmXp7ksih4OtojkViLrFbefucVqpQ/OvUvwnWg1jwIHDWZXd3w==
X-Received: by 2002:adf:ee4a:: with SMTP id w10mr27351982wro.81.1607955509003;
        Mon, 14 Dec 2020 06:18:29 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f2e4:25b3:2b53:52cd])
        by smtp.gmail.com with ESMTPSA id h5sm34126285wrp.56.2020.12.14.06.18.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Dec 2020 06:18:28 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 01/10] mhi: Add mhi_controller_initialize helper
Date:   Mon, 14 Dec 2020 15:25:28 +0100
Message-Id: <1607955937-26951-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
References: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This function allows to initialize a mhi_controller structure.
Today, it only zeroing the structure.

Use this function from mhi_alloc_controller so that any further
initialization can be factorized in initalize function.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/init.c | 6 ++++++
 include/linux/mhi.h         | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 96cde9c..a75ab8c 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1021,6 +1021,12 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_unregister_controller);
 
+void mhi_initialize_controller(struct mhi_controller *mhi_cntrl)
+{
+	memset(mhi_cntrl, 0, sizeof(*mhi_cntrl));
+}
+EXPORT_SYMBOL_GPL(mhi_initialize_controller);
+
 struct mhi_controller *mhi_alloc_controller(void)
 {
 	struct mhi_controller *mhi_cntrl;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 04cf7f3..2754742 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -537,6 +537,12 @@ struct mhi_driver {
 #define to_mhi_device(dev) container_of(dev, struct mhi_device, dev)
 
 /**
+ * mhi_initialize_controller - Initialize MHI Controller structure
+ * @mhi_cntrl: MHI controller structure to initialize
+ */
+void mhi_initialize_controller(struct mhi_controller *mhi_cntrl);
+
+/**
  * mhi_alloc_controller - Allocate the MHI Controller structure
  * Allocate the mhi_controller structure using zero initialized memory
  */
-- 
2.7.4

