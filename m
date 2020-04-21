Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E4C1B29E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 16:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729319AbgDUOdG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 10:33:06 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:38639 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729300AbgDUOdF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 10:33:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587479585; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=mNkd366fBI/Mx9MCE5qcOzNQoIGuapc6hsXcqID2Ecc=; b=s7ADcuVTcpa5MFyLvonwTzcJU9EguLdoPIZJyRvjzccUm45YeBKmGtM3+RlzUvz+yXZLMgcd
 KwsOT9IqIZOn+aFBXnW0U4ZDNZIfmse+BmvtwFVCAkNvLddshW+Hh3lt64cojXw/uWW5tYL6
 mful4SG1FE93Xt9bzXj1Hc3AZRY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9f0421.7f3fa9b54998-smtp-out-n03;
 Tue, 21 Apr 2020 14:33:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AE60BC44792; Tue, 21 Apr 2020 14:33:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C25DDC44799;
        Tue, 21 Apr 2020 14:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C25DDC44799
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com, mka@chromium.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 4/7] remoteproc: qcom_q6v5_mss: Extract mba/mpss from memory-region
Date:   Tue, 21 Apr 2020 20:02:25 +0530
Message-Id: <20200421143228.8981-5-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200421143228.8981-1-sibis@codeaurora.org>
References: <20200421143228.8981-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the absence of mba and mpss sub-child extract the mba/mpss regions
from the memory-region property.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 3a7352776a319..5c8d04c51af71 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1503,8 +1503,17 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 	struct resource r;
 	int ret;
 
+	/*
+	 * In the absence of mba/mpss sub-child, extract the mba and mpss
+	 * reserved memory regions from device's memory-region property.
+	 */
 	child = of_get_child_by_name(qproc->dev->of_node, "mba");
-	node = of_parse_phandle(child, "memory-region", 0);
+	if (!child)
+		node = of_parse_phandle(qproc->dev->of_node,
+					"memory-region", 0);
+	else
+		node = of_parse_phandle(child, "memory-region", 0);
+
 	ret = of_address_to_resource(node, 0, &r);
 	if (ret) {
 		dev_err(qproc->dev, "unable to resolve mba region\n");
@@ -1521,8 +1530,14 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 		return -EBUSY;
 	}
 
-	child = of_get_child_by_name(qproc->dev->of_node, "mpss");
-	node = of_parse_phandle(child, "memory-region", 0);
+	if (!child) {
+		node = of_parse_phandle(qproc->dev->of_node,
+					"memory-region", 1);
+	} else {
+		child = of_get_child_by_name(qproc->dev->of_node, "mpss");
+		node = of_parse_phandle(child, "memory-region", 0);
+	}
+
 	ret = of_address_to_resource(node, 0, &r);
 	if (ret) {
 		dev_err(qproc->dev, "unable to resolve mpss region\n");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
