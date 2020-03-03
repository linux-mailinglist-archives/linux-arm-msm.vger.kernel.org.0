Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43CAF1775DF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 13:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729268AbgCCM1e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 07:27:34 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:34544 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729180AbgCCM1e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 07:27:34 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583238453; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qFy6+eIadiQPy+SjXhSNxSeKJYjMx7CjIuxLtye6xO0=; b=uPIZWQM/WMP2pG/qrAHJ0tWKeCgXfgMKGXdso7sHXuJAEQleUKnAN4u8RgGs9dMO4qvEYrG3
 OFGn/z7/9m/HAd1mg5EGzscxS5Cjhkcd6F/NR5Gx/IifB1XJ47JSleIkvYmNCpRuQKxK3WAF
 9AXue3kuwxHrhlX75eXISFo0j2o=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5e4d21.7fabf270efb8-smtp-out-n01;
 Tue, 03 Mar 2020 12:27:13 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 57BA1C447A0; Tue,  3 Mar 2020 12:27:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 830E2C4479F;
        Tue,  3 Mar 2020 12:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 830E2C4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v10 2/3] soc: qcom: rpmh: Update dirty flag only when data changes
Date:   Tue,  3 Mar 2020 17:56:54 +0530
Message-Id: <1583238415-18686-3-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583238415-18686-1-git-send-email-mkshah@codeaurora.org>
References: <1583238415-18686-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently rpmh ctrlr dirty flag is set for all cases regardless of data
is really changed or not. Add changes to update dirty flag when data is
changed to newer values. Update dirty flag everytime when data in batch
cache is updated since rpmh_flush() may get invoked from any CPU instead
of only last CPU going to low power mode.

Also move dirty flag updates to happen from within cache_lock and remove
unnecessary INIT_LIST_HEAD() call and a default case from switch.

Fixes: 600513dfeef3 ("drivers: qcom: rpmh: cache sleep/wake state requests")
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
Reviewed-by: Evan Green <evgreen@chromium.org>
---
 drivers/soc/qcom/rpmh.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index eb0ded0..f28afe4 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -133,26 +133,30 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
 
 	req->addr = cmd->addr;
 	req->sleep_val = req->wake_val = UINT_MAX;
-	INIT_LIST_HEAD(&req->list);
 	list_add_tail(&req->list, &ctrlr->cache);
 
 existing:
 	switch (state) {
 	case RPMH_ACTIVE_ONLY_STATE:
-		if (req->sleep_val != UINT_MAX)
+		if (req->sleep_val != UINT_MAX) {
 			req->wake_val = cmd->data;
+			ctrlr->dirty = true;
+		}
 		break;
 	case RPMH_WAKE_ONLY_STATE:
-		req->wake_val = cmd->data;
+		if (req->wake_val != cmd->data) {
+			req->wake_val = cmd->data;
+			ctrlr->dirty = true;
+		}
 		break;
 	case RPMH_SLEEP_STATE:
-		req->sleep_val = cmd->data;
-		break;
-	default:
+		if (req->sleep_val != cmd->data) {
+			req->sleep_val = cmd->data;
+			ctrlr->dirty = true;
+		}
 		break;
 	}
 
-	ctrlr->dirty = true;
 unlock:
 	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
 
@@ -287,6 +291,7 @@ static void cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req *req)
 
 	spin_lock_irqsave(&ctrlr->cache_lock, flags);
 	list_add_tail(&req->list, &ctrlr->batch_cache);
+	ctrlr->dirty = true;
 	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
 }
 
@@ -323,6 +328,7 @@ static void invalidate_batch(struct rpmh_ctrlr *ctrlr)
 	list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list)
 		kfree(req);
 	INIT_LIST_HEAD(&ctrlr->batch_cache);
+	ctrlr->dirty = true;
 	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
 }
 
@@ -507,7 +513,6 @@ int rpmh_invalidate(const struct device *dev)
 	int ret;
 
 	invalidate_batch(ctrlr);
-	ctrlr->dirty = true;
 
 	do {
 		ret = rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
