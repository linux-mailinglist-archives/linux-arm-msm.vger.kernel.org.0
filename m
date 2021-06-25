Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283A63B4A30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 23:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhFYVb0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 17:31:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50831 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229881AbhFYVbZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 17:31:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624656544; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=pJQVTKLxIe0Fn9msKrGPa7GRTW4HbzJ0ouMJuFmUpVs=; b=Hezfe6OFSiPruat+yRqmxTFgYphvshlMku8HxHLOgFnd6nWePHEZc/0PhmLTOijpZG7z3bMO
 Ccjo4vqIy+Ox8+u6VCACC2sGbHGtBW5qJ/ZrGpC7VM/KhUfgOZ4uDo49phi/qWqmNTmJ2m9E
 tiJN4/k64nEDXqsMgDBgFd17QIk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60d64a9d7e5ba0fdc07460ee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 25 Jun 2021 21:29:01
 GMT
Sender: mdtipton=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 48FA0C43217; Fri, 25 Jun 2021 21:29:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mdtipton)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 19461C433F1;
        Fri, 25 Jun 2021 21:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 19461C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mdtipton@codeaurora.org
From:   Mike Tipton <mdtipton@codeaurora.org>
To:     djakov@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        saravanak@google.com, okukatla@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Tipton <mdtipton@codeaurora.org>
Subject: [PATCH 4/4] interconnect: qcom: icc-rpmh: Add BCMs to commit list in pre_aggregate
Date:   Fri, 25 Jun 2021 14:28:39 -0700
Message-Id: <20210625212839.24155-5-mdtipton@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625212839.24155-1-mdtipton@codeaurora.org>
References: <20210625212839.24155-1-mdtipton@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We're only adding BCMs to the commit list in aggregate(), but there are
cases where pre_aggregate() is called without subsequently calling
aggregate(). In particular, in icc_sync_state() when a node with initial
BW has zero requests. Since BCMs aren't added to the commit list in
these cases, we don't actually send the zero BW request to HW. So the
resources remain on unnecessarily.

Add BCMs to the commit list in pre_aggregate() instead, which is always
called even when there are no requests.

Fixes: 976daac4a1c5 ("interconnect: qcom: Consolidate interconnect RPMh support")
Signed-off-by: Mike Tipton <mdtipton@codeaurora.org>
---
 drivers/interconnect/qcom/icc-rpmh.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index f118f57eae37..b26fda0588e0 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -20,13 +20,18 @@ void qcom_icc_pre_aggregate(struct icc_node *node)
 {
 	size_t i;
 	struct qcom_icc_node *qn;
+	struct qcom_icc_provider *qp;
 
 	qn = node->data;
+	qp = to_qcom_provider(node->provider);
 
 	for (i = 0; i < QCOM_ICC_NUM_BUCKETS; i++) {
 		qn->sum_avg[i] = 0;
 		qn->max_peak[i] = 0;
 	}
+
+	for (i = 0; i < qn->num_bcms; i++)
+		qcom_icc_bcm_voter_add(qp->voter, qn->bcms[i]);
 }
 EXPORT_SYMBOL_GPL(qcom_icc_pre_aggregate);
 
@@ -44,10 +49,8 @@ int qcom_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
 {
 	size_t i;
 	struct qcom_icc_node *qn;
-	struct qcom_icc_provider *qp;
 
 	qn = node->data;
-	qp = to_qcom_provider(node->provider);
 
 	if (!tag)
 		tag = QCOM_ICC_TAG_ALWAYS;
@@ -67,9 +70,6 @@ int qcom_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
 	*agg_avg += avg_bw;
 	*agg_peak = max_t(u32, *agg_peak, peak_bw);
 
-	for (i = 0; i < qn->num_bcms; i++)
-		qcom_icc_bcm_voter_add(qp->voter, qn->bcms[i]);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_icc_aggregate);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

