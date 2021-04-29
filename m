Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71CB136E922
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 12:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240524AbhD2KwK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 06:52:10 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59393 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240522AbhD2KwI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 06:52:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619693482; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=AAxrCWNjdMQvBgnFcwuoWQZmImTH2y3gflCOb2dFfbI=; b=im1DP/MCe0FwOyokM72af3+5Inll4Yr4hvetb3vZx3JVt75IH9BxRb1UyubgqfR35XbLqGN3
 qaeV7/Uhf6xzzNmabtA5zUgAFvehK3TLq7ryYliL5EwZDVS4rE6a29yG+B1Er3IwB+uXHrft
 TS8BVmnKvLWo5MNPUMtXyaFwS7s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 608a8fa9febcffa80f4f4fa9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Apr 2021 10:51:21
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8685FC43460; Thu, 29 Apr 2021 10:51:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61C49C4360C;
        Thu, 29 Apr 2021 10:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61C49C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     p.zabel@pengutronix.de, bjorn.andersson@linaro.org,
        sboyd@kernel.org
Cc:     agross@kernel.org, robh+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 1/5] dt-bindings: mailbox: Add WPSS client index to IPCC
Date:   Thu, 29 Apr 2021 16:21:01 +0530
Message-Id: <1619693465-5724-2-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1619693465-5724-1-git-send-email-sibis@codeaurora.org>
References: <1619693465-5724-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add WPSS remote processor client index to Inter-Processor Communication
Controller (IPCC) block.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 include/dt-bindings/mailbox/qcom-ipcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/mailbox/qcom-ipcc.h b/include/dt-bindings/mailbox/qcom-ipcc.h
index 4c23eefed5f3..eb91a6c05b71 100644
--- a/include/dt-bindings/mailbox/qcom-ipcc.h
+++ b/include/dt-bindings/mailbox/qcom-ipcc.h
@@ -29,5 +29,6 @@
 #define IPCC_CLIENT_PCIE1		14
 #define IPCC_CLIENT_PCIE2		15
 #define IPCC_CLIENT_SPSS		16
+#define IPCC_CLIENT_WPSS		24
 
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

