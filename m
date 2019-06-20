Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5144D934
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 20:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbfFTSc2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 14:32:28 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54518 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbfFTSc1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 14:32:27 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3AFD960E57; Thu, 20 Jun 2019 18:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561055546;
        bh=nNFaKlesrcQPjLvKVg+8OZfxjFS3WjlQjPLTlWJcIzI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MymrtzTMFzFCOPICGEAJ2tAQ0q73Uknnswsq5s4PA49M1j2fmdwbP1m30dZpclwFJ
         Gjgt9BXfYWIJqk4NBf/H3vUSxlyUE928A4WzG6UK5Z6Uy+v4Nq6JZVBrAC5thw7Ees
         N61MbDgLuW2OYGzyejLkb/XoWwI6BGerKrZOApGU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-311.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F1216090F;
        Thu, 20 Jun 2019 18:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561055538;
        bh=nNFaKlesrcQPjLvKVg+8OZfxjFS3WjlQjPLTlWJcIzI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bNgid0dFyvbzzgJhV0wavktTRxxIC71szOjTKcejzQq7L/jgp+/VSgpMebQuNi4lC
         BmxBRW4V3a3c4LHGRYlCHFsIeF/pdiomhlFxdNVKAe56yjYCLBdPQlgmuDEnqK4VeW
         M5Me0a5DD4tHKbeiF5KZ3deov3zECjdUzjkWlizI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7F1216090F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
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
Subject: [PATCHv2 2/2] coresight: Abort probe if cpus are not available
Date:   Fri, 21 Jun 2019 00:01:52 +0530
Message-Id: <65050e4cb2b0433f3cb9b1ca0bf6ec49d0751086.1561054498.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1561054498.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1561054498.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently coresight etm and cpu-debug will go ahead with
the probe even when corresponding cpus are not available
and error out later in the probe path. In such cases, it
is better to abort the probe earlier.

Without this, setting *nosmp* will throw below errors:

 [    5.910622] coresight-cpu-debug 850000.debug: Coresight debug-CPU0 initialized
 [    5.914266] coresight-cpu-debug 852000.debug: CPU1 debug arch init failed
 [    5.921474] coresight-cpu-debug 854000.debug: CPU2 debug arch init failed
 [    5.928328] coresight-cpu-debug 856000.debug: CPU3 debug arch init failed
 [    5.935330] coresight etm0: CPU0: ETM v4.0 initialized
 [    5.941875] coresight-etm4x 85d000.etm: ETM arch init failed
 [    5.946794] coresight-etm4x: probe of 85d000.etm failed with error -22
 [    5.952707] coresight-etm4x 85e000.etm: ETM arch init failed
 [    5.958945] coresight-etm4x: probe of 85e000.etm failed with error -22
 [    5.964853] coresight-etm4x 85f000.etm: ETM arch init failed
 [    5.971096] coresight-etm4x: probe of 85f000.etm failed with error -22

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/hwtracing/coresight/coresight-platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 8b03fa573684..3f4559596c6b 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -168,6 +168,9 @@ static int of_coresight_get_cpu(struct device *dev)
 	cpu = of_cpu_node_to_id(dn);
 	of_node_put(dn);
 
+	if (num_online_cpus() <= cpu)
+		return -ENODEV;
+
 	return cpu;
 }
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

