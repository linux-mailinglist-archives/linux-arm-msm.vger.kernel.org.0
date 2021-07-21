Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2A813D159A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 19:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236971AbhGUROQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 13:14:16 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:18714 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230139AbhGUROP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 13:14:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626890092; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ySesvNlauEEm7yyBbVlezGiznvSWahvS4OLJh1EwFhQ=; b=E/Rns1+Em2qlWeyRA8icuE1/Tw33wosP72g+So8vNY9N7oUXfDJyX8itKXIxuXORP5qwABEg
 aRpIUxR4VT4q2xxzFMARajhFj9AoP4yeN/Ti/A9fkONUA1IcMd3SWdoBiB14e+D2bP9X+4XF
 60LeorRdBdjrfhOQ3q3yl0yT/xY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60f85f6196a66e66b2421134 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 17:54:41
 GMT
Sender: mdtipton=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4978DC43217; Wed, 21 Jul 2021 17:54:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mdtipton)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A9F3C4323A;
        Wed, 21 Jul 2021 17:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0A9F3C4323A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mdtipton@codeaurora.org
From:   Mike Tipton <mdtipton@codeaurora.org>
To:     djakov@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        saravanak@google.com, okukatla@codeaurora.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mike Tipton <mdtipton@codeaurora.org>
Subject: [PATCH v2 3/4] interconnect: qcom: icc-rpmh: Ensure floor BW is enforced for all nodes
Date:   Wed, 21 Jul 2021 10:54:31 -0700
Message-Id: <20210721175432.2119-4-mdtipton@codeaurora.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721175432.2119-1-mdtipton@codeaurora.org>
References: <20210721175432.2119-1-mdtipton@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We currently only enforce BW floors for a subset of nodes in a path.
All BCMs that need updating are queued in the pre_aggregate/aggregate
phase. The first set() commits all queued BCMs and subsequent set()
calls short-circuit without committing anything. Since the floor BW
isn't set in sum_avg/max_peak until set(), then some BCMs are committed
before their associated nodes reflect the floor.

Set the floor as each node is being aggregated. This ensures that all
all relevant floors are set before the BCMs are committed.

Fixes: 266cd33b5913 ("interconnect: qcom: Ensure that the floor bandwidth value is enforced")
Signed-off-by: Mike Tipton <mdtipton@codeaurora.org>
---
 drivers/interconnect/qcom/icc-rpmh.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index bf01d09dba6c..f118f57eae37 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -57,6 +57,11 @@ int qcom_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
 			qn->sum_avg[i] += avg_bw;
 			qn->max_peak[i] = max_t(u32, qn->max_peak[i], peak_bw);
 		}
+
+		if (node->init_avg || node->init_peak) {
+			qn->sum_avg[i] = max_t(u64, qn->sum_avg[i], node->init_avg);
+			qn->max_peak[i] = max_t(u64, qn->max_peak[i], node->init_peak);
+		}
 	}
 
 	*agg_avg += avg_bw;
@@ -90,11 +95,6 @@ int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 	qp = to_qcom_provider(node->provider);
 	qn = node->data;
 
-	qn->sum_avg[QCOM_ICC_BUCKET_AMC] = max_t(u64, qn->sum_avg[QCOM_ICC_BUCKET_AMC],
-						 node->avg_bw);
-	qn->max_peak[QCOM_ICC_BUCKET_AMC] = max_t(u64, qn->max_peak[QCOM_ICC_BUCKET_AMC],
-						  node->peak_bw);
-
 	qcom_icc_bcm_voter_commit(qp->voter);
 
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

