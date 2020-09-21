Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535AF272B26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 18:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgIUQKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 12:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgIUQKk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 12:10:40 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B73FC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:10:40 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o25so4504415pgm.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jNx5jfKYWZGFzKUONheqZrKSOvFz+O7hWeUKgyZ6/3A=;
        b=LzdCBSVsIZbg8EwXxwyxJP5SBlJdU8sfPtLhO9DKz7Qx6gL2BlwGCqUBv88BrT/lOJ
         wQN7w9tvbNZWd5AfQokR/ezQ95E9fvbwaLZb8N8TdwCmsNn/q1msTsR2dVAm3dbzF+Ou
         IzhrYJNFrpSdIUXbYtCp9HnniJ0jaS1my3BgMoziSOe7LKdt8dVqSuyuzCIqq8apMe3i
         k4r8TkOzPFzps1cJVfaWFcL5trVTM9pfeTEohs8MBgQQ2313M2U99ci8/V7/V9LLQwCW
         bi8IvVRG/J8zJM5MHE8fPIbsT2LCMFGb+zUoJF/vwVvo4rMSFe9uOFggjfddjAZQ6JnE
         XOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jNx5jfKYWZGFzKUONheqZrKSOvFz+O7hWeUKgyZ6/3A=;
        b=UyEEGmsLWzJA0qDbqsJCXHuww27xpHHPYgryMX38rSg059Uaga589ucx9hmzeoqwS5
         B11M+ib6V8QvJxyB9cCgoMyL+/0C5fNqqN3HJS4aqnvcODD56VD2sTC3TTH/CSuvrjdU
         YKbA6U6O40+vXMjlVx4xRRN/DuUhk9pcpkgIm9hEz6vn+GVREngu5n9Om919iPHArdyJ
         5Q3x7aiLBf4+lcruZmN0nRMiX5664ZJsNDPe5FHhYhzwV2qgQzA6jenOoNrNQxIkR77V
         KBWNFEe1hOMUKyMiJFijq21pxZq0HDjR84n6KPfN9s4v+gn8Qz+l8x8/S/Y2p0D4LgL5
         QHOA==
X-Gm-Message-State: AOAM533Lx6gHaQ+xuN/DjSn2F3dJv5vys52sGM42WhPobmt8qRDRevdY
        0n/vm0TXBbol+xuIiNB3g+0E
X-Google-Smtp-Source: ABdhPJyOwcOyAV3uHO339uG8sa9a/zsAgyRnHFQidQQUITv4rBBnFpBW3JRiwDZFcACc2rPhZIxYzQ==
X-Received: by 2002:a63:7f59:: with SMTP id p25mr306778pgn.146.1600704639764;
        Mon, 21 Sep 2020 09:10:39 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id f4sm9204577pgr.68.2020.09.21.09.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:10:38 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 11/18] bus: mhi: core: Add const qualifier to MHI config information
Date:   Mon, 21 Sep 2020 21:38:08 +0530
Message-Id: <20200921160815.28071-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
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

