Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F38A8412E6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 08:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbhIUGBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 02:01:37 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:26988 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbhIUGBh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 02:01:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632204009; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=OhGeWw49+gS6KAJRqr/xs6z83h7Ybuk7Knmq/JpWzIg=; b=vTCZb+FLnme8rzmZe/gLJ/zORddZ9JjTAyP46I3Xy0SJEWw1KGwKJAsi0Fn8KLlkL1PxVEqL
 +BFsV4V4ctiOOOPf9TPRTT3YPzzRx5wAzyTaz2ZlepcmeYbUoZKWKryvRGafKMc2K4DJAC1d
 odJLjBF3rWjjzauPu3FQE1Ceokw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 614974deec62f57c9a786044 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 05:59:58
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A0F5FC4360C; Tue, 21 Sep 2021 05:59:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CFCF9C4338F;
        Tue, 21 Sep 2021 05:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CFCF9C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Naina Mehta <nainmeht@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] soc: qcom: llcc: Disable MMUHWT retention
Date:   Tue, 21 Sep 2021 11:29:42 +0530
Message-Id: <20210921055942.30600-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Naina Mehta <nainmeht@codeaurora.org>

Disable MMUHWT retention for SC7280 as done for other platforms
to avoid more power burn.

Fixes: f6a07be63301 ("soc: qcom: llcc: Add configuration data for SC7280")
Signed-off-by: Naina Mehta <nainmeht@codeaurora.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/soc/qcom/llcc-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index fb471cc4066b..6bf2f1d1f2c5 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -115,7 +115,7 @@ static const struct llcc_slice_config sc7280_data[] =  {
 	{ LLCC_CMPT,     10, 768, 1, 1, 0x3f, 0x0, 0, 0, 0, 1, 0, 0},
 	{ LLCC_GPUHTW,   11, 256, 1, 1, 0x3f, 0x0, 0, 0, 0, 1, 0, 0},
 	{ LLCC_GPU,      12, 512, 1, 0, 0x3f, 0x0, 0, 0, 0, 1, 0, 0},
-	{ LLCC_MMUHWT,   13, 256, 1, 1, 0x3f, 0x0, 0, 0, 0, 1, 1, 0},
+	{ LLCC_MMUHWT,   13, 256, 1, 1, 0x3f, 0x0, 0, 0, 0, 0, 1, 0},
 	{ LLCC_MDMPNG,   21, 768, 0, 1, 0x3f, 0x0, 0, 0, 0, 1, 0, 0},
 	{ LLCC_WLHW,     24, 256, 1, 1, 0x3f, 0x0, 0, 0, 0, 1, 0, 0},
 	{ LLCC_MODPE,    29, 64,  1, 1, 0x3f, 0x0, 0, 0, 0, 1, 0, 0},
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

