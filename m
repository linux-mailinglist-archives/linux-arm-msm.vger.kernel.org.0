Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE35227D515
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 19:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgI2RxQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 13:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728519AbgI2RxP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 13:53:15 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC539C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:15 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id z19so5302801pfn.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jNx5jfKYWZGFzKUONheqZrKSOvFz+O7hWeUKgyZ6/3A=;
        b=EcOfnwcIhZmkg8YtKqupJtE6kqkv1F1JlgYrWpsbRQhuV48lQOWqLZuawvW8eN8vmE
         nYduKuwcGC5oi+NX8M2N7XYBQgmP3aa5s2Jhuxkr2pcr6zIwZ8q8tZ4/bi+tNCjkMBMl
         DUTCVnnRmCMU0uFr5M9qud6HasU3LGq1uDXF9oXMCjxCyuMmSyvYLbwv9sRhYLOHPTwz
         CdRHiD+XHE8pIDaSlaCR03i7M/I6xeforlG7UVvOq/k/n8lsubiUoO8ESKpzqA/q6+ws
         3QKJ8swzHL6L27YMEJi7gws9x+nyk9i/WyoRFEEx9aaXvLfByHGgXzEk7ZE2j6Cmb265
         0IAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jNx5jfKYWZGFzKUONheqZrKSOvFz+O7hWeUKgyZ6/3A=;
        b=DgQVmkIx03ggCAotOAGOCiRZf6tk5m/nTE94gsaqNF6m9R/VrPvon8mGGMSQT200Pt
         RhVprGScUKoMhEebGVjy/yptivIewzXUeKDZiqVJyRLtdgGf4xMejpJm1vjCE8yN/WlF
         8anxEs4E3c9K2BDvkbxROAvrE1GZ2qnW8iPGn3aRCc6ytr0jXNJriyxlPFxEnDf3cnS/
         BFhtV+YcBmIfraRxTBafyTj1gllJ0CkC4rBCPtvLWetTbq2ny3UhifySM+VMngk1pa1Q
         0+8Hj6C6UIV4UeNhsngpWJIClYlDCLw4Zl+B335bagm2BUPuSMOFV6QkT/uBXo5+M9iE
         OPeg==
X-Gm-Message-State: AOAM530N/pkTpRuj8GklMI8aoWqTq1VCkBmA1zSl7hm6zD3nAIiOW0U3
        O8MZ8VDghjD0ZftQgfS3rvaY
X-Google-Smtp-Source: ABdhPJzpvHisS1PdUoNs7JTrdToLTpc1i8Nmo9aXjx7gsfueAtDo2tvU/rP+p0YFXCbo8E6SbBBT/g==
X-Received: by 2002:a65:5647:: with SMTP id m7mr4171265pgs.327.1601401995324;
        Tue, 29 Sep 2020 10:53:15 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id r188sm6271046pfc.67.2020.09.29.10.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 10:53:14 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 11/19] bus: mhi: core: Add const qualifier to MHI config information
Date:   Tue, 29 Sep 2020 23:22:10 +0530
Message-Id: <20200929175218.8178-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
References: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

MHI channel, event and controller config data needs to be
treated read only information. Add const qualifier to make
sure config information passed by MHI controller is not
modified by MHI core driver.

Suggested-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 12 ++++++------
 include/linux/mhi.h         |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index f69a2f3d039d..d23293876be8 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -562,10 +562,10 @@ int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
 }
 
 static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
-			struct mhi_controller_config *config)
+			const struct mhi_controller_config *config)
 {
 	struct mhi_event *mhi_event;
-	struct mhi_event_config *event_cfg;
+	const struct mhi_event_config *event_cfg;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	int i, num;
 
@@ -648,9 +648,9 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
 }
 
 static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
-			struct mhi_controller_config *config)
+			const struct mhi_controller_config *config)
 {
-	struct mhi_channel_config *ch_cfg;
+	const struct mhi_channel_config *ch_cfg;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	int i;
 	u32 chan;
@@ -766,7 +766,7 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
 }
 
 static int parse_config(struct mhi_controller *mhi_cntrl,
-			struct mhi_controller_config *config)
+			const struct mhi_controller_config *config)
 {
 	int ret;
 
@@ -803,7 +803,7 @@ static int parse_config(struct mhi_controller *mhi_cntrl,
 }
 
 int mhi_register_controller(struct mhi_controller *mhi_cntrl,
-			    struct mhi_controller_config *config)
+			    const struct mhi_controller_config *config)
 {
 	struct mhi_event *mhi_event;
 	struct mhi_chan *mhi_chan;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 6b987e8cc438..b2c0214bfbd6 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -280,9 +280,9 @@ struct mhi_controller_config {
 	u32 timeout_ms;
 	u32 buf_len;
 	u32 num_channels;
-	struct mhi_channel_config *ch_cfg;
+	const struct mhi_channel_config *ch_cfg;
 	u32 num_events;
-	struct mhi_event_config *event_cfg;
+	const struct mhi_event_config *event_cfg;
 	bool use_bounce_buf;
 	bool m2_no_db;
 };
@@ -545,7 +545,7 @@ void mhi_free_controller(struct mhi_controller *mhi_cntrl);
  * @config: Configuration to use for the controller
  */
 int mhi_register_controller(struct mhi_controller *mhi_cntrl,
-			    struct mhi_controller_config *config);
+			const struct mhi_controller_config *config);
 
 /**
  * mhi_unregister_controller - Unregister MHI controller
-- 
2.17.1

