Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92FC832B109
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234842AbhCCBHi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:07:38 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:48992 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1576956AbhCBFfO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 00:35:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614663293; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=AY3VRhsh6oeLwdSW8cR2a9Vwno0w8GpexKTVBZaE/8s=; b=pL+dQsOassdf2ZvsaNezl7bREhXr94Ezl/orGOf4tGDsRWSCxS2r5PvYpEMh1kDXqgOR8RQ2
 yM9kV4nkqtlXkfv1NGrXaTbkZqI/32fRi37t7tEI7E/F+SHG5kjPCTzkz8eU51H3wAntC22h
 DqO6H6l4OGPwjq1t5U8fvlQ6awg=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 603dcb881d4da3b75dcc814c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Mar 2021 05:22:16
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 48B33C433ED; Tue,  2 Mar 2021 05:22:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        SORTED_RECIPS,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 56A58C433C6;
        Tue,  2 Mar 2021 05:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 56A58C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 1/2] pinctrl: qcom: sc7280: Fix SDC_QDSD_PINGROUP and UFS_RESET offsets
Date:   Tue,  2 Mar 2021 10:51:50 +0530
Message-Id: <1614662511-26519-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The offsets for SDC_QDSD_PINGROUP and UFS_RESET were off by 0x100000
due to an issue in the scripts generating the data.

Fixes: ecb454594c43: ("pinctrl: qcom: Add sc7280 pinctrl driver")

Reported-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-sc7280.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index 8daccd5..49c4347 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -1439,14 +1439,14 @@ static const struct msm_pingroup sc7280_groups[] = {
 	[172] = PINGROUP(172, qdss, _, _, _, _, _, _, _, _),
 	[173] = PINGROUP(173, qdss, _, _, _, _, _, _, _, _),
 	[174] = PINGROUP(174, qdss, _, _, _, _, _, _, _, _),
-	[175] = UFS_RESET(ufs_reset, 0x1be000),
-	[176] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x1b3000, 15, 0),
-	[177] = SDC_QDSD_PINGROUP(sdc1_clk, 0x1b3000, 13, 6),
-	[178] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x1b3000, 11, 3),
-	[179] = SDC_QDSD_PINGROUP(sdc1_data, 0x1b3000, 9, 0),
-	[180] = SDC_QDSD_PINGROUP(sdc2_clk, 0x1b4000, 14, 6),
-	[181] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x1b4000, 11, 3),
-	[182] = SDC_QDSD_PINGROUP(sdc2_data, 0x1b4000, 9, 0),
+	[175] = UFS_RESET(ufs_reset, 0xbe000),
+	[176] = SDC_QDSD_PINGROUP(sdc1_rclk, 0xb3000, 15, 0),
+	[177] = SDC_QDSD_PINGROUP(sdc1_clk, 0xb3000, 13, 6),
+	[178] = SDC_QDSD_PINGROUP(sdc1_cmd, 0xb3000, 11, 3),
+	[179] = SDC_QDSD_PINGROUP(sdc1_data, 0xb3000, 9, 0),
+	[180] = SDC_QDSD_PINGROUP(sdc2_clk, 0xb4000, 14, 6),
+	[181] = SDC_QDSD_PINGROUP(sdc2_cmd, 0xb4000, 11, 3),
+	[182] = SDC_QDSD_PINGROUP(sdc2_data, 0xb4000, 9, 0),
 };
 
 static const struct msm_pinctrl_soc_data sc7280_pinctrl = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

