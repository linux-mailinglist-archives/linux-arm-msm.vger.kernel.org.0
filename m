Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3234CF46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 15:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbfFTNqV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 09:46:21 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60880 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfFTNqV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 09:46:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 754C660FEA; Thu, 20 Jun 2019 13:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561038380;
        bh=wjGKmGJ9b+4RLn8uuVFdjOOHTr+DR+AbytFMu+YO4ks=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GQ3iY5UozqwF6THtWiyvkbXTvJOMG9rYZdv4g18VoQgiI2DuCUFnxUsh4zOHub5Bn
         PA11yqaaZ0LGWLY3a56ichyvaeCwewLUXJ3YxvI3c9pUIZGgAysMJq6bqMan30R6yJ
         pudCjCrmB8QcItepRds2sq2zeaMXDfWLclYmTZsM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A237660E7A;
        Thu, 20 Jun 2019 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561038373;
        bh=wjGKmGJ9b+4RLn8uuVFdjOOHTr+DR+AbytFMu+YO4ks=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wv3D4oZJ01Z8MM6Aj0lkBals+AavLR/scz92Ufuy4iAVArZB5XDEVqtxllYexmDrQ
         tabFcgQDdErldgk5RDRT60h+24/uB37pe9aBZljpe3QafpzndAbzrWoiRpnH/gNqdO
         g5ZF4PxcJgwqt4v020PFroi1PJi0iaCF6g41jM84=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A237660E7A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 1/2] coresight: Set affinity to invalid for missing CPU phandle
Date:   Thu, 20 Jun 2019 19:15:46 +0530
Message-Id: <49d6554536047b9f5526c4ea33990b7c904673d3.1561037262.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1561037262.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1561037262.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Affinity defaults to CPU0 in case of missing CPU phandle
and this leads to crashes in some cases because of such
wrong assumption. Fix this by returning -ENODEV in
coresight platform for such cases and then handle it
in the coresight drivers.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/hwtracing/coresight/coresight-platform.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 3c5ceda8db24..b1ea60c210e1 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -160,15 +160,17 @@ static int of_coresight_get_cpu(struct device *dev)
 
 	if (!dev->of_node)
 		return 0;
+
 	dn = of_parse_phandle(dev->of_node, "cpu", 0);
-	/* Affinity defaults to CPU0 */
+
+	/* Affinity defaults to invalid if no cpu nodes are found*/
 	if (!dn)
-		return 0;
+		return -ENODEV;
+
 	cpu = of_cpu_node_to_id(dn);
 	of_node_put(dn);
 
-	/* Affinity to CPU0 if no cpu nodes are found */
-	return (cpu < 0) ? 0 : cpu;
+	return cpu;
 }
 
 /*
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

