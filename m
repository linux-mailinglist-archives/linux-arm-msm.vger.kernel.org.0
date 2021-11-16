Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC734529C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 06:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234245AbhKPFbX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 00:31:23 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:43795 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234155AbhKPFaD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 00:30:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637040426; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Z5drDPiwGucdW3HzWu3F8slFIRETp3f9VoOX/bn1KQ0=; b=UiLDTsOii7b+24B0Mw2yLZzUizcVgYN031JTgJQJMxWdFQJuxC0QPlqtFJ5c0oCnhA/eZW5Q
 palVYKnUP8eBwfzI5/+uS4jPe3HM6t43YbvDsrviGUBV6odwhkCIp1pwxiZzlBdfMs4JQUG0
 kFnRGEaWAzhNivdvR9lXjCFzgN4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 61934129b3d5cb1f555c308b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Nov 2021 05:27:05
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 830B4C4338F; Tue, 16 Nov 2021 05:27:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C3AEC43460;
        Tue, 16 Nov 2021 05:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4C3AEC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 2/2] soc: qcom: rpmhpd: Make mx as a parent of cx only for sdm845
Date:   Tue, 16 Nov 2021 10:56:22 +0530
Message-Id: <1637040382-22987-2-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637040382-22987-1-git-send-email-rnayak@codeaurora.org>
References: <1637040382-22987-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The requirement to specify the active + sleep and active-only MX power
domains as the parents of the corresponding CX power domains is applicable
only on the sdm845 SoC. With the same struct definition reused for all the
SoCs this condition was wrongly applied to all those SoCs as well, which
isn't needed. Define new sdm845 specific structures to manage this
dependency and remove the parent assignements from the common structure.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/soc/qcom/rpmhpd.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index c71481d..12d8ce9 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -108,7 +108,6 @@ static struct rpmhpd cx_ao;
 static struct rpmhpd cx = {
 	.pd = { .name = "cx", },
 	.peer = &cx_ao,
-	.parent = &mx.pd,
 	.res_name = "cx.lvl",
 };
 
@@ -116,7 +115,6 @@ static struct rpmhpd cx_ao = {
 	.pd = { .name = "cx_ao", },
 	.active_only = true,
 	.peer = &cx,
-	.parent = &mx_ao.pd,
 	.res_name = "cx.lvl",
 };
 
@@ -149,12 +147,28 @@ static struct rpmhpd mxc_ao = {
 };
 
 /* SDM845 RPMH powerdomains */
+static struct rpmhpd sdm845_cx_ao;
+static struct rpmhpd sdm845_cx = {
+	.pd = { .name = "cx", },
+	.peer = &sdm845_cx_ao,
+	.parent = &mx.pd,
+	.res_name = "cx.lvl",
+};
+
+static struct rpmhpd sdm845_cx_ao = {
+	.pd = { .name = "cx_ao", },
+	.active_only = true,
+	.peer = &sdm845_cx,
+	.parent = &mx_ao.pd,
+	.res_name = "cx.lvl",
+};
+
 static struct rpmhpd *sdm845_rpmhpds[] = {
 	[SDM845_EBI] = &ebi,
 	[SDM845_MX] = &mx,
 	[SDM845_MX_AO] = &mx_ao,
-	[SDM845_CX] = &cx,
-	[SDM845_CX_AO] = &cx_ao,
+	[SDM845_CX] = &sdm845_cx,
+	[SDM845_CX_AO] = &sdm845_cx_ao,
 	[SDM845_LMX] = &lmx,
 	[SDM845_LCX] = &lcx,
 	[SDM845_GFX] = &gfx,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

