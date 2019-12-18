Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1EB0124802
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 14:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfLRNWq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 08:22:46 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:59368 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726987AbfLRNWm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 08:22:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576675361; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=FdGOQOKP865ooVLrbpu/TxpX5gOkds9e1sk+28WEJJA=; b=kFbodI676DR+snYGFjUzzxXk1lSv7ZPfM+7NdY8Aez/uP51mYWX+fXXD7lq7q89b6vbTzTXd
 9gVGDBM1Et7//mniC737E3zm5DjaiktIL/Gn4IJZy6EVqaH/dPf3DtkvvSGBSV861cejhili
 DqsHsV8hdiwnNVXDIlBCc2lq7vg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfa281c.7efc20df9f48-smtp-out-n03;
 Wed, 18 Dec 2019 13:22:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB46FC433CB; Wed, 18 Dec 2019 13:22:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 35BF3C4479F;
        Wed, 18 Dec 2019 13:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 35BF3C4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org
Cc:     ohad@wizery.com, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 1/5] remoteproc: q6v5-mss: Remove mem clk from the active pool
Date:   Wed, 18 Dec 2019 18:52:13 +0530
Message-Id: <20191218132217.28141-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191218132217.28141-1-sibis@codeaurora.org>
References: <20191218132217.28141-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently the mem clk is voted upon from both the active and proxy pool on
MSM8998 SoCs where only a proxy vote should suffice. Fix this by removing
mem clk from the active pool.

Fixes: 1665cbd5731fa ("remoteproc: qcom_q6v5_mss: Add support for MSM8998")
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 471128a2e7239..164fc2a53ef11 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1594,7 +1594,6 @@ static const struct rproc_hexagon_res msm8998_mss = {
 	.active_clk_names = (char*[]){
 			"iface",
 			"bus",
-			"mem",
 			"gpll0_mss",
 			"mnoc_axi",
 			"snoc_axi",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
