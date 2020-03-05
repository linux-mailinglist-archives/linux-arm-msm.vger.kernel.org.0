Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8A617A494
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 12:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbgCELsQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 06:48:16 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:49354 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727448AbgCELsP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 06:48:15 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583408895; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=pRNvHxX80n8wBj2lKTDP98u1doAk5pcKRHB2R9qvWTg=; b=Skjdm+YM7VvRuk1zy1M0DZuiPTk9rAFeNoUb8+CJLEbhY1dz3XxIJbaesUkT5Ud6y0Y1zfUZ
 3dN7abMrn1nSPHPP69K6yqRIWCztz3WgaJZbjsaTMUyIzvH0EnY9ZMT0EUHZGYuY35bMZV7t
 6/iS90snQ/3ztVGbAZuLd/B6pyI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e60e6fe.7fd756479ca8-smtp-out-n01;
 Thu, 05 Mar 2020 11:48:14 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2064C447A5; Thu,  5 Mar 2020 11:48:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2EE5CC433A2;
        Thu,  5 Mar 2020 11:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2EE5CC433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v11 4/4] soc: qcom: rpmh: Invalidate SLEEP and WAKE TCSes before flushing new data
Date:   Thu,  5 Mar 2020 17:17:36 +0530
Message-Id: <1583408856-1120-5-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583408856-1120-1-git-send-email-mkshah@codeaurora.org>
References: <1583408856-1120-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

TCSes have previously programmed data when rpmh_flush is called.
This can cause old data to trigger along with newly flushed.

Fix this by cleaning SLEEP and WAKE TCSes before new data is flushed.

Fixes: 600513dfeef3 ("drivers: qcom: rpmh: cache sleep/wake state requests")
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/soc/qcom/rpmh.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 1951f6a..63364ce 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -472,6 +472,11 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
 		return 0;
 	}
 
+	/* Invalidate the TCSes first to avoid stale data */
+	do {
+		ret = rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
+	} while (ret == -EAGAIN);
+
 	/* First flush the cached batch requests */
 	ret = flush_batch(ctrlr);
 	if (ret)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
