Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73D9D2F6AB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 20:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729789AbhANTRl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 14:17:41 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:10340 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729055AbhANTRk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 14:17:40 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610651837; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=AerxyCQvjSul9+v/pE8w51B3sA7h7woNe2yHOobcxGc=; b=R4ImXRsSnXSdIajMRJGC9DpCB2/RuBIIv93tGfTE0RwGJdjueJ7FY2ChkuDhqv0lQ8MjO8xU
 9dIX1Mdww/ikAXoA6p+tdAiM7hZwe1V/y1OnPnySMiX/HJjX283su6NcpgKhNGQlRkEZTcrE
 UdzTpSx7cSl3MmtgmM2gcPT1UaU=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6000989d8fb3cda82f4a1839 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Jan 2021 19:16:45
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A0CDCC43463; Thu, 14 Jan 2021 19:16:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9886FC433CA;
        Thu, 14 Jan 2021 19:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9886FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 1/3] bus: mhi: core: Clear devices when moving execution environments
Date:   Thu, 14 Jan 2021 11:16:33 -0800
Message-Id: <1610651795-31287-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610651795-31287-1-git-send-email-bbhatt@codeaurora.org>
References: <1610651795-31287-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When moving from SBL to mission mode execution environment, there
is no remove callback notification to MHI client drivers which
operate on SBL mode only. Client driver devices are being created
in SBL or AMSS(mission mode) and only destroyed after power down
or SYS_ERROR. If there exist any SBL-specific channels, those are
left open and client drivers are thus unaware of the new execution
environment where those channels cannot operate. Close the gap and
issue remove callbacks to SBL-specific client drivers once device
enters mission mode.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 22 ++++++++++++++++++----
 drivers/bus/mhi/core/pm.c   |  3 +++
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 8576b0f..1a7192e 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -244,8 +244,10 @@ static void mhi_del_ring_element(struct mhi_controller *mhi_cntrl,
 
 int mhi_destroy_device(struct device *dev, void *data)
 {
+	struct mhi_chan *ul_chan, *dl_chan;
 	struct mhi_device *mhi_dev;
 	struct mhi_controller *mhi_cntrl;
+	enum mhi_ee_type ee = MHI_EE_MAX;
 
 	if (dev->bus != &mhi_bus_type)
 		return 0;
@@ -257,6 +259,12 @@ int mhi_destroy_device(struct device *dev, void *data)
 	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
 		return 0;
 
+	ul_chan = mhi_dev->ul_chan;
+	dl_chan = mhi_dev->dl_chan;
+
+	if (data)
+		ee = *(enum mhi_ee_type *)data;
+
 	/*
 	 * For the suspend and resume case, this function will get called
 	 * without mhi_unregister_controller(). Hence, we need to drop the
@@ -264,11 +272,17 @@ int mhi_destroy_device(struct device *dev, void *data)
 	 * be sure that there will be no instances of mhi_dev left after
 	 * this.
 	 */
-	if (mhi_dev->ul_chan)
-		put_device(&mhi_dev->ul_chan->mhi_dev->dev);
+	if (ul_chan) {
+		if (ee != MHI_EE_MAX && !(ul_chan->ee_mask & BIT(ee)))
+			return 0;
+		put_device(&ul_chan->mhi_dev->dev);
+	}
 
-	if (mhi_dev->dl_chan)
-		put_device(&mhi_dev->dl_chan->mhi_dev->dev);
+	if (dl_chan) {
+		if (ee != MHI_EE_MAX && !(dl_chan->ee_mask & BIT(ee)))
+			return 0;
+		put_device(&dl_chan->mhi_dev->dev);
+	}
 
 	dev_dbg(&mhi_cntrl->mhi_dev->dev, "destroy device for chan:%s\n",
 		 mhi_dev->name);
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 681960c..8da8806 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -377,6 +377,7 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_event *mhi_event;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	enum mhi_ee_type ee = MHI_EE_MAX, current_ee = mhi_cntrl->ee;
 	int i, ret;
 
 	dev_dbg(dev, "Processing Mission Mode transition\n");
@@ -395,6 +396,8 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
 
 	wake_up_all(&mhi_cntrl->state_event);
 
+	device_for_each_child(&mhi_cntrl->mhi_dev->dev, &current_ee,
+			      mhi_destroy_device);
 	mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_MISSION_MODE);
 
 	/* Force MHI to be in M0 state before continuing */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

