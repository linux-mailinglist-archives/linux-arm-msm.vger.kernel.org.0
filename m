Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046AF1D97E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 15:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgESNgc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 09:36:32 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:19114 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728745AbgESNgb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 09:36:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589895391; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=HJYspk1r7I6VKeZl8ad/KiCiDuNmEjvFrwOYN97B5qA=; b=uxnUdR6P7v/+OU9TrsuFJpYLorFkmUgKX59nNtVJ6eAUQX2y8N98n4/l6wa5VqsY7GFwVMmh
 1kZ0pBwfSRMir4NqmWNCtpeLS5KLu3VzhCXZwEISeO3/UHldV8M/okjwk7FaYvfqU8UoA/He
 Imr/iQxDxVodq76nC47MNTQQPic=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5ec3e0d8c68d04556633838c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 May 2020 13:36:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 59C20C43637; Tue, 19 May 2020 13:36:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-311.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 58DA8C433D2;
        Tue, 19 May 2020 13:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 58DA8C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2 1/4] coresight: replicator: Use CS_AMBA_ID macro for id table
Date:   Tue, 19 May 2020 19:06:00 +0530
Message-Id: <063325edbcff869fde60c2af484e009c0b124ae4.1589894597.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1589894597.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1589894597.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use CS_AMBA_ID macro for dynamic replicator AMBA id table
instead of open coding.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index e7dc1c31d20d..c619b456f55a 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -348,16 +348,9 @@ static int dynamic_replicator_probe(struct amba_device *adev,
 }
 
 static const struct amba_id dynamic_replicator_ids[] = {
-	{
-		.id     = 0x000bb909,
-		.mask   = 0x000fffff,
-	},
-	{
-		/* Coresight SoC-600 */
-		.id     = 0x000bb9ec,
-		.mask   = 0x000fffff,
-	},
-	{ 0, 0 },
+	CS_AMBA_ID(0x000bb909),
+	CS_AMBA_ID(0x000bb9ec),		/* Coresight SoC-600 */
+	{},
 };
 
 static struct amba_driver dynamic_replicator_driver = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

