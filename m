Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D81C1A3366
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 13:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgDILoH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 07:44:07 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:18660 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726594AbgDILoH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 07:44:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586432647; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ygeSdjv3qyXRxfKD3H52vRAiT9C9fDAwrd4y1KxJuvM=; b=f4D4mE4u7br4rt2OvZPflV5iP5T/5ffBfhvkF9VXbm+UevHPWMclAN0c5S4Bsi6SNUw4dYdW
 7dHzuCfa3T8rPA3NjHzoGybx2z7P0cCWtukoyxHHYR9eBsqUFsC4oagjAfHUXnBM/aJFUd2n
 HQa9fOhuxI8bqnzOF+9CGQWToV4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8f0a7e.7f809910f148-smtp-out-n03;
 Thu, 09 Apr 2020 11:43:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EB4A8C433D2; Thu,  9 Apr 2020 11:43:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-311.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CDA40C433CB;
        Thu,  9 Apr 2020 11:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CDA40C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        mike.leach@linaro.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2 1/3] coresight: etm4x: Add support for Qualcomm SC7180 SoC
Date:   Thu,  9 Apr 2020 17:13:36 +0530
Message-Id: <996ca03f9d6785c692287ff1c13dd3f129a5ff3d.1586263250.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1586263250.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1586263250.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ETM UCI IDs for Qualcomm SC7180 SoC. It has 2
big CPU cores based on Cortex-A76 and 6 LITTLE CPU
cores based on Cortex-A55.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
index a90d757f7043..4fb4874981e1 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x.c
@@ -1556,6 +1556,8 @@ static const struct amba_id etm4_ids[] = {
 	CS_AMBA_UCI_ID(0x000f0211, uci_id_etm4),/* Qualcomm Kryo */
 	CS_AMBA_ID(0x000bb802),			/* Qualcomm Kryo 385 Cortex-A55 */
 	CS_AMBA_ID(0x000bb803),			/* Qualcomm Kryo 385 Cortex-A75 */
+	CS_AMBA_UCI_ID(0x000bb805, uci_id_etm4),/* Qualcomm Kryo 4XX Cortex-A55 */
+	CS_AMBA_UCI_ID(0x000bb804, uci_id_etm4),/* Qualcomm Kryo 4XX Cortex-A76 */
 	CS_AMBA_UCI_ID(0x000cc0af, uci_id_etm4),/* Marvell ThunderX2 */
 	{},
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
