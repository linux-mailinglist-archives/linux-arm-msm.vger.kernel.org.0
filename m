Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1240C27AD01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 13:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgI1LiT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 07:38:19 -0400
Received: from z5.mailgun.us ([104.130.96.5]:25399 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbgI1LiT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 07:38:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601293099; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=HtyanNG6hEeZvhgA5eqgIt4/bt21T19irBZrb+nidcM=; b=J5zSDoeO9wRdlLtaCIPzRSy5bofZF4Ztx/k/MOVQWTPhcucXLtHppTDeoXVMa5+MVw/0sYyD
 IzLF7F1athCncxNpVOVigCSuCzn4aLvvX292xPL0PPq3U351GncXmD/sbUH4MNsOKMmonTfc
 //9Er+0xPuzByW+sYYpbGrbIs9o=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f71cb01557d03a9f4acd845 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 11:37:37
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6AC72C43395; Mon, 28 Sep 2020 11:37:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 047CFC433CA;
        Mon, 28 Sep 2020 11:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 047CFC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, leo.yan@linaro.org,
        alexander.shishkin@linux.intel.com, peterz@infradead.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2 2/2] coresight: etm4x: Fix save and restore of TRCVMIDCCTLR1 register
Date:   Mon, 28 Sep 2020 17:07:09 +0530
Message-Id: <011321608e06db0a2797d3a0418b81c75438c571.1601292571.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1601292571.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1601292571.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit f188b5e76aae ("coresight: etm4x: Save/restore state
across CPU low power states"), mistakenly TRCVMIDCCTLR1 register
value was saved in trcvmidcctlr0 state variable which is used to
store TRCVMIDCCTLR0 register value in etm4x_cpu_save() and then
same value is written back to both TRCVMIDCCTLR0 and TRCVMIDCCTLR1
in etm4x_cpu_restore(). There is already a trcvmidcctlr1 state
variable available for TRCVMIDCCTLR1, so use it.

Fixes: f188b5e76aae ("coresight: etm4x: Save/restore state across CPU low power states")
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index de76d57850bc..abd706b216ac 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1243,7 +1243,7 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	state->trccidcctlr1 = readl(drvdata->base + TRCCIDCCTLR1);
 
 	state->trcvmidcctlr0 = readl(drvdata->base + TRCVMIDCCTLR0);
-	state->trcvmidcctlr0 = readl(drvdata->base + TRCVMIDCCTLR1);
+	state->trcvmidcctlr1 = readl(drvdata->base + TRCVMIDCCTLR1);
 
 	state->trcclaimset = readl(drvdata->base + TRCCLAIMCLR);
 
@@ -1353,7 +1353,7 @@ static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 	writel_relaxed(state->trccidcctlr1, drvdata->base + TRCCIDCCTLR1);
 
 	writel_relaxed(state->trcvmidcctlr0, drvdata->base + TRCVMIDCCTLR0);
-	writel_relaxed(state->trcvmidcctlr0, drvdata->base + TRCVMIDCCTLR1);
+	writel_relaxed(state->trcvmidcctlr1, drvdata->base + TRCVMIDCCTLR1);
 
 	writel_relaxed(state->trcclaimset, drvdata->base + TRCCLAIMSET);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

