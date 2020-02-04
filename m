Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD17B1515C4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 07:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgBDGOp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 01:14:45 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:43793 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726684AbgBDGOo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 01:14:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580796884; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=rzQQ6Fm+XB38EsSsLqZ7nQf+Q+dw8du1jrbmqDy8jjs=; b=cehMogaBmUnqvPAtsz3d0nSDs6lsThiX6l3GSgCTQxtZpG+nw8esLB2I+5r9idL0MuJOXqBi
 T1lV9RWiUI9dPYThU9JBMYaczCSDd34EB2/qiBqfzAp93oHkoQdSnmjwRkOXs3dePVqwd0Rz
 A5XB7VnRJj2HJtm/itdGOUjnY20=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e390bd0.7fd98add5b90-smtp-out-n01;
 Tue, 04 Feb 2020 06:14:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E3CF4C447A3; Tue,  4 Feb 2020 06:14:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E008CC447A0;
        Tue,  4 Feb 2020 06:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E008CC447A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH 2/3] soc: qcom: rpmh: Update rpm_msgs offset address and add list_del
Date:   Tue,  4 Feb 2020 11:43:50 +0530
Message-Id: <1580796831-18996-3-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580796831-18996-1-git-send-email-mkshah@codeaurora.org>
References: <1580796831-18996-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

rpm_msgs are copied in continuously allocated memory during write_batch.
Update request pointer to correctly point to designated area for rpm_msgs.

While at this also add missing list_del before freeing rpm_msgs.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/soc/qcom/rpmh.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index c3d6f00..04c7805 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -65,7 +65,7 @@ struct cache_req {
 struct batch_cache_req {
 	struct list_head list;
 	int count;
-	struct rpmh_request rpm_msgs[];
+	struct rpmh_request *rpm_msgs;
 };
 
 static struct rpmh_ctrlr *get_rpmh_ctrlr(const struct device *dev)
@@ -327,8 +327,10 @@ static void invalidate_batch(struct rpmh_ctrlr *ctrlr)
 	unsigned long flags;
 
 	spin_lock_irqsave(&ctrlr->cache_lock, flags);
-	list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list)
+	list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list) {
+		list_del(&req->list);
 		kfree(req);
+	}
 	INIT_LIST_HEAD(&ctrlr->batch_cache);
 	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
 }
@@ -377,10 +379,11 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 		return -ENOMEM;
 
 	req = ptr;
+	rpm_msgs = ptr + sizeof(*req);
 	compls = ptr + sizeof(*req) + count * sizeof(*rpm_msgs);
 
 	req->count = count;
-	rpm_msgs = req->rpm_msgs;
+	req->rpm_msgs = rpm_msgs;
 
 	for (i = 0; i < count; i++) {
 		__fill_rpmh_msg(rpm_msgs + i, state, cmd, n[i]);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
