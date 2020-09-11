Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 294DA265B41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 10:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgIKIOI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 04:14:08 -0400
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:43456
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725535AbgIKIN7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 04:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599812038;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=vt3MofETqalwqLZLDx4uPciFAkq5YtO458gX9NcGSGM=;
        b=JNkensoRoBEAHRExRYkpHx2tWlaTyuELEOqZiJ68Gh83prw+WCudLHg22WAG8ncH
        HlSt0vUong+tCJrMqRzemS95RnmuMHHyA+4PyAYtZzOVpUiAsRB/GuZXxtDN28F9UW7
        MqGfkndo0X9wjx2vz0oIB+ZkWAPnAFSMD0UOf5Cg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599812038;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=vt3MofETqalwqLZLDx4uPciFAkq5YtO458gX9NcGSGM=;
        b=HKJ0xUhXYgRj/gqy8D3VNvX9cJV+4axGQ1ZzK/ALob9li4gnPTQYx5gyoIF6CMjJ
        AdS8nH9oo7u5PpNy9yXbM1m12ap24lx/8Z7UtfoDI4QJHKFJmXMLtpE69gjo5FTJWzU
        gJQe+daKfrTkzTExp2nUvNVWLqpg/mPKCt/bsw0M=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 84E49C433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v1] bus: mhi: core: Add const qualifier to MHI config information
Date:   Fri, 11 Sep 2020 08:13:58 +0000
Message-ID: <010101747c3a6fdd-33efa632-e20c-476d-9e39-01cb1f2d1cea-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599812017-32680-1-git-send-email-hemantk@codeaurora.org>
References: <1599812017-32680-1-git-send-email-hemantk@codeaurora.org>
X-SES-Outgoing: 2020.09.11-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MHI channel, event and controller config data needs to be
treated read only information. Add const qualifier to make
sure config information passed by MHI controller is not
modified by MHI core driver.

Suggested-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/core/init.c | 12 ++++++------
 include/linux/mhi.h         |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index f69a2f3..d232938 100644
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
index 6b987e8..b2c0214 100644
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
@@ -545,7 +545,7 @@ struct mhi_driver {
  * @config: Configuration to use for the controller
  */
 int mhi_register_controller(struct mhi_controller *mhi_cntrl,
-			    struct mhi_controller_config *config);
+			const struct mhi_controller_config *config);
 
 /**
  * mhi_unregister_controller - Unregister MHI controller
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

