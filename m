Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17A8204886
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 06:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732361AbgFWEJQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 00:09:16 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:32689 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732230AbgFWEI6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 00:08:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592885337; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Sd4NzcJtimoRSr2CyJHyFEljlaFfuHbcu+YA4Khlm68=; b=NeUfqTpwQSU1i3aGWy0WYlEKz+Lh1cyuqWUDc+M2WaBZW7dBhtjVaL4B++tFG5UDrnd9nW8d
 C72uAGFPKs9tt/YWUw8zP4rJpOg7JF+HzkHfy33sUnSi7KJ/lsCRSqjQXN+vtSQS8O/eli7z
 7q5dyUwLdBnzkNbfdO8kEjaEqp0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5ef18040c4bb4f886dce0301 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Jun 2020 04:08:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 37A0DC433C8; Tue, 23 Jun 2020 04:08:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mdtipton-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mdtipton)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C465C43395;
        Tue, 23 Jun 2020 04:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8C465C43395
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mdtipton@codeaurora.org
From:   Mike Tipton <mdtipton@codeaurora.org>
To:     georgi.djakov@linaro.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Tipton <mdtipton@codeaurora.org>
Subject: [PATCH 3/4] interconnect: qcom: Add support for per-BCM scaling factors
Date:   Mon, 22 Jun 2020 21:08:13 -0700
Message-Id: <20200623040814.23791-4-mdtipton@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200623040814.23791-1-mdtipton@codeaurora.org>
References: <20200623040814.23791-1-mdtipton@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, bcm-voter always assumes requests are made in KBps and that
BCM HW always wants them in Bps, so it always scales the requests by
1000. However, certain use cases and BCMs may use different units.
Thus, add support for BCM-specific scaling factors.

Signed-off-by: Mike Tipton <mdtipton@codeaurora.org>
---
 drivers/interconnect/qcom/bcm-voter.c | 4 ++--
 drivers/interconnect/qcom/icc-rpmh.c  | 3 +++
 drivers/interconnect/qcom/icc-rpmh.h  | 2 ++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
index bb83ce7554b7..a68c858ca6b7 100644
--- a/drivers/interconnect/qcom/bcm-voter.c
+++ b/drivers/interconnect/qcom/bcm-voter.c
@@ -72,11 +72,11 @@ static void bcm_aggregate(struct qcom_icc_bcm *bcm)
 			agg_peak[bucket] = max(agg_peak[bucket], temp);
 		}
 
-		temp = agg_avg[bucket] * 1000ULL;
+		temp = agg_avg[bucket] * bcm->vote_scale;
 		do_div(temp, bcm->aux_data.unit);
 		bcm->vote_x[bucket] = temp;
 
-		temp = agg_peak[bucket] * 1000ULL;
+		temp = agg_peak[bucket] * bcm->vote_scale;
 		do_div(temp, bcm->aux_data.unit);
 		bcm->vote_y[bucket] = temp;
 	}
diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index 3ac5182c9ab2..008846c17bec 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -136,6 +136,9 @@ int qcom_icc_bcm_init(struct qcom_icc_bcm *bcm, struct device *dev)
 	INIT_LIST_HEAD(&bcm->list);
 	INIT_LIST_HEAD(&bcm->ws_list);
 
+	if (!bcm->vote_scale)
+		bcm->vote_scale = 1000;
+
 	/* Link Qnodes to their respective BCMs */
 	for (i = 0; i < bcm->num_nodes; i++) {
 		qn = bcm->nodes[i];
diff --git a/drivers/interconnect/qcom/icc-rpmh.h b/drivers/interconnect/qcom/icc-rpmh.h
index 903d25e61984..200e98be5926 100644
--- a/drivers/interconnect/qcom/icc-rpmh.h
+++ b/drivers/interconnect/qcom/icc-rpmh.h
@@ -94,6 +94,7 @@ struct qcom_icc_node {
  * @addr: address offsets used when voting to RPMH
  * @vote_x: aggregated threshold values, represents sum_bw when @type is bw bcm
  * @vote_y: aggregated threshold values, represents peak_bw when @type is bw bcm
+ * @vote_scale: scaling factor for vote_x and vote_y
  * @dirty: flag used to indicate whether the bcm needs to be committed
  * @keepalive: flag used to indicate whether a keepalive is required
  * @aux_data: auxiliary data used when calculating threshold values and
@@ -109,6 +110,7 @@ struct qcom_icc_bcm {
 	u32 addr;
 	u64 vote_x[QCOM_ICC_NUM_BUCKETS];
 	u64 vote_y[QCOM_ICC_NUM_BUCKETS];
+	u64 vote_scale;
 	bool dirty;
 	bool keepalive;
 	struct bcm_db aux_data;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

