Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B245C2CE512
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 02:25:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387793AbgLDBYd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 20:24:33 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:55754 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389571AbgLDBYd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 20:24:33 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607045055; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ivznYdvrzxMQucceaJCLvY3I+3vzVXBm9IYM1AxNLmk=; b=aXJE4z1ynNDrVlu5W2lU7rZWp9rQFGEsSuQX71vaSA3GpMqFakjVDnsieYrNpyi4peRnG30y
 3dtHTE2dFQplJ6ertUi3SUG6DkLJ9DyFMFOII828hJ250hTEYhOTI4AMaQh3FxZ6echpSGKn
 m+VPwP68YXtrZrdAgZKqre03OYs=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fc98f91288b6f9d8a181795 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 04 Dec 2020 01:23:29
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1E81DC433C6; Fri,  4 Dec 2020 01:23:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 09589C433CA;
        Fri,  4 Dec 2020 01:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 09589C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, loic.poulain@linaro.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 4/8] bus: mhi: core: Clear configuration from channel context during reset
Date:   Thu,  3 Dec 2020 17:23:13 -0800
Message-Id: <1607044997-19577-5-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607044997-19577-1-git-send-email-bbhatt@codeaurora.org>
References: <1607044997-19577-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When clearing up the channel context after client drivers are
done using channels, the configuration is currently not being
reset entirely. Ensure this is done to appropriately handle
issues where clients unaware of the context state end up calling
functions which expect a context.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/init.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 5cdddb2..1b6962d 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -553,6 +553,7 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
 	struct mhi_ring *buf_ring;
 	struct mhi_ring *tre_ring;
 	struct mhi_chan_ctxt *chan_ctxt;
+	u32 tmp;
 
 	buf_ring = &mhi_chan->buf_ring;
 	tre_ring = &mhi_chan->tre_ring;
@@ -563,7 +564,19 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
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

