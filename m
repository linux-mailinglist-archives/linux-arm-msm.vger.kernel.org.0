Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6C15234FA6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Aug 2020 05:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbgHADcn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 23:32:43 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:38813 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728480AbgHADcm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 23:32:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596252762; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=gcqQzQVXCs7enCe/CsT0vSZrIaJ9bCn32XECqcM0XFI=; b=WFJ4kBPOd3ppAQDFGqTiAVdcs8SCesaD8fkpaBzJ9UIQ/y2Eemu4WcYZkNTMpGj762eyPka3
 UAacIdNp6jobA7YAEuxSLBPmjfsh4dsFzY0kMzNWoYDZhM7yZmiQ4Ad141Tdk4EFPkgLMqi0
 R4HSfdbhTIfX6+wYioMs8VBWBL8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-west-2.postgun.com with SMTP id
 5f24e24beb556d49a60e44eb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 01 Aug 2020 03:32:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 07BC5C433CB; Sat,  1 Aug 2020 03:32:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mdtipton-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mdtipton)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 433BFC433C6;
        Sat,  1 Aug 2020 03:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 433BFC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mdtipton@codeaurora.org
From:   Mike Tipton <mdtipton@codeaurora.org>
To:     georgi.djakov@linaro.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mdtipton@codeaurora.org>
Subject: [PATCH v3 4/6] interconnect: qcom: Only wait for completion in AMC/WAKE by default
Date:   Fri, 31 Jul 2020 20:32:13 -0700
Message-Id: <20200801033215.1440-5-mdtipton@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200801033215.1440-1-mdtipton@codeaurora.org>
References: <20200801033215.1440-1-mdtipton@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the default TCS wait behavior to only wait for completion in AMC
and WAKE. Waiting isn't necessary in the SLEEP TCS, since votes are only
being removed in this case. Resources can be safely disabled
asynchronously in parallel with the rest of the power collapse sequence.
This reduces the sleep entry latency.

Signed-off-by: Mike Tipton <mdtipton@codeaurora.org>
---
 drivers/interconnect/qcom/bcm-voter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
index 4bba3b42b648..d95725b9208c 100644
--- a/drivers/interconnect/qcom/bcm-voter.c
+++ b/drivers/interconnect/qcom/bcm-voter.c
@@ -341,7 +341,7 @@ static int qcom_icc_bcm_voter_probe(struct platform_device *pdev)
 	voter->np = np;
 
 	if (of_property_read_u32(np, "qcom,tcs-wait", &voter->tcs_wait))
-		voter->tcs_wait = QCOM_ICC_TAG_ALWAYS;
+		voter->tcs_wait = QCOM_ICC_TAG_ACTIVE_ONLY;
 
 	mutex_init(&voter->lock);
 	INIT_LIST_HEAD(&voter->commit_list);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

