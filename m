Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E52C16F73B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 06:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgBZF1h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 00:27:37 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:13704 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726926AbgBZF1g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 00:27:36 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582694855; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=yB7z7Nq2or9K8dSwacG8JE6zzj8s/Dpg3xwkK+5fN/0=; b=PP3uSk8FvDROi1YRuizZdX1gcV6TKTMnaK0vCSiJDoyE6PqBaKGNoLTgXQAXhObK0ZnPLgFr
 Qm60cZToebhPBOXwlemw1FZFaAIwb/QETKuCpcgV2eX0kadZZ+AHCNbwUIxOAkMGCtBFT716
 mTHkgHllk+y1WSZmySfnAw+zGqs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5601c3.7f130a7c9030-smtp-out-n03;
 Wed, 26 Feb 2020 05:27:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DE01BC447A4; Wed, 26 Feb 2020 05:27:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C21CC433A2;
        Wed, 26 Feb 2020 05:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3C21CC433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v7 2/3] soc: qcom: rpmh: Update dirty flag only when data changes
Date:   Wed, 26 Feb 2020 10:57:12 +0530
Message-Id: <1582694833-9407-3-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582694833-9407-1-git-send-email-mkshah@codeaurora.org>
References: <1582694833-9407-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently rpmh ctrlr dirty flag is set for all cases regardless
of data is really changed or not. Add changes to update it when
data is updated to newer values.

Also move dirty flag updates to happen from within cache_lock.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
---
 drivers/soc/qcom/rpmh.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index eb0ded0..83ba4e0 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -139,20 +139,27 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
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
+		if (req->sleep_val != cmd->data) {
+			req->sleep_val = cmd->data;
+			ctrlr->dirty = true;
+		}
 		break;
 	default:
 		break;
 	}
 
-	ctrlr->dirty = true;
 unlock:
 	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
 
@@ -287,6 +294,7 @@ static void cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req *req)
 
 	spin_lock_irqsave(&ctrlr->cache_lock, flags);
 	list_add_tail(&req->list, &ctrlr->batch_cache);
+	ctrlr->dirty = true;
 	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
 }
 
@@ -323,6 +331,7 @@ static void invalidate_batch(struct rpmh_ctrlr *ctrlr)
 	list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list)
 		kfree(req);
 	INIT_LIST_HEAD(&ctrlr->batch_cache);
+	ctrlr->dirty = true;
 	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
 }
 
@@ -456,6 +465,7 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
 int rpmh_flush(struct rpmh_ctrlr *ctrlr)
 {
 	struct cache_req *p;
+	unsigned long flags;
 	int ret;
 
 	if (!ctrlr->dirty) {
@@ -488,7 +498,9 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
 			return ret;
 	}
 
+	spin_lock_irqsave(&ctrlr->cache_lock, flags);
 	ctrlr->dirty = false;
+	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
 
 	return 0;
 }
@@ -507,7 +519,6 @@ int rpmh_invalidate(const struct device *dev)
 	int ret;
 
 	invalidate_batch(ctrlr);
-	ctrlr->dirty = true;
 
 	do {
 		ret = rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
