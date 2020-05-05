Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB261C641A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 00:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729464AbgEEWrg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 18:47:36 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:46387 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729265AbgEEWrf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 18:47:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588718855; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=m26u8GXRAfLww1UnzFHikWU4UVdgIijSum+gcPCH04E=; b=NMvDu+tDyaPyh15U7nFn1spx1Fh8Qco1Wobkjoqz2z66AsZybOdj/fcpExvkXVIslJxpPOoe
 3Og3QXUzKRbm0VjibDjCiekmmrDXhh/oVQNKLjOoRouVmjeyKc9jfUpmXndfmBC2t5vZt6EO
 cRquFkDm91se7aEsClpfUCWWfFc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb1ecfa.7fd586743b58-smtp-out-n01;
 Tue, 05 May 2020 22:47:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 834CAC432C2; Tue,  5 May 2020 22:47:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F357CC432C2;
        Tue,  5 May 2020 22:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F357CC432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v6 2/8] bus: mhi: core: Cache intmod from mhi event to mhi channel
Date:   Tue,  5 May 2020 15:47:06 -0700
Message-Id: <1588718832-4891-3-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588718832-4891-1-git-send-email-bbhatt@codeaurora.org>
References: <1588718832-4891-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

Driver is using zero initialized intmod value from mhi channel when
configuring TRE for bei field. This prevents interrupt moderation to
take effect in case it is supported by an event ring. Fix this by
copying intmod value from associated event ring to mhi channel upon
registering mhi controller.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/bus/mhi/core/init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index eb2ab05..1a93d24 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -863,6 +863,10 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 		mutex_init(&mhi_chan->mutex);
 		init_completion(&mhi_chan->completion);
 		rwlock_init(&mhi_chan->lock);
+
+		/* used in setting bei field of TRE */
+		mhi_event = &mhi_cntrl->mhi_event[mhi_chan->er_index];
+		mhi_chan->intmod = mhi_event->intmod;
 	}
 
 	if (mhi_cntrl->bounce_buf) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
