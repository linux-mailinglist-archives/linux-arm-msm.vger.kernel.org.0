Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55C83ADB07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jun 2021 19:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234873AbhFSRLE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Jun 2021 13:11:04 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46701 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234867AbhFSRLC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Jun 2021 13:11:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624122531; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=j//viWQvsqoFQ/7oCoI6fIdZixErGKeS0nm9pZwJXwU=; b=MYa2T0EIRdfeoIJEBuXbRiPehT55mVDo+gXeIFySJIQG62gC+AD2xnOOkBPVoa2CVtuvT/z9
 xxuHmbLjvGrUtz1N0h2TO2lVZJ3y0zoRznHej267SRDz2xRpQUCgudd+kF+uQQpG+VbQaNSJ
 66pfhyuMXStVT7As2g6aEXQZBG0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60ce249fea2aacd7290bfcc6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 19 Jun 2021 17:08:47
 GMT
Sender: okukatla=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 18C15C43217; Sat, 19 Jun 2021 17:08:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from okukatla1-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: okukatla)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 298B6C433F1;
        Sat, 19 Jun 2021 17:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 298B6C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=okukatla@codeaurora.org
From:   Odelu Kukatla <okukatla@codeaurora.org>
To:     georgi.djakov@linaro.org, bjorn.andersson@linaro.org,
        evgreen@google.com, Georgi Djakov <djakov@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     sboyd@kernel.org, mdtipton@codeaurora.org, sibis@codeaurora.org,
        saravanak@google.com, okukatla@codeaurora.org,
        seansw@qti.qualcomm.com, elder@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: [PATCH] interconnect: Aggregate bandwidth votes for unused nodes in sync_state()
Date:   Sat, 19 Jun 2021 22:38:29 +0530
Message-Id: <1624122509-17508-1-git-send-email-okukatla@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When removing the initial bandwidth votes in sync_state(), make sure
to call the aggregate() function for nodes which don't have any
clients yet. aggregate_requests() does not invoke aggregate()
for unused nodes.

Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
---
 drivers/interconnect/core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 8a1e70e..1d9a00a 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -1106,7 +1106,16 @@ void icc_sync_state(struct device *dev)
 		dev_dbg(p->dev, "interconnect provider is in synced state\n");
 		list_for_each_entry(n, &p->nodes, node_list) {
 			if (n->init_avg || n->init_peak) {
-				aggregate_requests(n);
+				if (hlist_empty(&n->req_list)) {
+					if (p->pre_aggregate)
+						p->pre_aggregate(n);
+
+					p->aggregate(n, 0, 0, 0, &n->avg_bw,
+						&n->peak_bw);
+				} else {
+					aggregate_requests(n);
+				}
+
 				p->set(n, n);
 			}
 		}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

