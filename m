Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E43A8352171
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 23:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234685AbhDAVQs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 17:16:48 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:33684 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234866AbhDAVQq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 17:16:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617311807; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=LwVlPu7pm1/Svx8JJB1TfdOR3iv68dj6SiuBNSuPTxU=; b=VMc4tEB5ZEsrGY0x3FRFb21OtfFK6LJsLOBpGStowBHHWd10mXaOxKnhC4b/67pGfNA0Eazi
 7QMgzfW2jSgp0fwiTVX1KVER2US4UUXqnzoIvY9RSNQSFnC0cdohH9gOK8eNeEloZZpogAX/
 M2AN9yPKBGB9sIzT4RFRcXRByaI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6066382e8166b7eff7a2cf19 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Apr 2021 21:16:30
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0A741C43466; Thu,  1 Apr 2021 21:16:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E8C72C4346A;
        Thu,  1 Apr 2021 21:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E8C72C4346A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v8 6/9] bus: mhi: core: Clear configuration from channel context during reset
Date:   Thu,  1 Apr 2021 14:16:15 -0700
Message-Id: <1617311778-1254-7-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
References: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When clearing up the channel context after client drivers are
done using channels, the configuration is currently not being
reset entirely. Ensure this is done to appropriately handle
issues where clients unaware of the context state end up calling
functions which expect a context.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 9c2ed92..871a412 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -558,6 +558,7 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
 	struct mhi_ring *buf_ring;
 	struct mhi_ring *tre_ring;
 	struct mhi_chan_ctxt *chan_ctxt;
+	u32 tmp;
 
 	buf_ring = &mhi_chan->buf_ring;
 	tre_ring = &mhi_chan->tre_ring;
@@ -571,7 +572,19 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
 	vfree(buf_ring->base);
 
 	buf_ring->base = tre_ring->base = NULL;
+	tre_ring->ctxt_wp = NULL;
 	chan_ctxt->rbase = 0;
+	chan_ctxt->rlen = 0;
+	chan_ctxt->rp = 0;
+	chan_ctxt->wp = 0;
+
+	tmp = chan_ctxt->chcfg;
+	tmp &= ~CHAN_CTX_CHSTATE_MASK;
+	tmp |= (MHI_CH_STATE_DISABLED << CHAN_CTX_CHSTATE_SHIFT);
+	chan_ctxt->chcfg = tmp;
+
+	/* Update to all cores */
+	smp_wmb();
 }
 
 int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

